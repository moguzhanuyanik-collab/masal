'use strict';

const fs=require('fs');
const assert=require('assert');

const rescue=fs.readFileSync('rescue-1.1.97-to-1.1.98.php','utf8');
const updater=fs.readFileSync('src/updater.php','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');

const expected=[
  '1.1.98','1.1.99','1.1.100','1.1.101','1.1.102','1.1.103',
  '1.1.104','1.1.105','1.1.106','1.1.107','1.1.108','1.1.109',
  '1.1.110','1.1.111','1.1.112','1.1.113','1.1.114','1.1.115',
  '1.1.116','1.1.117','1.2.1'
];

assert(rescue.includes('function rescue_validate_historical_sequence'));
assert(rescue.includes('function rescue_validate_historical_chain'));
assert(rescue.includes('rescue_validate_historical_chain($gh);'));
assert(rescue.includes('function next_remote_version_info'));
assert(rescue.includes('function run_legacy_1_1_97_to_1_2_1_recovery'));
for(const v of expected) assert(rescue.includes("'"+v+"'"),'Aktif recovery zincirinde eksik sürüm: '+v);
assert(rescue.includes("$recoveryOnly=['1.1.119']"));

assert(updater.includes('/commits?sha='));
assert(updater.includes('Sıradaki güncelleme güvenli biçimde belirlenemedi.'));

assert.strictEqual(version.version,'1.2.8');
assert.strictEqual(release.version,'1.2.8');
assert.strictEqual(manifest.version,'1.2.8');
assert.strictEqual(version.release_revision,1);
assert.strictEqual(release.release_revision,1);
assert.strictEqual(manifest.release_revision,1);
assert(manifest.files.includes('RELEASE-1.2.8.md'));
assert(manifest.files.includes('tests/recovery-097-chain-gate-134.cjs'));
assert(workflow.includes('node tests/recovery-097-chain-gate-134.cjs'));

console.log('PASS: 1.1.97 historical recovery chain gate contract');
