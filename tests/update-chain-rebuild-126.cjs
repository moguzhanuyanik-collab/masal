'use strict';

const fs=require('fs');
const assert=require('assert');
const cp=require('child_process');

const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const updater=fs.readFileSync('src/updater.php','utf8');

const versionParts=String(version.version).split('.').map(Number);
const versionAtLeast123=versionParts[0]>1 || (versionParts[0]===1 && (versionParts[1]>2 || (versionParts[1]===2 && versionParts[2]>=3)));
assert(versionAtLeast123,'Release must remain 1.2.3 or newer.');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(version.release_revision,1);
assert.strictEqual(release.release_revision,1);
assert.strictEqual(manifest.release_revision,1);
assert(updater.includes('function github_branch_head_sha'));
assert(updater.includes('function remote_release_info(array $gh): array'));
assert(updater.includes('function run_legacy_1_1_97_to_1_2_1_recovery'));
assert(updater.includes('/commits?sha='));
assert(updater.includes("$historyFile=version_compare($localVersion,'1.1.101','>=')"));
assert(updater.includes('release_identity_should_replace_next($info,$next)'));
assert(updater.includes('Sıradaki güncelleme güvenli biçimde belirlenemedi.'));

const expected=[
 '1.1.97','1.1.98','1.1.99','1.1.100','1.1.101','1.1.102',
 '1.1.103','1.1.104','1.1.105','1.1.106','1.1.107','1.1.108',
 '1.1.109','1.1.110','1.1.111','1.1.112','1.1.113','1.1.114',
 '1.1.115','1.1.116','1.1.117','1.2.1','1.2.2','1.2.3','1.2.4','1.2.5','1.2.6'
];
const commits=cp.execFileSync('git',['log','--format=%H','--','version.json'],{encoding:'utf8'})
 .trim().split(/\s+/).filter(Boolean);
const versions=[];
const recoveryOnly=new Set(['1.1.119']);
for(const sha of commits){
 try{
  const raw=cp.execFileSync('git',['show',sha+':version.json'],{encoding:'utf8',stdio:['ignore','pipe','ignore']});
  const data=JSON.parse(raw);
  if(typeof data.version==='string' && data.version.trim()!=='') versions.push(data.version.trim());
 }catch(_){}
}
versions.reverse();
let cursor=0;
for(const v of versions){
 if(v===expected[cursor]) cursor++;
 if(cursor===expected.length) break;
}
assert.strictEqual(cursor,expected.length,'Sıralı 1.1.97 → 1.2.6 version.json commit zinciri eksik/bozuk: '+versions.slice(0,40).join(' → '));
assert(manifest.files.includes('tests/update-chain-rebuild-126.cjs'));
console.log('PASS: sequential rebuild and updater-chain integrity contract');
