'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_mutabakat_hedef_risk.php','utf8');
const page=fs.readFileSync('ticari-mutabakat-hedef-risk.php','utf8');
const css=fs.readFileSync('ticari-mutabakat-hedef-risk.css','utf8');
const inbox=fs.readFileSync('ticari-mutabakat-is-kutusu.php','utf8');
const health=fs.readFileSync('ticari-mutabakat-saglik.php','utf8');
const performance=fs.readFileSync('ticari-mutabakat-performans.php','utf8');
const targets=fs.readFileSync('ticari-mutabakat-hedefleri.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const escalationDomain=fs.readFileSync('src/ticari_mutabakat_eskalasyon.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const releaseNote=fs.readFileSync('RELEASE-1.2.68.md','utf8');

for(const fn of [
  'mhr_tables_ready','mhr_scope_labels','mhr_risk_labels','mhr_enrich_row',
  'mhr_rows','mhr_summary','mhr_owner_rows','mhr_remaining_label'
]) assert(domain.includes('function '+fn+'('),fn+' missing');

assert(domain.includes("'hedef_disinda'=>'Hedef Dışında'"),'target-outside queue state missing');
assert(domain.includes("'yuzde_75'=>'Süre %75+'"),'75 percent target-time band missing');
assert(domain.includes("'yuzde_50'=>'Süre %50–74'"),'50-74 percent target-time band missing');
assert(domain.includes("'politika_yok'=>'Politika Yok'"),'missing-policy queue state missing');
assert(domain.includes("if($usage>=75)"),'75 percent deterministic threshold missing');
assert(domain.includes("elseif($usage>=50)"),'50 percent deterministic threshold missing');
assert(domain.includes("mh_open_target_rows($pdo,1500)"),
  'target risk queue must reuse historical target-resolution rows');
assert(domain.includes("if($firstTs===false)"),
  'pending first-intervention clock handling missing');
assert(domain.includes("if($cycleOutside || $firstOutside)"),
  'any breached target must classify the case outside target');
assert(!/\bINSERT\b|\bUPDATE\b|\bDELETE\b/.test(domain),
  'target risk domain must remain read-only');

assert(page.includes("require_role('super_admin')"),'target risk queue must be Super Admin only');
assert(page.includes('Hedef Risk & Aksiyon Kuyruğu'),'target risk hero missing');
assert(page.includes('Süre %75+'),'75 percent queue UI missing');
assert(page.includes('Süre %50–74'),'50-74 percent queue UI missing');
assert(page.includes('Politika Yok'),'missing-policy queue UI missing');
assert(page.includes('Bu ekran sözleşmesel SLA, çalışan skoru veya başarı sıralaması değildir.'),
  'non-evaluative disclosure missing');
assert(page.includes('1.2.65 eskalasyon eşikleri değişmez'),
  'fixed escalation separation disclosure missing');
assert(page.includes('vaka_yeniden_acildi'),
  'reopen-aware cycle explanation missing');
assert(!page.includes("$_SERVER['REQUEST_METHOD']==='POST'"),
  'target risk page must not expose write actions');

assert(css.includes('.mhr-summary'),'target risk summary styles missing');
assert(css.includes('.mhr-progress'),'target-time usage progress styles missing');
assert(css.includes('.mhr-table'),'owner workload table styles missing');

for(const content of [inbox,health,performance,targets,admin])
  assert(content.includes('ticari-mutabakat-hedef-risk.php'),'target risk navigation missing');

assert(escalationDomain.includes("if($days>=30)") && escalationDomain.includes("if($days>=14)")
  && escalationDomain.includes("if($days>=8)") && escalationDomain.includes("if($days>=4)"),
  '1.2.65 fixed escalation milestones must remain unchanged');

assert(workflow.includes('node tests/reconciliation-target-risk-193.cjs'),
  'target risk source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-target-risk-db-193.php'),
  'target risk MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=68,'target risk queue requires 1.2.68 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(releaseNote.includes('Migration zinciri'),'release note migration-chain statement missing');
assert(releaseNote.includes('089'),'1.2.68 must document unchanged migration chain 089');

for(const path of [
  'RELEASE-1.2.68.md',
  'src/ticari_mutabakat_hedef_risk.php',
  'ticari-mutabakat-hedef-risk.php',
  'ticari-mutabakat-hedef-risk.css',
  'tests/reconciliation-target-risk-193.cjs',
  'tests/reconciliation-target-risk-db-193.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

assert(!manifest.files.includes('database/migrations/090_mutabakat_hedef_risk.sql'),
  'read-only target risk queue must not invent a migration');

console.log('PASS: read-only reconciliation target-risk queue, historical policy timing and non-evaluative workload source contract');
