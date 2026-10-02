'use strict';

const fs=require('fs');
const assert=require('assert');

const reminders=fs.readFileSync('src/tahsilat_hatirlatma.php','utf8');
const notifications=fs.readFileSync('src/bildirimler.php','utf8');
const page=fs.readFileSync('tahsilat-risk.php','utf8');
const migration=fs.readFileSync('database/migrations/083_ticari_tahsilat_hatirlatmalari.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(reminders.includes('function th_tables_ready('),'reminder readiness helper missing');
assert(reminders.includes('function th_milestone('),'reminder milestone resolver missing');
assert(reminders.includes('function th_manager_recipients('),'manager recipient resolver missing');
assert(reminders.includes('function th_history_exists('),'reminder history dedup helper missing');
assert(reminders.includes('function th_notification_text('),'reminder message builder missing');
assert(reminders.includes('function th_sync_manager_reminders('),'manager reminder sync missing');
assert(reminders.includes('function th_history_rows('),'reminder history list missing');
assert(reminders.includes('function th_contract_history('),'per-contract reminder history missing');
assert(reminders.includes('function th_summary('),'reminder summary missing');

assert(reminders.includes("'kod'=>'vade_7'"),'pre-due <=7 milestone missing');
assert(reminders.includes("'kod'=>'vade_0'"),'due/early-overdue milestone missing');
assert(reminders.includes("'kod'=>'gecikme_7'"),'7+ overdue milestone missing');
assert(reminders.includes("'kod'=>'gecikme_15'"),'15+ overdue milestone missing');
assert(reminders.includes("'kod'=>'gecikme_30'"),'30+ overdue milestone missing');
assert(reminders.includes("if($daysUntil<=7)") || reminders.includes('if($daysUntil<=7)'),
  'pre-due threshold guard missing');

assert(reminders.includes("kk.kurum_rolu='yonetici'"),
  'collection reminders must target institution managers only');
assert(reminders.includes("INNER JOIN kullanicilar u ON u.id=kk.kullanici_id AND u.aktif=1"),
  'inactive manager accounts must not receive reminders');
assert(reminders.includes("INSERT IGNORE INTO ticari_tahsilat_hatirlatmalari"),
  'reminder sync must deduplicate concurrent inserts');
assert(reminders.includes("WHERE sozlesme_id=? AND vade_tarihi=? AND esik_kodu=?"),
  'contract + due period + threshold dedup lookup missing');
assert(reminders.includes("'tahsilat_hatirlatma'"),
  'central notification source type missing');
assert(reminders.includes("'yonetici'"),
  'central notification target role missing');
assert(reminders.includes("'bildirimler.php'"),
  'manager reminder must link to accessible notification center');
assert(reminders.includes("tr_history_add(") && reminders.includes("'bildirim',$freshCode"),
  'risk history must record reminder delivery');
assert(reminders.includes("tr_contract_financial_state(") && reminders.includes("tr_should_track("),
  'reminder sync must recheck current financial truth under lock');
assert(!reminders.includes('mail('),
  'collection reminders must use central in-app notification system, not direct mail');
assert(!reminders.includes('DELETE FROM ticari_tahsilat_hatirlatmalari'),
  'reminder history must not be physically deleted');

assert(notifications.includes("function bd_recipient_roles(): array"),
  'manual notification role contract missing');
assert(notifications.includes("return ['ogretmen'=>'Öğretmenler','veli'=>'Veliler','ogrenci'=>'Öğrenciler'];"),
  'manual notification targets must remain student/parent/teacher only');
assert(notifications.includes("'yonetici'=>'Yöneticiler'"),
  'system-supported manager recipient role missing');

assert(page.includes("require __DIR__.'/src/tahsilat_hatirlatma.php';"),
  'risk center must load reminder domain');
assert(page.includes('name="action" value="notify"'),
  'explicit reminder synchronization action missing');
assert(page.includes('Yönetici Hatırlatmalarını Senkronize Et'),
  'manager reminder sync button missing');
assert(page.includes('Gönderim Geçmişi & Eşikler'),
  'reminder history panel missing');
assert(page.includes('Yönetici Hatırlatma Geçmişi'),
  'selected contract reminder history missing');
assert(page.includes('Hatırlatmalar yalnız aktif kurum yöneticilerine gider'),
  'manager-only reminder explanation missing');
assert(!page.includes("if($ready){\n    th_sync_manager_reminders"),
  'GET page load must not send manager reminders');

assert(migration.includes('CREATE TABLE IF NOT EXISTS ticari_tahsilat_hatirlatmalari'),
  'reminder delivery history table missing');
assert(migration.includes('UNIQUE KEY uk_tahsilat_hatirlatma (sozlesme_id,vade_tarihi,esik_kodu)'),
  'reminder DB dedup invariant missing');
assert(migration.includes('acik_tutar DECIMAL(14,2) NOT NULL'),
  'historical reminder amount snapshot missing');
assert(migration.includes('alici_sayisi INT UNSIGNED NOT NULL DEFAULT 0'),
  'historical recipient-count snapshot missing');
assert(!migration.includes('ALTER TABLE kurum_sozlesmeleri'),
  'reminder release must not mutate finance source schema');

assert(workflow.includes('node tests/collection-reminders-176.cjs'),
  'collection reminder source regression missing from quality gate');
assert(workflow.includes('php tests/collection-reminders-db-176.php'),
  'collection reminder MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=51,'collection reminders require 1.2.51 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.51.md',
  'database/migrations/083_ticari_tahsilat_hatirlatmalari.sql',
  'src/tahsilat_hatirlatma.php',
  'tests/collection-reminders-176.cjs',
  'tests/collection-reminders-db-176.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: manager-only collection reminders, 7/15/30 threshold dedup and delivery-history source contract');
