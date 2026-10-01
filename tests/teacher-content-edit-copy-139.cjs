'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('ogretmen-icerikleri.php','utf8');
const domain=fs.readFileSync('src/ogretmen_icerik.php','utf8');
const js=fs.readFileSync('ogretmen-icerikleri.js','utf8');
const css=fs.readFileSync('ogretmen-icerikleri.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(page.includes("elseif($action==='update')"),'teacher content update action missing');
assert(page.includes("elseif($action==='copy')"),'teacher content copy action missing');
assert(page.includes('oi_update_content($pdo,$user,$editContentId,$_POST,$targets)'),'update action must use domain helper');
assert(page.includes('oi_duplicate_content($pdo,$user,$sourceId)'),'copy action must use domain helper');
assert(page.includes('data-content-copy'),'copy confirmation hook missing');
assert(page.includes('🔒 Geçmiş var'),'activity lock indicator missing');
assert(page.includes("Öğrenci yanıtı veya ödev durumu oluşan içerikler"),'history protection explanation missing');
assert(page.includes('ogretmen-icerikleri.css?v=1.2.14'),'teacher content CSS must be cache-busted');
assert(page.includes('ogretmen-icerikleri.js?v=1.2.14'),'teacher content JS must be cache-busted');

assert(domain.includes('function oi_teacher_content_for_edit('),'editable content fetch helper missing');
assert(domain.includes('COUNT(DISTINCT c.ogrenci_id) soru_cevap_sayisi'),'question activity count missing');
assert(domain.includes('COUNT(DISTINCT od.ogrenci_id) odev_durum_sayisi'),'homework activity count missing');
assert(domain.includes('function oi_normalize_content_input('),'shared edit validation helper missing');
assert(domain.includes('function oi_update_content('),'teacher content update helper missing');
assert(domain.includes("if((int)($current['aktivite_sayisi']??0)>0)"),'history-protected update guard missing');
assert(domain.includes("WHERE id=? AND ogretmen_id=? AND kurum_id=?"),'teacher content update must remain owner and tenant scoped');
assert(domain.includes("DELETE FROM ogretmen_icerik_hedefleri WHERE icerik_id=?"),'target replacement missing');
assert(domain.includes('function oi_duplicate_content('),'teacher content duplicate helper missing');
assert(domain.includes("VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0)"),'duplicate must be created inactive');
assert(domain.includes("'ogretmen_icerik_kopyala'"),'duplicate audit event missing');

assert(js.includes("document.querySelectorAll('.teacher-content-form')"),'create/edit forms must be independently wired');
assert(js.includes("window.confirm('Bu içerik pasif bir kopya olarak oluşturulsun mu?"),'copy confirmation missing');
assert(css.includes('.teacher-content-action.edit'),'edit control styling missing');
assert(css.includes('.teacher-content-action.copy'),'copy control styling missing');

assert(workflow.includes('node tests/teacher-content-edit-copy-139.cjs'),'source regression must run in quality gate');
assert(workflow.includes('php tests/teacher-content-edit-copy-db-139.php'),'DB regression must run in quality gate');

assert(/^1\.2\.\d+$/.test(version.version),'release version must stay in 1.2.x line');
assert(Number(version.version.split('.')[2])>=14,'teacher content edit/copy requires 1.2.14 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.14.md',
  'tests/teacher-content-edit-copy-139.cjs',
  'tests/teacher-content-edit-copy-db-139.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: teacher content safe edit/copy source contract');
