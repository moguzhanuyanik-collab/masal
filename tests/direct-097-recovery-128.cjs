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
assert(rescue.includes("const ILKADIM_LEGACY_097_BOOTSTRAP_COMMIT='ea5ddda3a90cdc0ace01729cee827a532d673fe9';"), 'Rescue immutable bootstrap commit kullanmalı.');
assert(rescue.includes("const ILKADIM_LEGACY_097_TARGET_COMMIT='6a0f372871e6dbd2b71d2efef121fbf2dfb2f82c';"), 'Rescue 1.2.1 immutable target anchorını bilmeli.');
assert(rescue.includes('function rescue_bootstrap_commit'), 'Rescue sabit bootstrap commit fonksiyonunu kullanmalı.');
assert(!rescue.includes('rescue_branch_head_sha($gh)'), 'Rescue mutable branch HEAD kullanmamalı.');
assert(!rescue.includes('rescue_validate_historical_chain($gh)'), 'Rescue güncel branch tarihçesine bağımlı olmamalı.');
assert(rescue.includes('rescue_ref_file'), 'Rescue dosyaları aynı sabit commit üzerinden çekmeli.');
assert(rescue.includes("^[a-f0-9]{40}$"), 'Rescue gerçek 40 karakter SHA doğrulaması yapmalı.');
assert(rescue.includes("$targetVersion!=='1.2.16'"), 'Rescue yalnız doğrulanmış 1.2.9 bootstrap çekirdeğini kabul etmeli.');
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
const versionAtLeast116=versionParts[0]>1 || (versionParts[0]===1 && (versionParts[1]>2 || (versionParts[1]===2 && versionParts[2]>=3)));
assert(versionAtLeast123,'Release must remain 1.2.16 or newer.');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number.isInteger(version.release_revision) && version.release_revision>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);
assert(manifest.files.includes(testPath));
assert(manifest.files.includes('RELEASE-1.2.3.md'));
assert(workflow.includes('node tests/direct-097-recovery-128.cjs'));

console.log('PASS: direct 1.1.97 recovery contract');
