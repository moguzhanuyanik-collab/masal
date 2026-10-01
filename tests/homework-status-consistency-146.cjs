'use strict';

const fs=require('fs');
const assert=require('assert');

const parent=fs.readFileSync('veli-odevleri.php','utf8');
const teacherDetail=fs.readFileSync('ogretmen-odev-detay.php','utf8');
const teacherList=fs.readFileSync('ogretmen-odevleri.php','utf8');
const domain=fs.readFileSync('src/odev_durumu.php','utf8');
const parentCss=fs.readFileSync('veli-odevleri.css','utf8');
const teacherCss=fs.readFileSync('ogretmen-odev-detay.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(parent.includes("require __DIR__.'/src/odev_durumu.php';"),'parent homework page must use shared status domain');
assert(parent.includes("require __DIR__.'/src/veli_icerikleri.php';"),'parent homework page must use tenant-safe parent content domain');
assert(parent.includes("vi_parent_contents($pdo,(int)$user['id'],$childId,$institutionId,'odev')"),'parent homework list must use tenant-safe provider');
assert(parent.includes("vi_parent_child_institutions($pdo,(int)$user['id'],$childId)"),'parent homework institution filter must be parent-child scoped');
assert(parent.includes('name="durum"'),'parent homework status filter missing');
assert(parent.includes('value="overdue"'),'parent homework overdue filter missing');
assert(parent.includes("$summary=hw_summary($allHomeworks);"),'parent homework summary must use shared status domain');
assert(parent.includes("hw_filter($allHomeworks,$status)"),'parent homework status filter must use shared status domain');
assert(parent.includes("hw_status($homework)"),'parent homework cards must use shared status calculation');
assert(parent.includes('Geciken'), 'parent homework summary must expose overdue count');
assert(parent.includes('veli-odevleri.css?v=1.2.21'),'parent homework stylesheet must be versioned');

assert(teacherDetail.includes("require __DIR__.'/src/odev_durumu.php';"),'teacher homework detail must use shared status domain');
assert(teacherDetail.includes("hw_summary($students,null,(string)($homework['teslim_tarihi']??''))"),'teacher summary must use shared status calculation');
assert(teacherDetail.includes("hw_status($student,null,(string)($homework['teslim_tarihi']??''))"),'teacher student rows must use shared status calculation');
assert(teacherDetail.includes("ogrenci-raporu.php?id=<?=(int)$student['id']?>&amp;kurum_id=<?=(int)$homework['kurum_id']?>"),'teacher homework student drill-down must preserve institution context');
assert(teacherDetail.includes('Gecikti'),'teacher homework detail must expose overdue status');
assert(teacherDetail.includes('ogretmen-odev-detay.css?v=1.2.21'),'teacher homework detail stylesheet must be versioned');
assert(teacherList.includes('tamamlandı, gecikti ve bekliyor'),'teacher homework list help must describe all delivery states');

assert(domain.includes('function hw_status('),'shared homework status helper missing');
assert(domain.includes("if($completed) return 'completed';"),'completed homework must take precedence over due date');
assert(domain.includes("return 'overdue';"),'overdue homework status missing');
assert(domain.includes("return 'pending';"),'pending homework status missing');
assert(domain.includes('function hw_summary('),'homework summary helper missing');
assert(domain.includes('function hw_filter('),'homework status filter helper missing');

assert(parentCss.includes('.parent-homework-card.overdue'),'parent overdue styling missing');
assert(teacherCss.includes('.role-pill.warn'),'teacher overdue pill styling missing');

assert(workflow.includes('node tests/homework-status-consistency-146.cjs'),'source regression must run');
assert(workflow.includes('php tests/homework-status-consistency-146.php'),'behavior regression must run');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in 1.2.x line');
assert(Number(version.version.split('.')[2])>=21,'homework status consistency requires 1.2.21 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.21.md',
  'src/odev_durumu.php',
  'veli-odevleri.css',
  'ogretmen-odev-detay.css',
  'tests/homework-status-consistency-146.cjs',
  'tests/homework-status-consistency-146.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: homework status consistency source contract');
