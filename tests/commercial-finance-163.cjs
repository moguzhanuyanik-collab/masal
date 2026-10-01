'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_finans.php','utf8');
const page=fs.readFileSync('ticari-finans.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const migration=fs.readFileSync('database/migrations/073_ticari_finans_ve_tahsilat.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('function tf_save_contract('),'contract persistence missing');
assert(domain.includes('function tf_record_payment('),'payment persistence missing');
assert(domain.includes('function tf_cancel_payment('),'payment cancellation missing');
assert(domain.includes('function tf_license_renewal_rows('),'license renewal radar missing');
assert(domain.includes("FOR UPDATE"),'commercial write flows must use row locks');
assert(domain.includes("Sözleşme tutarı, tahsil edilmiş tutarın altına indirilemez."),'contract total may not drop below paid total');
assert(domain.includes("Tahsilat geçmişi olan sözleşmenin para birimi değiştirilemez."),'contract currency mutation guard missing');
assert(domain.includes("Tahsilat sözleşmenin kalan tutarını aşamaz."),'overpayment guard missing');
assert(domain.includes("SET durum='iptal',iptal_nedeni=?,iptal_tarihi=NOW()"),'payment cancellation must preserve history');
assert(!domain.includes('DELETE FROM kurum_tahsilatlari'),'payments must never be physically deleted');
assert(domain.includes('function tf_normalize_contract_status('),'contract status normalization missing');
assert(domain.includes("$newStatus=$newPaid+0.009>=(float)$contract['toplam_tutar']?'tamamlandi':'aktif';"),
  'payment writes must normalize completed/active status from balance');
assert(domain.includes("$newStatus=$remainingPaid+0.009>=(float)$contract['toplam_tutar']?'tamamlandi':'aktif';"),
  'payment cancellation must normalize contract status from remaining active payments');

assert(page.includes("require_role('super_admin')"),'commercial finance page must be Super Admin only');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),'commercial writes must require CSRF');
assert(page.includes('Yenileme Operasyon Merkezi'),'dedicated renewal center handoff missing');
assert(page.includes('href="lisans-yenilemeleri.php"'),'commercial finance must route renewal operations to dedicated center');
assert(page.includes('Ticari Portföy'),'contract portfolio UI missing');
assert(page.includes('TAHSİLAT GEÇMİŞİ'),'payment history UI missing');
assert(page.includes('resmi e-Fatura/e-Arşiv belgesi üretmez'),'page must not claim regulated invoice generation');
assert(admin.includes('href="ticari-finans.php"'),'Super Admin commercial finance navigation missing');

assert(migration.includes('CREATE TABLE IF NOT EXISTS kurum_sozlesmeleri'),'contract table migration missing');
assert(migration.includes('CREATE TABLE IF NOT EXISTS kurum_tahsilatlari'),'payment table migration missing');
assert(migration.includes('UNIQUE KEY uk_sozlesme_no'),'contract number uniqueness missing');
assert(migration.includes('iptal_nedeni VARCHAR(500)'),'payment cancellation audit reason missing');

assert(workflow.includes('node tests/commercial-finance-163.cjs'),'commercial finance source test missing from quality gate');
assert(workflow.includes('php tests/commercial-finance-db-163.php'),'commercial finance DB test missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in the 1.2.x line');
assert(Number(version.version.split('.')[2])>=38,'commercial finance capability requires 1.2.38 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.38.md',
  'database/migrations/073_ticari_finans_ve_tahsilat.sql',
  'src/ticari_finans.php',
  'ticari-finans.php',
  'tests/commercial-finance-163.cjs',
  'tests/commercial-finance-db-163.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: commercial finance, payment integrity and dedicated renewal-center handoff source contract');
