'use strict';

const fs=require('fs');
const cp=require('child_process');
const assert=require('assert');

const branch=String(process.env.GITHUB_REF_NAME||'');
const eventName=String(process.env.GITHUB_EVENT_NAME||'');
const protectedReleaseBranch=eventName==='push' && (
  branch==='main'
  || /^(?:update|recovery-safety|migration-safety|hardening|pwa-hardening|updater-manifest|db-ai-safety|db-backup)-/.test(branch)
);

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

  assert(/^[a-f0-9]{40}$/i.test(anchorHead),
    'update-release.json için geçerli bir release anchor commit bulunamadı.');

  // Release metadata'nın son değiştiği commit, güncel HEAD'in atası olmalıdır.
  // Release sonrasında dokümantasyon/regression/CI commitleri eklenebilir; bu
  // commitleri zorla metadata re-anchor etmeye mecbur bırakmak history rewrite
  // baskısı oluşturuyordu.
  try{
    cp.execFileSync('git',['merge-base','--is-ancestor',anchorHead,head],{stdio:'ignore'});
  }catch{
    assert.fail(
      'Release metadata anchor commit güncel HEAD tarihçesinin atası değil. '+
      'Bu durum history rewrite/force-push belirtisi olabilir.'
    );
  }
}

console.log('1.1.109 release metadata ancestor invariant passed');
