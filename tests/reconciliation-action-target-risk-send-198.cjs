'use strict';

const fs=require('fs');
const assert=require('assert');

const notificationDomain=fs.readFileSync('src/ticari_mutabakat_hedef_risk_bildirim.php','utf8');
const actionPage=fs.readFileSync('ticari-mutabakat-aksiyon.php','utf8');
const actionCss=fs.readFileSync('ticari-mutabakat-aksiyon.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const releaseNote=fs.readFileSync('RELEASE-1.2.73.md','utf8');

assert(notificationDomain.includes('function mrb_candidate_rows(PDO $pdo,array $actor,int $limit=1200,?int $onlyCaseId=null)'),
  'target-risk candidate resolver must support exact-case filtering');
assert(notificationDomain.includes('if($onlyCaseId!==null && $caseId!==$onlyCaseId) continue;'),
  'candidate resolver must exclude non-selected cases');
assert(notificationDomain.includes('function mrb_sync(PDO $pdo,array $actor,?int $onlyCaseId=null)'),
  'existing global sync engine must accept optional exact-case filter');
assert(notificationDomain.includes('$candidates=mrb_candidate_rows($pdo,$actor,1500,$onlyCaseId);'),
  'sync must use filtered candidate resolver');
assert(notificationDomain.includes("'candidate_count'=>$candidateCount"),
  'single-case caller needs candidate_count result for stale/no-longer-needed outcome');
assert(notificationDomain.includes('function mrb_sync_case(PDO $pdo,array $actor,int $caseId): array'),
  'single-case sync adapter missing');
assert(notificationDomain.includes('return mrb_sync($pdo,$actor,$caseId);'),
  'single-case adapter must reuse existing global send engine');
assert(notificationDomain.includes('LIMIT 1 FOR UPDATE'),
  'target-risk send engine must preserve row-lock checks');
assert(notificationDomain.includes('ma_case_source_still_open($pdo,$case)'),
  'target-risk send engine must preserve source-open revalidation');
assert(notificationDomain.includes('INSERT IGNORE INTO ticari_mutabakat_hedef_risk_bildirimleri'),
  'target-risk send engine must preserve concurrent dedup');
assert(notificationDomain.includes("'mutabakat_hedef_risk_bildirim'"),
  'central notification source contract missing');

assert(actionPage.includes("require __DIR__.'/src/bildirimler.php';"),
  'action page must load central notification infrastructure');
assert(actionPage.includes("require __DIR__.'/src/ticari_mutabakat_hedef_risk_bildirim.php';"),
  'action page must load target-risk notification domain');
assert(actionPage.includes("if($action==='send_target_risk')"),
  'single-case target-risk POST action missing');
assert(actionPage.includes("verify_csrf($_POST['csrf']??null)"),
  'single-case send must stay behind existing CSRF guard');
assert(actionPage.includes("ma_target_risk_context($pdo,$user,$caseId)"),
  'POST must re-resolve current target-risk context before send');
assert(actionPage.includes("!==\'bekliyor\'") || actionPage.includes("!=='bekliyor'"),
  'single-case send must require current pending-notification state');
assert(actionPage.includes('mrb_sync_case($pdo,$user,$caseId)'),
  'action detail must call exact-case sender');
assert(actionPage.includes('name="action" value="send_target_risk"'),
  'single-case send form action missing');
assert(actionPage.includes('Güncel Hedef-Risk Bildirimini Gönder'),
  'single-case send button missing');
assert(actionPage.includes("hedef_bildirim_durumu']??'')==='bekliyor'"),
  'send UI must render only for pending current signal');
assert(actionPage.includes('Aynı vaka + current owner + current reopen döngüsü + current sinyal ikinci kez gönderilemez.'),
  'UI dedup explanation missing');
assert(!actionPage.includes('okundu_tarihi=NOW()'),
  'sending from action detail must never mark notification as read');
assert(actionCss.includes('.ma-target-send'),
  'single-case send styling missing');

assert(workflow.includes('node tests/reconciliation-action-target-risk-send-198.cjs'),
  '1.2.73 source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-action-target-risk-send-db-198.php'),
  '1.2.73 MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=73,'single-case target-risk send requires 1.2.73 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(releaseNote.includes('Yeni migration yoktur.'),'1.2.73 must remain migration-free');
assert(releaseNote.includes('090'),'1.2.73 must document unchanged migration chain 090');

for(const path of [
  'RELEASE-1.2.73.md',
  'tests/reconciliation-action-target-risk-send-198.cjs',
  'tests/reconciliation-action-target-risk-send-db-198.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: reconciliation action detail exact-case target-risk notification send source contract');
