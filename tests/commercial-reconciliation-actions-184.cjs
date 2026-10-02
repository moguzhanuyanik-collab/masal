'use strict';

const fs=require('fs');
const assert=require('assert');

const base=fs.readFileSync('src/ticari_mutabakat.php','utf8');
const domain=fs.readFileSync('src/ticari_mutabakat_aksiyon.php','utf8');
const page=fs.readFileSync('ticari-mutabakat-aksiyon.php','utf8');
const readOnlyPage=fs.readFileSync('ticari-mutabakat.php','utf8');
const dashboard=fs.readFileSync('ticari-dashboard.php','utf8');
const documents=fs.readFileSync('ticari-belgeler.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const migration=fs.readFileSync('database/migrations/086_ticari_mutabakat_aksiyon_merkezi.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(base.includes('function tm_contract_rows(PDO $pdo,array $filters=[],int $limit=500,int $offset=0)'),
  'reconciliation contract reader must support safe pagination');
assert(base.includes("$contractId=max(0,(int)($filters['sozlesme_id']??0));"),
  'targeted contract reconciliation filter missing');
assert(base.includes('LIMIT {$limit} OFFSET {$offset}'),
  'reconciliation pagination SQL missing');

assert(domain.includes('function ma_tables_ready('),'action readiness helper missing');
assert(domain.includes('function ma_issue_key('),'stable reconciliation case key missing');
assert(domain.includes('function ma_contract_issues('),'contract issue scanner missing');
assert(domain.includes('function ma_integrity_issues('),'identity anomaly scanner missing');
assert(domain.includes('function ma_case_source_still_open('),'source revalidation helper missing');
assert(domain.includes('function ma_sync_cases('),'reconciliation case sync missing');
assert(domain.includes('function ma_queue_rows('),'reconciliation action queue missing');
assert(domain.includes('function ma_summary('),'reconciliation case summary missing');
assert(domain.includes('function ma_set_stage('),'reconciliation case stage flow missing');
assert(domain.includes('function ma_add_note('),'reconciliation follow-up note flow missing');

assert(domain.includes("hash('sha256','sozlesme_mutabakat|'"),
  'contract reconciliation case key must stay stable across classification changes');
assert(domain.includes("'vaka_yeniden_acildi'"),
  'resolved issue recurrence must reopen same case');
assert(domain.includes("'kaynak_cozuldu'"),
  'source-resolved auto-close history missing');
assert(domain.includes("'sinif_degisti'"),
  'operation/integrity classification change history missing');
assert(domain.includes("WHERE durum IN ('acik','incelemede','beklemede')"),
  'open reconciliation case lifecycle missing');
assert(!domain.includes('function ma_manual_close('),
  'manual reconciliation close bypass must not exist');
assert(!domain.includes('DELETE FROM ticari_mutabakat_vakalari'),
  'reconciliation cases must not be physically deleted');
assert(!domain.includes('DELETE FROM ticari_mutabakat_vaka_gecmisi'),
  'reconciliation case history must not be physically deleted');

for(const sourceTable of [
  'UPDATE kurum_sozlesmeleri',
  'UPDATE kurum_tahsilatlari',
  'UPDATE ticari_belgeler',
  'UPDATE ticari_belge_tahsilat_eslemeleri',
  'INSERT INTO kurum_sozlesmeleri',
  'INSERT INTO kurum_tahsilatlari',
  'INSERT INTO ticari_belgeler',
  'INSERT INTO ticari_belge_tahsilat_eslemeleri'
]) assert(!domain.includes(sourceTable),'action sync must not mutate financial source: '+sourceTable);

assert(page.includes("require_role('super_admin')"),'reconciliation action center must be Super Admin only');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),'reconciliation action writes must require CSRF');
assert(page.includes('name="action" value="sync"'),'explicit case sync action missing');
assert(page.includes('Mutabakat Vakalarını Senkronize Et'),'case sync button missing');
assert(page.includes('Dış Aksiyon Bekleniyor'),'external-action waiting stage missing');
assert(page.includes('Son kaynak teşhisi'),'source diagnosis display missing');
assert(page.includes('Manuel “kapat” işlemi yoktur.'),
  'UI must explain source-driven close policy');
assert(!page.includes('name="action" value="close"'),
  'manual close POST action must not exist');
assert(page.indexOf("ma_sync_cases($pdo,$user);") > page.indexOf("if($_SERVER['REQUEST_METHOD']==='POST')"),
  'case synchronization must only occur inside POST flow');

assert(readOnlyPage.includes('href="ticari-mutabakat-aksiyon.php"'),
  'read-only reconciliation center must link to action center');
assert(dashboard.includes('href="ticari-mutabakat-aksiyon.php"'),
  'commercial dashboard must link to reconciliation action center');
assert(documents.includes('href="ticari-mutabakat-aksiyon.php"'),
  'commercial documents must link to reconciliation action center');
assert(!admin.includes('Mutabakat Aksiyon Merkezi'),'legacy commercial navigation must stay hidden from the education-focused Super Admin');

assert(migration.includes('CREATE TABLE IF NOT EXISTS ticari_mutabakat_vakalari'),
  'reconciliation action case table missing');
assert(migration.includes('UNIQUE KEY uk_mutabakat_vaka_anahtar (anahtar)'),
  'stable case-key DB invariant missing');
assert(migration.includes('CREATE TABLE IF NOT EXISTS ticari_mutabakat_vaka_gecmisi'),
  'append-only reconciliation history table missing');
assert(!migration.includes('ALTER TABLE kurum_sozlesmeleri'),
  'action release must not mutate contract schema');
assert(!migration.includes('ALTER TABLE ticari_belgeler'),
  'action release must not mutate document schema');

assert(workflow.includes('node tests/commercial-reconciliation-actions-184.cjs'),
  'reconciliation action source regression missing from quality gate');
assert(workflow.includes('php tests/commercial-reconciliation-actions-db-184.php'),
  'reconciliation action MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=59,'reconciliation actions require 1.2.59 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.59.md',
  'database/migrations/086_ticari_mutabakat_aksiyon_merkezi.sql',
  'src/ticari_mutabakat_aksiyon.php',
  'ticari-mutabakat-aksiyon.php',
  'ticari-mutabakat-aksiyon.css',
  'tests/commercial-reconciliation-actions-184.cjs',
  'tests/commercial-reconciliation-actions-db-184.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: source-driven reconciliation cases, stable identity, auto-close/reopen and append-only action history contract');
