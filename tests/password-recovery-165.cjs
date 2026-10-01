'use strict';

const fs=require('fs');
const assert=require('assert');

const helper=fs.readFileSync('src/password_reset.php','utf8');
const migration=fs.readFileSync('database/migrations/075_guvenli_sifre_kurtarma.sql','utf8');
const forgot=fs.readFileSync('sifremi-unuttum.php','utf8');
const reset=fs.readFileSync('sifre-sifirla.php','utf8');
const login=fs.readFileSync('login.php','utf8');
const auth=fs.readFileSync('src/auth.php','utf8');
const appConfig=fs.readFileSync('config/app.php','utf8');
const localExample=fs.readFileSync('config/local.php.example','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(helper.includes('function pr_rate_consume('),'password reset rate limiter missing');
assert(helper.includes('function pr_issue_token_for_user('),'token issuer missing');
assert(helper.includes("hash('sha256',$raw)"),'raw reset token must be hashed before persistence');
assert(helper.includes('DATE_ADD(NOW(),INTERVAL 30 MINUTE)'),'reset token must expire after 30 minutes');
assert(helper.includes('SET iptal_tarihi=NOW()') || helper.includes('SET iptal_tarihi=COALESCE'),'previous/reset tokens must be revocable');
assert(helper.includes('function pr_token_is_valid('),'token validity check missing');
assert(helper.includes('function pr_reset_password('),'password reset completion missing');
assert(helper.includes('oturum_surumu=oturum_surumu+1'),'successful password reset must rotate session version');
assert(helper.includes('DELETE FROM kullanici_oturum_tokenlari'),'remember-me tokens must be invalidated');
assert(helper.includes('DELETE FROM ogrenci_oturum_tokenlari'),'legacy student remember tokens must be invalidated');
assert(helper.includes("error_log('[IlkAdim][password-reset] delivery_unavailable')"),'mail delivery failures must be server-side only');
assert(!helper.includes('error_log($raw'),'raw token must never be logged');
assert(!helper.includes('token='.$raw),'raw token must not be logged or persisted by string interpolation');
assert(helper.includes("if($transport==='smtp')"),'SMTP delivery path missing');
assert(helper.includes("if($transport==='mail')"),'PHP mail delivery path missing');
assert(helper.includes('STARTTLS'),'SMTP TLS support missing');

assert(forgot.includes('Eğer bu e-posta adresiyle eşleşen aktif bir hesap varsa'),'forgot password response must resist account enumeration');
assert(forgot.includes("header('Referrer-Policy: no-referrer')"),'forgot page must suppress referrer leakage');
assert(reset.includes("header('Referrer-Policy: no-referrer')"),'reset page must suppress token referrer leakage');
assert(reset.includes("header('Location: sifre-sifirla.php')"),'raw token must be removed from address bar after validation');
assert(reset.includes("unset(") && reset.includes("auth_version"),'successful reset must clear current auth session data');
assert(login.includes('href="sifremi-unuttum.php"'),'login recovery link missing');
assert(login.includes('Şifren başarıyla yenilendi'),'password reset success notice missing');

assert(auth.includes('function auth_session_version('),'session version helper missing');
assert(auth.includes("$_SESSION['auth_version']=auth_session_version($pdo,$userId)"),'new sessions must store auth version');
assert(auth.includes("array_key_exists('auth_version',$_SESSION)") && auth.includes(': 1;'),'legacy sessions must safely default to version 1');
assert(auth.includes('$sessionVersion===$currentVersion'),'session version mismatch enforcement missing');

assert(appConfig.includes("'base_url' => ''"),'configured base URL required for secure reset link generation');
assert(appConfig.includes("'transport' => 'disabled'"),'mail transport should fail closed until configured');
assert(localExample.includes("'transport' => 'smtp'"),'SMTP example configuration missing');

assert(migration.includes('ADD COLUMN oturum_surumu INT UNSIGNED NOT NULL DEFAULT 1'),'session version migration missing');
assert(migration.includes('CREATE TABLE IF NOT EXISTS sifre_sifirlama_tokenlari'),'password reset token table missing');
assert(migration.includes('CREATE TABLE IF NOT EXISTS sifre_sifirlama_guvenlik'),'password reset rate-limit table missing');
assert(migration.includes('token_hash CHAR(64)'),'only token hashes should be persisted');
assert(!migration.includes('token_raw'),'migration must not persist raw token');

assert(workflow.includes('node tests/password-recovery-165.cjs'),'password recovery source test missing from quality gate');
assert(workflow.includes('php tests/password-recovery-db-165.php'),'password recovery DB test missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=40,'password recovery requires 1.2.40 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.40.md',
  'database/migrations/075_guvenli_sifre_kurtarma.sql',
  'sifre-sifirla.php',
  'sifremi-unuttum.php',
  'src/password_reset.php',
  'tests/password-recovery-165.cjs',
  'tests/password-recovery-db-165.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: secure password recovery source contract, session invalidation and mail delivery configuration');
