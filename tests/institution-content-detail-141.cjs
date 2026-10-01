'use strict';

const fs=require('fs');
const assert=require('assert');

const list=fs.readFileSync('kurum-icerikleri.php','utf8');
const page=fs.readFileSync('kurum-icerik-detay.php','utf8');
const domain=fs.readFileSync('src/kurum_icerik_detay.php','utf8');
const css=fs.readFileSync('kurum-icerik-detay.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(list.includes('kurum-icerik-detay.php?kurum_id=<?=$institutionId?>&amp;id=<?=(int)$item[\'id\']?>'),'institution content list must link detail page');
assert(list.includes('kurum-icerikleri.css?v=1.2.16'),'institution content CSS must be cache-busted');

assert(page.includes("require_role(['yonetici','super_admin'])"),'detail page must require manager or super admin');
assert(page.includes('ky_assert_manageable($pdo,$user,$institutionId)'),'detail page must enforce manageable institution');
assert(page.includes("yy_can($pdo,$user,'kurum_goruntule')"),'detail page must enforce institution view permission');
assert(/kid_content_detail\(\$pdo,\$institutionId,\$contentId(?:,\$groupId)?\)/.test(page),'detail page must use tenant-scoped domain');
assert(page.includes('ogrenci-raporu.php?id=<?=(int)$student[\'id\']?>&amp;kurum_id=<?=$institutionId?>'),'student drill-down must preserve verified institution context');
assert(page.includes('Cevapladı'),'question status summary missing');
assert(page.includes('Gecikti'),'homework overdue state missing');
assert(page.includes('salt okunurdur'),'manager detail must remain read-only');
assert(page.includes('kurum-icerik-detay.css?v=1.2.16'),'detail CSS must be versioned');

assert(domain.includes('function kid_content_detail('),'institution content detail domain helper missing');
assert(domain.includes('WHERE oi.id=? AND oi.kurum_id=?'),'content lookup must be tenant scoped');
assert(domain.includes("tk.kurum_id=oi.kurum_id"),'teacher membership must match content institution');
assert(domain.includes("oo.kurum_id=oi.kurum_id"),'teacher/student relation must match content institution');
assert(domain.includes("sk.kurum_id=oi.kurum_id"),'student membership must match content institution');
assert(domain.includes("oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL"),'selected-target semantics missing');
assert(domain.includes('c.icerik_id=oi.id'),'question response join missing');
assert(domain.includes('od.icerik_id=oi.id'),'homework status join missing');
assert(domain.includes("$summary['overdue']++"),'overdue summary calculation missing');

assert(css.includes('.institution-content-detail-student'),'student detail styling missing');
assert(css.includes('.institution-content-detail-status.warn'),'warning status styling missing');

assert(workflow.includes('node tests/institution-content-detail-141.cjs'),'source regression must run in quality gate');
assert(workflow.includes('php tests/institution-content-detail-db-141.php'),'DB regression must run in quality gate');

assert(/^1\.2\.\d+$/.test(version.version),'release version must stay in 1.2.x line');
assert(Number(version.version.split('.')[2])>=16,'institution content detail requires 1.2.16 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.16.md',
  'src/kurum_icerik_detay.php',
  'kurum-icerik-detay.php',
  'kurum-icerik-detay.css',
  'tests/institution-content-detail-141.cjs',
  'tests/institution-content-detail-db-141.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: institution content student-status detail source contract');
