'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ogretmen_icerik.php','utf8');
const page=fs.readFileSync('ogretmenim.php','utf8');
const css=fs.readFileSync('ogretmenim.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('?bool &$alreadyCompleted=null'),'answer helper must expose already-completed state');
assert(domain.includes("$alreadyCompleted=false;"),'already-completed output must initialize false');
assert(domain.includes("if($content['secilen_cevap_indeksi']!==null && (int)($content['cevap_dogru']??0)===1)"),'correct-answer early lock missing');
assert(domain.includes("$alreadyCompleted=true;\n        return true;"),'correct-answer lock must return without rewriting answer');
assert(domain.includes("secilen_cevap_indeksi=IF(dogru=1,secilen_cevap_indeksi,VALUES(secilen_cevap_indeksi))"),'upsert must preserve selected answer after correct');
assert(domain.includes("deneme_sayisi=IF(dogru=1,deneme_sayisi,deneme_sayisi+1)"),'attempt count must freeze after correct');
assert(domain.includes("dogru=IF(dogru=1,1,VALUES(dogru))"),'correct state must be monotonic');

assert(page.includes('$alreadyCompleted=false;'),'student answer flow must receive lock state');
assert(page.includes('Bu soruyu zaten doğru tamamladın. Sonucun korunuyor.'),'repeat-submit feedback missing');
assert(page.includes('<?php if(!$answerCorrect):?>'),'answer form must only show while unresolved');
assert(page.includes('teacher-question-locked'),'correct question locked-state UI missing');
assert(page.includes('Doğru sonucun ve kazandığın yıldız korunuyor.'),'locked-state explanation missing');
assert(page.includes('input type="radio" disabled'),'locked options must be non-interactive');
assert(page.includes('ogretmenim.css?v=1.2.25'),'teacher page CSS cache version must be 1.2.25');

assert(css.includes('.teacher-question-locked'),'correct-question lock styling missing');
assert(css.includes('.teacher-option.locked'),'locked option styling missing');

assert(workflow.includes('node tests/teacher-question-correct-lock-150.cjs'),'source regression must run in quality gate');
assert(workflow.includes('php tests/teacher-question-correct-lock-db-150.php'),'DB regression must run in quality gate');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in 1.2.x line');
assert(Number(version.version.split('.')[2])>=25,'correct-answer lock requires 1.2.25 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.25.md',
  'tests/teacher-question-correct-lock-150.cjs',
  'tests/teacher-question-correct-lock-db-150.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: teacher question correct-answer lock source contract');
