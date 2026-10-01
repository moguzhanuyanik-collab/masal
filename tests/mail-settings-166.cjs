'use strict';

const fs=require('fs');
const assert=require('assert');

const helper=fs.readFileSync('src/mail_settings.php','utf8');
const page=fs.readFileSync('eposta-ayarlari.php','utf8');
const reset=fs.readFileSync('src/password_reset.php','utf8');
const config=fs.readFileSync('config/app.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(helper.includes("function ms_candidate("),'mail settings candidate builder missing');
assert(helper.includes("isset($input['clear_smtp_password'])"),'explicit SMTP password clear behavior missing');
assert(helper.includes("$newPassword!==''?$newPassword"),'blank SMTP password must preserve current secret');
assert(helper.includes("function ms_readiness("),'password recovery readiness check missing');
assert(helper.includes("function ms_test_connection("),'SMTP connection test helper missing');
assert(helper.includes("function ms_send_test_email("),'test email helper missing');
assert(helper.includes("fopen($dir.'/mail-settings.lock','c')"),'mail settings lock missing');
assert(helper.includes('flock($lock,LOCK_EX)'),'exclusive mail settings lock missing');
assert(helper.includes('hash_equals($expectedFingerprint,ms_settings_fingerprint($file))'),'stale-settings overwrite guard missing');
assert(helper.includes("tempnam($dir,'mail_')"),'atomic temp file write missing');
assert(helper.includes('chmod($temp,0600)'),'mail settings secret file must be mode 0600');
assert(helper.includes('rename($temp,$file)'),'atomic settings rename missing');

assert(page.includes("require_role('super_admin')"),'mail settings must be Super Admin only');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),'mail settings writes/tests require CSRF');
assert(page.includes('name="smtp_password"') && page.includes('value=""'),'SMTP password input must never be repopulated');
assert(page.includes('Kayıtlı şifre korunacak'),'stored SMTP secret preservation UX missing');
assert(page.includes('Bağlantıyı Test Et'),'SMTP handshake test action missing');
assert(page.includes('Test E-postası Gönder'),'real delivery test action missing');
assert(page.includes("Ayarları Kaydet"),'mail settings save action missing');
assert(!page.includes(`value="<?=eah((string)$smtp['password'])`),'SMTP secret must not be rendered into HTML');

assert(reset.includes('function pr_smtp_probe('),'SMTP probe capability missing');
assert(reset.includes('function pr_send_plain_email('),'generic plain email sender missing');
assert(reset.includes('return pr_send_plain_email($email,$subject,$body);'),'password reset must reuse generic mail sender');

assert(config.includes("$mailSettingsFile = dirname(__DIR__) . '/storage/mail-settings.php';"),'mutable mail settings load missing');
assert(config.includes("$defaults['app'] = array_replace($defaults['app'], $mailSettings['app']);"),'mutable base URL merge missing');
assert(config.includes("$defaults['mail'] = array_replace_recursive($defaults['mail'], $mailSettings['mail']);"),'mutable mail config merge missing');
assert(config.includes("'storage',"),'updater preserve list must keep storage directory');

assert(admin.includes('href="eposta-ayarlari.php"'),'Super Admin mail settings navigation missing');
assert(workflow.includes('node tests/mail-settings-166.cjs'),'mail settings source test missing from quality gate');
assert(workflow.includes('php tests/mail-settings-166.php'),'mail settings runtime test missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=41,'mail settings center requires 1.2.41 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.41.md',
  'eposta-ayarlari.php',
  'src/mail_settings.php',
  'tests/mail-settings-166.cjs',
  'tests/mail-settings-166.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: Super Admin SMTP settings, secret preservation, atomic storage and recovery readiness source contract');
