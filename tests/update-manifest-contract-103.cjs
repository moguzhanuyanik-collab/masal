'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const anchor=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(updater.includes('function normalized_packaged_manifest_files('));
assert(updater.includes('function assert_packaged_manifest_matches_tree('));
assert(updater.includes('manifestinde tekrarlı kayıt'));
assert(updater.includes('gerçek paket ağacıyla eşleşmiyor'));
assert(
  updater.indexOf('assert_packaged_manifest_matches_tree($manifestData,$newManagedFiles)')
  < updater.indexOf('copy_update_tree($sourceRoot,$root,$preserve)')
);
assert(workflow.includes('tests/update-manifest-contract-103.php'));
assert(workflow.includes('tests/update-manifest-contract-103.cjs'));
assert(/^1\.1\.(?:10[3-9]|1[1-9][0-9]|[2-9][0-9]{2,})$/.test(String(version.version)),'version must be 1.1.103 or newer');
assert.strictEqual(anchor.version,version.version);
assert.strictEqual(manifest.version,version.version);

const normalized=[...manifest.files].sort();
assert.deepStrictEqual(manifest.files,normalized,'managed manifest must stay sorted');
assert.strictEqual(new Set(manifest.files).size,manifest.files.length,'managed manifest contains duplicates');

console.log('1.1.103 managed-file manifest contract checks passed');
