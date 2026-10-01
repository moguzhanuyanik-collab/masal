'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

const start=updater.indexOf('function next_remote_version_info(');
const end=updater.indexOf('\nfunction ',start+10);
assert(start>=0 && end>start,'next_remote_version_info bulunamadı.');
const block=updater.slice(start,end);

assert(block.includes('/commits?sha='),'Updater GitHub version history üzerinden ara sürüm seçmeli.');
assert(block.includes('&path='));
assert(block.includes('per_page=100&page='));
assert(block.includes("$historyFile=version_compare($localVersion,'1.1.101','>=')"));
assert(block.includes("?'update-release.json'\n        :'version.json'"));
assert(block.includes('release_identity_is_newer($info,$localVersion,$localRevision)'));
assert(block.includes('release_identity_should_replace_next($info,$next)'));
assert(block.includes('remote_release_info_at_ref($gh,$sha)'));
assert(block.includes('remote_version_info_at_ref($gh,$sha)'));
assert(block.includes('Sıradaki güncelleme güvenli biçimde belirlenemedi.'));
assert(!block.includes('return remote_release_info($gh);'),
  'Updater doğrudan main HEAD release döndürerek ara sürümleri atlamamalı.');

function compareVersion(a,b){
  const pa=String(a).split('.').map(Number), pb=String(b).split('.').map(Number);
  for(let i=0;i<3;i++){
    if((pa[i]||0)!==(pb[i]||0)) return (pa[i]||0)>(pb[i]||0)?1:-1;
  }
  return 0;
}
function pick(candidates,localVersion,localRevision=0){
  let next=null;
  for(const info of candidates){
    const v=String(info.version||'');
    const rv=Number(info.release_revision||0);
    const localCmp=compareVersion(v,localVersion);
    if(localCmp<0 || (localCmp===0 && rv<=localRevision)) continue;

    if(next===null){
      next=info;
      continue;
    }

    const nextCmp=compareVersion(v,next.version);
    if(nextCmp<0 || (nextCmp===0 && rv<Number(next.release_revision||0))){
      next=info;
    }
  }
  return next;
}

const history=[
  {version:'1.2.5',release_revision:1},
  {version:'1.2.4',release_revision:1},
  {version:'1.2.3',release_revision:1},
  {version:'1.2.2',release_revision:1},
  {version:'1.2.1',release_revision:15},
  {version:'1.1.119',release_revision:1},
  {version:'1.1.117',release_revision:1},
  {version:'1.1.116',release_revision:1},
  {version:'1.1.100',release_revision:1},
  {version:'1.1.99',release_revision:1},
  {version:'1.1.98',release_revision:1},
  {version:'1.1.97',release_revision:1}
];

assert.strictEqual(pick(history,'1.1.97').version,'1.1.98');
assert.strictEqual(pick(history,'1.1.99').version,'1.1.100');
assert.strictEqual(pick(history,'1.1.116').version,'1.1.117');
assert.strictEqual(pick(history,'1.1.119').version,'1.2.1');
assert.strictEqual(pick(history,'1.2.1',15).version,'1.2.2');
assert.strictEqual(pick(history,'1.2.4').version,'1.2.5');

assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number.isInteger(version.release_revision) && version.release_revision>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);
assert(manifest.files.includes('tests/update-sequential-release-selection-133.cjs'));
assert(workflow.includes('node tests/update-sequential-release-selection-133.cjs'));

console.log('PASS: sequential next-release selection and no-skip contract');
