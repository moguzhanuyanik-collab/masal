'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('ogretmen-icerikleri.php','utf8');
const domain=fs.readFileSync('src/ogretmen_icerik.php','utf8');
const css=fs.readFileSync('ogretmen-icerikleri.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(page.includes('oi_teacher_target_groups($pdo,(int)$teacher[\'id\'],$selectedInstitutionId)'),'teacher content page must load tenant-safe target groups');
assert(page.includes('name="hedef_gruplar[]"'),'class/group targeting controls missing');
assert(page.includes('Sınıf / grup hızlı hedefleme'),'group targeting heading missing');
assert(page.includes('Grup üyeliği sonradan değişse bile eski yayının hedefi otomatik değişmez.'),'snapshot targeting explanation missing');
assert(page.includes('ogretmen-icerikleri.css?v=1.2.30'),'teacher content CSS cache version must be 1.2.30');
assert(page.includes('ogretmen-icerikleri.js?v=1.2.30'),'teacher content JS cache version must be 1.2.30');

assert(domain.includes('function oi_teacher_target_groups('),'teacher target group provider missing');
assert(domain.includes('function oi_teacher_group_student_ids('),'group student resolver missing');
assert(domain.includes('function oi_resolve_content_target_ids('),'combined target resolver missing');
assert(domain.includes("tk.kurum_id=ks.kurum_id"),'teacher active membership must match target group institution');
assert(domain.includes("sk.kurum_id=ks.kurum_id"),'student active membership must match target group institution');
assert(domain.includes('oo.ogretmen_id=?'),'target group students must belong to teacher');
assert(domain.includes("ks.id=?"),'group student resolver must target exact group');
assert(domain.includes("ks.kurum_id=?"),'group student resolver must be institution scoped');
assert(domain.includes("$groupIds=$input['hedef_gruplar']??[]"),'POST group targets must be normalized server-side');
assert(domain.includes('oi_teacher_group_student_ids($pdo,$teacherId,$institutionId,$groupId)'),'each selected group must be server expanded');
assert(domain.includes("throw new RuntimeException('Seçilen sınıf / gruplardan biri bu kurumda sana bağlı aktif öğrenci içermiyor.')"),'foreign/empty group target must fail closed');
assert(domain.includes('array_merge($targetStudentIds,$groupStudentIds)'),'group and manual targets must combine');
assert(domain.includes('sort($targetStudentIds,SORT_NUMERIC)'),'combined targets must be deterministic');
assert((domain.match(/oi_resolve_content_target_ids\(/g)||[]).length>=3,'create and update flows must both resolve class/group targets');

assert(css.includes('.teacher-content-group-target-box'),'group target box styling missing');
assert(css.includes('.teacher-content-group-targets'),'group target list styling missing');

assert(workflow.includes('node tests/teacher-group-targeting-155.cjs'),'source regression must run in quality gate');
assert(workflow.includes('php tests/teacher-group-targeting-db-155.php'),'DB regression must run in quality gate');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in 1.2.x line');
assert(Number(version.version.split('.')[2])>=30,'teacher group targeting requires 1.2.30 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.30.md',
  'tests/teacher-group-targeting-155.cjs',
  'tests/teacher-group-targeting-db-155.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: teacher class/group content targeting source contract');
