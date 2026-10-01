const fs=require('fs');
const assert=require('assert');

const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const updater=fs.readFileSync('src/updater.php','utf8');

assert(/^1\.2\.(?:[6-9]|[1-9]\d+)$/.test(version.version),'version must be 1.2.1 or newer');
assert(Number.isInteger(version.release_revision) && version.release_revision>=1);
assert.strictEqual(release.version,version.version);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(manifest.release_revision,version.release_revision);

assert(updater.includes('ILKADIM_UPDATER_CORE_GENERATION = 121'));
assert(updater.includes('function github_branch_head_sha'));
assert(updater.includes('return remote_release_info($gh);'));
assert(!updater.includes('/commits?sha='));
assert(!updater.includes('recovery_bridge_target_info'));
assert(updater.includes('1.2.1 temiz recovery yalnız uygulama kodu/updater çekirdeğini yeniler'));

assert(manifest.files.includes('RELEASE-1.1.119.md'));
assert(manifest.files.includes('update-release.json'));
assert(manifest.files.includes('tests/update-recovery-119.cjs'));
assert(manifest.files.includes('RELEASE-1.2.1.md'));

console.log('PASS: 1.2.1 clean recovery contract');
