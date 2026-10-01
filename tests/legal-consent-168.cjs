'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/yasal_onay.php','utf8');
const auth=fs.readFileSync('src/auth.php','utf8');
const userPage=fs.readFileSync('yasal-onay.php','utf8');
const adminPage=fs.readFileSync('yasal-belgeler.php','utf8');
const migration=fs.readFileSync('database/migrations/077_yasal_belge_onay_merkezi.sql','utf8');
const account=fs.readFileSync('hesap-guvenligi.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('function yl_create_draft('),'legal draft creation missing');
assert(domain.includes('function yl_update_draft('),'legal draft update missing');
assert(domain.includes('function yl_publish('),'legal publication missing');
assert(domain.includes('function yl_accept('),'explicit legal consent recording missing');
assert(domain.includes('function yl_pending_documents('),'pending legal document resolution missing');
assert(domain.includes('function yl_admin_user_report('),'detailed legal consent report missing');
assert(domain.includes("yl_hash_content((string)$doc['baslik'],(string)$doc['icerik'])"),'published document integrity check missing');
assert(domain.includes("AND belge_hash=?"),'existing consent must bind to exact document hash');
assert(domain.includes("Gelecek tarihli belge yürürlük tarihinden önce yayınlanamaz"),'future-effective publish gap guard missing');
assert(!domain.includes('DELETE FROM yasal_belgeler'),'published legal records must not be physically deleted');
assert(!domain.includes('DELETE FROM yasal_belge_onaylari'),'legal consent history must not be physically deleted');

assert(auth.includes('function auth_legal_pending_count('),'auth legal pending check missing');
assert(auth.includes('function auth_enforce_legal_consent('),'web legal consent enforcement missing');
assert(auth.includes('auth_enforce_legal_consent($user);'),'authenticated pages must enforce legal consent');
assert(auth.includes("'legal_consent_required'=>true"),'student API must expose legal consent requirement');
assert(auth.includes('pending_legal_documents'),'student API pending legal count missing');
assert(auth.includes('o.belge_hash=b.icerik_hash'),'auth consent check must bind exact document hash');

assert(userPage.includes('name="belgeler[]"'),'per-document explicit consent checkboxes missing');
assert(userPage.includes('required'),'legal consent checkboxes must be mandatory');
assert(userPage.includes('Bu belgeyi okudum ve bu sürümü onaylıyorum.'),'explicit per-document consent text missing');
assert(userPage.includes('Şimdi onaylamak istemiyorum, çıkış yap'),'user agency/logout option missing');
assert(userPage.includes('IP adresinin kendisi yerine tek yönlü hash'),'privacy note for hashed IP missing');

assert(adminPage.includes("require_role('super_admin')"),'legal admin center must be Super Admin only');
assert(adminPage.includes('Hukuki içerik uyarısı'),'legal-content review warning missing');
assert(adminPage.includes('publish_confirm'),'publication must require explicit confirmation');
assert(adminPage.includes('Onay Raporu'),'legal consent report UI missing');
assert(adminPage.includes('Hukuki kontrol tamam'),'publication legal-review confirmation missing');

assert(account.includes('href="yasal-onay.php"'),'user legal history access missing');
assert(admin.includes('href="yasal-belgeler.php"'),'Super Admin legal center navigation missing');

assert(migration.includes('CREATE TABLE IF NOT EXISTS yasal_belgeler'),'legal document table missing');
assert(migration.includes('CREATE TABLE IF NOT EXISTS yasal_belge_onaylari'),'legal consent table missing');
assert(migration.includes('UNIQUE KEY uk_yasal_belge_tur_surum'),'legal type/version uniqueness missing');
assert(migration.includes('PRIMARY KEY(belge_id,kullanici_id)'),'one consent per user/document invariant missing');
assert(migration.includes('onay_ip_hash CHAR(64)'),'hashed IP consent evidence missing');
assert(!migration.includes('REMOTE_ADDR'),'raw IP must not be persisted by migration');
assert(!migration.includes('INSERT INTO yasal_belgeler'),'migration must not auto-publish or seed legal text');

assert(workflow.includes('node tests/legal-consent-168.cjs'),'legal source regression missing from quality gate');
assert(workflow.includes('php tests/legal-consent-db-168.php'),'legal DB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=43,'legal consent center requires 1.2.43 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.43.md',
  'database/migrations/077_yasal_belge_onay_merkezi.sql',
  'src/yasal_onay.php',
  'yasal-belgeler.php',
  'yasal-onay.php',
  'yasal.css',
  'tests/legal-consent-168.cjs',
  'tests/legal-consent-db-168.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: versioned legal documents, exact-hash consent, mandatory web/API gate and consent reporting source contract');
