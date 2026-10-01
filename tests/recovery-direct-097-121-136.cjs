'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

const anchor='6a0f372871e6dbd2b71d2efef121fbf2dfb2f82c';

assert(updater.includes("const ILKADIM_LEGACY_097_RECOVERY_121_COMMIT='"+anchor+"';"));
assert(updater.includes("const ILKADIM_LEGACY_097_RECOVERY_121_SOURCE_TREE='9665e2754d02db81f8ca07a97b95506397103e1e';"));
assert(updater.includes("const ILKADIM_LEGACY_097_RECOVERY_121_RELEASE_REVISION=15;"));
assert(updater.includes('function github_commit_tree_sha'));
assert(updater.includes('function legacy_097_direct_121_recovery_release'));
assert(updater.includes("if($localVersion==='1.1.97'){"));
assert(updater.includes('return legacy_097_direct_121_recovery_release($gh);'));
assert(updater.includes("versionInfo['version']??''"));
assert(updater.includes("releaseInfo['version']??''"));
assert(updater.includes("legacy_097_to_121_direct"));
assert(updater.indexOf("if($localVersion==='1.1.97'){") < updater.indexOf("$historyFile=version_compare"),
  '1.1.97 direct recovery must run before historical chain scanning.');
assert(workflow.includes('node tests/recovery-direct-097-121-136.cjs'));

const parts=String(version.version).split('.').map(Number);
const atLeast129=parts[0]>1 || (parts[0]===1 && (parts[1]>2 || (parts[1]===2 && parts[2]>=9)));
assert(atLeast129,'Direct recovery release must remain 1.2.9 or newer.');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number.isInteger(version.release_revision) && version.release_revision>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);
assert(manifest.files.includes('RELEASE-'+version.version+'.md'));
assert(manifest.files.includes('tests/recovery-direct-097-121-136.cjs'));

console.log('PASS: direct 1.1.97 -> immutable 1.2.1 recovery contract');
