'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const status=fs.readFileSync('sistem-durum.php','utf8');
const updatePage=fs.readFileSync('guncelleme.php','utf8');
const config=fs.readFileSync('config/app.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const anchor=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(updater.includes('function update_package_limits('));
assert(updater.includes('function remote_update_metadata_at_ref('));
assert(updater.includes('function remote_release_info_at_ref('));
assert(updater.includes('function release_identity_is_newer('));
assert(updater.includes('function remote_release_info_at_ref('));
assert(updater.includes('int $maxBytes=0'));
assert(updater.includes('$downloadTooLarge=true'));
assert(updater.includes("'max_download_bytes'"));
assert(updater.includes("'max_entries'"));
assert(updater.includes("'max_uncompressed_bytes'"));
assert(updater.includes("'max_file_bytes'"));
assert(updater.includes("'max_compression_ratio'"));
assert(updater.includes("'update-release.json',"));
assert(updater.includes("'update-managed-files.json',"));
assert(updater.includes('Güncelleme paketi sürüm metadata dosyaları birbiriyle eşleşmiyor.'));
assert(updater.includes("'status'=>'preparing'"));
assert(updater.includes("'status']='application_backup_ready'"));
assert(updater.includes("'failure_stage']=$updateStage"));
assert(updater.includes('function create_database_backup('));
assert(updater.includes('$databasePlan=database_update_plan($pdo,$sourceRoot,$localVersion);'));
assert(updater.includes('$requiresDbBackup=$isLegacy097Recovery'));
assert(updater.includes("$updateStage=$databaseWorkRequired?'database_recovery_preflight':'database_recovery_skip'"));
assert(updater.includes("assert_backup_disk_space(dirname($extractDir)"));
assert(status.includes('$recoveryHealthy=$recoveryStatus===\'update_completed\';'));
assert(status.includes('İnceleme gerekli'));
assert(status.includes('Paket güvenlik sınırları'));
assert(updatePage.includes("'Güncelleme ZIP paketi'"));
for(const key of [
  'max_package_download_bytes',
  'max_package_entries',
  'max_package_uncompressed_bytes',
  'max_package_file_bytes',
  'max_package_compression_ratio'
]) assert(config.includes("'"+key+"'"),key+' missing');
assert(workflow.includes('tests/update-safety-102.php'));
assert(workflow.includes('tests/update-safety-102.cjs'));
assert(/^1\.1\.(?:10[2-9]|1[1-9][0-9]|[2-9][0-9]{2,})$/.test(String(version.version)) || /^1\.2\.\d+$/.test(String(version.version)),'version must be 1.1.102 or newer');
assert.strictEqual(anchor.version,version.version);
assert.strictEqual(manifest.version,version.version);

console.log('1.1.102 update package and recovery lifecycle checks passed');
