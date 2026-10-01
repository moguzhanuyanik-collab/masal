'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('src/kurum_rol_sayfasi.php','utf8');
const management=fs.readFileSync('src/kurumlar_modulu.php','utf8');
const institution=fs.readFileSync('src/kurum_yonetimi.php','utf8');
const js=fs.readFileSync('kurum-rol-crud.js','utf8');
const css=fs.readFileSync('kurum-rol-crud.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(page.includes("require __DIR__.'/kurumlar_modulu.php';"),'shared role page must use central institution member domain');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),'institution member CRUD must require CSRF');
assert(page.includes("if($action==='create')"),'create action missing');
assert(page.includes("elseif($action==='update')"),'update action missing');
assert(page.includes("elseif($action==='delete')"),'safe remove action missing');
assert(page.includes("elseif($action==='restore')"),'restore action missing');
assert(page.includes('km_create_member('),'create must use central member function');
assert(page.includes('km_update_member('),'update must use central member function');
assert(page.includes('km_delete_member('),'delete must use central safe member function');
assert(page.includes('km_restore_member('),'restore must use central member function');
assert(page.includes("ky_role_members($pdo,$institutionId,$kyRole,true)"),'role page must expose inactive memberships');
assert(page.includes('data-member-dialog'),'member edit dialog missing');
assert(page.includes("name=\"sinif_seviyesi\" data-member-grade"),'student grade edit field missing');
assert(page.includes("name=\"telefon\" data-member-phone"),'teacher/parent phone edit field missing');
assert(page.includes('Kurumdan çıkar'),'safe removal control missing');
assert(page.includes('Yeniden aktifleştir'),'restore control missing');

assert(management.includes("function km_restore_member("),'central restore function missing');
assert(management.includes("UPDATE kurum_kullanicilari SET aktif=1"),'restore must reactivate membership');
assert(management.includes("UPDATE kullanicilar SET aktif=1"),'restore must reactivate account');
assert(management.includes("UPDATE {$table} SET aktif=1 WHERE kullanici_id=?"),'restore must reactivate role profile');
assert(management.includes("if(auth_runtime_column_exists($pdo,'ogrenciler','sinif_seviyesi'))"),'student update must support grade');
assert(management.includes("$studentGrade=$role==='ogrenci'?ky_student_grade"),'student grade validation missing');
assert(management.includes("ky_create_user($pdo,$actor,$role,$name,$email,$password,$institutionId,$studentGrade)"),'central student create must pass selected grade');

assert(institution.includes('bool $includeInactive=false'),'member listing must opt into inactive records safely');
assert(institution.includes('kk.aktif uyelik_aktif'),'membership state must be exposed');
assert(institution.includes('k.aktif kullanici_aktif'),'account state must be exposed');
assert(institution.includes('profil_aktif'),'profile state must be exposed');

assert(js.includes("window.confirm('Bu kullanıcı kurumdan çıkarılsın mı?"),'safe removal confirmation missing');
assert(js.includes('dialog.showModal()'),'edit modal open behavior missing');
assert(css.includes('.member-edit-dialog'),'CRUD dialog styling missing');

assert(workflow.includes('node tests/institution-member-crud-135.cjs'),'source CRUD regression must run in quality gate');
assert(workflow.includes('php tests/institution-member-crud-db-135.php'),'DB CRUD regression must run in quality gate');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in the 1.2.x line');
assert(Number(version.version.split('.')[2])>=10,'institution member CRUD requires 1.2.10 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.10.md',
  'kurum-rol-crud.js',
  'kurum-rol-crud.css',
  'tests/institution-member-crud-135.cjs',
  'tests/institution-member-crud-db-135.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: institution role member CRUD source contract');
