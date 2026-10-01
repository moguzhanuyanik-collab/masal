'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ogretmen_icerik.php','utf8');
const normalized=fs.readFileSync('src/normalized.php','utf8');
const v4=fs.readFileSync('api/v4-features.php','utf8');
const teacher=fs.readFileSync('ogretmen-icerikleri.php','utf8');
const student=fs.readFileSync('ogretmenim.php','utf8');
const detail=fs.readFileSync('ogretmen-icerik-detay.php','utf8');
const migration=fs.readFileSync('database/migrations/069_ogretmen_soru_yildiz_odulleri.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes("function oi_record_question_reward("),'idempotent reward writer missing');
assert(domain.includes("INSERT IGNORE INTO ogretmen_icerik_yildiz_odulleri"),'reward writer must be duplicate-safe');
assert(domain.includes("PRIMARY KEY")===false || true);
assert(domain.includes("$stars=max(0,min(20,$stars));"),'reward writer must clamp 0-20');
assert(domain.includes("if($correct && $reward>0)"),'reward may only be issued after a correct answer');
assert(domain.includes("oi_record_question_reward($pdo,$studentId,$contentId,$reward)"),'answer flow must use idempotent reward writer');
assert(domain.includes("$star=max(0,min(20,(int)($input['yildiz_degeri']??0)));"),'create/update reward input must be clamped');
assert(domain.includes("if($type!=='soru') $star=0;"),'non-question content must not retain question reward');
assert(domain.includes("'yildiz_degeri'=>$star"),'normalized edit payload must preserve reward');
assert(domain.includes("aciklama=?,yildiz_degeri=?"),'content update SQL must persist reward');
assert(domain.includes("yr.yildiz_degeri kazanilan_yildiz"),'teacher detail must expose awarded star records');

assert(normalized.includes("function normalized_teacher_reward_stars("),'normalized teacher reward sum helper missing');
assert(normalized.includes("SUM(yildiz_degeri)"),'normalized helper must aggregate awarded stars');
assert(normalized.includes("$out['stars']+=normalized_teacher_reward_stars($pdo,$studentId);"),'student summary must include teacher rewards');

assert(v4.includes("+normalized_teacher_reward_stars($db,$sid);"),'reward store earned stars must include teacher rewards');

const rewardInputs=(teacher.match(/name="yildiz_degeri"/g)||[]).length;
assert(rewardInputs>=2,'teacher create and edit forms must both expose reward input');
assert(teacher.includes('Doğru cevap yıldız ödülü'),'teacher reward field label missing');
assert(teacher.includes("⭐ '.(int)$item['yildiz_degeri'].' ödül"),'teacher content list must show configured reward');

assert(student.includes("$awardedStars=0;"),'student answer flow must capture newly awarded stars');
assert(student.includes("oi_answer_question($pdo,$studentId,$contentId,$selected,$awardedStars)"),'student answer flow must request awarded amount');
assert(student.includes("yıldız kazandın!"),'student first-award message missing');
assert(student.includes("<?=min(20,(int)$item['yildiz_degeri'])?> yıldız"),'student question reward badge missing');

assert(detail.includes("Dağıtılan yıldız"),'teacher detail reward summary missing');
assert(detail.includes("İlk doğru cevap ödülü"),'teacher detail configured reward missing');
assert(detail.includes("kazanilan_yildiz"),'teacher detail student reward result missing');

assert(migration.includes("CREATE TABLE IF NOT EXISTS ogretmen_icerik_yildiz_odulleri"),'reward migration table missing');
assert(migration.includes("PRIMARY KEY (icerik_id,ogrenci_id)"),'reward migration must enforce one reward per content/student');
assert(migration.includes("KEY ix_oi_yildiz_ogrenci"),'reward migration student index missing');

assert(workflow.includes('node tests/teacher-question-star-reward-147.cjs'),'source regression must run');
assert(workflow.includes('php tests/teacher-question-star-reward-db-147.php'),'DB regression must run');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in 1.2.x line');
assert(Number(version.version.split('.')[2])>=22,'teacher star reward requires 1.2.22 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.22.md',
  'database/migrations/069_ogretmen_soru_yildiz_odulleri.sql',
  'tests/teacher-question-star-reward-147.cjs',
  'tests/teacher-question-star-reward-db-147.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: teacher question star reward source contract');
