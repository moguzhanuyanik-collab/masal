'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const updatePage=fs.readFileSync('guncelleme.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const anchor=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

const vp=String(version.version).split('.').map(Number);
assert(vp.length===3 && vp.every(Number.isFinite),'version must be semver-like');
assert(vp[0]>1 || (vp[0]===1 && vp[1]>1) || (vp[0]===1 && vp[1]===1 && vp[2]>=101),'version must be 1.1.101 or newer');
assert.strictEqual(anchor.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(updater.includes('function remote_release_info(array $gh): array'));
assert(updater.includes("'update-release.json'"));
assert(updatePage.includes('[IlkAdim][update-post-check]'));
assert(updatePage.includes('Güncelleme kuruldu; sonraki sürüm kontrolü şu anda tamamlanamadı.'));
assert(workflow.includes('tests/update-release-anchor-101.cjs'));

console.log('1.1.101 release anchor and post-install checks passed');
