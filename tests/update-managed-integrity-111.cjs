'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const anchor=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(updater.includes("['format'=>2,'updated_at'=>date(DATE_ATOM)]+$state"));
assert(updater.includes("'application_backup_sha256'"));
assert(updater.includes("'application_backup_bytes'"));
assert(updater.includes('function read_managed_update_hashes('));
assert(updater.includes("'format'=>2"));
assert(updater.includes("'hashes'=>$hashes"));
assert(updater.includes('function assert_stale_managed_files_safe('));
assert(updater.includes('güvenilir hash baseline yok'));
assert(updater.includes('kurulumdan sonra değiştirilmiş'));
const recoveryStageGate=updater.indexOf("$updateStage=($isLegacy097Recovery || $pendingMigrations!==[] || $legacyRepairNeeded || $studentSchemaMissing)");
assert(recoveryStageGate>=0);
assert(
  updater.indexOf('$stalePreflight=assert_stale_managed_files_safe(')
  < recoveryStageGate
);
assert(workflow.includes('tests/update-managed-integrity-111.php'));
assert(workflow.includes('tests/update-managed-integrity-111.cjs'));

{
  const parts=String(version.version).split('.').map(Number);
  assert((parts.length===3 && parts[0]===1 && parts[1]===1 && Number.isInteger(parts[2]) && parts[2]>=111) || /^1\.2\.\d+$/.test(String(version.version)),'version must be 1.1.111 or newer');
}
assert(Number.isInteger(version.release_revision) && version.release_revision>=1,'release revision must be positive');
assert.strictEqual(anchor.version,version.version);
assert.strictEqual(anchor.release_revision,version.release_revision);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(manifest.release_revision,version.release_revision);

console.log('1.1.111 managed integrity contract checks passed');
