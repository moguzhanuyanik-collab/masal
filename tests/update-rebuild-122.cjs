'use strict';

const fs=require('fs');
const assert=require('assert');

const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const updater=fs.readFileSync('src/updater.php','utf8');
const updatePage=fs.readFileSync('guncelleme.php','utf8');

assert.strictEqual(version.version,'1.1.119');
assert(version.release_revision>=1);
assert.strictEqual(version.application_generation,117);
assert.strictEqual(release.version,'1.1.119');
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(release.application_generation,117);
assert.strictEqual(manifest.version,'1.1.119');
assert.strictEqual(manifest.release_revision,version.release_revision);
assert.strictEqual(manifest.application_generation,117);

assert(updater.includes('function normalize_application_generation'));
assert(updater.includes('function read_local_application_generation'));
assert(updater.includes('function release_application_generation_is_safe'));
assert(updater.includes('application_generation'));
assert(updater.includes('uygulama neslini geriye götürüyor'));
assert(updater.includes('function github_branch_head_sha'));
assert(updater.includes('function remote_release_info(array $gh): array'));assert(updater.includes('return remote_release_info($gh);'));
assert(!updater.includes('/commits?sha='));

assert(updatePage.includes('read_local_application_generation'));
assert(updatePage.includes('release_application_generation_is_safe'));

for(const required of [
  'RELEASE-1.1.98.md',
  'RELEASE-1.1.99.md',
  'RELEASE-1.1.100.md',
  'RELEASE-1.1.113.md',
  'RELEASE-1.1.114.md',
  'RELEASE-1.1.115.md',
  'RELEASE-1.1.116.md',
  'RELEASE-1.1.117.md',
  'RELEASE-1.1.119.md',
  'database/migrations/065_kurum_bazli_eslestirme_izolasyonu.sql',
  'database/migrations/066_kurum_eslestirme_schema_guard.sql',
  'tests/tenant-matching-crud-117.cjs'
]){
  assert(manifest.files.includes(required),'managed manifest missing '+required);
}

console.log('PASS: 1.1.119 rev2 lossless rebuild + application generation contract');
