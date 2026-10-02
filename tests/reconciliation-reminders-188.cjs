'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_mutabakat_hatirlatma.php','utf8');
const page=fs.readFileSync('ticari-mutabakat-hatirlatma.php','utf8');
const css=fs.readFileSync('ticari-mutabakat-hatirlatma.css','utf8');
const notifications=fs.readFileSync('src/bildirimler.php','utf8');
const inbox=fs.readFileSync('ticari-mutabakat-is-kutusu.php','utf8');
const action=fs.readFileSync('ticari-mutabakat-aksiyon.php','utf8');
const health=fs.readFileSync('ticari-mutabakat-saglik.php','utf8');
const planning=fs.readFileSync('ticari-mutabakat-planlama.php','utf8');
const dashboard=fs.readFileSync('ticari-dashboard.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const migration=fs.readFileSync('database/migrations/087_mutabakat_aksiyon_hatirlatmalari.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const note=fs.readFileSync('RELEASE-1.2.63.md','utf8');

assert(domain.includes('function mr_tables_ready('),'reminder readiness helper missing');
assert(domain.includes('function mr_milestone('),'action reminder milestone resolver missing');
assert(domain.includes('function mr_owner('),'Super Admin owner validation helper missing');
assert(domain.includes('function mr_candidate_rows('),'reminder candidate query missing');
assert(domain.includes('function mr_notification_text('),'reminder message builder missing');
assert(domain.includes('function mr_sync('),'reminder synchronization missing');
assert(domain.includes('function mr_summary('),'reminder summary missing');
assert(domain.includes('function mr_history_rows('),'reminder history query missing');
assert(domain.includes('function mr_case_history('),'case reminder history query missing');

assert(domain.includes("'kod'=>'bugun'"),'today milestone missing');
assert(domain.includes("'kod'=>'gecikme_1'"),'1+ overdue milestone missing');
assert(domain.includes("'kod'=>'gecikme_3'"),'3+ overdue milestone missing');
assert(domain.includes("'kod'=>'gecikme_7'"),'7+ overdue milestone missing');
assert(domain.includes("'kod'=>'gecikme_14'"),'14+ overdue milestone missing');
assert(domain.includes("'kod'=>'gecikme_30'"),'30+ overdue milestone missing');
assert(domain.includes('if($late<0) return null;'),'future actions must not notify');

assert(domain.includes("v.durum IN ('acik','incelemede','beklemede')"),
  'only open reconciliation cases may notify');
assert(domain.includes('v.sorumlu_kullanici_id IS NOT NULL'),
  'unassigned cases must not notify');
assert(domain.includes('v.sonraki_aksiyon_tarihi<=CURDATE()'),
  'future action dates must stay outside candidate queue');
assert(domain.includes("auth_user_has_role($user,'super_admin')"),
  'recipient must be active Super Admin');
assert(domain.includes('ma_case_source_still_open($pdo,$case)'),
  'source issue must be revalidated before notification');
assert(domain.includes('INSERT IGNORE INTO ticari_mutabakat_aksiyon_hatirlatmalari'),
  'concurrent reminder dedup guard missing');
assert(domain.includes('vaka_id=? AND aksiyon_tarihi=? AND esik_kodu=? AND alici_kullanici_id=?'),
  'case+date+threshold+recipient dedup lookup missing');
assert(domain.includes("'super_admin'"),
  'system notification recipient role missing');
assert(domain.includes("'mutabakat_aksiyon_hatirlatma'"),
  'central notification source type missing');
assert(domain.includes("'ticari-mutabakat-aksiyon.php?vaka_id='"),
  'reminder deep-link to case missing');
assert(domain.includes("ma_history_add(") && domain.includes("'bildirim','hatirlatma_'.$code"),
  'append-only case history reminder event missing');
assert(!domain.includes('DELETE FROM ticari_mutabakat_aksiyon_hatirlatmalari'),
  'reminder history must not be physically deleted');

assert(notifications.includes("'super_admin'=>'Süper Admin'"),
  'internal Super Admin notification recipient support missing');
assert(notifications.includes("function bd_recipient_roles(): array"),
  'manual notification role contract missing');
assert(notifications.includes("return ['ogretmen'=>'Öğretmenler','veli'=>'Veliler','ogrenci'=>'Öğrenciler'];"),
  'manual notification roles must remain unchanged');

assert(page.includes("require_role('super_admin')"),'reminder center must be Super Admin only');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),'reminder sync must require CSRF');
assert(page.includes('name="action" value="sync"'),'explicit reminder sync action missing');
assert(page.includes('Aksiyon Hatırlatmalarını Senkronize Et'),'reminder sync button missing');
assert(page.includes('Güncel Adaylar') || page.includes('GÜNCEL ADAYLAR'),'candidate preview missing');
assert(page.includes('Hatırlatma Geçmişi'),'delivery history panel missing');
assert(page.includes('sayfayı açmak bildirim üretmez'),'GET no-send disclosure missing');
assert(!page.includes("mr_sync($pdo,$user);\n$summary"),
  'GET page load must not synchronize reminders');

