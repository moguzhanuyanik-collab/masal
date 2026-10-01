'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const updatePage=fs.readFileSync('guncelleme.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const anchor=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(updater.includes('function atomic_replace_update_file('));
assert(updater.includes('function assert_update_activation_preflight('));
assert(updater.includes('function verify_activated_update_files('));
assert(updater.includes("hash_file('sha256'"));
assert(updater.includes("'.ilkadim-update-'"));
assert(
  updater.indexOf('assert_update_activation_preflight(')
  < updater.indexOf("$updateStage='database_mutation';")
);
assert(
  updater.indexOf('verify_activated_update_files(')
  < updater.indexOf('$removedManagedFiles=remove_stale_managed_files(')
);
assert(updatePage.includes("'Güncelleme hedef'"));
assert(updatePage.includes("'Güncelleme sonrası'"));
assert(workflow.includes('tests/update-activation-104.php'));
assert(workflow.includes('tests/update-activation-104.cjs'));
assert(/^1\.1\.(?:10[4-9]|1[1-9][0-9]|[2-9][0-9]{2,})$/.test(String(version.version)) || String(version.version)==='1.2.1','version must be 1.1.104 or newer');
assert.strictEqual(anchor.version,version.version);
assert.strictEqual(manifest.version,version.version);

console.log('1.1.104 activation safety checks passed');
