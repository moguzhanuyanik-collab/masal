'use strict';

const fs=require('fs');
const assert=require('assert');

const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const updater=fs.readFileSync('src/updater.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
function version_compare_like(a,b){
  const pa=String(a).split('.').map(Number), pb=String(b).split('.').map(Number);
  for(let i=0;i<3;i++){if((pa[i]||0)!==(pb[i]||0)) return (pa[i]||0)>(pb[i]||0);}
  return true;
}

assert(version_compare_like(version.version,'1.2.1'),'version must be 1.2.1 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number.isInteger(version.release_revision) && version.release_revision>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const required of [
  'RELEASE-1.1.98.md',
  'RELEASE-1.1.99.md',
  'RELEASE-1.1.100.md',
  'RELEASE-1.1.101.md',
  'RELEASE-1.1.102.md',
  'RELEASE-1.1.103.md',
  'RELEASE-1.1.104.md',
  'RELEASE-1.1.105.md',
  'RELEASE-1.1.106.md',
  'RELEASE-1.1.107.md',
  'RELEASE-1.1.108.md',
  'RELEASE-1.1.109.md',
  'RELEASE-1.1.110.md',
  'RELEASE-1.1.111.md',
  'RELEASE-1.1.112.md',
  'RELEASE-1.1.113.md',
  'RELEASE-1.1.114.md',
  'RELEASE-1.1.115.md',
  'RELEASE-1.1.116.md',
  'RELEASE-1.1.117.md',
  'RELEASE-1.1.119.md',
  'RELEASE-1.2.1.md',
  'database/migrations/064_adimbot_rate_limit_ve_migration_checkpoint.sql',
  'database/migrations/065_kurum_bazli_eslestirme_izolasyonu.sql',
  'database/migrations/066_kurum_eslestirme_schema_guard.sql',
  'tests/tenant-isolation-114.cjs',
  'tests/tenant-isolation-db-115.php',
  'tests/tenant-schema-guard-116.cjs',
  'tests/tenant-matching-crud-117.cjs',
  'tests/update-recovery-119.cjs'
]) {
  assert(manifest.files.includes(required), 'Managed manifest missing: '+required);
  assert(fs.existsSync(required), 'Recovered file missing from tree: '+required);
}

assert(updater.includes('ILKADIM_UPDATER_CORE_GENERATION = 121'));
assert(updater.includes('function github_branch_head_sha'));
const nextStart=updater.indexOf('function next_remote_version_info(');
const nextEnd=updater.indexOf('\nfunction ',nextStart+10);
const nextBlock=updater.slice(nextStart,nextEnd);
assert(nextBlock.includes('/commits?sha='));
assert(nextBlock.includes('release_identity_should_replace_next($info,$next)'));
assert(!nextBlock.includes('return remote_release_info($gh);'));
assert(updater.includes('ILKADIM_ALLOW_SAFE_TENANT_SCHEMA_ALTER'));
assert(!updater.includes('recovery_bridge_target_info'));
assert(workflow.includes('node tests/update-recovery-119.cjs'));
assert(workflow.includes('node tests/rebuild-release-121.cjs'));

console.log('PASS: 1.2.1 full recovery-line reconstruction contract');
