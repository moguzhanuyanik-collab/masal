'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const anchor=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(updater.includes('$activated=false;'));
assert(updater.includes('atomic_replace_update_file($backupPath,$target,$relative);'));
assert(updater.includes('Updater çekirdeği rollback bütünlük doğrulamasından geçemedi.'));
assert(updater.includes('[IlkAdim][updater-core-handoff-recovery]'));
assert(updater.includes('[IlkAdim][updater-core-handoff-history]'));
assert(workflow.includes('tests/update-core-handoff-rollback-109.php'));
assert(workflow.includes('tests/update-core-handoff-rollback-109.cjs'));
assert(workflow.includes('tests/update-release-head-anchor-109.cjs'));

assert(/^1\.1\.(?:109|1[1-9][0-9]|[2-9][0-9]{2,})$/.test(String(version.version)) || String(version.version)==='1.2.1','version must be 1.1.109 or newer');
assert(Number.isInteger(version.release_revision) && version.release_revision>=1,'release revision must be positive');
assert.strictEqual(anchor.version,version.version);
assert.strictEqual(anchor.release_revision,version.release_revision);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(manifest.release_revision,version.release_revision);

console.log('1.1.109 updater handoff rollback contract checks passed');
