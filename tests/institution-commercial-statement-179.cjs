'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/kurum_ticari_360.php','utf8');
const page=fs.readFileSync('kurum-ticari-360.php','utf8');
const csv=fs.readFileSync('kurum-ticari-ekstre-csv.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('function kt360_statement_filters('),'statement filter helper missing');
assert(domain.includes('function kt360_statement('),'account statement engine missing');
assert(domain.includes('function kt360_csv_safe_cell('),'CSV formula-injection guard missing');
assert(domain.includes("s.durum IN ('aktif','tamamlandi')"),
  'statement must exclude draft/cancelled contracts from financial balance');
assert(domain.includes("t.durum='aktif'"),
  'statement must exclude cancelled payments from financial balance');
assert(domain.includes("SUM(s.toplam_tutar)"),
  'statement contract-debit aggregation missing');
assert(domain.includes("-SUM(t.tutar)"),
  'opening balance active-payment credit aggregation missing');
assert(domain.includes("'sozlesme' hareket_turu"),
  'statement contract movement row missing');
assert(domain.includes("'tahsilat' hareket_turu"),
  'statement payment movement row missing');
assert(domain.includes("if($type==='sozlesme'") && domain.includes("if($type==='tahsilat'"),
  'movement display filters missing');
assert(domain.includes("$running[$ccy]+=(float)$row['borc']-(float)$row['tahsilat'];"),
  'per-currency running balance missing');
assert(domain.indexOf("$running[$ccy]+=(float)$row['borc']-(float)$row['tahsilat'];")
  < domain.indexOf("if($type==='sozlesme'"),
  'running balance must be calculated before movement-type display filtering');
assert(domain.includes("if($startDate->diff($endDate)->days>1096)"),
  'three-year statement range guard missing');
assert(domain.includes("preg_match('/^[=+\\-@\\t\\r]/u'"),
  'CSV spreadsheet formula-injection prefix guard missing');
assert(!/\bINSERT\b|\bUPDATE\b|\bDELETE\b/.test(domain),
  'institution 360/statement domain must remain read-only');

assert(page.includes('HESAP EKSTRESİ'),'statement section missing from institution 360');
assert(page.includes('Dönemsel Ticari Hareketler'),'statement ledger heading missing');
assert(page.includes('name="baslangic"'),'statement start-date filter missing');
assert(page.includes('name="bitis"'),'statement end-date filter missing');
assert(page.includes('name="para_birimi"'),'statement currency filter missing');
assert(page.includes('name="hareket_turu"'),'statement movement-type filter missing');
assert(page.includes('Açılış'),'statement opening balance UI missing');
assert(page.includes('Dönem Borcu'),'statement period debit UI missing');
assert(page.includes('Dönem Tahsilatı'),'statement period collection UI missing');
assert(page.includes('Kapanış'),'statement closing balance UI missing');
assert(page.includes('kurum-ticari-ekstre-csv.php?'),'CSV export link missing');
assert(page.includes('İptal tahsilatlar finansal bakiyeyi değiştirmez'),
  'cancelled-payment financial/audit distinction missing');
assert(!page.includes("$_SERVER['REQUEST_METHOD']==='POST'"),
  'institution statement view must not add write POST flow');

assert(csv.includes("require_role('super_admin')"),'CSV export must be Super Admin only');
assert(csv.includes("header('Cache-Control: no-store, max-age=0')"),'CSV no-store guard missing');
assert(csv.includes("header('X-Content-Type-Options: nosniff')"),'CSV nosniff guard missing');
assert(csv.includes("http_response_code(404)"),'unknown institution export guard missing');
assert(csv.includes("http_response_code(400)"),'invalid filter export guard missing');
assert(csv.includes('kt360_statement_filters($_GET)'),'CSV must share statement filter contract');
assert(csv.includes('kt360_statement($pdo,$institutionId,$filters,10000)'),
  'CSV must use shared statement engine');
assert(csv.includes('kt360_csv_safe_cell('),'CSV must sanitize every cell');
assert(csv.includes('fwrite($out,"\\xEF\\xBB\\xBF")'),'UTF-8 BOM missing');
assert(csv.includes("fputcsv($handle,$safe,';','\"','')"),
  'semicolon CSV writer with explicit escape argument missing');
assert(csv.includes("Content-Disposition: attachment; filename="),
  'safe fixed-format CSV filename header missing');
assert(!/\bINSERT\b|\bUPDATE\b|\bDELETE\b/.test(csv),
  'CSV endpoint must remain read-only');

assert(workflow.includes('node tests/institution-commercial-statement-179.cjs'),
  'statement source regression missing from quality gate');
assert(workflow.includes('php tests/institution-commercial-statement-db-179.php'),
  'statement MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=54,'institution statement requires 1.2.54 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.54.md',
  'kurum-ticari-ekstre-csv.php',
  'tests/institution-commercial-statement-179.cjs',
  'tests/institution-commercial-statement-db-179.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

assert(!manifest.files.includes('database/migrations/084_kurum_ticari_ekstre.sql'),
  'read-only statement/export release must not invent a migration');

console.log('PASS: institution account statement filters, running balance and formula-safe CSV export source contract');
