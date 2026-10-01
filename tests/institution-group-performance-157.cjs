'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('kurum-icerikleri.php','utf8');
const detail=fs.readFileSync('kurum-icerik-detay.php','utf8');
const dashboard=fs.readFileSync('src/kurum_icerik_dashboard.php','utf8');
const detailDomain=fs.readFileSync('src/kurum_icerik_detay.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(page.includes('name="grup_id"'),'institution content dashboard group filter missing');
assert(page.includes('kic_group_options($pdo,$institutionId,$teacherId)'),'group options must be teacher/institution scoped');
assert(page.includes('kic_contents($pdo,$institutionId,$teacherId,$type,$publication,$groupId)'),'dashboard query must receive group scope');
assert(page.includes("http_response_code(403);\n        echo 'Bu sınıf / grup için kurum içerik performansını görüntüleme yetkin yok.'"),'invalid group must fail closed');
assert(page.includes("<?=$groupId>0?'&amp;grup_id='.$groupId:''?>"),'detail link must preserve group snapshot context');
assert(page.includes('yayın anındaki hedef snapshotını kullanır'),'snapshot semantics must be explained');
assert(page.includes('kurum-icerikleri-dashboard.css?v=1.2.32'),'dashboard CSS cache version must be 1.2.32');

assert(dashboard.includes('function kic_group_options('),'institution group option provider missing');
assert(dashboard.includes("ogretmen_icerik_hedef_gruplari"),'dashboard must use group snapshot table');
assert(dashboard.includes('function kic_contents('),'institution content provider missing');
assert(dashboard.includes('int $groupId=0'),'institution content provider must accept group id');
assert(dashboard.includes('gh.kurum_sinif_id=?'),'group join must target exact snapshot group');
assert(dashboard.includes('gh.ogrenci_id=o.id'),'group metrics must restrict exact snapshot students');
assert(dashboard.includes('array_merge($joinParams,$params)'),'group join placeholder order must be preserved');
assert(dashboard.includes("if($groupId>0 && !kic_table_exists($pdo,'ogretmen_icerik_hedef_gruplari')) return [];"),'missing snapshot table must fail closed');

assert(detail.includes('$groupId=max(0,(int)($_GET[\'grup_id\']??0));'),'detail must read group context');
assert(detail.includes('kid_content_detail($pdo,$institutionId,$contentId,$groupId)'),'detail domain must receive group context');
assert(detail.includes('yayın-anı snapshotı'),'detail must identify snapshot context');
assert(detail.includes('kurum-icerik-detay.css?v=1.2.32'),'detail CSS cache version must be 1.2.32');

assert(detailDomain.includes('function kid_group_context('),'detail group validation helper missing');
assert(detailDomain.includes('AND kurum_sinif_id=?'),'detail group validation must target exact group');
assert(detailDomain.includes('function kid_content_detail(PDO $pdo,int $institutionId,int $contentId,int $groupId=0)'),'detail provider must accept group id');
assert(detailDomain.includes('gh.kurum_sinif_id=?'),'detail students must be snapshot group scoped');
assert(detailDomain.includes('gh.ogrenci_id=o.id'),'detail group scope must match exact student');

assert(workflow.includes('node tests/institution-group-performance-157.cjs'),'source regression must run');
assert(workflow.includes('php tests/institution-group-performance-db-157.php'),'DB regression must run');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=32,'institution group performance requires 1.2.32 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.32.md',
  'tests/institution-group-performance-157.cjs',
  'tests/institution-group-performance-db-157.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: institution content group performance source contract');
