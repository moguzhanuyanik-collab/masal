'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('veli-icerikleri.php','utf8');
const panel=fs.readFileSync('veli-paneli.php','utf8');
const domain=fs.readFileSync('src/veli_icerikleri.php','utf8');
const css=fs.readFileSync('veli-icerikleri.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(page.includes("require_role('veli')"),'parent content page must require parent role');
assert(page.includes('vi_parent_children($pdo,(int)$user[\'id\'])'),'page must use scoped parent-child provider');
assert(page.includes('vi_parent_child_institutions($pdo,(int)$user[\'id\'],$childId)'),'institution filter must be parent-child scoped');
assert(page.includes('vi_parent_contents($pdo,(int)$user[\'id\'],$childId,$institutionId,$type)'),'content list must use tenant-safe domain');
assert(page.includes('Bu öğrencinin öğretmen içeriklerine erişim yetkiniz yok.'),'invalid child access must be rejected');
assert(page.includes('Bu kurum için öğretmen içeriklerine erişim yetkiniz yok.'),'invalid institution filter must be rejected');
assert(page.includes('Soru doğruluğu'),'question performance summary missing');
assert(page.includes('Ödev tamamlama'),'homework completion summary missing');
assert(page.includes("status='Gecikti'"),'overdue homework status missing');
assert(page.includes('salt okunurdur'),'parent content page must remain read-only');
assert(page.includes('veli-icerikleri.css?v=1.2.17'),'parent content stylesheet must be versioned');

assert(panel.includes('href="veli-icerikleri.php"'),'parent panel must link teacher content tracking');
assert(panel.includes('Öğretmen İçerikleri'),'parent panel content module missing');

assert(domain.includes('function vi_parent_children('),'parent children domain helper missing');
assert(domain.includes('function vi_parent_child_institutions('),'parent child institution helper missing');
assert(domain.includes('function vi_parent_contents('),'parent content list helper missing');
assert(domain.includes('function vi_parent_summary('),'parent summary helper missing');
assert(domain.includes('vo.kurum_id=oi.kurum_id'),'parent-child relation must match content institution');
assert(domain.includes("vk.kurum_id=oi.kurum_id"),'parent membership must match content institution');
assert(domain.includes("sk.kurum_id=oi.kurum_id"),'student membership must match content institution');
assert(domain.includes('oo.kurum_id=oi.kurum_id'),'teacher-student relation must match content institution');
assert(domain.includes("oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL"),'selected target semantics missing');
assert(domain.includes('oi.aktif=1'),'parent must only see active teacher content');
assert(domain.includes('c.ogrenci_id=os.id'),'question response must belong to selected child');
assert(domain.includes('od.ogrenci_id=os.id'),'homework state must belong to selected child');

assert(css.includes('.parent-content-card'),'parent content card styling missing');
assert(css.includes('.parent-content-status.warn'),'parent content warning state styling missing');

assert(workflow.includes('node tests/parent-teacher-content-142.cjs'),'source regression must run');
assert(workflow.includes('php tests/parent-teacher-content-db-142.php'),'DB regression must run');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in 1.2.x line');
assert(Number(version.version.split('.')[2])>=17,'parent content tracking requires 1.2.17 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.17.md',
  'src/veli_icerikleri.php',
  'veli-icerikleri.php',
  'veli-icerikleri.css',
  'tests/parent-teacher-content-142.cjs',
  'tests/parent-teacher-content-db-142.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: parent teacher-content tracking source contract');
