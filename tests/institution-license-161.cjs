'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/kurum_lisanslari.php','utf8');
const management=fs.readFileSync('src/kurumlar_modulu.php','utf8');
const page=fs.readFileSync('paketler.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const migration=fs.readFileSync('database/migrations/071_paket_ve_kurum_lisanslari.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('function kl_active_license('),'active license resolver missing');
assert(domain.includes('function kl_assert_member_capacity('),'member capacity guard missing');
assert(domain.includes("kl.durum IN ('aktif','deneme')"),'only active/trial licenses may enforce limits');
assert(domain.includes("p.aktif=1"),'inactive package must not enforce capacity');
assert(domain.includes("kl.bitis_tarihi IS NULL OR kl.bitis_tarihi>=CURDATE()"),'expired license must not be treated as active');
assert(domain.includes("'ogrenci'=>'ogrenci_limiti'"),'student capacity mapping missing');
assert(domain.includes("'ogretmen'=>'ogretmen_limiti'"),'teacher capacity mapping missing');
assert(domain.includes("'veli'=>'veli_limiti'"),'parent capacity mapping missing');
assert(domain.includes("if($limit===0) return;"),'zero package limit must mean unlimited');
assert(domain.includes("SELECT id,kurum_id,kl.paket_id") || domain.includes("function kl_license_state("),
      'institution license state resolver/lock missing');
assert(domain.includes("if($before){"),'institution license update must distinguish existing current row');
assert(domain.includes("INSERT INTO kurum_lisanslari"),'institution license create path missing');

assert(management.includes("require_once __DIR__.'/kurum_lisanslari.php';"),'institution member domain must load license guard');
assert(management.includes('kl_assert_member_capacity($pdo,$institutionId,$role);'),'member create must enforce active license capacity');
assert(management.includes('if($institutionId!==$oldInstitutionId)'),'member move must distinguish target capacity');
assert((management.match(/kl_assert_member_capacity\(\$pdo,\$institutionId,\$role,\$userId\);/g)||[]).length>=2,
  'member move and restore must enforce target capacity');

assert(page.includes("require __DIR__.'/src/kurum_lisanslari.php';"),'package page domain missing');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),'package/license writes must require CSRF');
assert(page.includes("name=\"ogrenci_limiti\""),'student limit form missing');
assert(page.includes("name=\"ogretmen_limiti\""),'teacher limit form missing');
assert(page.includes("name=\"veli_limiti\""),'parent limit form missing');
assert(page.includes("name=\"ai_aylik_kota\""),'AI quota field missing');
assert(page.includes("name=\"baslangic_tarihi\""),'license start date missing');
assert(page.includes("name=\"bitis_tarihi\""),'license end date missing');
assert(!admin.includes('href="paketler.php"'),'legacy package navigation must stay hidden from the education-focused Super Admin');

assert(migration.includes('CREATE TABLE IF NOT EXISTS paketler'),'package table migration missing');
assert(migration.includes('CREATE TABLE IF NOT EXISTS kurum_lisanslari'),'institution license table migration missing');
assert(migration.includes('UNIQUE KEY uk_kurum_lisans (kurum_id)'),'one current license per institution invariant missing');

assert(workflow.includes('node tests/institution-license-161.cjs'),'license source regression missing from quality gate');
assert(workflow.includes('php tests/institution-license-db-161.php'),'license DB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in the 1.2.x line');
assert(Number(version.version.split('.')[2])>=36,'package/license capability requires 1.2.36 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.36.md',
  'database/migrations/071_paket_ve_kurum_lisanslari.sql',
  'paketler.php',
  'src/kurum_lisanslari.php',
  'tests/institution-license-161.cjs',
  'tests/institution-license-db-161.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: institution package/license and member-capacity source contract');
