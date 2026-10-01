'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(updater.includes('function assert_recovered_release_postconditions'));
assert(updater.includes("version_compare($targetVersion,'1.2.1','<')"));
assert(updater.includes("'064_adimbot_rate_limit_ve_migration_checkpoint'"));
assert(updater.includes("'065_kurum_bazli_eslestirme_izolasyonu'"));
assert(updater.includes("'066_kurum_eslestirme_schema_guard'"));
assert(updater.includes("updater_core_generation_from_file($sourceUpdater)"));
assert(updater.includes("updater_core_generation_from_file($liveUpdater)"));
assert(updater.includes("validate_tenant_relation_schema_guard($pdo,$sourceRoot)"));
assert(updater.includes("assert_recovered_release_postconditions($pdo,$root,$sourceRoot,$remote)"));

assert.strictEqual(version.version,'1.2.3');
assert.strictEqual(release.version,'1.2.3');
assert.strictEqual(manifest.version,'1.2.3');
assert(manifest.files.includes('tests/recovery-release-postcondition-131.php'));
assert(manifest.files.includes('tests/recovery-release-postcondition-131.cjs'));
assert(workflow.includes('php tests/recovery-release-postcondition-131.php'));
assert(workflow.includes('node tests/recovery-release-postcondition-131.cjs'));

console.log('PASS: recovery release postcondition source contract');
