'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const page=fs.readFileSync('guncelleme.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const anchor=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(updater.includes('function prepare_updater_core_handoff('));
assert(updater.includes('function read_updater_core_handoff_marker('));
assert(updater.includes("durum='yeniden_dene'"));
assert(updater.includes("'retry_required'=>true"));
assert(
  updater.indexOf('$coreHandoff=prepare_updater_core_handoff(')
  < updater.indexOf('$pendingMigrations=pending_migration_names(')
);
assert(updater.includes('clear_updater_core_handoff_marker($root);'));
assert(page.includes("'retry_required' => true"));
assert(page.includes('while (true) {'));
assert(page.includes('handoffRetries < 2'));
assert(page.includes('setTimeout(resolve, 350)'));
assert(workflow.includes('tests/update-core-handoff-108.php'));
assert(workflow.includes('tests/update-core-handoff-108.cjs'));

assert.strictEqual(version.version,'1.1.108');
assert.strictEqual(version.release_revision,1);
assert.strictEqual(anchor.version,version.version);
assert.strictEqual(anchor.release_revision,version.release_revision);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(manifest.release_revision,version.release_revision);

console.log('1.1.108 updater core handoff contract checks passed');
