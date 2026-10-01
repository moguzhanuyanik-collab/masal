'use strict';

const fs=require('fs');
const assert=require('assert');
const cp=require('child_process');

const pkg=JSON.parse(fs.readFileSync('RECOVERY-1.1.97-1.2.1-PACKAGE.json','utf8'));
const updater=fs.readFileSync('src/updater.php','utf8');
const rescue=fs.readFileSync('rescue-1.1.97-to-1.1.98.php','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

function git(args){return cp.execFileSync('git',args,{encoding:'utf8'}).trim();}

assert.strictEqual(pkg.baseline.version,'1.1.97');
assert.strictEqual(pkg.baseline.commit,'be2651c5e375e3b54c0735d7283820a6ec9eb581');
assert.strictEqual(pkg.source.version,'1.2.1');
assert.strictEqual(pkg.source.release_revision,15);
assert.strictEqual(pkg.source.commit,'6a0f372871e6dbd2b71d2efef121fbf2dfb2f82c');
assert.strictEqual(pkg.source.source_tree,'9665e2754d02db81f8ca07a97b95506397103e1e');
assert.strictEqual(git(['show','-s','--format=%T',pkg.source.commit]),pkg.source.source_tree);
assert.doesNotThrow(()=>git(['merge-base','--is-ancestor',pkg.baseline.commit,pkg.source.commit]));
assert.strictEqual(Number(git(['rev-list','--count',pkg.baseline.commit+'..'+pkg.source.commit])),30);

assert(updater.includes("const ILKADIM_LEGACY_097_RECOVERY_121_COMMIT='"+pkg.source.commit+"';"));
assert(updater.includes("const ILKADIM_LEGACY_097_RECOVERY_121_SOURCE_TREE='"+pkg.source.source_tree+"';"));
assert(updater.includes("const ILKADIM_LEGACY_097_RECOVERY_121_RELEASE_REVISION=15;"));
assert(updater.includes('function github_commit_tree_sha'));
assert(rescue.includes("const ILKADIM_LEGACY_097_TARGET_COMMIT='"+pkg.source.commit+"';"));

assert.strictEqual(version.version,'1.2.16');
assert.strictEqual(release.version,'1.2.16');
assert.strictEqual(manifest.version,'1.2.16');
assert.strictEqual(version.release_revision,1);
assert.strictEqual(release.release_revision,1);
assert.strictEqual(manifest.release_revision,1);
assert(manifest.files.includes('RECOVERY-1.1.97-1.2.1-PACKAGE.json'));
assert(manifest.files.includes('tests/recovery-package-lock-142.cjs'));

console.log('PASS: 1.1.97 -> 1.2.1 immutable recovery package lock');
