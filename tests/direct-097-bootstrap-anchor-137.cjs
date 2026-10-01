'use strict';

function version_compare_118(a,b){const A=a.split('.').map(Number),B=b.split('.').map(Number);for(let i=0;i<3;i++){if((A[i]||0)!==(B[i]||0))return (A[i]||0)-(B[i]||0);}return 0;}

const fs=require('fs');
const assert=require('assert');

const rescue=fs.readFileSync('rescue-1.1.97-to-1.1.98.php','utf8');
const updater=fs.readFileSync('src/updater.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

const bootstrap='2c86df240cde635812e12d35cafbb10fe99471d1';
const target='6a0f372871e6dbd2b71d2efef121fbf2dfb2f82c';

assert(rescue.includes("const ILKADIM_LEGACY_097_BOOTSTRAP_COMMIT='"+bootstrap+"';"));
assert(rescue.includes("const ILKADIM_LEGACY_097_TARGET_COMMIT='"+target+"';"));
assert(rescue.includes('function rescue_bootstrap_commit'));
assert(rescue.includes('$targetCommit=rescue_bootstrap_commit();'));
assert(!rescue.includes('$targetCommit=rescue_branch_head_sha($gh);'));
assert(!rescue.includes('rescue_validate_historical_chain($gh);'));
assert(rescue.includes("$targetVersion!=='1.2.9'"));
assert(rescue.includes("'bootstrap_commit'=>ILKADIM_LEGACY_097_BOOTSTRAP_COMMIT"));
assert(rescue.includes("'target_121_commit'=>ILKADIM_LEGACY_097_TARGET_COMMIT"));
assert(rescue.includes("const ILKADIM_LEGACY_097_RECOVERY_121_COMMIT='6a0f372871e6dbd2b71d2efef121fbf2dfb2f82c';"));

assert(updater.includes("const ILKADIM_LEGACY_097_RECOVERY_121_COMMIT='"+target+"';"));
assert(updater.includes("if($localVersion==='1.1.97'){"));
assert(workflow.includes('node tests/direct-097-bootstrap-anchor-137.cjs'));

assert(version_compare_118(String(version.version),'1.2.10')>=0);
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(version.release_revision,1);
assert.strictEqual(release.release_revision,1);
assert.strictEqual(manifest.release_revision,1);
assert(manifest.files.includes('RELEASE-1.2.10.md'));
assert(manifest.files.includes('tests/direct-097-bootstrap-anchor-137.cjs'));

console.log('PASS: immutable 1.1.97 bootstrap -> 1.2.1 direct recovery anchor contract');
