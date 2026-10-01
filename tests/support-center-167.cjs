'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/destek.php','utf8');
const page=fs.readFileSync('destek.php','utf8');
const migration=fs.readFileSync('database/migrations/076_destek_talep_merkezi.sql','utf8');
const manager=fs.readFileSync('yonetici-paneli.php','utf8');
const teacher=fs.readFileSync('ogretmen-paneli.php','utf8');
const parent=fs.readFileSync('veli-paneli.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('function ds_create_ticket('),'support ticket creation missing');
assert(domain.includes('function ds_user_reply('),'requester reply flow missing');
assert(domain.includes('function ds_admin_reply('),'Super Admin reply flow missing');
assert(domain.includes('function ds_admin_set_status('),'support status management missing');
assert(domain.includes('function ds_admin_summary('),'support operations summary missing');
assert(domain.includes("if(!auth_user_in_institution($pdo,(int)$user['id'],$institutionId,$role))") ||
       domain.includes("!auth_user_in_institution($pdo,(int)$user['id'],$institutionId,$role)"),
       'ticket creation must enforce institution membership');
assert(domain.includes('AND t.acani_kullanici_id=?'),'non-admin ticket detail must be owner scoped');
assert(domain.includes("if((string)$ticket['durum']==='kapali')"),'closed ticket reply guard missing');
assert(domain.includes("SET durum='acik',cozum_tarihi=NULL,kapanis_tarihi=NULL"),'requester reply must reopen resolved ticket');
assert(domain.includes("SET durum='kullanici_bekleniyor'"),'admin reply waiting-user transition missing');
assert(domain.includes("WHEN ?='kapali' THEN COALESCE(cozum_tarihi,NOW())"),'closure must preserve resolution chronology');
assert(!domain.includes('DELETE FROM destek_talepleri'),'support tickets must never be physically deleted');
assert(!domain.includes('DELETE FROM destek_talep_mesajlari'),'support messages must never be physically deleted');

assert(page.includes("require_login()"),'support center must require authentication');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),'support writes must require CSRF');
assert(page.includes('Destek Talebi Aç'),'requester create UI missing');
assert(page.includes('Destek Operasyon Merkezi'),'Super Admin operations UI missing');
assert(page.includes('Destek Yanıtı'),'Super Admin reply UI missing');
assert(page.includes('Talep Durumu'),'Super Admin status UI missing');
assert(page.includes('Dosya yükleme özellikle eklenmedi'),'text-only support safety note missing');

assert(manager.includes('href="destek.php"'),'manager support access missing');
assert(teacher.includes('href="destek.php"'),'teacher support access missing');
assert(parent.includes('href="destek.php"'),'parent support access missing');
assert(admin.includes('href="destek.php"'),'Super Admin support navigation missing');

assert(migration.includes('CREATE TABLE IF NOT EXISTS destek_talepleri'),'support ticket table migration missing');
assert(migration.includes('CREATE TABLE IF NOT EXISTS destek_talep_mesajlari'),'support message table migration missing');
assert(migration.includes('KEY ix_destek_kuyruk'),'support queue index missing');
assert(migration.includes('KEY ix_destek_mesaj_talep'),'support conversation index missing');

assert(workflow.includes('node tests/support-center-167.cjs'),'support source regression missing from quality gate');
assert(workflow.includes('php tests/support-center-db-167.php'),'support DB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=42,'support center requires 1.2.42 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.42.md',
  'database/migrations/076_destek_talep_merkezi.sql',
  'destek.css',
  'destek.php',
  'src/destek.php',
  'tests/support-center-167.cjs',
  'tests/support-center-db-167.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: support center tenant scope, immutable conversation history and status workflow source contract');
