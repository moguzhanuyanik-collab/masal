'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_mutabakat_performans.php','utf8');
const page=fs.readFileSync('ticari-mutabakat-performans.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const health=fs.readFileSync('ticari-mutabakat-saglik.php','utf8');
const inbox=fs.readFileSync('ticari-mutabakat-is-kutusu.php','utf8');
const escalation=fs.readFileSync('ticari-mutabakat-eskalasyon.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

for(const fn of [
  'mp_tables_ready','mp_window_days','mp_first_intervention_expr','mp_summary',
  'mp_owner_rows','mp_issue_rows','mp_monthly_closed','mp_recent_closed_rows'
]) assert(domain.includes('function '+fn+'('),fn+' missing');

assert(domain.includes("gf.kod='takip_notu' OR gf.kod LIKE 'asama_%'"),
  'first intervention must use note/stage events');
assert(domain.includes("mhs_cycle_expr("),
  'performance metrics must reuse reconciliation cycle-start contract');
assert(domain.includes("vaka_yeniden_acildi"),
  'reopen-aware metrics missing');
assert(domain.includes("ticari_mutabakat_aksiyon_hatirlatmalari"),
  'reminder volume integration missing');
assert(domain.includes("ticari_mutabakat_eskalasyonlari"),
  'escalation volume integration missing');
assert(!/\bINSERT\b|\bUPDATE\b|\bDELETE\b/.test(domain),
  'performance domain must remain read-only');

assert(page.includes("require_role('super_admin')"),'performance dashboard must be Super Admin only');
assert(page.includes('foreach([7,30,90] as $window)'),
  '7/30/90 reporting window loop missing');
assert(page.includes('ticari-mutabakat-performans.php?gun=<?=$window?>'),
  'reporting window links missing');
assert(page.includes('Ort. çevrim günü'),'average cycle KPI missing');
assert(page.includes('Ort. ilk müdahale saati'),'first intervention KPI missing');
assert(page.includes('Reopen oranı'),'reopen KPI missing');
assert(page.includes('Objektif Operasyon Göstergeleri'),'owner metrics section missing');
assert(page.includes('6 AYLIK TREND'),'six-month close trend missing');
assert(page.includes('Bu dashboard salt-okunurdur.'),
  'read-only disclosure missing');
assert(!page.includes("$_SERVER['REQUEST_METHOD']==='POST'"),
  'performance dashboard must not expose write actions');

for(const content of [admin,health,inbox,escalation])
  assert(content.includes('ticari-mutabakat-performans.php'),'performance navigation missing');

assert(workflow.includes('node tests/reconciliation-performance-191.cjs'),
  'performance source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-performance-db-191.php'),
  'performance DB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=66,'performance dashboard requires 1.2.66 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.66.md',
  'src/ticari_mutabakat_performans.php',
  'ticari-mutabakat-performans.php',
  'ticari-mutabakat-performans.css',
  'tests/reconciliation-performance-191.cjs',
  'tests/reconciliation-performance-db-191.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

assert(!manifest.files.includes('database/migrations/089_mutabakat_performans.sql'),
  'read-only performance dashboard must not invent a migration');

console.log('PASS: read-only reopen-aware reconciliation performance dashboard source contract');
