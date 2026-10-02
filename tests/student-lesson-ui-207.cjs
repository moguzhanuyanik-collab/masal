'use strict';

const fs=require('fs');
const assert=require('assert');

const audio=fs.readFileSync('global-audio-feedback.js','utf8');
const index=fs.readFileSync('index.php','utf8');
const css=fs.readFileSync('student-responsive-fix.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(audio.includes('const immediateNavigationControl=target=>'));
assert(audio.includes('sonraki(?:\\s+aşama)?|devam|ileri|ilerle|tamam|bitir'));
assert(audio.includes("target.closest('a[href],button,input,select,textarea,label,summary,[role=\"button\"],[role=\"link\"]"));
assert(audio.includes('disarmCard(armedCard);'));
assert(audio.includes('stopSpeech();'));

assert(index.includes("student-responsive-fix.css?v=<?=$assetVersion('student-responsive-fix.css')?>"));
assert(css.includes('display:flex!important'));
assert(css.includes('transform:none!important'));
assert(css.includes('flex:1 1 20%!important'));
assert(css.includes('width:20%!important'));
assert(css.includes('overflow-x:clip'));
assert(css.includes('.question-card'));
assert(css.includes('.answers'));
assert(css.includes('padding-bottom:calc(74px + env(safe-area-inset-bottom))'));
assert(workflow.includes('node tests/student-lesson-ui-207.cjs'));

assert.strictEqual(version.version,'1.2.80');
assert(Number(version.release_revision)>=11);
assert.strictEqual(release.version,version.version);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(manifest.release_revision,version.release_revision);
assert(manifest.files.includes('student-responsive-fix.css'));
assert(manifest.files.includes('tests/student-lesson-ui-207.cjs'));
assert.strictEqual(manifest.files.length,908);
assert.deepStrictEqual(manifest.files,[...manifest.files].sort());

console.log('PASS: student lesson navigation and responsive UI contract');
