'use strict';

const fs=require('fs');
const assert=require('assert');

const index=fs.readFileSync('index.php','utf8');
const retiredReset=fs.readFileSync('test-progress-reset.js','utf8');
const persistence=fs.readFileSync('student-progress-persistence.js','utf8');
const state=fs.readFileSync('api/state.php','utf8');
const bootstrap=fs.readFileSync('api/bootstrap.js.php','utf8');
const activities=fs.readFileSync('api/activities.php','utf8');
const activityUi=fs.readFileSync('activities-extra.js','utf8');
const curriculum=fs.readFileSync('curriculum-menu-bridge.js','utf8');
const migration=fs.readFileSync('database/migrations/092_ogrenci_etkinlik_ilerleme.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(!index.includes('test-progress-reset.js'),'production index must not load the historical reset script');
assert(index.includes("student-progress-persistence.js?v=<?=$assetVersion('student-progress-persistence.js')?>"));
assert(index.indexOf('student-progress-persistence.js')<index.indexOf('app-runtime.js'),'progress protection must load before app runtime');

assert(retiredReset.includes('RETIRED'));
assert(!retiredReset.includes('state.steps=[]'));
assert(!retiredReset.includes('state.attempts=[]'));
assert(!retiredReset.includes('indexedDB.deleteDatabase'));

assert(persistence.includes("const RESET_MARKER='ilkadim-explicit-progress-reset'"));
assert(persistence.includes("target.closest('#confirm-reset')"));
assert(persistence.includes('payload.reset_progress=true'));

assert(state.includes('function persisted_student_progress('));
assert(state.includes('function merge_student_progress('));
assert(state.includes("$explicitReset=($payload['reset_progress']??false)===true"));
assert(state.includes('if(!$explicitReset)'));
assert(state.includes("SELECT ders_kodu,modul_indeksi FROM ogrenci_ilerleme"));
assert(state.includes("SELECT oyun_kodu FROM oyun_tamamlamalari"));
assert(state.includes("SELECT ders_kodu,soru_anahtari,secilen_cevap,dogru,sure_ms,cevap_tarihi FROM ogrenci_cevaplari"));

assert(bootstrap.includes('$questionStepMap=[]'));
assert(bootstrap.includes("'stepKey'=>$stepKey"));
assert(bootstrap.includes('isset($questionStepMap[$lessonCode][$attemptKey])'));
assert(bootstrap.includes("ON DUPLICATE KEY UPDATE tamamlandi=1"));
assert(bootstrap.includes('[IlkAdim][bootstrap-progress-heal]'));

assert(activities.includes('etkinlik_ilerleme'));
assert(activities.includes("'next_round'"));
assert(activities.includes('sonraki_soru_indeksi=GREATEST'));
assert(activities.includes('reset_progress'));

assert(activityUi.includes("const PROGRESS_STORE='ilkadim-extra-game-progress-v2'"));
assert(activityUi.includes('function postProgress('));
assert(activityUi.includes('g.resumeRound'));
assert(activityUi.includes('postProgress(g.id,nextRound,finalRound,false)'));
assert(activityUi.includes('Bu etkinliği tamamladın'));
assert(activityUi.includes('tekrar yapmak zorunda değilsin'));
assert(activityUi.includes('const nativeReplayAllowed=new Set()'));
assert(activityUi.includes('data.ilkadimCompletedNative') || activityUi.includes('dataset.ilkadimCompletedNative'));
assert(activityUi.includes("target.closest('.game-list a[href^=\"#/oyun/\"]')"));
assert(activityUi.includes('showNativeCompleted(gameId)'));
assert(activityUi.includes("nativeReplayAllowed.add(gameId)"));

assert(curriculum.includes("indexes.find(index=>!completed.has(String(lesson.id)+'-'+index))"),'curriculum entry must target first incomplete question');

assert(migration.includes('CREATE TABLE IF NOT EXISTS etkinlik_ilerleme'));
assert(migration.includes("SET @ogrenci_id_type=("));
assert(migration.includes("COLUMN_TYPE"));
assert(migration.includes('UNIQUE KEY uk_etkinlik_ilerleme (ogrenci_id,oyun_kodu)'));
assert(migration.includes('sonraki_soru_indeksi'));
assert(migration.includes('ON DUPLICATE KEY UPDATE tamamlandi=1'));
assert(!/DELETE\s+FROM\s+oyun_tamamlamalari/i.test(migration));

assert(workflow.includes('node tests/student-progress-persistence-209.cjs'));
assert(workflow.includes('php tests/student-progress-persistence-db-209.php'));

const versionParts=String(version.version).split('.').map(Number);
assert(versionParts.length===3 && versionParts[0]===1 && versionParts[1]===2 && versionParts[2]>=82);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.version,version.version);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(manifest.release_revision,version.release_revision);
for(const path of [
  'student-progress-persistence.js',
  'database/migrations/092_ogrenci_etkinlik_ilerleme.sql',
  'tests/student-progress-persistence-209.cjs',
  'tests/student-progress-persistence-db-209.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);
assert(manifest.files.length>=914,'student progress managed-file baseline must be retained');
assert.deepStrictEqual(manifest.files,[...manifest.files].sort());

console.log('PASS: student progress is DB-backed, monotonic and resumable');
