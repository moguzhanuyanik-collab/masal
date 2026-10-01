'use strict';

const fs=require('fs');
const assert=require('assert');
const cp=require('child_process');

// Recovery chain ancestry regression.
const chain=JSON.parse(fs.readFileSync('RECOVERY-1.1.97-1.2.1-CHAIN.json','utf8'));
const evidence=JSON.parse(fs.readFileSync('RECOVERY-1.1.97-1.2.1-EVIDENCE.json','utf8'));

function git(args){
  return cp.execFileSync('git',args,{encoding:'utf8',stdio:['ignore','pipe','pipe']}).trim();
}
function ancestor(commit,ref){
  cp.execFileSync('git',['merge-base','--is-ancestor',commit,ref],{stdio:'ignore'});
}

assert.strictEqual(chain.format,1);
assert.strictEqual(chain.baseline.version,'1.1.97');
assert.strictEqual(chain.source.version,'1.2.1');
assert.strictEqual(chain.source.release_revision,15);
assert.strictEqual(chain.expected_commit_count,30);

assert.deepStrictEqual(
  chain.active_sequence.map(x=>x[0]),
  evidence.reconstructed_release_sequence
);
assert.deepStrictEqual(chain.excluded,evidence.excluded_from_active_sequence);
assert.deepStrictEqual(chain.recovery_only,evidence.recovery_only);
assert.strictEqual(chain.baseline.commit,evidence.baseline.commit);
assert.strictEqual(chain.source.commit,evidence.source.commit);

for(const [version,commit] of chain.active_sequence){
  assert(/^[a-f0-9]{40}$/.test(commit),'Invalid recovery commit: '+version);
  ancestor(commit,'HEAD');
  const subject=git(['show','-s','--format=%s',commit]);
  assert(subject.includes(version),'Commit subject does not identify '+version);
  assert(fs.existsSync('RELEASE-'+version+'.md'),'Missing release note for '+version);
}

const count=Number(git(['rev-list','--count',chain.baseline.commit+'..'+chain.source.commit]));
assert.strictEqual(count,chain.expected_commit_count);
ancestor(chain.baseline.commit,chain.source.commit);
ancestor(chain.source.commit,'HEAD');

assert(!chain.active_sequence.some(x=>chain.excluded.includes(x[0])));
assert.deepStrictEqual(chain.recovery_only,['1.1.119']);

console.log('PASS: 1.1.97 to 1.2.1 recovery chain ancestry');
