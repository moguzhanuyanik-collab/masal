'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');

assert(updater.includes('function run_legacy_1_1_97_to_1_2_1_recovery'));
assert(updater.includes("if($localVersion!=='1.1.97') return [];"));
assert(updater.includes("if(!in_array($localVersion,['1.1.97','1.1.98'],true)) return [];"));
assert(updater.includes("if($already){"));
assert(updater.includes("adimbot_rate_limitleri"));
assert(updater.includes("recover_missing_064_checkpoint_after_1_1_98_bridge($pdo,$migrationRoot,$localVersion)"));
assert(updater.includes("repair_legacy_institution_membership_schema($pdo)"));
assert(updater.includes("'065_kurum_bazli_eslestirme_izolasyonu'"));
assert(updater.includes("'066_kurum_eslestirme_schema_guard'"));
assert(updater.includes('$requiresDbBackup=$isLegacy097Recovery;'));
assert(updater.includes('$dbBackupName=create_database_backup($root,$dbConfig,$updateConfig,$pdo);'));
assert(updater.includes('$migrations=run_legacy_1_1_97_to_1_2_1_recovery($pdo,$sourceRoot,$localVersion);'));
assert(updater.includes('$isClean121Recovery=!$isLegacy097Recovery'));

const helperStart=updater.indexOf('function run_legacy_1_1_97_to_1_2_1_recovery');
const helperEnd=updater.indexOf('function run_pending_migrations',helperStart);
assert(helperStart>=0 && helperEnd>helperStart);
const helperBlock=updater.slice(helperStart,helperEnd);
assert(helperBlock.indexOf('recover_missing_064_checkpoint_after_1_1_98_bridge') < helperBlock.indexOf('repair_legacy_institution_membership_schema'));
assert(helperBlock.indexOf("'065_kurum_bazli_eslestirme_izolasyonu'") < helperBlock.indexOf("'066_kurum_eslestirme_schema_guard'"));
assert(helperBlock.includes('001-063') || updater.includes('001-063'));

assert.strictEqual(version.version,'1.2.1');
assert.strictEqual(release.version,'1.2.1');
assert.strictEqual(manifest.version,'1.2.1');
assert.strictEqual(version.release_revision,11);
assert.strictEqual(release.release_revision,11);
assert.strictEqual(manifest.release_revision,11);
assert(manifest.files.includes('tests/update-legacy-db-recovery-123.cjs'));
assert(workflow.includes('node tests/update-legacy-db-recovery-123.cjs'));
assert(workflow.includes('php tests/legacy-064-integrity-124.php'));

console.log('PASS: 1.1.97 -> 1.2.1 legacy DB recovery contract');
