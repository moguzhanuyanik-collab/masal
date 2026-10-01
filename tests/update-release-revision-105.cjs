'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const updatePage=fs.readFileSync('guncelleme.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const anchor=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(updater.includes('function normalize_release_revision('));
assert(updater.includes('function read_local_release_revision('));
assert(updater.includes('function release_identity_is_newer('));
assert(updater.includes('function release_identity_should_replace_next('));
assert(updater.includes("'release_revision'=>normalize_release_revision"));
assert(updater.includes('release revision metadata değerleri birbiriyle eşleşmiyor'));
assert(updater.includes('write_managed_update_manifest($root,$newManagedFiles'));
assert(updatePage.includes("'local_revision'"));
assert(updatePage.includes("'remote_revision'"));
assert(updatePage.includes('release_identity_is_newer('));
assert(updatePage.includes("' · rev '"));
assert(workflow.includes('tests/update-release-revision-105.php'));
assert(workflow.includes('tests/update-release-revision-105.cjs'));

assert(/^1\.1\.(?:10[5-9]|1[1-9][0-9]|[2-9][0-9]{2,})$/.test(String(version.version)) || /^1\.2\.\d+$/.test(String(version.version)),'version must be 1.1.105 or newer');
assert(Number.isInteger(version.release_revision) && version.release_revision>=1,'release revision must be positive');
assert.strictEqual(anchor.version,version.version);
assert.strictEqual(anchor.release_revision,version.release_revision);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(manifest.release_revision,version.release_revision);

console.log('1.1.105 release revision contract checks passed');
