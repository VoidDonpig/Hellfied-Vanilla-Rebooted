const { spawn } = require('child_process');
const fs = require('fs');
const path = require('path');

class SpyglassLSPClient {
  constructor() {
    this.messageId = 0;
    this.pendingRequests = new Map();
    this.diagnostics = new Map();
    this.buffer = '';
  }

  async start() {
    return new Promise((resolve, reject) => {
      const serverPath = path.join(process.cwd(), 'node_modules', '@spyglassmc/language-server', 'lib', 'server.js');
      
      if (!fs.existsSync(serverPath)) {
        reject(new Error('Spyglass language server not found'));
        return;
      }

      this.process = spawn('node', [serverPath, '--stdio']);
      
      this.process.stdout.on('data', (data) => {
        this.handleData(data);
      });

      this.process.stderr.on('data', (data) => {
        console.error('LSP Error:', data.toString());
      });

      this.process.on('error', (err) => {
        reject(err);
      });

      // 初期化
      this.initialize().then(resolve).catch(reject);
    });
  }

  handleData(data) {
    this.buffer += data.toString();
    
    while (true) {
      const headerEnd = this.buffer.indexOf('\r\n\r\n');
      if (headerEnd === -1) break;

      const headers = this.buffer.substring(0, headerEnd);
      const contentLengthMatch = headers.match(/Content-Length: (\d+)/);
      
      if (!contentLengthMatch) break;

      const contentLength = parseInt(contentLengthMatch[1]);
      const messageStart = headerEnd + 4;
      const messageEnd = messageStart + contentLength;

      if (this.buffer.length < messageEnd) break;

      const messageContent = this.buffer.substring(messageStart, messageEnd);
      this.buffer = this.buffer.substring(messageEnd);

      try {
        const message = JSON.parse(messageContent);
        this.handleMessage(message);
      } catch (err) {
        console.error('Failed to parse message:', err);
      }
    }
  }

  handleMessage(message) {
    if (message.id && this.pendingRequests.has(message.id)) {
      const { resolve, reject } = this.pendingRequests.get(message.id);
      this.pendingRequests.delete(message.id);
      
      if (message.error) {
        reject(message.error);
      } else {
        resolve(message.result);
      }
    } else if (message.method === 'textDocument/publishDiagnostics') {
      const uri = message.params.uri;
      this.diagnostics.set(uri, message.params.diagnostics);
    }
  }

  sendRequest(method, params) {
    return new Promise((resolve, reject) => {
      const id = ++this.messageId;
      const message = {
        jsonrpc: '2.0',
        id,
        method,
        params
      };

      this.pendingRequests.set(id, { resolve, reject });
      this.sendMessage(message);

      // タイムアウト設定
      setTimeout(() => {
        if (this.pendingRequests.has(id)) {
          this.pendingRequests.delete(id);
          reject(new Error(`Request ${method} timed out`));
        }
      }, 30000);
    });
  }

  sendNotification(method, params) {
    const message = {
      jsonrpc: '2.0',
      method,
      params
    };
    this.sendMessage(message);
  }

  sendMessage(message) {
    const content = JSON.stringify(message);
    const header = `Content-Length: ${Buffer.byteLength(content)}\r\n\r\n`;
    this.process.stdin.write(header + content);
  }

  async initialize() {
    const workspaceFolder = process.cwd();
    
    const result = await this.sendRequest('initialize', {
      processId: process.pid,
      rootUri: `file://${workspaceFolder}`,
      capabilities: {
        textDocument: {
          publishDiagnostics: {},
          synchronization: {
            didOpen: true,
            didChange: true,
            didSave: true
          }
        },
        workspace: {
          workspaceFolders: true
        }
      },
      workspaceFolders: [{
        uri: `file://${workspaceFolder}`,
        name: path.basename(workspaceFolder)
      }]
    });

    this.sendNotification('initialized', {});
    
    return result;
  }

