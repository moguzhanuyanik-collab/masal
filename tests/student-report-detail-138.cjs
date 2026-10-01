'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('ogrenci-raporu.php','utf8');
const domain=fs.readFileSync('src/ogrenci_rapor_detay.php','utf8');
const css=fs.readFileSync('ogrenci-raporu.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(page.includes("require __DIR__ . '/src/ogretmen_icerik.php';"),'student report must load teacher content domain');
assert(page.includes("require __DIR__ . '/src/ogrenci_rapor_detay.php';"),'student report must load detail summary domain');
assert(page.includes('ord_scope_teacher_contents($teacherContents,$reportInstitutionId)'),'institution drill-down must scope teacher content');
assert(page.includes("WHERE kso.kurum_id=? AND kso.ogrenci_id=?"),'student group list must be institution scoped');
assert(page.includes('Öğretmen içerikleri'),'teacher content summary section missing');
assert(page.includes('Ödev durumu'),'homework detail section missing');
assert(page.includes('Öğretmen soruları'),'teacher question detail section missing');
assert(page.includes("Süresi geçti"),'overdue homework state missing');
assert(page.includes("$reportBackLabel='Panelime Dön'"),'default report return label missing');
assert(page.includes("$reportBackLabel='Kurum Raporuna Dön'") || page.includes("$reportBackLabel=(string)$managerContext['back_label'];"),'verified manager report return label missing');
assert(page.includes('<?=h_report($reportBackLabel)?>'),'student report return action must render verified context label');
assert(/ogrenci-raporu\.css\?v=1\.2\.(?:1[3-9]|[2-9]\d)/.test(page),'student report stylesheet must be versioned at 1.2.13 or newer');

assert(domain.includes('function ord_scope_teacher_contents('),'teacher content scope helper missing');
assert(domain.includes("(int)($row['kurum_id']??0)===$institutionId"),'teacher content scope must match exact institution');
assert(domain.includes('function ord_teacher_content_summary('),'teacher content summary helper missing');
assert(domain.includes("if($type==='soru')"),'question summary missing');
assert(domain.includes("if($type!=='odev') continue;"),'homework summary missing');
assert(domain.includes("if($dueAt<$now)$summary['homeworks_overdue']++"),'overdue summary calculation missing');
assert(domain.includes('function ord_recent_homeworks('),'recent homework helper missing');
assert(domain.includes('function ord_recent_questions('),'recent question helper missing');

assert(css.includes('.student-report-grid'),'student report metric grid missing');
assert(css.includes('.student-report-detail-card'),'student report detail card styling missing');

assert(workflow.includes('node tests/student-report-detail-138.cjs'),'student report source regression must run in quality gate');
assert(workflow.includes('php tests/student-report-detail-138.php'),'student report behavior test must run in quality gate');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in 1.2.x line');
assert(Number(version.version.split('.')[2])>=13,'student detail reporting requires 1.2.13 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.13.md',
  'src/ogrenci_rapor_detay.php',
  'ogrenci-raporu.css',
  'tests/student-report-detail-138.cjs',
  'tests/student-report-detail-138.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: detailed student report source contract');
