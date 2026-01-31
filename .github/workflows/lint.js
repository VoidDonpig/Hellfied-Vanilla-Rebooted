const { spawn } = require('child_process');
const fs = require('fs');
const path = require('path');

class SpyglassLSPClient {
  constructor() {
    this.messageId = 0;
    this.pendingRequests = new Map();
    this.diagnostics = new Map();
    this.buffer = '';
    this.pendingDiagnostics = new Set();
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
        // stderrは無視
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
        // パースエラーは無視
      }
    }
  }

  handleMessage(message) {
    if (message.id !== undefined && this.pendingRequests.has(message.id)) {
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
      this.pendingDiagnostics.delete(uri);
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
            didChange: false,
            didSave: false,
            willSave: false,
            willSaveWaitUntil: false
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

    this.sendNotification('initialized', {});
    
    await new Promise(resolve => setTimeout(resolve, 500));
    
    return result;
  }

  async openDocument(filePath) {
    const content = fs.readFileSync(filePath, 'utf8');
    const uri = `file://${filePath}`;
    
    this.pendingDiagnostics.add(uri);
    
    this.sendNotification('textDocument/didOpen', {
      textDocument: {
        uri,
        languageId: this.getLanguageId(filePath),
        version: 1,
        text: content
      }
    });
  }

  async waitForDiagnostics(timeout = 10000) {
    const startTime = Date.now();
    
    while (this.pendingDiagnostics.size > 0 && (Date.now() - startTime) < timeout) {
      await new Promise(resolve => setTimeout(resolve, 100));
    }
    
    if (this.pendingDiagnostics.size > 0) {
      console.log(`Warning: ${this.pendingDiagnostics.size} files did not receive diagnostics`);
    }
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
      const shutdownPromise = this.sendRequest('shutdown', null);
      const timeoutPromise = new Promise((_, reject) => 
        setTimeout(() => reject(new Error('Shutdown timeout')), 2000)
      );
      
      await Promise.race([shutdownPromise, timeoutPromise]).catch(() => {});
      
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
    console.log('LSP initialized successfully');

    const dataDir = path.join(process.cwd(), 'data');
    const files = findDatapackFiles(dataDir);
    
    console.log(`Found ${files.length} files to check`);

    // バッチ処理で高速化（診断を待つように修正）
    const BATCH_SIZE = 20;
    for (let i = 0; i < files.length; i += BATCH_SIZE) {
      const batch = files.slice(i, i + BATCH_SIZE);
      
      // バッチ内のファイルを開く
      for (const file of batch) {
        await client.openDocument(file);
      }
      
      // このバッチの診断結果を待つ
      await client.waitForDiagnostics(5000);
      
      if ((i + BATCH_SIZE) % 100 === 0 || (i + BATCH_SIZE) >= files.length) {
        console.log(`Progress: ${Math.min(i + BATCH_SIZE, files.length)}/${files.length} files`);
      }
    }

    // 念のため最後にもう一度待つ
    console.log('Waiting for any remaining diagnostics...');
    await new Promise(resolve => setTimeout(resolve, 1000));

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
    console.log('Spyglass LSP Lint Results');
    console.log('='.repeat(60));
    console.log(`Total files checked: ${results.totalFiles}`);
    console.log(`Files with issues: ${results.filesWithIssues}`);
    console.log(`Errors: ${results.errors}`);
    console.log(`Warnings: ${results.warnings}`);
    console.log(`Info: ${results.info}`);
    console.log(`Duration: ${duration}s`);

    if (results.diagnostics.length > 0) {
      console.log('\nDiagnostics:');
      results.diagnostics.slice(0, 50).forEach(diag => {
        const icon = diag.severity === 'error' ? '❌' : diag.severity === 'warning' ? '⚠️' : 'ℹ️';
        console.log(`${icon} ${path.relative(process.cwd(), diag.file)}:${diag.line}:${diag.column}`);
        console.log(`   [${diag.severity}] ${diag.message}`);
      });
      
      if (results.diagnostics.length > 50) {
        console.log(`\n... and ${results.diagnostics.length - 50} more issues`);
      }
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