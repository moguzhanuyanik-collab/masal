'use strict';

const fs=require('fs');
const assert=require('assert');
const cp=require('child_process');

const evidence=JSON.parse(fs.readFileSync('RECOVERY-1.1.97-1.2.1-EVIDENCE.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

const baseline=evidence.baseline.commit;
const source=evidence.source.commit;

function git(args){
  return cp.execFileSync('git',args,{encoding:'utf8',stdio:['ignore','pipe','pipe']}).trim();
}

function commitExists(sha){
  try{ git(['cat-file','-e',sha+'^{commit}']); return true; }catch{return false;}
}

assert(/^[a-f0-9]{40}$/.test(baseline));
assert(/^[a-f0-9]{40}$/.test(source));
assert(commitExists(baseline),'1.1.97 baseline commit Git history içinde bulunamadı.');
assert(commitExists(source),'1.2.1 recovery source commit Git history içinde bulunamadı.');

assert.strictEqual(git(['show',baseline+':version.json']).match(/"version"\s*:\s*"([^"]+)"/)?.[1],'1.1.97');
assert.strictEqual(git(['show',source+':version.json']).match(/"version"\s*:\s*"([^"]+)"/)?.[1],'1.2.1');

assert.strictEqual(git(['rev-list','--count',baseline+'..'+source]),String(evidence.source_compare.baseline_to_source_commit_count));
assert.strictEqual(evidence.source_compare.baseline_to_source_commit_count,30);

assert.doesNotThrow(()=>git(['merge-base','--is-ancestor',baseline,source]));
assert.doesNotThrow(()=>git(['merge-base','--is-ancestor',source,'HEAD']));

assert.strictEqual(evidence.source.version,'1.2.1');
assert.strictEqual(evidence.source.commit,source);
assert.strictEqual(evidence.reconstructed_release_sequence[0],'1.1.97');
assert.strictEqual(evidence.reconstructed_release_sequence.at(-1),'1.2.1');
assert.deepStrictEqual(evidence.excluded_from_active_sequence,['1.1.118','1.1.120']);
assert.deepStrictEqual(evidence.recovery_only,['1.1.119']);

const currentParts=String(version.version).split('.').map(Number);
assert(
  currentParts[0]>1
  || (currentParts[0]===1 && (currentParts[1]>2 || (currentParts[1]===2 && currentParts[2]>=14))),
  'Recovery lineage integrity test 1.2.14 veya daha yeni bir koruma sürümünde çalışmalı.'
);
assert.strictEqual(release.version,version.version);
assert.strictEqual(version.release_revision,release.release_revision);
assert(Number.isInteger(version.release_revision) && version.release_revision>=1);

const evidenceTree=String(evidence.source.source_tree||'');
const actualTree=git(['show','-s','--format=%T',source]);
assert.strictEqual(evidenceTree,actualTree,'Evidence source_tree, 1.2.1 source commit tree ile eşleşmiyor.');
const actualParent=git(['show','-s','--format=%P',source]).split(/\s+/)[0]||'';
assert.strictEqual(evidence.source.parent_commit,actualParent,'Evidence parent_commit, 1.2.1 source commit parentı ile eşleşmiyor.');

console.log('PASS: 1.1.97 -> 1.2.1 immutable recovery source integrity');
