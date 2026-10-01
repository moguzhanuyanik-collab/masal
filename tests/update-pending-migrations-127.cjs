'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

const installStart=updater.indexOf('function install_github_update');
assert(installStart>=0,'install_github_update bulunamadı.');
const installBlock=updater.slice(installStart);

assert(installBlock.includes('$requiresDbBackup=database_update_requires_backup($pdo,$sourceRoot,$localVersion);'),
  'Non-legacy update öncesinde DB backup gereksinimi hesaplanmalı.');
assert(installBlock.includes('$pendingMigrations=pending_migration_names($pdo,$sourceRoot,$localVersion);'),
  'Bekleyen migration listesi hesaplanmalı.');
assert(installBlock.includes('$migrations=run_pending_migrations($pdo,$sourceRoot,$localVersion);'),
  'Non-legacy güncellemede bekleyen migrationlar çalıştırılmalı.');
assert(installBlock.includes('if($studentSchemaMissing){'),
  'Eksik öğrenci auth şeması checkpointten bağımsız doğrulanmalı.');
assert(installBlock.includes('ensure_student_auth_schema($pdo);'),
  'Eksik öğrenci auth şeması idempotent biçimde onarılmalı.');

const legacyPos=installBlock.indexOf('$isLegacy097Recovery=');
const pendingPos=installBlock.indexOf('$pendingMigrations=pending_migration_names');
const legacyRecoveryPos=installBlock.indexOf('$migrations=run_legacy_1_1_97_to_1_2_1_recovery');
const genericRecoveryPos=installBlock.indexOf('$migrations=run_pending_migrations');
assert(legacyPos>=0 && pendingPos>legacyPos,'Legacy tespitinden sonra pending migration preflight gelmeli.');
assert(legacyRecoveryPos>=0 && genericRecoveryPos>legacyRecoveryPos,'1.1.97 özel recovery generic migration akışından önce kalmalı.');

assert.strictEqual(version.version,'1.2.2');
assert.strictEqual(release.version,'1.2.2');
assert.strictEqual(manifest.version,'1.2.2');
assert.strictEqual(version.release_revision,1);
assert.strictEqual(release.release_revision,1);
assert.strictEqual(manifest.release_revision,1);
assert(manifest.files.includes('tests/update-pending-migrations-127.cjs'));
assert(manifest.files.includes('RELEASE-1.2.2.md'));
assert(workflow.includes('node tests/update-pending-migrations-127.cjs'));

console.log('PASS: 1.2.2 pending database migration contract');
