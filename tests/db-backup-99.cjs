'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const updatePage=fs.readFileSync('guncelleme.php','utf8');
const config=fs.readFileSync('config/app.php','utf8');
const status=fs.readFileSync('sistem-durum.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));

for(const fn of [
  'normalize_db_backup_config',
  'find_mysqldump_binary',
  'create_database_backup',
  'legacy_membership_repair_needed',
  'pending_migration_names',
  'database_update_requires_backup'
]){
  assert(updater.includes('function '+fn+'('),fn+' missing');
}

assert(!updater.includes("'MYSQL_PWD'"));
assert(updater.includes('function create_mysql_defaults_file'));
assert(updater.includes("'--defaults-extra-file='"));
assert(updater.includes("'--single-transaction'"));
assert(updater.includes("'--quick'"));
assert(updater.includes("'--triggers'"));
assert(updater.includes("'--hex-blob'"));
assert(updater.includes("'--skip-lock-tables'"));
assert(!updater.includes("'--password="));
assert(updater.includes('Migration öncesi veritabanı yedeği doğrulanamadı'));
assert(updater.includes("function database_update_plan(PDO $pdo,string $root,string $localVersion='0.0.0'): array"));
assert(updater.includes("'requires_backup'=>$studentSchemaMissing || $legacyRepair || $pending!==[]"));
assert(updater.includes('function create_database_backup('));
assert(updater.includes('$databasePlan=database_update_plan($pdo,$sourceRoot,$localVersion);'));
assert(updater.includes('$requiresDbBackup=$isLegacy097Recovery'));
assert(updater.includes('$pendingMigrations=(array)($databasePlan[\'pending_migrations\']??[]);'));
assert(updater.includes("$updateStage=$databaseWorkRequired?'database_recovery_preflight':'database_recovery_skip'"));
assert(updater.includes("'database_backup'=>$dbBackupName"));

assert(!updater.includes("masal@gmail.com"));
assert(!updater.includes("test@ilkadim.local"));
assert(!updater.includes("password_hash('12345678'"));
assert(updater.includes('Şema onarımı kullanıcı kimliği, e-posta veya parola üretmez/değiştirmez.'));

assert(config.includes("'mysqldump_path' => ''"));
assert(updatePage.includes("$dbCfg = app_config('db');"));
assert(updatePage.includes("is_array($dbCfg)?$dbCfg:[]"));
assert(updatePage.includes("'database_backup' => (string)($result['database_backup'] ?? '')"));
assert(status.includes('Migration DB yedeği'));
assert(status.includes('find_mysqldump_binary($updateConfig)'));

assert(workflow.includes('tests/db-backup-99.php'));
assert(/^1\.1\.(?:99|[1-9][0-9]{2,})$/.test(String(version.version)) || /^1\.2\.\d+$/.test(String(version.version)),'version must be 1.1.99 or newer');

console.log('1.1.99 DB backup and legacy account safety checks passed');
