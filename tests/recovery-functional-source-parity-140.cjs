'use strict';

const fs=require('fs');
const assert=require('assert');
const cp=require('child_process');

const evidence=JSON.parse(fs.readFileSync('RECOVERY-1.1.97-1.2.1-EVIDENCE.json','utf8'));
const source=evidence.source.commit;
assert(/^[a-f0-9]{40}$/.test(source),'1.2.1 source commit SHA geçersiz.');

function git(args){
  return cp.execFileSync('git',args,{encoding:'utf8',stdio:['ignore','pipe','pipe']});
}

const files=evidence.functional_source_files;
assert(Array.isArray(files) && files.length>=10,'Functional source file listesi eksik.');

for(const file of files){
  assert(typeof file==='string' && file!=='' && !file.includes('..'),'Geçersiz functional source path: '+file);
  const current=fs.readFileSync(file,'utf8');
  const sourceContent=git(['show',source+':'+file]);
  assert.strictEqual(
    current,
    sourceContent,
    '1.2.1 source authority ile current main arasında beklenmeyen functional dosya farkı: '+file
  );
}

assert.strictEqual(evidence.functional_source_contract,'tests/recovery-functional-source-parity-140.cjs');
console.log('PASS: 1.2.1 functional source parity is preserved for the recovered application tree');
