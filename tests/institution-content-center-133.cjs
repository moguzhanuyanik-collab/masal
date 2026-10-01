'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('kurum-icerikleri.php','utf8');
const domain=fs.existsSync('src/kurum_icerik_dashboard.php')?fs.readFileSync('src/kurum_icerik_dashboard.php','utf8'):page;
const detail=fs.readFileSync('kurum-detay.php','utf8');
const manager=fs.readFileSync('yonetici-paneli.php','utf8');
const teacher=fs.readFileSync('ogretmen-paneli.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(page.includes("require_role(['yonetici','super_admin'])"),'institution content center must require manager/super admin');
assert(page.includes('ky_assert_manageable($pdo,$user,$institutionId)'),'institution content center must validate manageable institution');
assert(page.includes("yy_can($pdo,$user,'kurum_goruntule')"),'institution content center must require institution view permission');
assert(domain.includes("$where=['oi.kurum_id=?']") || domain.includes('$where=["oi.kurum_id=?"]'),'content query must always start with institution scope');
assert(domain.includes("tk.kurum_id=oi.kurum_id"),'teacher membership must match content institution');
assert(domain.includes("oo.kurum_id=oi.kurum_id"),'target student count must keep teacher relation in content institution');
assert(domain.includes("sk.kurum_id=oi.kurum_id"),'student membership must match content institution');
assert(page.includes('ogretmen_id'),'teacher filter missing');
assert(page.includes('icerik_turu'),'content type filter missing');
assert(page.includes('tamamlayan_sayisi') || page.includes('tamamlayan_ogrenci_sayisi'),'homework completion summary missing');
assert(page.includes('cevaplayan_sayisi') || page.includes('cevap_ogrenci_sayisi'),'question answer summary missing');
assert(page.includes('salt okunurdur'),'manager content center must remain read-only');

assert(detail.includes('href="kurum-icerikleri.php?kurum_id=<?=$institutionId?>"'),'institution detail must link content center');
assert(!detail.includes('Kuruma özel içerik yönetimini daha sonra ayrı modül yapacağız.'),'stale content placeholder must be removed');
assert(manager.includes('href="kurum-icerikleri.php?kurum_id=<?=$institutionId?>"'),'manager dashboard must link content center');
assert(!manager.includes('özel içerik kaynağı daha sonra öğretmen içerikleriyle etkinleştirilecek'),'manager stale content placeholder must be removed');
assert(!teacher.includes('Öğretmene özel içerik üretimi ve kurum içeriği daha sonra bağlanacak'),'teacher stale content placeholder must be removed');

assert(workflow.includes('node tests/institution-content-center-133.cjs'),'quality gate must run institution content regression');
assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in the 1.2.x line');
assert(Number(version.version.split('.')[2])>=8,'institution content center requires 1.2.8 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);
for(const path of [
  'RELEASE-1.2.8.md',
  'kurum-icerikleri.php',
  'kurum-icerikleri.css',
  'tests/institution-content-center-133.cjs'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: institution content center tenant-safe source contract');
