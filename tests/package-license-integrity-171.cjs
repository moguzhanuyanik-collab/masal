'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/kurum_lisanslari.php','utf8');
const demo=fs.readFileSync('src/deneme_satis.php','utf8');
const api=fs.readFileSync('api/adimbot-ai.php','utf8');
const page=fs.readFileSync('paketler.php','utf8');
const migration=fs.readFileSync('database/migrations/079_paket_lisans_butunlugu.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes("SELECT id FROM paketler WHERE id=? LIMIT 1 FOR UPDATE"),
  'package update must lock and verify requested package id');
assert(domain.includes("if($exists<=0) throw new RuntimeException('Paket bulunamadı.')"),
  'nonexistent package update guard missing');
assert(domain.includes("SELECT id,aktif FROM paketler WHERE id=? LIMIT 1 FOR UPDATE"),
  'package toggle must lock and verify target');
assert(domain.includes("if($changed!==1) throw new RuntimeException('Paket aktiflik durumu güncellenemedi.')"),
  'package toggle affected-row verification missing');

assert(domain.includes('function kl_history_ready('),'license history readiness helper missing');
assert(domain.includes('function kl_record_license_history('),'append-only license history writer missing');
assert(domain.includes('function kl_license_history_rows('),'license history query missing');
assert(domain.includes("'not_hash'=>"),'license history note hashing missing');
assert(!migration.includes('eski_notlar '),'license history must not duplicate plaintext old notes');
assert(!migration.includes('yeni_notlar '),'license history must not duplicate plaintext new notes');
assert(migration.includes('eski_not_hash CHAR(64)'),'old note hash field missing');
assert(migration.includes('yeni_not_hash CHAR(64)'),'new note hash field missing');

assert(domain.includes('function kl_ai_entitlement('),'AI entitlement resolver missing');
assert(domain.includes("'license_suspended'"),'suspended license AI block reason missing');
assert(domain.includes("'license_cancelled'"),'cancelled license AI block reason missing');
assert(domain.includes("'license_expired'"),'expired license AI block reason missing');
assert(domain.includes("'license_not_started'"),'future license AI block reason missing');
assert(domain.includes("'package_inactive'"),'inactive package AI block reason missing');
assert(domain.includes("'ambiguous_active_licenses'"),'multi-license ambiguity block missing');
assert(domain.includes("'ambiguous_institutions'"),'unresolved multi-institution block missing');
assert(domain.includes("'legacy_unlicensed'"),'single legacy-unlicensed compatibility path missing');

assert(domain.includes('function kl_license_integrity_issues('),'package/license integrity scanner missing');
assert(page.includes('PAKET / LİSANS BÜTÜNLÜĞÜ'),'package/license integrity UI missing');
assert(page.includes('LİSANS DEĞİŞİKLİK GEÇMİŞİ'),'license history UI missing');
assert(page.includes('AI Kapalı'),'admin AI closed-state label missing');
assert(page.includes('birden fazla kuruma bağlıysa'),'multi-institution AI guidance missing');

assert(api.includes("'reason'=>'institution_ai_license'"),'AI license access API reason missing');
assert(api.includes("],403);"),'AI license access block must use HTTP 403');
assert(api.includes("'reason'=>'institution_ai_quota'"),'quota exhaustion reason must remain distinct');
assert(api.includes("],429);"),'quota exhaustion must remain HTTP 429');

assert(demo.includes("'demo_deneme'"),'demo trial license history event missing');
assert(demo.includes("'demo_donusum'"),'demo paid-conversion license history event missing');
assert(demo.includes("'demo_kayip'"),'demo lost-sale license history event missing');

assert(migration.includes('CREATE TABLE IF NOT EXISTS kurum_lisans_gecmisi'),'license history migration missing');
assert(migration.includes('KEY ix_lisans_gecmis_lisans'),'license history license index missing');
assert(migration.includes('KEY ix_lisans_gecmis_kurum'),'license history institution index missing');

assert(workflow.includes('node tests/package-license-integrity-171.cjs'),
  'package/license integrity source regression missing from quality gate');
assert(workflow.includes('php tests/package-license-integrity-db-171.php'),
  'package/license integrity DB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=46,'package/license integrity requires 1.2.46 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.46.md',
  'database/migrations/079_paket_lisans_butunlugu.sql',
  'tests/package-license-integrity-171.cjs',
  'tests/package-license-integrity-db-171.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: package target verification, append-only license history and fail-closed AI entitlement source contract');
