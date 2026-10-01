'use strict';

const fs=require('fs');
const assert=require('assert');
const cp=require('child_process');

const baseline='be2651c5e375e3b54c0735d7283820a6ec9eb581';
const source='6a0f372871e6dbd2b71d2efef121fbf2dfb2f82c';

function git(args){
  return cp.execFileSync('git',args,{encoding:'utf8',stdio:['ignore','pipe','pipe']}).trim();
}
function show(ref,path){
  return git(['show',ref+':'+path]);
}
function compareVersion(a,b){
  const A=String(a).split('.').map(Number),B=String(b).split('.').map(Number);
  for(let i=0;i<3;i++){
    if((A[i]||0)!==(B[i]||0)) return (A[i]||0)-(B[i]||0);
  }
  return 0;
}

assert.doesNotThrow(()=>git(['cat-file','-e',baseline+'^{commit}']));
assert.doesNotThrow(()=>git(['cat-file','-e',source+'^{commit}']));
assert.strictEqual(git(['merge-base','--is-ancestor',baseline,source]),'');
assert.strictEqual(git(['merge-base','--is-ancestor',source,'HEAD']),'');
assert.strictEqual(Number(git(['rev-list','--count',baseline+'..'+source])),30);

const sourceVersion=JSON.parse(show(source,'version.json'));
assert.strictEqual(sourceVersion.version,'1.2.1');
assert.strictEqual(sourceVersion.release_revision,15);

const evidence=JSON.parse(fs.readFileSync('RECOVERY-1.1.97-1.2.1-EVIDENCE.json','utf8'));
assert.strictEqual(evidence.baseline.commit,baseline);
assert.strictEqual(evidence.source.commit,source);
assert.strictEqual(evidence.source.release_revision,15);
assert.strictEqual(evidence.source_compare.baseline_to_source_commit_count,30);

const expected=evidence.reconstructed_release_sequence;
const excluded=new Set(evidence.excluded_from_active_sequence);
assert(!expected.includes('1.1.118'));
assert(!expected.includes('1.1.120'));
assert.deepStrictEqual(evidence.recovery_only,['1.1.119']);

for(const version of expected.slice(1)){
  const file='RELEASE-'+version+'.md';
  assert(fs.existsSync(file),'Eksik recovery release notu: '+file);
}
for(const version of expected.slice(1)){
  const file='RELEASE-'+version+'.md';
  assert(fs.readFileSync('update-managed-files.json','utf8').includes('"'+file+'"'),
    'Managed manifestte eksik release notu: '+file);
}
assert(fs.existsSync(evidence.functional_rebuild_artifact));
assert(fs.existsSync('tests/functional-rebuild-118.cjs'));

const current=JSON.parse(fs.readFileSync('version.json','utf8'));
assert(compareVersion(current.version,'1.2.11')>=0,'Recovery koruma sürümü 1.2.11 veya daha yeni olmalı.');

console.log('PASS: recovered 1.1.97 -> 1.2.1 source lineage is anchored and protected');
