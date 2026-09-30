const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const page=fs.readFileSync('guncelleme.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(updater.includes('ILKADIM_UPDATER_CORE_GENERATION = 118'),'core generation missing');
assert(updater.includes('preserve_newer_live_updater_in_staging'),'newer updater preservation missing');
assert(updater.includes('update-bridge-1.1.99-recovery.json'),'1.1.99 recovery bridge contract missing');
assert(updater.includes('bridge_recovery'),'bridge target flag missing');
assert(page.includes('Sıradaki sürüm'),'sequential version label missing');
assert(page.includes('Hedef commit'),'target commit label missing');
assert(workflow.includes('php tests/update-core-generation-118.php'),'PHP 118 regression not in CI');
assert(workflow.includes('node tests/update-core-generation-118.cjs'),'Node 118 regression not in CI');
assert.strictEqual(version.version,'1.1.118');
assert.strictEqual(release.version,'1.1.118');
assert.strictEqual(manifest.version,'1.1.118');
assert.strictEqual(version.release_revision,1);
assert.strictEqual(release.release_revision,1);
assert.strictEqual(manifest.release_revision,1);
assert(manifest.files.includes('RELEASE-1.1.118.md'));
assert(manifest.files.includes('tests/update-core-generation-118.php'));
assert(manifest.files.includes('tests/update-core-generation-118.cjs'));

console.log('PASS: 1.1.118 updater bootstrap recovery contract');
