'use strict';

const fs=require('fs');
const cp=require('child_process');
const assert=require('assert');

const branch=String(process.env.GITHUB_REF_NAME||'');
const protectedReleaseBranch=branch==='main' || branch.startsWith('update-');

const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const anchor=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert.strictEqual(anchor.version,version.version);
assert.strictEqual(anchor.release_revision,version.release_revision);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(manifest.release_revision,version.release_revision);

if(protectedReleaseBranch){
  const head=cp.execFileSync('git',['rev-parse','HEAD'],{encoding:'utf8'}).trim();
  const anchorHead=cp.execFileSync('git',['log','-1','--format=%H','--','update-release.json'],{encoding:'utf8'}).trim();
  assert.strictEqual(
    anchorHead,
    head,
    'Release branch HEAD must be the latest update-release.json anchor commit. Re-anchor instead of appending post-release commits.'
  );

  const changed=cp.execFileSync(
    'git',['diff-tree','--no-commit-id','--name-only','-r','HEAD'],
    {encoding:'utf8'}
  ).trim().split(/\r?\n/).filter(Boolean);
  for(const required of ['version.json','update-release.json','update-managed-files.json']){
    assert(changed.includes(required),'Release HEAD must change '+required);
  }
}

console.log('1.1.109 release HEAD anchor invariant passed');
