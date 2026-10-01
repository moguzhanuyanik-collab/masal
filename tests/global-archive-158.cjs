'use strict';

const fs=require('fs');
const assert=require('assert');

const hub=fs.readFileSync('global.php','utf8');
const students=fs.readFileSync('global-ogrenciler.php','utf8');
const parents=fs.readFileSync('global-veliler.php','utf8');
const archive=fs.readFileSync('global-arsiv.php','utf8');
const domain=fs.readFileSync('src/kurum_yonetimi.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(hub.includes('href="global-arsiv.php"'),'global hub must link archive');
assert(hub.includes('<strong>Global Arşiv</strong>'),'global archive hub label missing');
assert(students.includes('href="global-arsiv.php?rol=ogrenci"'),'student list must link student archive');
assert(parents.includes('href="global-arsiv.php?rol=veli"'),'parent list must link parent archive');

assert(archive.includes("require_role('super_admin')"),'global archive must be super-admin only');
assert(archive.includes("verify_csrf($_POST['csrf']??null)"),'restore action must enforce CSRF');
assert(archive.includes("ky_restore_global_user($pdo,$user,$restoreRole,$userId)"),'archive must use restore domain');
assert(archive.includes("ky_global_archived_users($pdo,$role)"),'archive list must use domain query');
assert(archive.includes('name="rol"'),'archive role filter missing');
assert(archive.includes('name="kullanici_id"'),'restore user id missing');
assert(archive.includes('value="restore"'),'restore action marker missing');
assert(archive.includes('Aktifleştir'),'restore CTA missing');
assert(archive.includes('Hesap bir kuruma aktif olarak bağlanmışsa'),'institution-bound safety note missing');
assert(!archive.includes('#sa-archive'),'archive page must not reference undefined icon');
assert(archive.includes('#sa-database'),'archive page must reuse existing icon');
assert(archive.includes('super-admin-pages.css?v=1.0.72'),'archive page must reuse existing admin stylesheet');

assert(domain.includes('function ky_global_archived_users('),'archived global list helper missing');
assert(domain.includes("if(!in_array($role,['tum','ogrenci','veli'],true))"),'archive role filter must be allow-listed');
assert(domain.includes("(k.aktif=0 OR o.aktif=0)"),'student archive must include partially inactive accounts');
assert(domain.includes("(k.aktif=0 OR v.aktif=0)"),'parent archive must include partially inactive accounts');
assert(domain.includes("WHERE kk.kullanici_id=k.id AND kk.aktif=1"),'archive must exclude active institution membership');
assert(domain.includes('function ky_restore_global_user('),'global restore helper missing');
assert(domain.includes("if(!auth_user_has_role($actor,'super_admin'))"),'restore must be super-admin only');
assert(domain.includes("UPDATE kullanicilar SET aktif=1 WHERE id=?"),'restore must reactivate account');
assert(domain.includes("UPDATE ogrenciler SET aktif=1 WHERE id=?"),'student restore must reactivate profile');
assert(domain.includes("UPDATE veliler SET aktif=1 WHERE id=?"),'parent restore must reactivate profile');
assert(domain.includes("'global_kullanici_aktif'"),'restore audit event missing');
assert(domain.includes('$pdo->beginTransaction()'),'restore must be transactional');
assert(domain.includes('$pdo->rollBack()'),'restore rollback missing');

assert(workflow.includes('node tests/global-archive-158.cjs'),'global archive source regression must run');
assert(workflow.includes('php tests/global-archive-db-158.php'),'global archive DB regression must run');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in 1.2.x line');
assert(Number(version.version.split('.')[2])>=33,'global archive requires 1.2.33 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.33.md',
  'global-arsiv.php',
  'tests/global-archive-158.cjs',
  'tests/global-archive-db-158.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: global archived account restore source contract');
