'use strict';

const fs=require('fs');
const assert=require('assert');

const rescue=fs.readFileSync('tools/updater-1.1.97-rescue.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const anchor=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(rescue.includes("return $localVersion==='1.1.96' && $remoteVersion==='1.1.97';"));
assert(rescue.includes('function apply_1_1_97_history_checkpoint('));
assert(rescue.includes("'001_1_1_97_history_checkpoint'"));
assert(rescue.includes('run_migration_sql($pdo,$path);'));
assert(rescue.includes("INSERT IGNORE INTO sistem_migrations"));
assert(
  rescue.indexOf('if(is_1_1_97_rescue_transition(')
  < rescue.indexOf('$migrations=run_pending_migrations($pdo,$sourceRoot);')
);
assert(workflow.includes('tests/update-197-rescue-106.php'));
assert(workflow.includes('tests/update-197-rescue-106.cjs'));
assert(/^1\.1\.(?:10[6-9]|1[1-9][0-9]|[2-9][0-9]{2,})$/.test(String(version.version)),'version must be 1.1.106 or newer');
assert(Number.isInteger(version.release_revision) && version.release_revision>=1,'release revision must be positive');
assert.strictEqual(anchor.version,version.version);
assert.strictEqual(anchor.release_revision,version.release_revision);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(manifest.release_revision,version.release_revision);

console.log('1.1.106 historical 1.1.97 rescue checks passed');
