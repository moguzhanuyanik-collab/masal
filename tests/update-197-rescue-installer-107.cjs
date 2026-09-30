'use strict';

const fs=require('fs');
const assert=require('assert');

const installer=fs.readFileSync('tools/apply-updater-1.1.97-rescue.php','utf8');
const rollback=fs.readFileSync('tools/rollback-updater-1.1.97-rescue.php','utf8');
const rescue=fs.readFileSync('tools/updater-1.1.97-rescue.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const anchor=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(installer.includes("Kurtarma yalnız 1.1.96 kurulumunda çalışır."));
assert(installer.includes("updater-before-1.1.97-rescue-"));
assert(installer.includes("rename($tmp,$target)"));
assert(installer.includes("hash_equals($sourceHash,$finalHash)"));
assert(installer.includes("PHP_SAPI!=='cli'"));
assert(rollback.includes("storage/backups"));
assert(rescue.includes("is_1_1_97_rescue_transition"));
assert(workflow.includes('tests/update-197-rescue-installer-107.php'));
assert(workflow.includes('tests/update-197-rescue-installer-107.cjs'));

assert.strictEqual(version.version,'1.1.107');
assert.strictEqual(version.release_revision,1);
assert.strictEqual(anchor.version,version.version);
assert.strictEqual(anchor.release_revision,version.release_revision);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(manifest.release_revision,version.release_revision);

console.log('1.1.107 rescue installer contract checks passed');
