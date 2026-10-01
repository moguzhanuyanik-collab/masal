'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

const gateStart=updater.indexOf('function assert_historical_migration_history');
const gateEnd=updater.indexOf('\nfunction ',gateStart+10);
assert(gateStart>=0 && gateEnd>gateStart,'historical migration gate bulunamadı.');
const gate=updater.slice(gateStart,gateEnd);

assert(!gate.includes("if(version_compare($localVersion,'1.1.98','<')) return;"),
  '1.1.97 direct recovery eski erken-return guardına dönmemeli.');
assert(gate.includes("if(version_compare($localVersion,'1.1.97','<')) return;"));
assert(gate.includes("in_array($localVersion,['1.1.97','1.1.98'],true)"));
assert(gate.includes("missing===['064_adimbot_rate_limit_ve_migration_checkpoint']"),
  '064 tek eksik checkpoint istisnası korunmalı.');

const legacyStart=updater.indexOf('function run_legacy_1_1_97_to_1_2_1_recovery');
const legacyEnd=updater.indexOf('\nfunction ',legacyStart+10);
assert(legacyStart>=0 && legacyEnd>legacyStart,'legacy recovery fonksiyonu bulunamadı.');
const legacy=updater.slice(legacyStart,legacyEnd);
const historyCall=legacy.indexOf('assert_historical_migration_history($pdo,$migrationRoot,$localVersion);');
const checkpointCall=legacy.indexOf('recover_missing_064_checkpoint_after_1_1_98_bridge($pdo,$migrationRoot,$localVersion);');
assert(historyCall>=0,'legacy recovery historical gate çağırmalı.');
assert(checkpointCall>historyCall,'historical gate 064 checkpoint recoveryden önce çalışmalı.');

assert.strictEqual(version.version,'1.2.17');
assert.strictEqual(release.version,'1.2.17');
assert.strictEqual(manifest.version,'1.2.17');
assert(Number.isInteger(version.release_revision) && version.release_revision>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);
assert(manifest.files.includes('tests/recovery-097-historical-gate-143.cjs'));
assert(manifest.files.includes('RELEASE-1.2.17.md'));
assert(workflow.includes('node tests/recovery-097-historical-gate-143.cjs'));

console.log('PASS: 1.1.97 legacy recovery historical migration gate');
