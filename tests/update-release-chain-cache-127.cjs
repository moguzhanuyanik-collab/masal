'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const page=fs.readFileSync('guncelleme.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(updater.includes('function release_chain_cache_path'));
assert(updater.includes('function release_chain_cache_secret_path'));
assert(updater.includes('function release_chain_cache_secret'));
assert(updater.includes('function release_chain_cache_read'));
assert(updater.includes('function release_chain_cache_write'));
assert(updater.includes('function build_release_chain_cache'));
assert(updater.includes('function select_next_release_from_chain'));
assert(updater.includes('function latest_release_from_chain'));
assert(updater.includes('hash_hmac'));
assert(updater.includes('release-chain-secret'));
assert(updater.includes('release-chain-cache.json'));
assert(updater.includes('github_branch_head_sha($gh)'));
assert(updater.includes('path=update-release.json'));
assert(updater.includes('release_identity_should_replace_next'));
assert(updater.includes("'update-managed-files.json'"),'managed manifest identity must be remotely readable');
assert(updater.includes('function remote_managed_manifest_info_at_ref'),'managed manifest metadata helper missing');
assert(updater.includes('function release_candidate_metadata_consistent'),'release metadata consistency guard missing');
assert(updater.includes('release_candidate_metadata_consistent($gh,$next)'),'next release must validate all metadata files');
assert(updater.includes('$validatedChain=array_values($chain)'),'invalid historical anchors must be removable without mutating cache');

assert(updater.includes('$root!==null'));
assert(page.includes('next_remote_version_info($gh,$local,$localRevision,__DIR__)'));
assert(page.includes('next_remote_version_info($gh,$newLocal,$newLocalRevision,__DIR__)'));

assert.strictEqual(version.version,release.version);
assert.strictEqual(version.version,manifest.version);
assert(/^1\.2\.\d+$/.test(version.version),'final release must remain on the 1.2.x line');
assert(Number.isInteger(version.release_revision) && version.release_revision>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);
assert(manifest.files.includes('tests/update-release-chain-cache-127.cjs'));
assert(manifest.files.includes('tests/update-release-chain-cache-127.php'));
assert(workflow.includes('php tests/update-release-chain-cache-127.php'));
assert(workflow.includes('node tests/update-release-chain-cache-127.cjs'));

console.log('PASS: 1.2.1 release-chain HMAC cache regression contract');
