'use strict';

const fs=require('fs');
const assert=require('assert');

const report=fs.readFileSync('ogrenci-raporu.php','utf8');
const domain=fs.readFileSync('src/kurum_yonetimi.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(report.includes("require __DIR__ . '/src/yonetici_yetkileri.php';"),'student report must load manager permission domain');
assert(report.includes("require __DIR__ . '/src/kurum_yonetimi.php';"),'student report must load manageable institution domain');
assert(report.includes("$effectiveRole==='yonetici'"),'manager report branch missing');
assert(report.includes('ky_manager_student_report_contexts($pdo,$user,$studentId)'),'manager report must enumerate only manageable student institutions');
assert(report.includes('ky_manager_student_report_context($pdo,$user,$studentId,$reportInstitutionId)'),'manager report must strictly verify selected institution');
assert(report.includes("echo 'Bu kurum için öğrenci raporunu görüntüleme yetkiniz yok.'"),'forged manager report institution must be rejected');
assert(report.includes("count($managerInstitutionChoices)===1"),'single manageable institution must auto-scope');
assert(report.includes("count($managerInstitutionChoices)>1"),'multiple manageable institutions must require explicit selection');
assert(report.includes('Bu öğrenci birden fazla yönetebildiğin kurumda aktif.'),'manager multi-institution selection explanation missing');
assert(report.includes("$effectiveRole==='super_admin' && $reportInstitutionId>0"),'super admin explicit institution must still be validated');
assert(report.includes('ogrenci-raporu.css?v=1.2.20'),'student report CSS cache version must be 1.2.20');

assert(domain.includes('function ky_manager_student_report_contexts('),'manager report context list helper missing');
assert(domain.includes("yy_can($pdo,$user,'kurum_goruntule')"),'manager report context must enforce kurum_goruntule permission');
assert(domain.includes('auth_manageable_institution_ids($pdo,$user)'),'manager report context must use manageable institution ids');
assert(domain.includes("sk.kurum_id IN ({$placeholders})"),'manager context list must intersect student membership with manageable institutions');
assert(domain.includes('function ky_manager_student_report_context('),'strict manager report context helper missing');
assert(domain.includes('ky_assert_manageable($pdo,$user,$institutionId)'),'selected report institution must be manageable');
assert(domain.includes("sk.kurum_id=?"),'selected report institution must match active student membership');
assert(domain.includes("'back'=>'kurum-raporlari.php?kurum_id='.$institutionId"),'manager report back contract missing');

assert(workflow.includes('node tests/manager-report-tenant-scope-145.cjs'),'manager report source regression must run');
assert(workflow.includes('php tests/manager-report-tenant-scope-db-145.php'),'manager report DB regression must run');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in 1.2.x line');
assert(Number(version.version.split('.')[2])>=20,'manager report tenant fix requires 1.2.20 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.20.md',
  'tests/manager-report-tenant-scope-145.cjs',
  'tests/manager-report-tenant-scope-db-145.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: manager student-report tenant scope source contract');
