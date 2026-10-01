'use strict';

function version_compare_118(a,b){const A=a.split('.').map(Number),B=b.split('.').map(Number);for(let i=0;i<3;i++){if((A[i]||0)!==(B[i]||0))return (A[i]||0)-(B[i]||0);}return 0;}

const fs=require('fs');
const assert=require('assert');

const rescue=fs.readFileSync('rescue-1.1.97-to-1.1.98.php','utf8');
const rebuild=fs.readFileSync('tests/update-chain-rebuild-126.cjs','utf8');
const gate=fs.readFileSync('tests/recovery-097-chain-gate-134.cjs','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');

const expected=['1.1.98','1.1.99','1.1.100','1.1.101','1.1.102','1.1.103','1.1.104','1.1.105','1.1.106','1.1.107','1.1.108','1.1.109','1.1.110','1.1.111','1.1.112','1.1.113','1.1.114','1.1.115','1.1.116','1.1.117','1.2.1'];
const bootstrap='ea5ddda3a90cdc0ace01729cee827a532d673fe9';
const target='6a0f372871e6dbd2b71d2efef121fbf2dfb2f82c';

assert(rescue.includes("const ILKADIM_LEGACY_097_BOOTSTRAP_COMMIT='"+bootstrap+"';"));
assert(rescue.includes("const ILKADIM_LEGACY_097_TARGET_COMMIT='"+target+"';"));
assert(!rescue.includes('function rescue_validate_historical_sequence'));
assert(!rescue.includes('function rescue_validate_historical_chain'));
assert(!rescue.includes('rescue_validate_historical_chain($gh);'));
assert(rebuild.includes("const recoveryOnly=new Set(['1.1.119'])"));
assert(!gate.includes("'1.1.119','1.2.1'"),'1.1.119 aktif zincirde sayılmamalı.');
for(const v of expected){
  assert(rebuild.includes("'"+v+"'"),'Rebuild contract zincirinde eksik sürüm: '+v);
}

assert(version_compare_118(String(version.version),'1.2.16')>=0);
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number.isInteger(version.release_revision) && version.release_revision>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);
assert(manifest.files.includes('tests/recovery-chain-order-135.cjs'));
assert(workflow.includes('node tests/recovery-chain-order-135.cjs'));

console.log('PASS: recovery chain preserved while 1.1.97 bootstrap no longer depends on history');
