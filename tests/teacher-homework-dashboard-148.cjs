'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('ogretmen-odevleri.php','utf8');
const domain=fs.readFileSync('src/ogretmen_odev_dashboard.php','utf8');
const css=fs.readFileSync('ogretmen-odevleri.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(page.includes("require __DIR__.'/src/ogretmen_odev_dashboard.php';"),'teacher homework page must use dashboard domain');
assert(page.includes('thd_teacher_institutions($pdo,(int)$user[\'id\'])'),'teacher institution filter must use dashboard domain');
assert(page.includes('thd_teacher_homeworks($pdo,(int)$user[\'id\'],$institutionId,$publication,\'tum\')'),'dashboard rows must use shared progress query');
assert(page.includes('thd_dashboard_summary($allHomeworks)'),'dashboard summary missing');
assert(page.includes('thd_filter_homeworks($allHomeworks,$delivery)'),'delivery filter missing');
assert(page.includes('name="yayin"'),'publication status filter missing');
assert(page.includes('name="teslim"'),'delivery performance filter missing');
assert(page.includes('value="overdue"'),'overdue dashboard filter missing');
assert(page.includes('value="completed"'),'completed dashboard filter missing');
assert(page.includes('value="no_target"'),'no-target dashboard filter missing');
assert(page.includes('Gecikme var'),'overdue dashboard state missing');
assert(page.includes('Tümü tamamlandı'),'completed dashboard state missing');
assert(page.includes('hedef</span>'),'target-count metric missing');
assert(page.includes('gecikti</span>'),'overdue-count metric missing');
assert(page.includes('bekliyor</span>'),'pending-count metric missing');
assert(page.includes('ogretmen-odevleri.css?v=1.2.23'),'dashboard stylesheet must be versioned');

assert(domain.includes('function thd_teacher_profile_id('),'teacher profile helper missing');
assert(domain.includes('function thd_teacher_institutions('),'teacher institutions helper missing');
assert(domain.includes('function thd_teacher_homeworks('),'teacher homework progress provider missing');
assert(domain.includes('function thd_homework_progress_state('),'progress state helper missing');
assert(domain.includes('function thd_dashboard_summary('),'dashboard summary helper missing');
assert(domain.includes('function thd_filter_homeworks('),'dashboard delivery filter helper missing');
assert(domain.includes("oo.kurum_id=oi.kurum_id"),'teacher/student relation must stay institution scoped');
assert(domain.includes("tk.kurum_id=oi.kurum_id"),'teacher active membership must match homework institution');
assert(domain.includes("sk.kurum_id=oi.kurum_id"),'student active membership must match homework institution');
assert(domain.includes('su.id IS NOT NULL'),'inactive student user must be excluded from progress counts');
assert(domain.includes("oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL"),'selected-target semantics missing');
assert(domain.includes("oi.teslim_tarihi<NOW()"),'overdue aggregate calculation missing');
assert(domain.includes("$row['bekleyen_sayisi']=max(0,$target-$completed-$overdue)"),'pending count must exclude completed and overdue students');

assert(css.includes('.teacher-homework-dashboard-card.overdue'),'overdue dashboard card styling missing');
assert(css.includes('.teacher-homework-progress'),'homework progress metric styling missing');

assert(workflow.includes('node tests/teacher-homework-dashboard-148.cjs'),'source regression must run');
assert(workflow.includes('php tests/teacher-homework-dashboard-db-148.php'),'DB regression must run');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in 1.2.x line');
assert(Number(version.version.split('.')[2]) >=23,'teacher homework dashboard requires 1.2.23 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.23.md',
  'src/ogretmen_odev_dashboard.php',
  'ogretmen-odevleri.css',
  'tests/teacher-homework-dashboard-148.cjs',
  'tests/teacher-homework-dashboard-db-148.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: teacher homework delivery dashboard source contract');
