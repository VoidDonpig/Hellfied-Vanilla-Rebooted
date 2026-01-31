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
    await new Promise(resolve => setTimeout(resolve, 3000));

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
        if (diag.code) {
          console.log(`   Code: ${diag.code}`);
        }
      });
    }

    // shutdownを試みるが、失敗しても続行
    await client.shutdown().catch(() => {});

    // 少し待ってから終了
    await new Promise(resolve => setTimeout(resolve, 500));

    // エラーがある場合は終了コード1
    const exitCode = results.errors > 0 ? 1 : 0;
    console.log(`\nExiting with code ${exitCode}`);
    process.exit(exitCode);

  } catch (err) {
    console.error('Error:', err);
    
    // エラー時もshutdownを試みる
    try {
      await client.shutdown().catch(() => {});
    } catch {}
    
    process.exit(1);
  }
}

main();