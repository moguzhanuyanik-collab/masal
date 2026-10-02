'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_mutabakat_eskalasyon.php','utf8');
const page=fs.readFileSync('ticari-mutabakat-eskalasyon.php','utf8');
const migration=fs.readFileSync('database/migrations/088_mutabakat_operasyon_eskalasyonlari.sql','utf8');
const health=fs.readFileSync('ticari-mutabakat-saglik.php','utf8');
const reminder=fs.readFileSync('ticari-mutabakat-hatirlatma.php','utf8');
const transfer=fs.readFileSync('ticari-mutabakat-devir.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('function me_tables_ready('),'escalation readiness helper missing');
assert(domain.includes('function me_milestone('),'escalation milestone resolver missing');
assert(domain.includes('function me_cycle_key('),'cycle dedup key missing');
assert(domain.includes('function me_case_health('),'fresh case health revalidation missing');
assert(domain.includes('function me_candidate_rows('),'escalation candidate queue missing');
assert(domain.includes('function me_sync('),'escalation sync missing');
assert(domain.includes('function me_summary('),'escalation summary missing');
assert(domain.includes('function me_history_rows('),'escalation history list missing');

assert(domain.includes("'ilk_mudahale_2'"),'2+ day first-intervention threshold missing');
assert(domain.includes("'dongu_4'"),'4+ day escalation threshold missing');
assert(domain.includes("'dongu_8'"),'8+ day escalation threshold missing');
assert(domain.includes("'dongu_14'"),'14+ day escalation threshold missing');
assert(domain.includes("'dongu_30'"),'30+ day escalation threshold missing');
assert(domain.includes("hash('sha256',$caseId.'|'"),
  'reopen-cycle stable SHA-256 dedup key missing');

assert(domain.includes("SELECT *") && domain.includes("LIMIT 1 FOR UPDATE"),
  'case row must be locked before escalation delivery');
assert(domain.includes('ma_case_source_still_open('),
  'source issue must be revalidated before escalation');
assert(domain.includes("INSERT IGNORE INTO ticari_mutabakat_eskalasyonlari"),
  'concurrent escalation dedup guard missing');
assert(domain.includes("'mutabakat_operasyon_eskalasyon'"),
  'central notification source type missing');
assert(domain.includes("'super_admin'"),
  'escalation recipient role missing');
assert(domain.includes("'bildirim','eskalasyon_'.$code"),
  'append-only escalation audit event missing');
assert(!domain.includes('DELETE FROM ticari_mutabakat_eskalasyonlari'),
  'escalation history must not be physically deleted');

assert(page.includes("require_role('super_admin')"),'escalation center must be Super Admin only');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),'escalation sync must require CSRF');
assert(page.includes('Eskalasyonları Senkronize Et'),'explicit escalation sync action missing');
assert(page.includes('sözleşmesel veya harici bir SLA tanımlamaz'),
  'internal-policy boundary disclosure missing');
assert(page.includes('2+ gün ilk müdahale yok'),'first-intervention threshold UI missing');
assert(page.includes('4+ gün açık'),'4+ threshold UI missing');
assert(page.includes('8+ gün açık'),'8+ threshold UI missing');
assert(page.includes('14+ gün açık'),'14+ threshold UI missing');
assert(page.includes('30+ gün açık'),'30+ threshold UI missing');
assert(page.includes('ticari-mutabakat-devir.php'),
  'invalid-owner escalation must route to recovery center');
assert(!page.includes("me_sync($pdo,$user);\n$"),
  'GET page load must not silently send escalations');

assert(migration.includes('CREATE TABLE IF NOT EXISTS ticari_mutabakat_eskalasyonlari'),
  'escalation history table missing');
assert(migration.includes('dongu_anahtari CHAR(64) NOT NULL'),
  'cycle-key persistence missing');
assert(migration.includes('UNIQUE KEY uk_mutabakat_eskalasyon (vaka_id,dongu_anahtari,esik_kodu,alici_kullanici_id)'),
  'cycle+threshold+recipient dedup invariant missing');
assert(!migration.includes('ALTER TABLE ticari_mutabakat_vakalari'),
  'escalation release must not mutate core case schema');

for(const text of [health,reminder,transfer]){
  assert(text.includes('href="ticari-mutabakat-eskalasyon.php"'),
    'mutabakat operation page missing escalation navigation');
}
assert(!admin.includes('Mutabakat Operasyon Eskalasyonu'),'legacy commercial navigation must stay hidden from the education-focused Super Admin');

assert(workflow.includes('node tests/reconciliation-escalation-190.cjs'),
  'escalation source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-escalation-db-190.php'),
  'escalation MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=65,'reconciliation escalation requires 1.2.65 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.65.md',
  'database/migrations/088_mutabakat_operasyon_eskalasyonlari.sql',
  'src/ticari_mutabakat_eskalasyon.php',
  'ticari-mutabakat-eskalasyon.php',
  'ticari-mutabakat-eskalasyon.css',
  'tests/reconciliation-escalation-190.cjs',
  'tests/reconciliation-escalation-db-190.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: reconciliation operational escalation thresholds, cycle dedup, source revalidation and recovery routing source contract');
