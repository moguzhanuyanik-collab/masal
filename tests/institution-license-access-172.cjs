'use strict';

const fs=require('fs');
const assert=require('assert');

const auth=fs.readFileSync('src/auth.php','utf8');
const institutionDomain=fs.readFileSync('src/kurum_yonetimi.php','utf8');
const supportDomain=fs.readFileSync('src/destek.php','utf8');
const notifications=fs.readFileSync('src/bildirimler.php','utf8');
const manager=fs.readFileSync('yonetici-paneli.php','utf8');
const gatePage=fs.readFileSync('lisans-erisim.php','utf8');
const gateCss=fs.readFileSync('lisans-erisim.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(auth.includes('function auth_user_institution_ids_raw('),'raw institution membership resolver missing');
assert(auth.includes('function auth_institution_license_access('),'institution license access resolver missing');
assert(auth.includes('function auth_operational_access_summary('),'operational access summary missing');
assert(auth.includes('function auth_operational_manageable_institution_ids('),'manager operational institution resolver missing');
assert(auth.includes('function auth_enforce_institution_license_access('),'web license access gate missing');

assert(auth.includes("'license_suspended'=>'Lisans askıda'"),'suspended license label missing');
assert(auth.includes("'license_cancelled'=>'Lisans iptal edildi'"),'cancelled license label missing');
assert(auth.includes("'license_expired'=>'Lisans süresi doldu'"),'expired license label missing');
assert(auth.includes("'license_not_started'=>'Lisans henüz başlamadı'"),'future license label missing');
assert(auth.includes("'package_inactive'=>'Paket pasif'"),'inactive package label missing');
assert(auth.includes("'legacy_unlicensed'=>'Eski / lisans tanımlanmamış kurum'"),'legacy no-license compatibility label missing');

assert(auth.includes("'lisans-erisim.php','destek.php','hesap-guvenligi.php','yasal-onay.php'"),
  'restricted-user safe page allowlist missing');
assert(auth.includes("header('Location: lisans-erisim.php')"),'restricted web users must route to license status page');
assert(auth.includes("'institution_license_required'=>true"),'student/report API license block flag missing');
assert(auth.includes("auth_operational_access_summary($pdo,$user)"),'student report API must enforce operational license access');
assert(auth.includes("if(($summary['restricted']??false)===true) return 'lisans-erisim.php';"),
  'post-login license routing missing');

assert(auth.includes("AND kt.kurum_id IN ({$ph})"),
  'teacher student scope must filter to operational institutions');
assert(auth.includes("AND vk.kurum_id IN ({$ph})"),
  'parent student scope must filter to operational institutions');

assert(supportDomain.includes("function ds_raw_institution_ids("),
  'support raw institution compatibility helper missing');
assert(supportDomain.includes("return auth_user_institution_ids_raw($pdo,$userId,$role);"),
  'support must prefer raw institution membership while license is restricted');
assert(supportDomain.includes("function ds_raw_user_in_institution("),
  'support raw membership authorization helper missing');
assert(supportDomain.includes("return auth_user_in_institution_raw($pdo,$userId,$institutionId,$role);"),
  'support ticket creation must prefer raw membership authorization');

assert(institutionDomain.includes('function ky_operational_manageable_ids('),
  'manager operational scope compatibility helper missing');
assert(institutionDomain.includes('return auth_operational_manageable_institution_ids($pdo,$user);'),
  'manager institution operations must prefer operationally licensed institution scope');
assert(institutionDomain.includes('Kurum lisansı operasyonel kullanıma açık değil.'),
  'manager direct-operation license denial missing');

assert(notifications.includes('function bd_operational_manageable_ids('),
  'notification operational scope compatibility helper missing');
assert(notifications.includes('return auth_operational_manageable_institution_ids($pdo,$actor);'),
  'manager announcement writes must prefer operational institutions only');

assert(manager.includes('$operationalOpen=(bool)($licenseAccess[\'allowed\']??true);'),
  'manager panel license state missing');
assert(manager.includes('Operasyonel Modüller Geçici Olarak Kapalı'),
  'manager restricted-state UI missing');
assert(manager.includes('Destek merkezi ve hesap güvenliği açık kalır.'),
  'manager restricted-state safe paths missing');
assert(manager.includes('<?php if($canOperate):?><a class="role-primary"'),
  'manager operational entry point must hide when license is closed');

assert(gatePage.includes("require_login()"),'license status page must require authentication');
assert(gatePage.includes('Bağlı Kurum Durumları'),'license status institution list missing');
assert(gatePage.includes('Destek Merkezi'),'license status support path missing');
assert(gatePage.includes('Hesap Güvenliği'),'license status account-security path missing');
assert(gatePage.includes('Bu durum hesabını silmez ve geçmiş verilerini kaldırmaz.'),
  'license restriction data-retention explanation missing');
assert(gateCss.includes('.le-alert.warn'),'license status restricted styling missing');

assert(workflow.includes('node tests/institution-license-access-172.cjs'),
  'institution license access source test missing from quality gate');
assert(workflow.includes('php tests/institution-license-access-db-172.php'),
  'institution license access DB test missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=47,'institution license access requires 1.2.47 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
for(const path of [
  'RELEASE-1.2.47.md',
  'lisans-erisim.php',
  'lisans-erisim.css',
  'tests/institution-license-access-172.cjs',
  'tests/institution-license-access-db-172.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: institution license operational gate, tenant filtering, support bypass and manager restricted mode source contract');
