'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('kurum-siniflari.php','utf8');
const domain=fs.readFileSync('src/kurum_siniflari.php','utf8');
const migration=fs.readFileSync('database/migrations/068_kurum_siniflari_ve_gruplar.sql','utf8');
const detail=fs.readFileSync('kurum-detay.php','utf8');
const manager=fs.readFileSync('yonetici-paneli.php','utf8');
const contentCenter=fs.readFileSync('kurum-icerikleri.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(page.includes("require_role(['yonetici','super_admin'])"),'classes/groups must require manager or super admin');
assert(page.includes('ky_assert_manageable($pdo,$user,$institutionId)'),'manageable institution check missing');
assert(page.includes("yy_can($pdo,$user,'kurum_goruntule')"),'institution view permission missing');
assert(page.includes("yy_can($pdo,$user,'ogrenci_yonet')"),'student management permission gate missing');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),'CSRF protection missing');
assert(page.includes('WHERE id=? AND kurum_id=?'),'group lookup must be institution scoped');
assert(page.includes("kk.kurum_id=? AND kk.kurum_rolu='ogrenci'"),'student choices must be institution scoped');
assert(page.includes('DELETE FROM kurum_sinif_ogrencileri WHERE kurum_sinif_id=? AND kurum_id=?'),'membership replacement must stay institution scoped');
assert(page.includes('Seçilen öğrencilerden biri bu sınıf / grup için uygun değil.'),'server-side student eligibility check missing');
assert(domain.includes("if($type==='sinif' && ($grade<1 || $grade>8))"),'class grade validation missing');
assert(page.includes('sinif_seviyesi'), 'grade-aware group support missing');
assert(page.includes('auth_audit('),'class/group changes must be audited');

assert(migration.includes('CREATE TABLE IF NOT EXISTS kurum_siniflari'),'class table migration missing');
assert(migration.includes('CREATE TABLE IF NOT EXISTS kurum_sinif_ogrencileri'),'class membership table migration missing');
assert(migration.includes('UNIQUE KEY uk_kurum_sinif_ad'),'institution class name uniqueness missing');
assert(migration.includes('PRIMARY KEY (kurum_sinif_id,ogrenci_id)'),'membership idempotency key missing');
assert(!/\bDELETE\s+FROM\b/i.test(migration),'migration must not delete data');
assert(!/\bDROP\s+TABLE\b/i.test(migration),'migration must not drop tables');

assert(detail.includes('href="kurum-siniflari.php?kurum_id=<?=$institutionId?>"'),'institution detail must link classes/groups');
assert(!detail.includes('Kurum sınıf ve grup yapısını daha sonra ekleyeceğiz.'),'stale classes/groups placeholder must be removed');
assert(manager.includes('href="kurum-siniflari.php?kurum_id=<?=$institutionId?>"'),'manager dashboard must link classes/groups');
assert(contentCenter.includes('href="kurum-siniflari.php?kurum_id=<?=$institutionId?>"'),'content center must link classes/groups');
assert(workflow.includes('node tests/institution-classes-groups-134.cjs'),'source regression must run in quality gate');
assert(workflow.includes('php tests/institution-classes-groups-db-134.php'),'DB regression must run in quality gate');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in the 1.2.x line');
assert(Number(version.version.split('.')[2])>=9,'classes/groups capability requires 1.2.9 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.9.md',
  'database/migrations/068_kurum_siniflari_ve_gruplar.sql',
  'kurum-siniflari.php',
  'kurum-siniflari.css',
  'tests/institution-classes-groups-134.cjs',
  'tests/institution-classes-groups-db-134.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: institution classes/groups tenant-safe source contract');
