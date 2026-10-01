'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const updatePage=fs.readFileSync('guncelleme.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const anchor=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(/^1\.1\.(?:10[1-9]|1[1-9][0-9]|[2-9][0-9]{2,})$/.test(String(version.version)),'version must be 1.1.101 or newer');
assert.strictEqual(anchor.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(updater.includes('function next_remote_version_info'));
assert(updater.includes('return remote_release_info($gh);'));
assert(!updater.includes('/commits?sha='),'Updater must not traverse historical commits to select an update.');
assert(updatePage.includes('[IlkAdim][update-post-check]'));
assert(updatePage.includes('Güncelleme kuruldu; sonraki sürüm kontrolü şu anda tamamlanamadı.'));
assert(workflow.includes('tests/update-release-anchor-101.cjs'));

console.log('1.1.101 release anchor and post-install checks passed');
