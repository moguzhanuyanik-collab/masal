'use strict';

const fs=require('fs');
const assert=require('assert');

const list=fs.readFileSync('ogretmen-icerikleri.php','utf8');
const page=fs.readFileSync('ogretmen-icerik-detay.php','utf8');
const domain=fs.readFileSync('src/ogretmen_icerik.php','utf8');
const css=fs.readFileSync('ogretmen-icerik-detay.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(list.includes('ogretmen-icerik-detay.php?id=<?=(int)$item[\'id\']?>'),'teacher content list must link detail page');
assert(page.includes("require_role('ogretmen')"),'detail page must require teacher role');
assert(page.includes('oi_teacher_content_detail($pdo,$user,$contentId)'),'detail page must use teacher-owned detail domain');
assert(page.includes('ogrenci-raporu.php?id=<?=(int)$student[\'id\']?>'),'teacher must be able to drill into authorized student report');
assert(page.includes('Cevapladı'),'question summary missing');
assert(page.includes('Gecikti'),'homework overdue state missing');
assert(page.includes('deneme'),'question attempt detail missing');
assert(page.includes('ogretmen-icerik-detay.css?v=1.2.15'),'detail CSS must be versioned');

assert(domain.includes('function oi_teacher_content_detail('),'teacher content detail domain helper missing');
assert(domain.includes("WHERE oi.id=? AND oi.ogretmen_id=?"),'content detail must enforce teacher ownership');
assert(domain.includes('oi_teacher_can_use_institution($pdo,(int)$user[\'id\'],$institutionId)'),'teacher must still have active institution access');
assert(domain.includes("oo.kurum_id=oi.kurum_id"),'teacher/student relation must match content institution');
assert(domain.includes("kk.kurum_id=oi.kurum_id"),'student membership must match content institution');
assert(domain.includes("oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL"),'selected-target semantics missing');
assert(domain.includes("c.icerik_id=oi.id"),'question response join missing');
assert(domain.includes("od.icerik_id=oi.id"),'homework status join missing');
assert(domain.includes("$summary['overdue']++"),'overdue summary missing');

assert(css.includes('.teacher-detail-student'),'student detail card styling missing');
assert(css.includes('.teacher-detail-status.warn'),'warning status styling missing');

assert(workflow.includes('node tests/teacher-content-detail-140.cjs'),'source regression must run');
assert(workflow.includes('php tests/teacher-content-detail-db-140.php'),'DB regression must run');

assert(/^1\.2\.\d+$/.test(version.version),'release version must stay in 1.2.x line');
assert(Number(version.version.split('.')[2])>=15,'teacher content detail requires 1.2.15 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.15.md',
  'ogretmen-icerik-detay.php',
  'ogretmen-icerik-detay.css',
  'tests/teacher-content-detail-140.cjs',
  'tests/teacher-content-detail-db-140.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: teacher content student-status detail source contract');
