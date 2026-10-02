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
const releaseNote=fs.readFileSync('RELEASE-1.2.74.md','utf8');

assert(inboxDomain.includes('function mi_target_risk_case(PDO $pdo,array $actor,int $caseId): ?array'),
  'inbox exact-case target-risk context adapter missing');
assert(inboxDomain.includes('mi_target_risk_map($pdo,$actor,[$caseId])'),
  'inbox exact-case context must reuse current-owner/current-cycle inbox resolver');
assert(inboxDomain.includes('function mi_send_target_risk_case(PDO $pdo,array $actor,int $caseId): array'),
  'inbox target-risk send adapter missing');
assert(inboxDomain.includes("if((string)($context['hedef_bildirim_durumu']??'')!=='bekliyor')"),
  'inbox send adapter must require current pending state');
assert(inboxDomain.includes('mrb_sync_case($pdo,$actor,$caseId)'),
  'inbox send adapter must reuse 1.2.73 exact-case notification engine');
assert(!inboxDomain.includes('INSERT INTO ticari_mutabakat_hedef_risk_bildirimleri'),
  'inbox adapter must not implement a second notification persistence algorithm');

assert(notificationDomain.includes('function mrb_sync_case(PDO $pdo,array $actor,int $caseId): array'),
  'existing exact-case send engine missing');
assert(notificationDomain.includes('return mrb_sync($pdo,$actor,$caseId);'),
  'exact-case adapter must still reuse global send engine');
assert(notificationDomain.includes('LIMIT 1 FOR UPDATE'),
  'send engine row-lock guard missing');
assert(notificationDomain.includes('INSERT IGNORE INTO ticari_mutabakat_hedef_risk_bildirimleri'),
  'send engine concurrent dedup guard missing');
assert(notificationDomain.includes('ma_case_source_still_open($pdo,$case)'),
  'send engine stale-source revalidation missing');

assert(page.includes("require __DIR__.'/src/bildirimler.php';"),
  'inbox page must load central notification infrastructure');
assert(page.includes("require __DIR__.'/src/ticari_mutabakat_hedef_risk_bildirim.php';"),
  'inbox page must load target-risk notification engine');
assert(page.includes("if($_SERVER['REQUEST_METHOD']==='POST')"),
  'inbox must expose controlled POST flow');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),
  'inbox exact-case send must require CSRF');
assert(page.includes("if($action!=='send_target_risk')"),
  'inbox POST must whitelist exact send action');
assert(page.includes("ma_sync_cases($pdo,$user)"),
  'inbox POST must refresh reconciliation source state before send');
assert(page.includes('mi_send_target_risk_case($pdo,$user,$caseId)'),
  'inbox page must call exact-case inbox adapter');
assert(page.includes('name="action" value="send_target_risk"'),
  'inbox row send form missing');
assert(page.includes('Güncel Hedef-Risk Bildirimini Gönder'),
  'inbox exact-case send button missing');
assert(page.includes("if(!empty($row['hedef_bildirim_bekliyor']))"),
  'send button must render only for pending current target-risk delivery');
assert(page.includes('Aynı vaka + current owner + current reopen döngüsü + current sinyal ikinci kez gönderilemez.'),
  'inbox dedup explanation missing');
assert(page.includes('function mi_return_query(array $source): string'),
  'safe inbox return-filter builder missing');
assert(!page.includes('return_to'),
  'inbox send must not accept arbitrary return URL');
assert(!page.includes('okundu_tarihi=NOW()'),
  'inbox send must never mark target-risk notification as read');
assert(css.includes('.mi-risk-send'),
  'inbox exact-case send styles missing');

assert(workflow.includes('node tests/reconciliation-inbox-target-risk-send-199.cjs'),
  '1.2.74 source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-inbox-target-risk-send-db-199.php'),
  '1.2.74 MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=74,'inbox exact-case target-risk send requires 1.2.74 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(releaseNote.includes('Yeni migration yoktur.'),'1.2.74 must remain migration-free');
assert(releaseNote.includes('090'),'1.2.74 must document unchanged migration chain 090');

for(const path of [
  'RELEASE-1.2.74.md',
  'tests/reconciliation-inbox-target-risk-send-199.cjs',
  'tests/reconciliation-inbox-target-risk-send-db-199.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: reconciliation inbox exact-case target-risk send reuses current context and 1.2.73 send engine');
