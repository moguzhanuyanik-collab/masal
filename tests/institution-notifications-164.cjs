'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/bildirimler.php','utf8');
const page=fs.readFileSync('bildirimler.php','utf8');
const teacherContent=fs.readFileSync('src/ogretmen_icerik.php','utf8');
const manager=fs.readFileSync('yonetici-paneli.php','utf8');
const teacher=fs.readFileSync('ogretmen-paneli.php','utf8');
const parent=fs.readFileSync('veli-paneli.php','utf8');
const student=fs.readFileSync('index.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const migration=fs.readFileSync('database/migrations/074_merkezi_bildirim_ve_duyurular.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('function bd_create_manual('),'manual institution announcement creation missing');
assert(domain.includes('function bd_notify_teacher_content('),'teacher content system notification hook missing');
assert(domain.includes('function bd_unread_count('),'unread count helper missing');
assert(domain.includes('function bd_mark_read('),'per-user read tracking missing');
assert(domain.includes('function bd_mark_all_read('),'mark-all-read helper missing');
assert(domain.includes('function bd_archive_manual('),'manual announcement archive missing');
assert(domain.includes('auth_manageable_institution_ids($pdo,$actor)'),'sender scope must use manageable institution ids');
assert(domain.includes("INNER JOIN kullanicilar u ON u.id=kk.kullanici_id AND u.aktif=1"),'manual recipient snapshot must include only active users');
assert(domain.includes("vo.kurum_id=?"),'homework parent notification must remain tenant scoped');
assert(domain.includes("'ogretmen_icerik',$contentId"),'automatic teacher content source dedupe key missing');
assert(domain.includes("tur='duyuru'"),'system notifications must not be archived as manual announcements');

assert(page.includes("require_login()"),'notification center must require authentication');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),'notification writes must require CSRF');
assert(page.includes('GELEN KUTUSU'),'notification inbox UI missing');
assert(page.includes('GÖNDERİM TAKİBİ'),'manager send/read tracking UI missing');
assert(page.includes('hedef_roller[]'),'manual target role controls missing');
assert(page.includes('Tümünü okundu yap'),'mark-all-read UI missing');

assert(teacherContent.includes("require_once __DIR__.'/bildirimler.php';"),'teacher content domain must load notification helper');
assert(teacherContent.includes('bd_notify_teacher_content('),'successful teacher publication must create a system notification');
assert(teacherContent.indexOf('$pdo->commit();') < teacherContent.indexOf('bd_notify_teacher_content('),
  'teacher content notification must run only after content commit');

assert(manager.includes('href="bildirimler.php"'),'manager notification entry missing');
assert(teacher.includes('href="bildirimler.php"'),'teacher notification entry missing');
assert(parent.includes('href="bildirimler.php"'),'parent notification entry missing');
assert(student.includes('class="bildirim-shortcut"'),'student notification shortcut missing');
assert(student.includes('bildirimler-shortcut.css'),'student notification shortcut styles missing');
assert(admin.includes('href="bildirimler.php"'),'Super Admin notification navigation missing');

assert(migration.includes('CREATE TABLE IF NOT EXISTS kurum_duyurulari'),'announcement table migration missing');
assert(migration.includes('CREATE TABLE IF NOT EXISTS kurum_duyuru_alicilari'),'recipient snapshot table migration missing');
assert(migration.includes('PRIMARY KEY(duyuru_id,kullanici_id)'),'one recipient snapshot per announcement/user required');
assert(migration.includes('UNIQUE KEY uk_duyuru_kaynak'),'system notification source dedupe invariant missing');
assert(migration.includes('okundu_tarihi DATETIME NULL'),'read tracking column missing');

assert(workflow.includes('node tests/institution-notifications-164.cjs'),'notification source test missing from quality gate');
assert(workflow.includes('php tests/institution-notifications-db-164.php'),'notification DB test missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in the 1.2.x line');
assert(Number(version.version.split('.')[2])>=39,'notification center requires 1.2.39 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.39.md',
  'bildirimler-shortcut.css',
  'bildirimler.css',
  'bildirimler.php',
  'database/migrations/074_merkezi_bildirim_ve_duyurular.sql',
  'src/bildirimler.php',
  'tests/institution-notifications-164.cjs',
  'tests/institution-notifications-db-164.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: institution announcements, recipient snapshots, read tracking and teacher-content notifications');
