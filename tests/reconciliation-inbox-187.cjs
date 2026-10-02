'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_mutabakat_is_kutusu.php','utf8');
const page=fs.readFileSync('ticari-mutabakat-is-kutusu.php','utf8');
const css=fs.readFileSync('ticari-mutabakat-is-kutusu.css','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const action=fs.readFileSync('ticari-mutabakat-aksiyon.php','utf8');
const health=fs.readFileSync('ticari-mutabakat-saglik.php','utf8');
const planning=fs.readFileSync('ticari-mutabakat-planlama.php','utf8');
const dashboard=fs.readFileSync('ticari-dashboard.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const note=fs.readFileSync('RELEASE-1.2.62.md','utf8');

assert(domain.includes('function mi_tables_ready('),'inbox readiness helper missing');
assert(domain.includes('function mi_scope_labels('),'inbox scope labels missing');
assert(domain.includes('function mi_window_labels('),'inbox window labels missing');
assert(domain.includes('function mi_case_rows('),'inbox case query missing');
assert(domain.includes('function mi_summary('),'personal inbox summary missing');
assert(domain.includes('function mi_team_workload('),'team workload query missing');

assert(domain.includes("v.sorumlu_kullanici_id=?"),'mine/owner filter missing');
assert(domain.includes("v.sonraki_aksiyon_tarihi<CURDATE()"),'overdue window missing');
assert(domain.includes("v.sonraki_aksiyon_tarihi=CURDATE()"),'today window missing');
assert(domain.includes("INTERVAL 3 DAY"),'next-3-day window missing');
assert(domain.includes("INTERVAL 7 DAY"),'next-7-day window missing');
assert(domain.includes("v.sonraki_aksiyon_tarihi IS NULL"),'no-action-date window missing');
assert(domain.includes("v.durum IN ('acik','incelemede','beklemede')"),'closed cases must be excluded');
assert(domain.includes("mhs_cycle_expr('v')"),'inbox must reuse health-cycle semantics');
assert(domain.includes("mhs_intervention_exists_expr('v')"),'inbox must reuse current-cycle intervention semantics');
assert(!/\bINSERT\b|\bUPDATE\b|\bDELETE\b/.test(domain),'inbox domain must remain read-only');

assert(page.includes("require_role('super_admin')"),'inbox must be Super Admin only');
assert(page.includes('Bana atanan'),'mine summary missing');
assert(page.includes('Gecikmiş'),'overdue summary missing');
assert(domain.includes("'next3'=>'Önümüzdeki 3 Gün'"),'next-3-day filter missing');
assert(domain.includes("'next7'=>'Önümüzdeki 7 Gün'"),'next-7-day filter missing');
assert(page.includes('Sahipsiz'),'unassigned view missing');
assert(page.includes('Sorumlu İş Yükü'),'team workload section missing');
assert(page.includes('Bu ekran salt-okunurdur.'),'read-only disclosure missing');
assert(!page.includes("$_SERVER['REQUEST_METHOD']==='POST'"),'inbox page must not expose POST writes');
assert(page.includes('name="owner_id"'),'owner filter preservation missing');

assert(css.includes('.mi-summary'),'inbox summary styles missing');
assert(css.includes('.mi-team'),'team workload styles missing');

for(const content of [admin,action,health,planning,dashboard]){
  assert(content.includes('ticari-mutabakat-is-kutusu.php'),'cross-navigation to daily inbox missing');
}

assert(workflow.includes('node tests/reconciliation-inbox-187.cjs'),'inbox source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-inbox-db-187.php'),'inbox DB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=62,'reconciliation inbox requires 1.2.62 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(note.includes('Migration zinciri') && note.includes('086'),'migration chain must remain 086');

for(const path of [
  'RELEASE-1.2.62.md',
  'src/ticari_mutabakat_is_kutusu.php',
  'ticari-mutabakat-is-kutusu.php',
  'ticari-mutabakat-is-kutusu.css',
  'tests/reconciliation-inbox-187.cjs',
  'tests/reconciliation-inbox-db-187.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: personal reconciliation inbox, due windows, team workload and read-only source contract');
