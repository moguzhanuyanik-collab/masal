'use strict';

const fs=require('fs');
const assert=require('assert');

const report=fs.readFileSync('ogrenci-raporu.php','utf8');
const parentDomain=fs.readFileSync('src/veli_icerikleri.php','utf8');
const parentContents=fs.readFileSync('veli-icerikleri.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(report.includes("require __DIR__ . '/src/veli_icerikleri.php';"),'student report must load parent tenant context domain');
assert(report.includes("$effectiveRole==='veli'"),'student report must branch for parent role');
assert(report.includes('vi_parent_child_institutions($pdo,(int)$user[\'id\'],$studentId)'),'parent report must enumerate verified child institutions');
assert(report.includes('vi_parent_report_context($pdo,(int)$user[\'id\'],$studentId,$reportInstitutionId)'),'parent report institution must be strictly verified');
assert(report.includes("http_response_code(403);\n                echo 'Bu kurum için öğrenci raporuna erişim yetkiniz yok.'"),'forged parent institution context must be rejected');
assert(report.includes("count($parentInstitutionChoices)===1"),'single parent institution must auto-scope');
assert(report.includes("count($parentInstitutionChoices)>1"),'multiple parent institutions must require explicit choice');
assert(report.includes('Öğretmen soru ve ödevlerinin karışmaması için raporu hangi kurum kapsamında açacağını seç.'),'multi-institution safety explanation missing');
assert(report.includes("exit;\n        }\n    }catch(Throwable $e)"),'multi-institution selection must stop report execution before data queries');
assert(report.includes("if($reportInstitutionScoped){\n    $teacherContents=ord_scope_teacher_contents($teacherContents,$reportInstitutionId);"),'teacher contents must be institution scoped after parent context validation');
assert(report.includes("$reportBackLabel=(string)$parentContext['back_label'];"),'parent report back label must be context-specific');
assert(report.includes('ogrenci-raporu.css?v=1.2.19'),'student report CSS cache version must be 1.2.19');

assert(parentDomain.includes('function vi_parent_report_context('),'strict parent report context helper missing');
assert(parentDomain.includes('vo.kurum_id=?'),'parent report context must target exact veli_ogrenci institution');
assert(parentDomain.includes("vk.kurum_id=vo.kurum_id"),'parent active institution membership must match relation');
assert(parentDomain.includes("sk.kurum_id=vo.kurum_id"),'student active institution membership must match relation');
assert(parentDomain.includes("'back_label'=>'Çocuklarıma Dön'"),'parent report back contract missing');

assert(parentContents.includes("$reportInstitutionId=$institutionId>0?$institutionId:(count($institutions)===1?(int)$institutions[0]['id']:0);"),'parent content center must resolve report institution safely');
assert(parentContents.includes("<?=$reportInstitutionId>0?'&amp;kurum_id='.$reportInstitutionId:''?>"),'parent content report link must carry resolved institution');

assert(workflow.includes('node tests/parent-report-tenant-scope-144.cjs'),'source regression must run');
assert(workflow.includes('php tests/parent-report-tenant-scope-db-144.php'),'DB regression must run');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in 1.2.x line');
assert(Number(version.version.split('.')[2])>=19,'parent report tenant fix requires 1.2.19 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.19.md',
  'tests/parent-report-tenant-scope-144.cjs',
  'tests/parent-report-tenant-scope-db-144.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: parent student-report tenant scope source contract');
