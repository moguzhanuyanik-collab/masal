'use strict';
const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const anchor=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(updater.includes('function updater_core_handoff_max_age_seconds()'));
assert(updater.includes("strtotime($updatedAt)"));
assert(updater.includes("'Handoff updater yedeği'"));
assert(updater.includes("'Canlı updater çekirdeği'"));
assert(updater.includes('function managed_runtime_manifest_state('));
assert(updater.includes("if($version!==$localVersion) return null"));
assert(updater.includes("if(count($hashes)!==count($files)) return []"));
assert(workflow.includes('tests/update-continuity-112.php'));
assert(workflow.includes('tests/update-continuity-112.cjs'));

assert.strictEqual(version.version,'1.1.112');
assert.strictEqual(version.release_revision,1);
assert.strictEqual(anchor.version,version.version);
assert.strictEqual(anchor.release_revision,version.release_revision);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(manifest.release_revision,version.release_revision);

console.log('PASS: 1.1.112 continuity source contract');
