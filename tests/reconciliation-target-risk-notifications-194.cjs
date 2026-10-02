'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_mutabakat_hedef_risk_bildirim.php','utf8');
const page=fs.readFileSync('ticari-mutabakat-hedef-risk-bildirim.php','utf8');
const riskPage=fs.readFileSync('ticari-mutabakat-hedef-risk.php','utf8');
const policies=fs.readFileSync('ticari-mutabakat-hedefleri.php','utf8');
const notifications=fs.readFileSync('src/bildirimler.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const migration=fs.readFileSync('database/migrations/090_mutabakat_hedef_risk_bildirimleri.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('function mrb_tables_ready('),'target-risk notification readiness helper missing');
assert(domain.includes('function mrb_signal('),'target-risk signal resolver missing');
assert(domain.includes('function mrb_cycle_key('),'reopen-aware cycle key missing');
assert(domain.includes('function mrb_owner('),'Super Admin owner validation missing');
assert(domain.includes('function mrb_history_exists('),'notification history dedup lookup missing');
assert(domain.includes('function mrb_case_state('),'fresh target-risk state resolver missing');
assert(domain.includes('function mrb_candidate_rows('),'notification candidate resolver missing');
assert(domain.includes('function mrb_notification_text('),'notification message builder missing');
assert(domain.includes('function mrb_sync('),'explicit target-risk notification sync missing');
assert(domain.includes('function mrb_history_rows('),'notification history reader missing');
assert(domain.includes('function mrb_summary('),'notification summary missing');

assert(domain.includes("'kod'=>'hedef_75'"),'75+ signal missing');
assert(domain.includes("'kod'=>'hedef_disinda'"),'target-outside signal missing');
assert(!domain.includes("'kod'=>'hedef_50'"),'50-74 band must not emit notifications');
assert(domain.includes("if(empty($row['hedef_politika_id'])) return null;"),
  'policy-missing case must not emit target notification');

assert(domain.includes("hash('sha256',$caseId.'|'.trim($cycleStart))"),
  'cycle key must be reopen-aware');
assert(domain.includes("auth_user_has_role($user,'super_admin')"),
  'recipient must be a valid Super Admin');
assert(domain.includes("SELECT *") && domain.includes("FROM ticari_mutabakat_vakalari") && domain.includes("FOR UPDATE"),
  'case row lock missing before send');
assert(domain.includes('ma_case_source_still_open($pdo,$case)'),
  'source-open revalidation missing');
assert(domain.includes('mrb_case_state($pdo,$actor,$caseId)'),
  'fresh risk recomputation missing after row lock');
assert(domain.includes('INSERT IGNORE INTO ticari_mutabakat_hedef_risk_bildirimleri'),
  'concurrent dedup insert guard missing');
assert(domain.includes("'super_admin'"),
  'target-risk notifications must use Super Admin system recipient role');
assert(domain.includes("'mutabakat_hedef_risk_bildirim'"),
  'central notification source type missing');
assert(domain.includes("'ticari-mutabakat-aksiyon.php?vaka_id='"),
  'notification deep link to action center missing');
assert(domain.includes("'bildirim','hedef_risk_'.$code"),
  'append-only case notification history missing');
assert(!domain.includes('UPDATE ticari_mutabakat_vakalari'),
  'target-risk notification domain must not mutate case state');
assert(!domain.includes('UPDATE ticari_mutabakat_hedef_politikalari'),
  'target-risk notification domain must not mutate policy state');
assert(!domain.includes('ticari_mutabakat_eskalasyonlari'),
  'target-risk notifications must not write escalation state');

assert(page.includes("require_role('super_admin')"),'notification center must be Super Admin only');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),'notification sync must require CSRF');
assert(page.includes('Hedef Risk Bildirimlerini Senkronize Et'),'explicit sync button missing');
assert(page.includes('1.2.65 operasyon eskalasyonunun yerine geçmez'),
  'UI must preserve target-risk vs escalation distinction');
assert(page.includes('İlk senkronizasyon vaka zaten hedef dışındaysa eski %75 uyarısı geriye dönük gönderilmez.'),
  'no-backfill notification behavior must be explicit');
assert(page.includes('Bildirim Geçmişi'),'append-only notification history UI missing');

assert(riskPage.includes('aria-label="Hedef Risk Bildirimleri"'),
  'target-risk queue notification shortcut missing');
assert(!riskPage.includes("mrb_sync($pdo"),
  '1.2.68 target-risk queue must remain read-only and must not send notifications');
assert(policies.includes('aria-label="Hedef Risk Bildirimleri"'),
  'target-policy center notification shortcut missing');
assert(!admin.includes('Mutabakat Hedef Risk Bildirimleri'),'legacy commercial navigation must stay hidden from the education-focused Super Admin');

assert(notifications.includes("'super_admin'=>'Süper Admin'"),
  'central system notification support for Super Admin missing');
assert(notifications.includes("return ['ogretmen'=>'Öğretmenler','veli'=>'Veliler','ogrenci'=>'Öğrenciler'];"),
  'manual announcement roles must remain unchanged');

assert(migration.includes('CREATE TABLE IF NOT EXISTS ticari_mutabakat_hedef_risk_bildirimleri'),
  'target-risk notification table missing');
assert(migration.includes('UNIQUE KEY uk_hedef_risk_bildirim (vaka_id,dongu_anahtari,hedef_politika_id,esik_kodu,alici_kullanici_id)'),
  'cycle+policy+signal+recipient dedup invariant missing');
assert(migration.includes('kullanim_orani DECIMAL(7,2) NULL'),
  'historical risk-usage snapshot missing');

assert(workflow.includes('node tests/reconciliation-target-risk-notifications-194.cjs'),
  '194 source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-target-risk-notifications-db-194.php'),
  '194 DB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=69,'target-risk notifications require 1.2.69 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.69.md',
  'database/migrations/090_mutabakat_hedef_risk_bildirimleri.sql',
  'src/ticari_mutabakat_hedef_risk_bildirim.php',
  'ticari-mutabakat-hedef-risk-bildirim.php',
  'ticari-mutabakat-hedef-risk-bildirim.css',
  'tests/reconciliation-target-risk-notifications-194.cjs',
  'tests/reconciliation-target-risk-notifications-db-194.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: policy-based target-risk notification dedup, owner validation, no-backfill and read-only queue separation');
