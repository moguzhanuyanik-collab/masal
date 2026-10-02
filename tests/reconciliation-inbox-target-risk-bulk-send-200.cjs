'use strict';

const fs=require('fs');
const assert=require('assert');

const inboxDomain=fs.readFileSync('src/ticari_mutabakat_is_kutusu.php','utf8');
const notificationDomain=fs.readFileSync('src/ticari_mutabakat_hedef_risk_bildirim.php','utf8');
const page=fs.readFileSync('ticari-mutabakat-is-kutusu.php','utf8');
const css=fs.readFileSync('ticari-mutabakat-is-kutusu.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const releaseNote=fs.readFileSync('RELEASE-1.2.75.md','utf8');

assert(inboxDomain.includes('function mi_pending_case_ids(array $rows): array'),
  'pending visible case-id resolver missing');
assert(inboxDomain.includes('function mi_send_target_risk_cases('),
  'bulk target-risk send adapter missing');
assert(inboxDomain.includes('$normalized[$caseId]=$caseId'),
  'bulk selection must normalize duplicate case ids');
assert(inboxDomain.includes('$maxCases=max(1,min(50,$maxCases));'),
  'bulk send must enforce a hard 50-case ceiling');
assert(inboxDomain.includes("if(!isset($allowed[$caseId]))"),
  'bulk send must enforce the visible/pending allowlist');
assert(inboxDomain.includes("$out['not_visible']++"),
  'bulk send must report rejected hidden/non-pending selections');
assert(inboxDomain.includes('mi_send_target_risk_case($pdo,$actor,$caseId)'),
  'bulk adapter must reuse exact-case inbox sender');
assert(inboxDomain.includes('catch(Throwable $e)'),
  'one selected-case failure must not abort the remaining batch');
assert(!inboxDomain.includes('INSERT INTO ticari_mutabakat_hedef_risk_bildirimleri'),
  'bulk inbox adapter must not create a second notification persistence algorithm');

assert(notificationDomain.includes('function mrb_sync_case(PDO $pdo,array $actor,int $caseId): array'),
  'exact-case notification engine missing');
assert(notificationDomain.includes('return mrb_sync($pdo,$actor,$caseId);'),
  'exact-case notification engine must still reuse global sender');
assert(notificationDomain.includes('LIMIT 1 FOR UPDATE'),
  'notification engine row-lock guard missing');
assert(notificationDomain.includes('INSERT IGNORE INTO ticari_mutabakat_hedef_risk_bildirimleri'),
  'notification engine concurrent dedup guard missing');

assert(page.includes("in_array($action,['send_target_risk','send_target_risk_batch'],true)"),
  'inbox POST action whitelist must include only single and batch sends');
assert(page.includes("if($action==='send_target_risk_batch')"),
  'batch POST flow missing');
assert(page.includes('ma_sync_cases($pdo,$user)'),
  'batch POST must refresh reconciliation state before rebuilding eligibility');
assert(page.includes('$visibleRows=mi_case_rows($pdo,$user'),
  'batch POST must rebuild current filtered rows');
assert(page.includes('$allowed=mi_pending_case_ids($visibleRows)'),
  'batch POST must derive current visible/pending allowlist');
assert(page.includes('mi_send_target_risk_cases($pdo,$user,$selected,$allowed,50)'),
  'batch POST must call hard-limited bulk adapter');
assert(page.includes('name="action" value="send_target_risk_batch"'),
  'bulk send form missing');
assert(page.includes('name="vaka_ids[]"'),
  'per-row bulk selection checkbox missing');
assert(page.includes('form="mi-bulk-risk-form"'),
  'bulk checkboxes must target standalone batch form without nested forms');
assert(page.includes('İlk 50 görünür bekleyen vakayı seç'),
  'visible pending select-all control missing');
assert(page.includes('Seçili Hedef-Risk Bildirimlerini Gönder'),
  'bulk send button missing');
assert(page.includes("index<50"),
  'client-side visible select-all must stop after first 50 checkboxes');
assert(page.includes('function mi_return_query(array $source): string'),
  'safe return-filter builder missing');
assert(!page.includes('return_to'),
  'batch send must not accept arbitrary redirect URLs');
assert(!page.includes('okundu_tarihi=NOW()'),
  'batch send must never mark notifications as read');

assert(css.includes('.mi-bulk-risk'),
  'bulk send toolbar styles missing');
assert(css.includes('.mi-bulk-select'),
  'bulk row selector styles missing');
assert(css.includes('.mi-row-wrap.bulk-pending'),
  'bulk pending row styling must avoid :has dependency');
assert(!css.includes(':has('),
  'bulk inbox styles must not require :has selector');

assert(workflow.includes('node tests/reconciliation-inbox-target-risk-bulk-send-200.cjs'),
  '1.2.75 source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-inbox-target-risk-bulk-send-db-200.php'),
  '1.2.75 MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=75,'bulk inbox target-risk send requires 1.2.75 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(releaseNote.includes('Yeni migration yoktur.'),'1.2.75 must remain migration-free');
assert(releaseNote.includes('090'),'1.2.75 must document unchanged migration chain 090');

for(const path of [
  'RELEASE-1.2.75.md',
  'tests/reconciliation-inbox-target-risk-bulk-send-200.cjs',
  'tests/reconciliation-inbox-target-risk-bulk-send-db-200.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: reconciliation inbox filtered bulk target-risk send reuses exact-case safeguards with visible allowlist and hard batch limit');
