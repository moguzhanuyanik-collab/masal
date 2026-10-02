'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_mutabakat_is_kutusu.php','utf8');
const page=fs.readFileSync('ticari-mutabakat-is-kutusu.php','utf8');
const css=fs.readFileSync('ticari-mutabakat-is-kutusu.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('function mi_target_risk_labels('),'target-risk inbox filter labels missing');
assert(domain.includes('function mi_target_risk_ready('),'target-risk readiness guard missing');
assert(domain.includes('function mi_target_risk_map('),'target-risk enrichment map missing');
assert(domain.includes('function mi_risk_priority('),'target-risk inbox priority resolver missing');
assert(domain.includes("function_exists('mhr_rows')"),'target-risk integration must degrade safely without target domain');
assert(domain.includes("'ticari_mutabakat_hedef_risk_bildirimleri'"),'target-risk notification history dependency missing');
assert(domain.includes("'kurum_duyuru_alicilari'"),'recipient read-state dependency missing');
assert(domain.includes("hash('sha256',$caseId.'|'.trim($cycleStart))"),
  'inbox current-cycle key must match target-risk notification dedup semantics');
assert(domain.includes("b.alici_kullanici_id") && domain.includes("b.dongu_anahtari") && domain.includes("b.esik_kodu"),
  'current owner/cycle/signal notification match missing');
assert(domain.includes("'hedef_bildirim_durumu'"),'target-risk notification state missing');
assert(domain.includes("'hedef_bildirim_okunmadi'"),'unread target-risk flag missing');
assert(domain.includes("'hedef_bildirim_bekliyor'"),'pending target-risk delivery flag missing');
assert(domain.includes("'mine_target_outside'"),'mine target-outside summary missing');
assert(domain.includes("'mine_target_75'"),'mine 75+ summary missing');
assert(domain.includes("'mine_target_unread'"),'mine unread target-risk summary missing');
assert(domain.includes("'mine_target_pending'"),'mine pending target-risk summary missing');
assert(domain.includes("'target_outside_count'"),'team target-outside workload missing');
assert(domain.includes("'target_unread_count'"),'team unread-risk workload missing');
assert(domain.includes("'target_pending_count'"),'team pending-risk workload missing');
assert(!/\bINSERT\b|\bUPDATE\b|\bDELETE\b/.test(domain),
  'daily inbox target-risk integration must remain read-only');

assert(page.includes("require __DIR__.'/src/ticari_mutabakat_hedef_risk.php';"),
  'inbox page must load target-risk resolver');
assert(page.includes('name="risk"'),'target-risk filter missing from inbox UI');
assert(page.includes('Hedef Dışında'),'target-outside badge missing');
assert(page.includes('Hedef %75+'),'75+ badge missing');
assert(page.includes('Bildirim Okunmadı'),'unread target-risk badge missing');
assert(page.includes('Bildirim Bekliyor'),'pending target-risk badge missing');
assert(page.includes('Risk bildirimi okunmadı'),'unread target-risk summary card missing');
assert(page.includes('Risk bildirimi bekliyor'),'pending target-risk summary card missing');
assert(page.includes('aria-label="Hedef Risk Bildirim Sağlığı"'),
  'notification health shortcut missing from inbox');
assert(page.includes('Hedef-risk sinyali veya bildirim üretmez'),
  'read-only target-risk integration disclosure missing');
assert(!page.includes("$_SERVER['REQUEST_METHOD']==='POST'"),
  'daily inbox must remain write-free');

assert(css.includes('.role-pill.target-outside'),'target-outside badge style missing');
assert(css.includes('.role-pill.target-unread'),'unread target-risk badge style missing');
assert(css.includes('.role-pill.target-pending'),'pending target-risk badge style missing');

assert(workflow.includes('node tests/reconciliation-inbox-target-risk-196.cjs'),
  '196 source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-inbox-target-risk-db-196.php'),
  '196 DB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=71,'target-risk inbox integration requires 1.2.71 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.71.md',
  'tests/reconciliation-inbox-target-risk-196.cjs',
  'tests/reconciliation-inbox-target-risk-db-196.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

assert(!manifest.files.includes('database/migrations/091_mutabakat_is_kutusu_hedef_risk.sql'),
  'read-only inbox integration must not invent a migration');

console.log('PASS: target-risk/current-owner/current-cycle notification state integrated into read-only reconciliation inbox');
