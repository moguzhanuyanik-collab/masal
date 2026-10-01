'use strict';

const fs=require('fs');
const assert=require('assert');

const migration=fs.readFileSync('database/migrations/067_odev_teslim_tarihi_ve_tamamlama.sql','utf8');
const helper=fs.readFileSync('src/ogretmen_icerik.php','utf8');
const teacherForm=fs.readFileSync('ogretmen-icerikleri.php','utf8');
const teacherJs=fs.readFileSync('ogretmen-icerikleri.js','utf8');
const teacherList=fs.readFileSync('ogretmen-odevleri.php','utf8');
const teacherDetail=fs.readFileSync('ogretmen-odev-detay.php','utf8');
const parent=fs.readFileSync('veli-odevleri.php','utf8');
const student=fs.readFileSync('ogrenci-odevleri.php','utf8');
const profileFeatures=fs.readFileSync('v4-features.js','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(migration.includes('ADD COLUMN teslim_tarihi DATETIME NULL'),'homework deadline migration missing');
assert(migration.includes('CREATE TABLE IF NOT EXISTS ogrenci_odev_durumlari'),'homework status table migration missing');
assert(migration.includes('PRIMARY KEY (icerik_id,ogrenci_id)'),'homework status idempotency key missing');
assert(!/\bDELETE\s+FROM\b/i.test(migration),'homework migration must not delete data');
assert(!/\bDROP\s+TABLE\b/i.test(migration),'homework migration must not drop tables');

assert(helper.includes("$dueRaw=trim((string)($input['teslim_tarihi']??''))"),'teacher due-date normalization missing');
assert(helper.includes('function oi_set_homework_completed('),'student homework completion function missing');
assert(helper.includes('LEFT JOIN ogrenci_odev_durumlari od'),'student homework status join missing');
assert(helper.includes('oo.kurum_id=oi.kurum_id'),'student content relation must keep institution scope');
assert(helper.includes('WHERE oo.ogretmen_id=? AND oo.kurum_id=?'),'teacher target relation must keep institution scope');

assert(teacherForm.includes('name="teslim_tarihi"'),'teacher homework deadline field missing');
assert(teacherForm.includes('data-homework-fields'),'homework conditional field wrapper missing');
assert(teacherJs.includes("type?.value==='odev'"),'teacher homework field toggle missing');

assert(teacherList.includes('Teslim:'),'teacher homework list deadline missing');
assert(teacherDetail.includes('TESLİM ÖZETİ'),'teacher completion summary missing');
assert(teacherDetail.includes("tamamlanma_tarihi"),'teacher completion timestamp missing');
assert(parent.includes("auth_accessible_student_ids"),'parent homework child list must use centralized scoped access');
assert(parent.includes("vo.kurum_id=oi.kurum_id"),'parent homework relation must be tenant scoped');
assert(parent.includes('Tamamlandı'),'parent completion status missing');

assert(student.includes('require_student_login()'),'student homework page must require student role');
assert(student.includes("verify_csrf($_POST['csrf']??null)"),'student homework status must require CSRF');
assert(student.includes('oi_set_homework_completed'),'student homework status action missing');
assert(student.includes('Süresi geçti'),'student overdue state missing');
assert(student.includes('Tekrar bekliyor yap'),'student completion reversal missing');
assert(profileFeatures.includes("'ogrenci-odevleri.php'"),'student homework page must be discoverable from profile');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in the 1.2.x line');
assert(Number(version.version.split('.')[2])>=7,'homework completion capability requires 1.2.7 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);
for(const path of [
  'RELEASE-1.2.7.md',
  'database/migrations/067_odev_teslim_tarihi_ve_tamamlama.sql',
  'ogrenci-odevleri.php',
  'ogrenci-odevleri.css',
  'tests/homework-completion-132.cjs',
  'tests/homework-completion-db-132.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: homework deadline/completion end-to-end source contract');
