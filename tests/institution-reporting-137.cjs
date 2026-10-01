'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('kurum-raporlari.php','utf8');
const domain=fs.readFileSync('src/kurum_raporlari.php','utf8');
const studentReport=fs.readFileSync('ogrenci-raporu.php','utf8');
const management=fs.readFileSync('src/kurum_yonetimi.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(page.includes("name=\"grup_id\""),'institution report group filter missing');
assert(page.includes('kr_active_groups($pdo,$institutionId)'),'report must load institution-scoped groups');
assert(page.includes('kr_report_rows($pdo,$institutionId,$grade,$groupId,$start,$end)'),'report must use shared report domain');
assert(page.includes("ogrenci-raporu.php?id=<?=(int)$row['id']?>&amp;kurum_id=<?=$institutionId?>"),'student drill-down must preserve institution context');
assert(page.includes("Sistem sorusu yanıtı"),'system question summary missing');
assert(page.includes("Öğretmen sorusu yanıtı"),'teacher question summary missing');
assert(page.includes("Süresi geçmiş bekleyen"),'overdue homework summary missing');
assert(page.includes("Tarih filtresi soru performansında cevap tarihini, ödevlerde yayın tarihini sınırlar."),'report date semantics must be explicit');

assert(domain.includes('function kr_active_groups('),'active group provider missing');
assert(domain.includes('WHERE id=? AND kurum_id=? AND aktif=1'),'group selection must be tenant scoped');
assert(domain.includes("oi.kurum_id=?"),'teacher content must be institution scoped');
assert(domain.includes("oi.icerik_turu='soru'"),'teacher question aggregation missing');
assert(domain.includes("oi.icerik_turu='odev'"),'homework aggregation missing');
assert(domain.includes("oo.kurum_id=oi.kurum_id"),'homework teacher/student relation must match institution');
assert(domain.includes("tk.kurum_id=oi.kurum_id"),'teacher membership must match content institution');
assert(domain.includes("h.ogrenci_id=oo.ogrenci_id"),'selected homework target must match student');
assert(domain.includes("kso.kurum_id=?"),'group membership filter must be institution scoped');
assert(domain.includes("kso.kurum_sinif_id=?"),'group membership filter must target exact group');
assert(domain.includes("COUNT(DISTINCT CASE"),'homework status aggregation must avoid duplicate content counts');
assert(domain.includes("oi.teslim_tarihi<NOW()"),'overdue homework calculation missing');

assert(studentReport.includes("SELECT id,ad,email,egitim_kademesi,sinif_seviyesi,kullanici_id FROM ogrenciler"),'student report must load display name and user id');
assert(studentReport.includes('ky_manager_student_report_context($pdo,$user,$studentId,$reportInstitutionId)'),'student report return context must use strict manager scope');
assert(management.includes('ky_assert_manageable($pdo,$user,$institutionId)'),'student report return context must verify manageable institution');
assert(management.includes("sk.kurum_id=?"),'student report return context must verify student membership in selected institution');
assert(management.includes("'back'=>'kurum-raporlari.php?kurum_id='.$institutionId"),'student report must return to verified institution report');

assert(workflow.includes('node tests/institution-reporting-137.cjs'),'institution reporting source regression must run in quality gate');
assert(workflow.includes('php tests/institution-reporting-db-137.php'),'institution reporting DB regression must run in quality gate');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in the 1.2.x line');
assert(Number(version.version.split('.')[2])>=12,'institution reporting capability requires 1.2.12 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.12.md',
  'src/kurum_raporlari.php',
  'kurum-raporlari.css',
  'tests/institution-reporting-137.cjs',
  'tests/institution-reporting-db-137.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: institution reporting group/question/homework source contract');
