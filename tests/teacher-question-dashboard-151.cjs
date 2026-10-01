'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('ogretmen-sorulari.php','utf8');
const panel=fs.readFileSync('ogretmen-paneli.php','utf8');
const domain=fs.readFileSync('src/ogretmen_soru_dashboard.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(page.includes("require_role('ogretmen')"),'question dashboard must require teacher role');
assert(page.includes('tsd_teacher_questions($pdo,(int)$user[\'id\'],$institutionId,$publication)'),'dashboard must use teacher-scoped question domain');
assert(page.includes('name="kurum_id"'),'institution filter missing');
assert(page.includes('name="yayin"'),'publication filter missing');
assert(page.includes('name="performans"'),'performance filter missing');
assert(page.includes('Cevaplanma'),'answer-rate metric missing');
assert(page.includes('Doğruluk'),'accuracy metric missing');
assert(page.includes('Dağıtılan yıldız'),'reward total metric missing');
assert(page.includes('ogretmen-icerik-detay.php?id=<?=(int)$question[\'id\']?>'),'question card must drill into per-student detail');
assert(page.includes('ogretmen-sorulari.css?v=1.2.26'),'question dashboard CSS must be versioned');
assert(panel.includes('href="ogretmen-sorulari.php"'),'teacher panel must link question dashboard');

assert(domain.includes('function tsd_teacher_questions('),'question dashboard provider missing');
assert(domain.includes("oi.icerik_turu='soru'"),'dashboard must only aggregate question content');
assert(domain.includes('oi_teacher_can_use_institution($pdo,$teacherUserId,$institutionId)'),'institution filter must verify teacher membership');
assert(domain.includes("tk.kurum_id=oi.kurum_id"),'teacher membership must match content institution');
assert(domain.includes("oo.kurum_id=oi.kurum_id"),'teacher/student relation must match content institution');
assert(domain.includes("sk.kurum_id=oi.kurum_id"),'student membership must match content institution');
assert(domain.includes("oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL"),'selected target semantics missing');
assert(domain.includes('function tsd_question_state('),'question state classifier missing');
assert(domain.includes("if($target<=0) return 'no_target';"),'no-target state missing');
assert(domain.includes("if($correct===$target) return 'all_correct';"),'all-correct state missing');
assert(domain.includes("if($wrong>0) return 'wrong';"),'wrong-answer state missing');
assert(domain.includes('function tsd_filter_questions('),'performance filter helper missing');
assert(domain.includes('function tsd_dashboard_summary('),'dashboard summary helper missing');
assert(domain.includes("SUM(CASE"),'distributed star aggregation missing');

assert(workflow.includes('node tests/teacher-question-dashboard-151.cjs'),'source regression must run');
assert(workflow.includes('php tests/teacher-question-dashboard-db-151.php'),'DB regression must run');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in 1.2.x line');
assert(Number(version.version.split('.')[2])>=26,'teacher question dashboard requires 1.2.26 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.26.md',
  'src/ogretmen_soru_dashboard.php',
  'ogretmen-sorulari.php',
  'ogretmen-sorulari.css',
  'tests/teacher-question-dashboard-151.cjs',
  'tests/teacher-question-dashboard-db-151.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: teacher question performance dashboard source contract');
