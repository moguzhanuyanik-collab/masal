'use strict';

const fs=require('fs');
const assert=require('assert');

const auth=fs.readFileSync('src/auth.php','utf8');
const status=fs.readFileSync('sistem-durum.php','utf8');
const homework=fs.readFileSync('ogretmen-odevleri.php','utf8');
const questions=fs.readFileSync('ogretmen-sorulari.php','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(auth.includes("require_once __DIR__.'/runtime_compat.php';"));
assert(status.includes('Fallback aktif'));
assert(homework.includes('[IlkAdim][teacher-homework-groups]'));
assert(questions.includes('[IlkAdim][teacher-question-groups]'));
assert.strictEqual(version.version,'1.2.80');
assert.strictEqual(version.release_revision,1);
assert.strictEqual(release.version,'1.2.80');
assert.strictEqual(release.release_revision,1);
assert.strictEqual(manifest.version,'1.2.80');
assert.strictEqual(manifest.release_revision,1);
assert(manifest.files.includes('src/runtime_compat.php'));
assert(manifest.files.includes('tests/runtime-page-health-205.php'));
assert(manifest.files.includes('tests/runtime-page-health-205.cjs'));
assert.strictEqual(manifest.files.length,906);
assert.deepStrictEqual(manifest.files,[...manifest.files].sort());

console.log('PASS: runtime page hardening contract');