for(const content of [inbox,action,health,planning,dashboard]){
  assert(content.includes('ticari-mutabakat-hatirlatma.php'),'commercial cross-navigation to reminder center missing');
}
assert(!admin.includes('ticari-mutabakat-hatirlatma.php'),'legacy reminder navigation must stay hidden from the education-focused Super Admin');
if(Number(version.version.split('.')[2])<74){
  assert(inbox.includes('Bu ekran salt-okunurdur.'),
    'legacy daily inbox must remain read-only after reminder release');
  assert(!inbox.includes("$_SERVER['REQUEST_METHOD']==='POST'"),
    'legacy daily inbox must not absorb reminder POST writes');
}else{
  assert(inbox.includes("$_SERVER['REQUEST_METHOD']==='POST'"),
    '1.2.74+ daily inbox target-risk POST missing');
  if(Number(version.version.split('.')[2])<75){
    assert(inbox.includes("if($action!=='send_target_risk')"),
      '1.2.74 daily inbox must allow only exact target-risk send');
  }else{
    assert(inbox.includes("in_array($action,['send_target_risk','send_target_risk_batch'],true)"),
      '1.2.75+ daily inbox must keep only single/batch target-risk writes in its closed whitelist');
  }
  assert(!inbox.includes("name=\"action\" value=\"sync\""),
    'daily inbox must not absorb action-reminder sync');
}

assert(css.includes('.mr-summary'),'reminder summary styles missing');
assert(css.includes('.mr-history'),'reminder history styles missing');

assert(migration.includes('CREATE TABLE IF NOT EXISTS ticari_mutabakat_aksiyon_hatirlatmalari'),
  'reminder history table missing');
assert(migration.includes('UNIQUE KEY uk_mutabakat_hatirlatma (vaka_id,aksiyon_tarihi,esik_kodu,alici_kullanici_id)'),
  'DB reminder dedup invariant missing');
assert(!migration.includes('ALTER TABLE ticari_mutabakat_vakalari'),
  'reminder release must not mutate reconciliation case schema');

assert(workflow.includes('node tests/reconciliation-reminders-188.cjs'),
  'reminder source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-reminders-db-188.php'),
  'reminder MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=63,'reconciliation reminders require 1.2.63 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(note.includes('Migration zinciri') && note.includes('087'),'migration chain must advance to 087');

for(const path of [
  'RELEASE-1.2.63.md',
  'database/migrations/087_mutabakat_aksiyon_hatirlatmalari.sql',
  'src/ticari_mutabakat_hatirlatma.php',
  'ticari-mutabakat-hatirlatma.php',
  'ticari-mutabakat-hatirlatma.css',
  'tests/reconciliation-reminders-188.cjs',
  'tests/reconciliation-reminders-db-188.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: reconciliation action reminders, Super Admin recipient support, dedup and controlled inbox-write separation');
