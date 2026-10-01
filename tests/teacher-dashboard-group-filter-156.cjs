'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ogretmen_icerik.php','utf8');
const qDomain=fs.readFileSync('src/ogretmen_soru_dashboard.php','utf8');
const hDomain=fs.readFileSync('src/ogretmen_odev_dashboard.php','utf8');
const qPage=fs.readFileSync('ogretmen-sorulari.php','utf8');
const hPage=fs.readFileSync('ogretmen-odevleri.php','utf8');
const detail=fs.readFileSync('ogretmen-icerik-detay.php','utf8');
const homeworkDetail=fs.readFileSync('ogretmen-odev-detay.php','utf8');
const migration=fs.readFileSync('database/migrations/070_ogretmen_icerik_grup_hedef_snapshot.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(migration.includes('CREATE TABLE IF NOT EXISTS ogretmen_icerik_hedef_gruplari'),'group target snapshot table missing');
assert(migration.includes('PRIMARY KEY (icerik_id,kurum_sinif_id,ogrenci_id)'),'group/student snapshot uniqueness missing');

assert(domain.includes('function oi_resolve_content_target_plan('),'target plan helper missing');
assert(domain.includes("'group_targets'=>$groupTargets"),'target plan must return group/student snapshots');
assert(domain.includes('function oi_store_content_group_targets('),'group snapshot persistence helper missing');
assert(domain.includes('INSERT INTO ogretmen_icerik_hedef_gruplari'),'group snapshot insert missing');
assert(domain.includes("SELECT DISTINCT kurum_sinif_id FROM ogretmen_icerik_hedef_gruplari"),'edit flow must reload selected groups');
assert(domain.includes('DELETE FROM ogretmen_icerik_hedef_gruplari WHERE icerik_id=?'),'edit must replace group snapshots');
assert(domain.includes('SELECT ?,kurum_sinif_id,kurum_id,ogrenci_id,grup_adi,grup_turu,sinif_seviyesi'),'copy must preserve group snapshots');
assert(domain.includes('function oi_teacher_dashboard_target_groups('),'dashboard group provider missing');

assert(qDomain.includes('int $groupId=0'),'question dashboard group argument missing');
assert(qDomain.includes('ogretmen_icerik_hedef_gruplari ghs'),'question metrics must use group/student snapshot');
assert(qDomain.includes('ogretmen_icerik_hedef_gruplari ghc'),'question list must require content group snapshot');
assert(hDomain.includes('int $groupId=0'),'homework dashboard group argument missing');
assert(hDomain.includes('ogretmen_icerik_hedef_gruplari ghs'),'homework metrics must use group/student snapshot');
assert(hDomain.includes('ogretmen_icerik_hedef_gruplari ghc'),'homework list must require content group snapshot');

assert(qPage.includes('name="grup_id"'),'question dashboard group filter missing');
assert(qPage.includes("tsd_teacher_questions($pdo,(int)$user['id'],$institutionId,$publication,$groupId)"),'question dashboard must pass group filter');
assert(qPage.includes("ogretmen-icerik-detay.php?id=<?=(int)$question['id']?><?=$groupId>0?'&amp;grup_id='.$groupId:''?>"),'question detail must preserve group context');
assert(hPage.includes('name="grup_id"'),'homework dashboard group filter missing');
assert(hPage.includes("thd_teacher_homeworks($pdo,(int)$user['id'],$institutionId,$publication,'tum',$groupId)"),'homework dashboard must pass group filter');
assert(hPage.includes("ogretmen-odev-detay.php?id=<?=(int)$homework['id']?><?=$groupId>0?'&amp;grup_id='.$groupId:''?>"),'homework detail must preserve group context');

assert(detail.includes('oi_teacher_content_detail($pdo,$user,$contentId,$groupId)'),'content detail must apply group context');
assert(detail.includes("&amp;kurum_id=<?=(int)$content['kurum_id']?>"),'content detail student report must preserve institution');
assert(homeworkDetail.includes('ogretmen_icerik_hedef_gruplari ghs'),'homework detail must filter by snapshot group');
assert(homeworkDetail.includes("$returnUrl='ogretmen-odevleri.php?kurum_id='"),'homework detail return context missing');

assert(workflow.includes('node tests/teacher-dashboard-group-filter-156.cjs'),'source regression must run');
assert(workflow.includes('php tests/teacher-dashboard-group-filter-db-156.php'),'DB regression must run');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain 1.2.x');
assert(Number(version.version.split('.')[2])>=31,'group dashboard filter requires 1.2.31 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.31.md',
  'database/migrations/070_ogretmen_icerik_grup_hedef_snapshot.sql',
  'tests/teacher-dashboard-group-filter-156.cjs',
  'tests/teacher-dashboard-group-filter-db-156.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: teacher dashboard class/group snapshot filtering source contract');
