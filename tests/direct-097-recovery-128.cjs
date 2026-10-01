'use strict';

const fs=require('fs');
const assert=require('assert');

const rescue=fs.readFileSync('rescue-1.1.97-to-1.1.98.php','utf8');
const updater=fs.readFileSync('src/updater.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const testPath='tests/direct-097-recovery-128.cjs';

assert(rescue.includes("installed!=='1.1.97'"),'Direct rescue yalnız 1.1.97 için çalışmalı.');
assert(rescue.includes('rescue_branch_head_sha'), 'Rescue gerçek branch HEAD SHA çözümlemeli.');
assert(rescue.includes('function rescue_validate_historical_chain'), 'Rescue tarihsel recovery zincirini doğrulamalı.');
assert(rescue.includes('1.1.98') && rescue.includes('1.2.1'), 'Rescue 1.1.98 → 1.2.1 zincir sınırlarını bilmeli.');
assert(rescue.includes('rescue_ref_file'), 'Rescue dosyaları aynı sabit commit üzerinden çekmeli.');
assert(rescue.includes("^[a-f0-9]{40}$"), 'Rescue gerçek 40 karakter SHA doğrulaması yapmalı.');
assert(rescue.includes('version_compare($targetVersion,\'1.2.2\',\'<\')'), 'Rescue eski/broken updater hedeflerini reddetmeli.');
assert(rescue.includes('function run_legacy_1_1_97_to_1_2_1_recovery'), 'Rescue yalnız doğrulanmış modern updater çekirdeğini kabul etmeli.');
assert(rescue.includes('hash_file(\'sha256\',$target)'), 'Canlı updater SHA-256 ile doğrulanmalı.');
assert(rescue.includes('hash_file(\'sha256\',$backup)'), 'Updater yedeği SHA-256 ile doğrulanmalı.');
assert(rescue.includes('rescue_atomic_replace'), 'Updater atomik olarak etkinleştirilmeli.');
assert(rescue.includes("'database_changed'=>false"), 'Rescue DB değişikliği yapmamalı.');
assert(rescue.includes("'migrations_run'=>false"), 'Rescue migration çalıştırmamalı.');
assert(!/\\b(?:DROP|TRUNCATE)\\s+TABLE\\b/i.test(rescue),'Rescue DROP TABLE içermemeli.');
assert(!/\\bDELETE\\s+FROM\\b/i.test(rescue),'Rescue DELETE FROM içermemeli.');
assert(!/\\bALTER\\s+TABLE\\b/i.test(rescue),'Rescue ALTER TABLE içermemeli.');

assert(updater.includes('function run_legacy_1_1_97_to_1_2_1_recovery'));
assert(updater.includes('$migrations=run_pending_migrations($pdo,$sourceRoot,$localVersion);'));
assert(updater.includes('function prepare_updater_core_handoff'));

const versionParts=String(version.version).split('.').map(Number);
const versionAtLeast123=versionParts[0]>1 || (versionParts[0]===1 && (versionParts[1]>2 || (versionParts[1]===2 && versionParts[2]>=3)));
assert(versionAtLeast123,'Release must remain 1.2.3 or newer.');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(version.release_revision,1);
assert.strictEqual(release.release_revision,1);
assert.strictEqual(manifest.release_revision,1);
assert(manifest.files.includes(testPath));
assert(manifest.files.includes('RELEASE-1.2.3.md'));
assert(workflow.includes('node tests/direct-097-recovery-128.cjs'));

console.log('PASS: direct 1.1.97 recovery contract');
