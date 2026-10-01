'use strict';

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

assert(rescue.includes('function rescue_validate_historical_sequence'));
assert(rescue.includes("$recoveryOnly=['1.1.119']"));
assert(rebuild.includes("const recoveryOnly=new Set(['1.1.119'])"));
assert(!gate.includes("'1.1.119','1.2.1'"),'1.1.119 aktif zincirde sayılmamalı.');
for(const v of expected) assert(rescue.includes("'"+v+"'"),'Eksik aktif zincir sürümü: '+v);

function collapse(history,ignored){
  const out=[];
  for(const value of history){
    if(!value || ignored.has(value)) continue;
    if(out[out.length-1]!==value) out.push(value);
  }
  return out;
}
function exactChain(history,expected,ignored){
  const c=collapse(history,ignored);
  for(let i=0;i<=c.length-expected.length;i++){
    if(expected.every((v,j)=>c[i+j]===v)) return true;
  }
  return false;
}
const recoveryOnly=new Set(['1.1.119']);
assert(exactChain(['1.1.97',...expected],expected,recoveryOnly));
assert(exactChain(['1.1.97','1.1.98','1.1.98','1.1.99',...expected.slice(2)],expected,recoveryOnly));
assert(exactChain(['1.1.97','1.1.98','1.1.119','1.1.99',...expected.slice(2)],expected,recoveryOnly));
assert(!exactChain(['1.1.97','1.1.98','1.1.100','1.1.99',...expected.slice(2)],expected,recoveryOnly));
assert(!exactChain(['1.1.97','1.1.98','1.1.99','1.1.101',...expected.slice(3)],expected,recoveryOnly));

assert.strictEqual(version.version,'1.2.8');
assert.strictEqual(release.version,'1.2.8');
assert.strictEqual(manifest.version,'1.2.8');
assert.strictEqual(version.release_revision,1);
assert.strictEqual(release.release_revision,1);
assert.strictEqual(manifest.release_revision,1);
assert(manifest.files.includes('tests/recovery-chain-order-135.cjs'));
assert(workflow.includes('node tests/recovery-chain-order-135.cjs'));

console.log('PASS: exact active 1.1.97 -> 1.2.1 recovery chain order contract');
