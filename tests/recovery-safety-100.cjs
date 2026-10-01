'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const updatePage=fs.readFileSync('guncelleme.php','utf8');
const status=fs.readFileSync('sistem-durum.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));

for(const fn of [
  'project_backup_source_bytes',
  'assert_backup_disk_space',
  'validate_project_backup',
  'mysql_option_quote',
  'create_mysql_defaults_file',
  'database_size_bytes',
  'backup_artifact_metadata',
  'write_recovery_manifest'
]){
  assert(updater.includes('function '+fn+'('),fn+' missing');
}

assert(!updater.includes("'MYSQL_PWD'"));
assert(updater.includes("'--defaults-extra-file='"));
assert(updater.includes("str_starts_with($rel,'.git/')"));
assert(updater.includes("['config/local.php','.env','.git/config']"));
assert(
  updater.includes("'status'=>'ready_before_mutation'")
  || updater.includes("$recoveryState['status']='ready_before_mutation'")
);
assert(updater.includes("'manual_restore_only'=>true"));
assert(updater.includes("'update_failed_during_file_activation'"));
assert(updater.includes("'update_failed_after_database_mutation'"));
assert(updater.includes("'update_completed'"));
assert(updater.includes("'recovery_manifest'=>$recoveryManifestName"));

assert(updatePage.includes("'recovery_manifest' => (string)($result['recovery_manifest'] ?? '')"));
assert(updatePage.includes("backupParts.push('Recovery: ' + data.recovery_manifest)"));
assert(status.includes('Recovery manifest'));
assert(status.includes("storage/backups/recovery.json"));

assert(workflow.includes('tests/recovery-safety-100.php'));
assert(workflow.includes('tests/recovery-safety-100.cjs'));
assert(/^1\.1\.(?:100|10[1-9]|1[1-9][0-9]|[2-9][0-9]{2,})$/.test(String(version.version)) || String(version.version)==='1.2.1','version must be 1.1.100 or newer');

console.log('1.1.100 recovery safety checks passed');
