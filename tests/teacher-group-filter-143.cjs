'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('ogretmen-ogrencilerim.php','utf8');
const report=fs.readFileSync('ogrenci-raporu.php','utf8');
const domain=fs.readFileSync('src/ogretmen_ogrenci_listesi.php','utf8');
const css=fs.readFileSync('ogretmen-ogrencilerim.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(page.includes("require __DIR__.'/src/ogretmen_ogrenci_listesi.php';"),'teacher student page must use group-aware domain');
assert(page.includes('name="grup_id"'),'teacher student group filter missing');
assert(page.includes('tol_teacher_groups($pdo,(int)$user[\'id\'],$institutionId)'),'teacher groups must be domain scoped');
assert(page.includes('tol_teacher_students($pdo,(int)$user[\'id\'],$institutionId,$grade,$groupId)'),'student filtering must use group-aware domain');
assert(page.includes('tol_student_group_map($pdo,$institutionId'),'student group chips must use tenant-scoped map');
assert(page.includes('Bu sınıf / grup sana bağlı aktif öğrenciler kapsamında değil.'),'foreign/unrelated group selection must be rejected');
assert(page.includes('ogrenci-raporu.php?id=<?=$sid?>&amp;kurum_id=<?=$institutionId?>'),'student report link must preserve institution context');
assert(page.includes('Kurum, Sınıf ve Grup'),'filter heading must expose group support');
assert(page.includes('ogretmen-ogrencilerim.css?v=1.2.18'),'student list CSS must be versioned');

assert(report.includes("require __DIR__ . '/src/ogretmen_ogrenci_listesi.php';"),'student report must load teacher context helper');
assert(report.includes("$effectiveRole==='ogretmen'"),'student report must support teacher institution context');
assert(report.includes('tol_teacher_report_context($pdo,(int)$user[\'id\'],$studentId,$reportInstitutionId)'),'teacher report return must be verified by domain');

assert(domain.includes('function tol_teacher_groups('),'teacher group provider missing');
assert(domain.includes('function tol_teacher_students('),'teacher student provider missing');
assert(domain.includes('function tol_student_group_map('),'student group map helper missing');
assert(domain.includes('function tol_teacher_report_context('),'teacher report context helper missing');
assert(domain.includes('oo.kurum_id=ks.kurum_id'),'group provider teacher relation must match institution');
assert(domain.includes("tk.kurum_id=ks.kurum_id"),'teacher membership must match group institution');
assert(domain.includes("sk.kurum_id=ks.kurum_id"),'student membership must match group institution');
assert(domain.includes("kso.kurum_id=?"),'student group filter must be institution scoped');
assert(domain.includes("kso.kurum_sinif_id=?"),'student group filter must target exact group');
assert(domain.includes("'oo.kurum_id=?'"),'teacher students must be institution scoped');
assert(domain.includes("'back'=>'ogretmen-ogrencilerim.php?kurum_id='.$institutionId"),'verified report back target missing');

assert(css.includes('.teacher-student-groups'),'student group chip styling missing');

assert(workflow.includes('node tests/teacher-group-filter-143.cjs'),'source regression must run');
assert(workflow.includes('php tests/teacher-group-filter-db-143.php'),'DB regression must run');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in 1.2.x line');
assert(Number(version.version.split('.')[2])>=18,'teacher group filtering requires 1.2.18 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.18.md',
  'src/ogretmen_ogrenci_listesi.php',
  'ogretmen-ogrencilerim.css',
  'tests/teacher-group-filter-143.cjs',
  'tests/teacher-group-filter-db-143.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: teacher class/group student filtering source contract');
