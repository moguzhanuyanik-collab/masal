'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/deneme_satis.php','utf8');
const page=fs.readFileSync('demo-satis.php','utf8');
const migration=fs.readFileSync('database/migrations/078_demo_satis_donusum_merkezi.sql','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const packages=fs.readFileSync('paketler.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('function st_create_trial('),'trial institution creation missing');
assert(domain.includes('function st_convert('),'trial-to-paid conversion missing');
assert(domain.includes('function st_mark_lost('),'lost-sale close flow missing');
assert(domain.includes('function st_add_note('),'append-only sales note flow missing');
assert(domain.includes('function st_trial_warning_rows('),'trial expiry radar missing');
assert(domain.includes('function st_summary('),'sales conversion summary missing');
assert(domain.includes('function st_effective_status('),'expired-trial effective state missing');

assert(domain.includes("$pdo->beginTransaction()"),'trial sales writes must be transactional');
assert(domain.includes("INSERT INTO kurumlar"),'trial creation must create institution');
assert(domain.includes("INSERT INTO kurum_lisanslari"),'trial creation must create trial license');
assert(domain.includes("INSERT INTO kurum_deneme_satislari"),'trial creation must create sales lifecycle row');
assert(domain.includes("INSERT INTO kurum_satis_notlari"),'sales notes must be append-only rows');
assert(!domain.includes('DELETE FROM kurum_satis_notlari'),'sales note history must never be deleted');
assert(!domain.includes('DELETE FROM kurum_deneme_satislari'),'sales lifecycle history must never be deleted');

assert(domain.includes("durum='aktif'"),'conversion must activate the existing institution license');
assert(domain.includes("durum='donustu'"),'conversion state update missing');
assert(domain.includes("durum='kaybedildi'"),'lost opportunity state update missing');
assert(domain.includes("SET durum='iptal',notlar=?"),'lost trial must cancel the trial license');
assert(domain.includes("Demo lisansı artık deneme durumunda değil. Lisans ve satış kaydını önce uzlaştır."),
  'license/sales lifecycle reconciliation guard missing');
assert(domain.includes("DATEDIFF(s.deneme_bitis_tarihi,CURDATE())<=?"),'expiry warning query missing');
assert(domain.includes("'genel_donusum_orani'"),'overall conversion rate missing');
assert(domain.includes("'karar_verilen_donusum_orani'"),'decided-opportunity conversion rate missing');

assert(page.includes("require_role('super_admin')"),'demo sales center must be Super Admin only');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),'demo sales writes must require CSRF');
assert(page.includes('Demo Kurumu ve Deneme Lisansını Oluştur'),'atomic trial creation UI missing');
assert(page.includes('7 GÜNLÜK RADAR'),'trial expiry radar UI missing');
assert(page.includes('Ücretliye Dönüştür'),'paid conversion UI missing');
assert(page.includes('Kaybedildi Olarak İşaretle'),'lost-sale UI missing');
assert(page.includes('Satış Geçmişi'),'sales note history UI missing');
assert(page.includes("Sözleşme ve tahsilat kaydı Ticari Finans'ta ayrıca oluşturulur."),
  'conversion must not falsely imply contract/payment creation');

assert(admin.includes('href="demo-satis.php"'),'Super Admin demo sales navigation missing');
assert(packages.includes('href="demo-satis.php"'),'package center demo sales shortcut missing');

assert(migration.includes('CREATE TABLE IF NOT EXISTS kurum_deneme_satislari'),'trial sales table missing');
assert(migration.includes('CREATE TABLE IF NOT EXISTS kurum_satis_notlari'),'sales note table missing');
assert(migration.includes('UNIQUE KEY uk_deneme_satis_kurum (kurum_id)'),'one sales lifecycle per demo institution invariant missing');
assert(migration.includes('KEY ix_deneme_satis_durum_bitis'),'trial-expiry queue index missing');
assert(migration.includes('KEY ix_satis_not_satis'),'sales note history index missing');

assert(workflow.includes('node tests/trial-sales-170.cjs'),'trial sales source test missing from quality gate');
assert(workflow.includes('php tests/trial-sales-db-170.php'),'trial sales DB test missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=45,'trial sales center requires 1.2.45 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.45.md',
  'database/migrations/078_demo_satis_donusum_merkezi.sql',
  'demo-satis.css',
  'demo-satis.php',
  'src/deneme_satis.php',
  'tests/trial-sales-170.cjs',
  'tests/trial-sales-db-170.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: atomic demo institution creation, trial lifecycle, append-only sales notes and conversion metrics source contract');