  async openDocument(filePath) {
    const content = fs.readFileSync(filePath, 'utf8');
    const uri = `file://${filePath}`;
    
    this.sendNotification('textDocument/didOpen', {
      textDocument: {
        uri,
        languageId: this.getLanguageId(filePath),
        version: 1,
        text: content
      }
    });

    // 診断結果を待つ
    await new Promise(resolve => setTimeout(resolve, 500));
  }

  getLanguageId(filePath) {
    const ext = path.extname(filePath);
    const languageMap = {
      '.mcfunction': 'mcfunction',
      '.json': 'json',
      '.nbt': 'nbt'
    };
    return languageMap[ext] || 'plaintext';
  }

  async shutdown() {
    await this.sendRequest('shutdown', null);
    this.sendNotification('exit', null);
    this.process.kill();
  }
}

function findDatapackFiles(dir, extensions = ['.mcfunction', '.json']) {
  let files = [];
  
  if (!fs.existsSync(dir)) {
    return files;
  }

  const items = fs.readdirSync(dir, { withFileTypes: true });
  
  for (const item of items) {
    const fullPath = path.join(dir, item.name);
    if (item.isDirectory()) {
      files = files.concat(findDatapackFiles(fullPath, extensions));
    } else if (extensions.some(ext => item.name.endsWith(ext))) {
      files.push(fullPath);
    }
  }
  
  return files;
}

async function main() {
  const client = new SpyglassLSPClient();
  
  console.log('Starting Spyglass LSP...');
  
  try {
    await client.start();
    console.log('LSP initialized successfully');

    const dataDir = path.join(process.cwd(), 'data');
    const files = findDatapackFiles(dataDir);
    
    console.log(`Found ${files.length} files to check`);

    for (const file of files) {
      console.log(`Checking: ${path.relative(process.cwd(), file)}`);
      await client.openDocument(file);
    }

    // 全ての診断が完了するまで待つ
    await new Promise(resolve => setTimeout(resolve, 2000));

    // 結果を集計
    const results = {
      totalFiles: files.length,
      filesWithIssues: 0,
      errors: 0,
      warnings: 0,
      info: 0,
      diagnostics: []
    };

    for (const [uri, diagnostics] of client.diagnostics.entries()) {
      if (diagnostics.length > 0) {
        results.filesWithIssues++;
        
        diagnostics.forEach(diag => {
          const severity = ['error', 'warning', 'info', 'hint'][diag.severity - 1] || 'info';
          
          if (severity === 'error') results.errors++;
          else if (severity === 'warning') results.warnings++;
          else results.info++;

          results.diagnostics.push({
            file: uri.replace('file://', ''),
            line: diag.range.start.line + 1,
            column: diag.range.start.character + 1,
            severity,
            message: diag.message,
            source: diag.source || 'spyglass'
          });
        });
      }
    }

    // 結果を保存
    fs.writeFileSync('spyglass-results.json', JSON.stringify(results, null, 2));

    // コンソール出力
    console.log('\n' + '='.repeat(60));
    console.log('Spyglass LSP Lint Results');
    console.log('='.repeat(60));
    console.log(`Total files checked: ${results.totalFiles}`);
    console.log(`Files with issues: ${results.filesWithIssues}`);
    console.log(`Errors: ${results.errors}`);
    console.log(`Warnings: ${results.warnings}`);
    console.log(`Info: ${results.info}`);

    if (results.diagnostics.length > 0) {
      console.log('\nDiagnostics:');
      results.diagnostics.forEach(diag => {
        const icon = diag.severity === 'error' ? '❌' : diag.severity === 'warning' ? '⚠️' : 'ℹ️';
        console.log(`${icon} ${path.relative(process.cwd(), diag.file)}:${diag.line}:${diag.column}`);
        console.log(`   [${diag.severity}] ${diag.message}`);
      });
    }

    await client.shutdown();

    // エラーがある場合は終了コード1
    process.exit(results.errors > 0 ? 1 : 0);

  } catch (err) {
    console.error('Error:', err);
    process.exit(1);
  }
}

main();