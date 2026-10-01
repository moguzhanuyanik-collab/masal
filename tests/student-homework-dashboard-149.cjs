'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('ogrenci-odevleri.php','utf8');
const domain=fs.readFileSync('src/ogrenci_odev_dashboard.php','utf8');
const shared=fs.readFileSync('src/odev_durumu.php','utf8');
const css=fs.readFileSync('ogrenci-odevleri.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(page.includes("require __DIR__.'/src/odev_durumu.php';"),'student homework page must use shared homework status domain');
assert(page.includes("require __DIR__.'/src/ogrenci_odev_dashboard.php';"),'student homework dashboard domain missing');
assert(page.includes('sod_homeworks($contents)'),'student homework list must derive from accessible teacher contents');
assert(page.includes('sod_institutions($allHomeworks)'),'institution filter must derive from accessible homework rows');
assert(page.includes('name="kurum_id"'),'institution filter missing');
assert(page.includes('name="durum"'),'status filter missing');
assert(page.includes("'pending','overdue','completed'"),'supported status filters missing');
assert(page.includes("http_response_code(403);\n    echo 'Bu kurum için aktif ödev erişimin yok.'"),'foreign institution filter must be rejected');
assert(page.includes('$summary=sod_summary($institutionHomeworks);'),'dashboard summary missing');
assert(page.includes('Tamamlama oranı'),'completion rate stat missing');
assert(page.includes("Sıradaki:"),'next due indicator missing');
assert(page.includes("hw_status($item)"),'card status must use shared semantics');
assert(page.includes("oi_set_homework_completed($pdo,$studentId,$contentId,$completed)"),'existing completion action must be preserved');
assert(page.includes('ogrenci-odevleri.css?v=1.2.24'),'student homework CSS cache version must be 1.2.24');

assert(domain.includes('function sod_homeworks('),'homework extraction helper missing');
assert(domain.includes("icerik_turu']??'')==='odev'"),'dashboard must keep only homework content');
assert(domain.includes('function sod_institutions('),'institution provider missing');
assert(domain.includes('function sod_filter('),'dashboard filter helper missing');
assert(domain.includes("hw_filter($rows,$status,$now)"),'status filtering must reuse shared homework semantics');
assert(domain.includes('function sod_sort('),'urgency sort helper missing');
assert(domain.includes("$rank=['overdue'=>0,'pending'=>1,'completed'=>2]"),'urgency status order missing');
assert(domain.includes('function sod_summary('),'dashboard summary helper missing');
assert(domain.includes("round($summary['completed']*100/$summary['total'])"),'completion rate calculation missing');
assert(domain.includes("$summary['next_due']"),'next due calculation missing');

assert(shared.includes("function hw_status("),'shared homework status helper missing');
assert(css.includes('.homework-dashboard'),'dashboard styling missing');
assert(css.includes('.homework-filter'),'filter styling missing');
assert(css.includes('.homework-warning'),'overdue warning styling missing');

assert(workflow.includes('node tests/student-homework-dashboard-149.cjs'),'source regression must run in quality gate');
assert(workflow.includes('php tests/student-homework-dashboard-db-149.php'),'DB regression must run in quality gate');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in 1.2.x line');
assert(Number(version.version.split('.')[2])>=24,'student homework dashboard requires 1.2.24 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.24.md',
  'src/ogrenci_odev_dashboard.php',
  'tests/student-homework-dashboard-149.cjs',
  'tests/student-homework-dashboard-db-149.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: student homework delivery dashboard source contract');
