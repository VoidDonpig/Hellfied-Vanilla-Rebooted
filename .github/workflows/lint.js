const { spawn } = require('child_process');
const fs = require('fs');
const path = require('path');

class SpyglassLSPClient {
  constructor() {
    this.messageId = 0;
    this.pendingRequests = new Map();
    this.diagnostics = new Map();
    this.buffer = '';
    this.messageLog = [];
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
        console.error('LSP stderr:', data.toString());
      });

      this.process.on('error', (err) => {
        reject(err);
      });

      this.initialize().then(resolve).catch(reject);
    });
  }

  handleData(data) {
    this.buffer += data.toString();
    
    while (this.buffer.length > 0) {
      const headerMatch = this.buffer.match(/Content-Length: (\d+)\r\n/);
      
      if (!headerMatch) break;

      const contentLength = parseInt(headerMatch[1]);
      const headerEnd = this.buffer.indexOf('\r\n\r\n');
      
      if (headerEnd === -1) break;

      const messageStart = headerEnd + 4;
      const messageEnd = messageStart + contentLength;

      if (this.buffer.length < messageEnd) break;

      const messageContent = this.buffer.substring(messageStart, messageEnd);
      this.buffer = this.buffer.substring(messageEnd);

      try {
        const message = JSON.parse(messageContent);
        this.handleMessage(message);
      } catch (err) {
        console.error('Parse error:', err.message);
        console.error('Content:', messageContent.substring(0, 200));
      }
    }
  }

  handleMessage(message) {
    // すべてのメッセージをログ
    if (message.method) {
      this.messageLog.push({ method: message.method, hasParams: !!message.params });
    }

    if (message.id !== undefined && this.pendingRequests.has(message.id)) {
      const { resolve, reject } = this.pendingRequests.get(message.id);
      this.pendingRequests.delete(message.id);
      
      if (message.error) {
        console.error('LSP Error Response:', message.error);
        reject(message.error);
      } else {
        resolve(message.result);
      }
    } else if (message.method === 'textDocument/publishDiagnostics') {
      const uri = message.params.uri;
      const diagCount = message.params.diagnostics.length;
      
      console.log(`📋 Diagnostics for ${path.basename(uri)}: ${diagCount} issues`);
      
      if (diagCount > 0) {
        message.params.diagnostics.forEach(diag => {
          console.log(`  - Line ${diag.range.start.line + 1}: ${diag.message}`);
        });
      }
      
      this.diagnostics.set(uri, message.params.diagnostics);
    } else if (message.method && message.method.startsWith('window/')) {
      console.log(`Window message: ${message.method}`);
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
    const contentLength = Buffer.byteLength(content, 'utf8');
    const header = `Content-Length: ${contentLength}\r\n\r\n`;
    const fullMessage = header + content;
    
    try {
      this.process.stdin.write(fullMessage, 'utf8');
    } catch (err) {
      console.error('Error writing to stdin:', err);
    }
  }

  async initialize() {
    const workspaceFolder = process.cwd();
    
    console.log('Initializing LSP...');
    const result = await this.sendRequest('initialize', {
      processId: process.pid,
      clientInfo: {
        name: 'spyglass-ci',
        version: '1.0.0'
      },
      rootUri: `file://${workspaceFolder}`,
      capabilities: {
        textDocument: {
          publishDiagnostics: {
            relatedInformation: true,
            tagSupport: { valueSet: [1, 2] },
            versionSupport: false
          },
          synchronization: {
            didOpen: true,
            didChange: true,
            didSave: true
          }
        },
        workspace: {
          workspaceFolders: true,
          configuration: true
        }
      },
      workspaceFolders: [{
        uri: `file://${workspaceFolder}`,
        name: path.basename(workspaceFolder)
      }]
    });

    console.log('Server capabilities:', JSON.stringify(result.capabilities, null, 2));

    this.sendNotification('initialized', {});
    
    await new Promise(resolve => setTimeout(resolve, 1000));
    
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
    
    // 各ファイルごとに診断を待つ
    await new Promise(resolve => setTimeout(resolve, 200));
  }

  getLanguageId(filePath) {
    const ext = path.extname(filePath);
    const languageMap = {
      '.mcfunction': 'mcfunction',
      '.json': 'json',
      '.nbt': 'nbt',
      '.mcmeta': 'json'
    };
    return languageMap[ext] || 'plaintext';
  }

  async shutdown() {
    try {
      await this.sendRequest('shutdown', null);
      this.sendNotification('exit', null);
    } catch (err) {}
    
    setTimeout(() => {
      if (this.process && !this.process.killed) {
        this.process.kill('SIGTERM');
      }
    }, 300);
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
  const startTime = Date.now();
  
  try {
    await client.start();
    console.log('LSP initialized successfully\n');

    const dataDir = path.join(process.cwd(), 'data');
    const files = findDatapackFiles(dataDir);
    
    console.log(`Found ${files.length} files to check\n`);

    // テストとして最初の10ファイルだけ処理
    const testFiles = files.slice(0, 20);
    
    for (let i = 0; i < testFiles.length; i++) {
      const file = testFiles[i];
      console.log(`[${i + 1}/${testFiles.length}] Checking: ${path.relative(process.cwd(), file)}`);
      await client.openDocument(file);
    }

    // 最終的な診断を待つ
    console.log('\nWaiting for final diagnostics...');
    await new Promise(resolve => setTimeout(resolve, 3000));

    console.log('\nMessage log summary:');
    const methodCounts = {};
    client.messageLog.forEach(log => {
      methodCounts[log.method] = (methodCounts[log.method] || 0) + 1;
    });
    console.log(methodCounts);

    // 結果を集計
    const results = {
      totalFiles: testFiles.length,
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
            source: diag.source || 'spyglass',
            code: diag.code
          });
        });
      }
    }

    // 結果を保存
    fs.writeFileSync('spyglass-results.json', JSON.stringify(results, null, 2));

    const duration = ((Date.now() - startTime) / 1000).toFixed(2);

    // コンソール出力
    console.log('\n' + '='.repeat(60));
    console.log('Spyglass LSP Lint Results (Test Run - First 20 Files)');
    console.log('='.repeat(60));
    console.log(`Total files checked: ${results.totalFiles}`);
    console.log(`Files with issues: ${results.filesWithIssues}`);
    console.log(`Errors: ${results.errors}`);
    console.log(`Warnings: ${results.warnings}`);
    console.log(`Info: ${results.info}`);
    console.log(`Duration: ${duration}s`);

    if (results.diagnostics.length > 0) {
      console.log('\nAll Diagnostics:');
      results.diagnostics.forEach(diag => {
        const icon = diag.severity === 'error' ? '❌' : diag.severity === 'warning' ? '⚠️' : 'ℹ️';
        console.log(`${icon} ${path.relative(process.cwd(), diag.file)}:${diag.line}:${diag.column}`);
        console.log(`   [${diag.severity}] ${diag.message}`);
      });
    } else {
      console.log('\n⚠️  No diagnostics received - LSP may not be working correctly');
    }

    await client.shutdown().catch(() => {});
    await new Promise(resolve => setTimeout(resolve, 300));

    const exitCode = results.errors > 0 ? 1 : 0;
    console.log(`\nExiting with code ${exitCode}`);
    process.exit(exitCode);

  } catch (err) {
    console.error('Error:', err);
    
    try {
      await client.shutdown().catch(() => {});
    } catch {}
    
    process.exit(1);
  }
}

main();