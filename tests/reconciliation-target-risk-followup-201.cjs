'use strict';

const fs=require('fs');
const assert=require('assert');

const health=fs.readFileSync('src/ticari_mutabakat_hedef_risk_saglik.php','utf8');
const planning=fs.readFileSync('src/ticari_mutabakat_planlama.php','utf8');
const follow=fs.readFileSync('src/ticari_mutabakat_hedef_risk_takip.php','utf8');
const healthPage=fs.readFileSync('ticari-mutabakat-hedef-risk-saglik.php','utf8');
const followPage=fs.readFileSync('ticari-mutabakat-hedef-risk-takip.php','utf8');
const followCss=fs.readFileSync('ticari-mutabakat-hedef-risk-takip.css','utf8');
const inbox=fs.readFileSync('ticari-mutabakat-is-kutusu.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const releaseNote=fs.readFileSync('RELEASE-1.2.76.md','utf8');

assert(health.includes("$isCurrentOwner=(int)$row['alici_kullanici_id']===(int)($row['sorumlu_kullanici_id']??0)"),
  'health current-owner matcher missing');
assert(health.includes("$row['guncel_acik_vaka']=$isOpen && $isCurrentCycle && $isCurrentOwner"),
  'current-open health state must require current owner');
assert(health.includes("'eski_sorumlu_bildirimi'"),
  'old-owner historical notification state missing');
assert(health.includes("$stateFilter==='eski_sorumlu'"),
  'old-owner health filter missing');
assert(health.includes("'old_owner'=>0"),
  'old-owner health summary missing');

assert(planning.includes('function map_bulk_reschedule_preserve_owners('),
  'preserve-owner bulk reschedule helper missing');
assert(planning.includes("SET sonraki_aksiyon_tarihi=?,guncelleyen_kullanici_id=?"),
  'preserve-owner planning must not update owner');
assert(planning.includes("'toplu_takip_planlama'"),
  'preserve-owner planning audit history code missing');
assert(planning.includes("map_validate_owner($pdo,$ownerId)"),
  'current owner must be revalidated as active Super Admin');

assert(follow.includes('function mrt_tables_ready('),'follow-up readiness helper missing');
assert(follow.includes('function mrt_normalize_case_ids('),'follow-up selection normalization missing');
assert(follow.includes('function mrt_rows('),'current unread follow-up resolver missing');
assert(follow.includes('function mrt_summary('),'follow-up summary missing');
assert(follow.includes('function mrt_visible_case_ids('),'follow-up allowlist helper missing');
assert(follow.includes('function mrt_plan_selected('),'follow-up planning adapter missing');
assert(follow.includes("if(count($ids)>50)"),
  'follow-up hard 50-case cap missing');
assert(follow.includes("'state'=>'guncel_acik_okunmadi'"),
  'follow-up must start from current-open-unread health state');
assert(follow.includes("mi_target_risk_map($pdo,$actor"),
  'follow-up must reuse exact current owner/cycle/signal inbox resolver');
assert(follow.includes("(int)($ctx['hedef_bildirim_id']??0)!==(int)$row['id']"),
  'follow-up must require exact current notification id');
assert(follow.includes("(string)($ctx['hedef_bildirim_durumu']??'')!=='okunmadi'"),
  'follow-up must require unread exact current notification');
assert(follow.includes("ma_sync_cases($pdo,$actor)"),
  'follow-up must re-sync source cases before POST allowlist validation');
assert(follow.includes("map_bulk_reschedule_preserve_owners("),
  'follow-up must reuse preserve-owner planning engine');
assert(follow.includes("artık güncel açık ve okunmamış hedef-risk allowlistinde değil"),
  'stale selection fail-closed guard missing');

assert(healthPage.includes('Eski sorumlu'),'health old-owner UI missing');
assert(healthPage.includes('ticari-mutabakat-hedef-risk-takip.php'),
  'health follow-up planner navigation missing');
assert(healthPage.includes('Bu dashboard salt-okunurdur.'),
  'health dashboard must remain read-only');
assert(!healthPage.includes("$_SERVER['REQUEST_METHOD']==='POST'"),
  'health dashboard must remain free of write POST actions');

assert(followPage.includes("require_role('super_admin')"),
  'follow-up planner must be Super Admin only');
assert(followPage.includes("verify_csrf($_POST['csrf']??null)"),
  'follow-up write must require CSRF');
assert(followPage.includes("if((string)($_POST['action']??'')!=='plan_unread')"),
  'follow-up page must use a closed action whitelist');
assert(followPage.includes('İlk 50 görünür vakayı seç'),
  'follow-up selection helper missing');
assert(followPage.includes('owner değiştirmez'),
  'follow-up owner-preservation disclosure missing');
assert(followPage.includes('current owner + current reopen döngüsü + exact current signal + okunmamış'),
  'follow-up POST revalidation disclosure missing');
assert(followCss.includes('.mrt-summary'),'follow-up summary styles missing');
assert(followCss.includes('.mrt-row'),'follow-up selection styles missing');

assert(inbox.includes('aria-label="Okunmamış Risk Takibi"'),
  'daily inbox follow-up shortcut missing');
assert(!admin.includes('Okunmamış Hedef Risk Takibi'),'legacy commercial navigation must stay hidden from the education-focused Super Admin');

assert(workflow.includes('node tests/reconciliation-target-risk-followup-201.cjs'),
  '201 source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-target-risk-followup-db-201.php'),
  '201 MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=76,'target-risk follow-up requires 1.2.76 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(releaseNote.includes('090'),'1.2.76 must document unchanged migration chain 090');

for(const path of [
  'RELEASE-1.2.76.md',
  'src/ticari_mutabakat_hedef_risk_takip.php',
  'ticari-mutabakat-hedef-risk-takip.php',
  'ticari-mutabakat-hedef-risk-takip.css',
  'tests/reconciliation-target-risk-followup-201.cjs',
  'tests/reconciliation-target-risk-followup-db-201.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

assert(!manifest.files.includes('database/migrations/091_mutabakat_hedef_risk_takip.sql'),
  'follow-up planning release must not invent a migration');

console.log('PASS: current-owner notification health and exact unread target-risk follow-up planning source contract');
