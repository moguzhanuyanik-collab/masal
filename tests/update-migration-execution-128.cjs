'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');

assert(updater.includes('function database_update_plan('),
  'Updater database plan helper missing.');
assert(updater.includes('$databasePlan=database_update_plan($pdo,$sourceRoot,$localVersion);'),
  'Install flow must calculate pending DB work from the staged release package.');
assert(updater.includes('$migrations=run_pending_migrations($pdo,$sourceRoot,$localVersion);'),
  'Sequential update flow must execute staged pending migrations.');
assert(updater.includes('$requiresDbBackup=$isLegacy097Recovery'),
  'Legacy 1.1.97 recovery must still require a DB backup.');
assert(updater.includes('$dbBackupName=create_database_backup($root,$dbConfig,$updateConfig,$pdo);'),
  'DB backup must be created before database mutation.');
assert(updater.includes('$databaseMutationStarted=true;'),
  'Recovery manifest must mark DB mutation before migrations run.');
assert(updater.includes('run_legacy_1_1_97_to_1_2_1_recovery($pdo,$sourceRoot,$localVersion);'),
  'Direct 1.1.97 -> 1.2.1 recovery bridge must remain available.');

const planStart=updater.indexOf('function database_update_plan(');
const planEnd=updater.indexOf('function database_update_requires_backup(',planStart);
assert(planStart>=0 && planEnd>planStart,'Database update plan helper boundaries missing.');
const installStart=updater.indexOf('function install_github_update(');
const installEnd=updater.indexOf('$updateStage=\'database_migration\';',installStart);
assert(installStart>=0 && installEnd>installStart,'Install database stage missing.');

assert(workflow.includes('node tests/update-migration-execution-128.cjs'));
console.log('PASS: 1.2.2 sequential migration execution contract');
