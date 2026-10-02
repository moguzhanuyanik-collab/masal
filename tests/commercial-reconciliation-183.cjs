'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_mutabakat.php','utf8');
const page=fs.readFileSync('ticari-mutabakat.php','utf8');
const css=fs.readFileSync('ticari-mutabakat.css','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const dashboard=fs.readFileSync('ticari-dashboard.php','utf8');
const documents=fs.readFileSync('ticari-belgeler.php','utf8');
const finance=fs.readFileSync('ticari-finans.php','utf8');
const institution360=fs.readFileSync('kurum-ticari-360.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const releaseNote=fs.readFileSync('RELEASE-1.2.58.md','utf8');

assert(domain.includes('function tm_tables_ready('),'reconciliation readiness helper missing');
assert(domain.includes('function tm_contract_rows('),'contract reconciliation rows missing');
assert(domain.includes('function tm_currency_summary('),'currency reconciliation summary missing');
assert(domain.includes('function tm_open_documents('),'open document queue missing');
assert(domain.includes('function tm_unallocated_payments('),'unallocated payment queue missing');
assert(domain.includes('function tm_integrity_issues('),'integrity issue scanner missing');
assert(domain.includes('function tm_status_label('),'reconciliation status labels missing');

assert(domain.includes("s.durum IN ('aktif','tamamlandi')"),
  'financial reconciliation must use active/completed contracts only');
assert(domain.includes("b.durum='aktif'"),
  'reconciliation must use active documents only');
assert(domain.includes("t.durum='aktif'"),
  'reconciliation must use active payments only');
assert(domain.includes("WHERE e.durum='aktif'"),
  'reconciliation must use active mappings only');
assert(domain.includes("AND t.para_birimi=b.para_birimi"),
  'effective allocations must require payment/document currency identity');
assert(domain.includes("AND b.sozlesme_id=e.sozlesme_id"),
  'effective allocations must require document/contract identity');
assert(domain.includes("AND t.sozlesme_id=e.sozlesme_id"),
  'effective allocations must require payment/contract identity');

assert(domain.includes("$statusFilter==='hata'") && domain.includes("$where[]=$errorExpr"),
  'error reconciliation filter must be applied before SQL LIMIT');
assert(domain.includes("$statusFilter==='eksik'") && domain.includes("$where[]='NOT '.$errorExpr.' AND '.$gapExpr"),
  'gap reconciliation filter must be applied before SQL LIMIT');
assert(domain.includes("FROM (") && domain.includes("GROUP BY x.para_birimi"),
  'currency summary must aggregate full portfolio in SQL instead of UI-limited rows');

assert(domain.includes("'belge_kimlik_uyumsuz'"),'document identity anomaly missing');
assert(domain.includes("'tahsilat_kimlik_uyumsuz'"),'payment identity anomaly missing');
assert(domain.includes("'esleme_kimlik_uyumsuz'"),'mapping identity anomaly missing');
assert(domain.includes("'kod'=>'limit_asimi'") || domain.includes("'kod'=>'limit_asimi',"),
  'capacity-limit anomaly missing');
assert(!/\bINSERT\b|\bUPDATE\b|\bDELETE\b/.test(domain),
  'reconciliation domain must remain read-only');

assert(page.includes("require_role('super_admin')"),'reconciliation center must be Super Admin only');
assert(page.includes('Sözleşme, Belge ve Tahsilat Mutabakat Merkezi'),'reconciliation hero missing');
assert(page.includes('Veri Kontrolü Gerekli'),'integrity-error UI missing');
assert(page.includes('Operasyon Açığı'),'normal operational-gap UI missing');
assert(page.includes('Açık Ticari Belgeler'),'open-document queue UI missing');
assert(page.includes('Dağıtılmamış Tahsilatlar'),'unallocated-payment queue UI missing');
assert(page.includes('Gerçek Kontrol Uyarıları'),'integrity issues UI missing');
assert(page.includes('Bu ekran hiçbir finansal kaydı değiştirmez.'),
  'read-only disclosure missing');
assert(!page.includes("$_SERVER['REQUEST_METHOD']==='POST'"),
  'reconciliation page must not expose write POST actions');

assert(css.includes('.tm-summary-grid'),'reconciliation summary styles missing');
assert(css.includes('.tm-table'),'reconciliation table styles missing');
assert(css.includes('.tm-issues'),'integrity issue styles missing');

assert(!admin.includes('Ticari Mutabakat & Kontrol'),'legacy commercial navigation must stay hidden from the education-focused Super Admin');
assert(dashboard.includes('aria-label="Ticari Mutabakat"'),'dashboard reconciliation shortcut missing');
assert(documents.includes('aria-label="Ticari Mutabakat"'),'commercial documents reconciliation shortcut missing');
assert(finance.includes('aria-label="Ticari Mutabakat"'),'finance reconciliation shortcut missing');
assert(institution360.includes('ticari-mutabakat.php?kurum_id=<?=$institutionId?>'),
  'institution 360 scoped reconciliation shortcut missing');

assert(workflow.includes('node tests/commercial-reconciliation-183.cjs'),
  'reconciliation source regression missing from quality gate');
assert(workflow.includes('php tests/commercial-reconciliation-db-183.php'),
  'reconciliation MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=58,'commercial reconciliation requires 1.2.58 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(releaseNote.includes('Migration zinciri') && releaseNote.includes('085'),
  '1.2.58 must document unchanged migration chain 085');

for(const path of [
  'RELEASE-1.2.58.md',
  'src/ticari_mutabakat.php',
  'ticari-mutabakat.php',
  'ticari-mutabakat.css',
  'tests/commercial-reconciliation-183.cjs',
  'tests/commercial-reconciliation-db-183.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

assert(!manifest.files.includes('database/migrations/086_ticari_mutabakat.sql'),
  'read-only reconciliation release must not invent migration 086');

console.log('PASS: read-only commercial reconciliation, operational-gap separation and integrity scanning source contract');
