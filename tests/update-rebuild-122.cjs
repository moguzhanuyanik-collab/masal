'use strict';

const fs=require('fs');
const assert=require('assert');

const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const updater=fs.readFileSync('src/updater.php','utf8');

assert.strictEqual(version.version,release.version);
assert.strictEqual(version.version,manifest.version);
assert(/^1\.2\.\d+$/.test(version.version));
assert.strictEqual(version.release_revision,15);
assert.strictEqual(release.release_revision,15);
assert.strictEqual(manifest.release_revision,15);
assert(updater.includes('function github_branch_head_sha'));
assert(updater.includes('function remote_release_info(array $gh): array'));
assert(updater.includes('function run_legacy_1_1_97_to_1_2_1_recovery'));
assert(!updater.includes('/commits?sha='));

for(const required of [
  'RELEASE-1.1.98.md','RELEASE-1.1.99.md','RELEASE-1.1.100.md',
  'RELEASE-1.1.113.md','RELEASE-1.1.114.md','RELEASE-1.1.115.md',
  'RELEASE-1.1.116.md','RELEASE-1.1.117.md','RELEASE-1.1.119.md',
  'database/migrations/065_kurum_bazli_eslestirme_izolasyonu.sql',
  'database/migrations/066_kurum_eslestirme_schema_guard.sql',
  'tests/tenant-matching-crud-117.cjs',
  'tests/update-chain-rebuild-126.cjs'
]){
  assert(manifest.files.includes(required),'managed manifest missing '+required);
}
console.log('PASS: 1.2.1 rebuild contract');
