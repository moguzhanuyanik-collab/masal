'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/lisans_yenileme.php','utf8');
const page=fs.readFileSync('lisans-yenilemeleri.php','utf8');
const notifications=fs.readFileSync('src/bildirimler.php','utf8');
const notificationPage=fs.readFileSync('bildirimler.php','utf8');
const finance=fs.readFileSync('ticari-finans.php','utf8');
const packages=fs.readFileSync('paketler.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const migration=fs.readFileSync('database/migrations/080_lisans_yenileme_operasyon_merkezi.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('function ly_sync_cases('),'renewal queue sync missing');
assert(domain.includes('function ly_queue_rows('),'renewal queue query missing');
assert(domain.includes('function ly_add_note('),'renewal follow-up note flow missing');
assert(domain.includes('function ly_set_stage('),'renewal stage flow missing');
assert(domain.includes('function ly_renew('),'real license renewal flow missing');
assert(domain.includes('function ly_mark_not_renewed('),'not-renewed close flow missing');
assert(domain.includes('function ly_sync_manager_notifications('),'manager renewal notification sync missing');
assert(domain.includes('function ly_notification_milestone('),'renewal notification milestone resolver missing');
assert(domain.includes('function ly_history_has_code('),'notification/history dedupe helper missing');

assert(domain.includes("DATEDIFF(kl.bitis_tarihi,CURDATE())<=?"),'30-day queue source query missing');
assert(domain.includes("$status==='open'"),'aggregate open-case filter missing');
assert(domain.includes("y.durum IN ('acik','temas','teklif')"),'urgency filters must stay inside open action queue');
assert(domain.includes("'yenilendi'"),'renewed lifecycle state missing');
assert(domain.includes("'yenilenmedi'"),'not-renewed lifecycle state missing');
assert(domain.indexOf("if($licenseStatus==='iptal')") < domain.indexOf("elseif($currentEnd==='' || $currentEnd>$target)"),
  'external cancellation must win over null/extended-end renewal reconciliation');
assert(domain.includes("'gun_'.$milestone"),'30/15/7/1/expired notification code generation missing');
assert(domain.includes("if($remainingDays<=1) return 1;"),'1-day milestone missing');
assert(domain.includes("if($remainingDays<=7) return 7;"),'7-day milestone missing');
assert(domain.includes("if($remainingDays<=15) return 15;"),'15-day milestone missing');
assert(domain.includes("return 30;"),'30-day milestone missing');
assert(domain.includes("if($remainingDays<=0) return 0;"),'expired milestone missing');

assert(domain.includes("SET paket_id=?,bitis_tarihi=?,durum='aktif'"),
  'renewal must update existing institution license instead of creating second license');
assert(!domain.includes('INSERT INTO kurum_lisanslari'),
  'renewal domain must never create a second institution license');
assert(domain.includes("kl_record_license_history("),
  'renewal must append to core license history');
assert(domain.includes("Yenileme mevcut lisans bitiş tarihini geriye çekemez."),
  'stale renewal case must not shorten current license');
assert(!domain.includes('DELETE FROM kurum_lisans_yenilemeleri'),
  'renewal cases must not be physically deleted');
assert(!domain.includes('DELETE FROM kurum_lisans_yenileme_gecmisi'),
  'renewal history must not be physically deleted');

assert(notifications.includes('function bd_supported_recipient_roles('),
  'system-supported notification roles missing');
assert(notifications.includes("['yonetici'=>'Yöneticiler']"),
  'manager internal system notification role missing');
assert(notifications.includes("array_keys(bd_supported_recipient_roles())"),
  'system notification recipient validation must accept manager');
assert(notificationPage.includes('$map=bd_supported_recipient_roles();'),
  'notification UI must render manager system recipient label');

assert(page.includes("require_role('super_admin')"),'renewal center must be Super Admin only');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),'renewal writes must require CSRF');
assert(page.includes('30/15/7/1 gün'),'renewal milestone UI missing');
assert(page.includes('Yönetici Uyarılarını Senkronize Et'),'manager notification sync action missing');
assert(page.includes('Lisansı Yenile ve Vakayı Kapat'),'real renewal UI missing');
assert(page.includes('Yenilenmedi Olarak Kapat'),'not-renewed action missing');
assert(page.includes('Yenileme Geçmişi'),'append-only renewal history UI missing');
assert(page.includes('Bu işlem lisansı erken iptal etmez'),
  'not-renewed flow must explain current license remains valid until end date');

assert(finance.includes('Yenileme Operasyon Merkezi'),'finance handoff to renewal center missing');
assert(finance.includes('href="lisans-yenilemeleri.php"'),'finance renewal-center link missing');
assert(packages.includes('href="lisans-yenilemeleri.php"'),'package center renewal shortcut missing');
assert(admin.includes('href="lisans-yenilemeleri.php"'),'Super Admin renewal navigation missing');

assert(migration.includes('CREATE TABLE IF NOT EXISTS kurum_lisans_yenilemeleri'),'renewal case table missing');
assert(migration.includes('CREATE TABLE IF NOT EXISTS kurum_lisans_yenileme_gecmisi'),'renewal history table missing');
assert(migration.includes('UNIQUE KEY uk_lisans_yenileme_donem (lisans_id,hedef_bitis_tarihi)'),
  'one renewal case per license/end-date invariant missing');
assert(migration.includes('KEY ix_lisans_yenileme_kuyruk'),'renewal queue index missing');
assert(migration.includes('KEY ix_lisans_yenileme_gecmis_kod'),'notification/history dedupe index missing');

assert(workflow.includes('node tests/license-renewal-173.cjs'),
  'license renewal source regression missing from quality gate');
assert(workflow.includes('php tests/license-renewal-db-173.php'),
  'license renewal DB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=48,'license renewal center requires 1.2.48 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.48.md',
  'database/migrations/080_lisans_yenileme_operasyon_merkezi.sql',
  'lisans-yenilemeleri.css',
  'lisans-yenilemeleri.php',
  'src/lisans_yenileme.php',
  'tests/license-renewal-173.cjs',
  'tests/license-renewal-db-173.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: renewal queue, 30/15/7/1 manager alerts, append-only history and real license extension source contract');
