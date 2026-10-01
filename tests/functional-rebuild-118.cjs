'use strict';

const fs=require('fs');
const assert=require('assert');

const read=p=>fs.readFileSync(p,'utf8');
const updater=read('src/updater.php');
const auth=read('src/auth.php');
const normalized=read('src/normalized.php');
const activities=read('api/activities.php');
const activityClient=read('activities-extra.js');
const state=read('api/state.php');
const report=read('api/report.php');
const v4=read('api/v4-features.php');
const teacher=read('ogretmen-paneli.php');
const parent=read('veli-paneli.php');
const matching=read('src/kurumlar_modulu.php');
const matchingApi=read('api/kurumlar-modulu.php');
const rate=read('src/adimbot_rate_limit.php');
const chat=read('api/adimbot-ai.php');
const voice=read('api/adimbot-transcribe.php');
const migration064=read('database/migrations/064_adimbot_rate_limit_ve_migration_checkpoint.sql');
const migration065=read('database/migrations/065_kurum_bazli_eslestirme_izolasyonu.sql');
const migration066=read('database/migrations/066_kurum_eslestirme_schema_guard.sql');
const workflow=read('.github/workflows/quality.yml');
const version=JSON.parse(read('version.json'));
const release=JSON.parse(read('update-release.json'));
const manifest=JSON.parse(read('update-managed-files.json'));

assert(rate.includes('function adimbot_rate_limit_check_and_record'));
assert(rate.includes("'student_ip'") && rate.includes("'student'") && rate.includes("'ip'"));
assert(chat.includes('adimbot_rate_limit_check_and_record('));
assert(voice.includes('adimbot_rate_limit_check_and_record('));
assert(migration064.includes('CREATE TABLE IF NOT EXISTS adimbot_rate_limitleri'));

assert(activities.includes("verify_csrf($_SERVER['HTTP_X_CSRF_TOKEN'] ?? null)"));
assert(activities.includes("'csrf'=>csrf_token()"));
assert(activityClient.includes("'X-CSRF-Token':csrfToken"));
assert(state.includes('verify_csrf('));
assert(state.includes("'csrf'=>csrf_token()"));

assert(report.includes('normalized_student_curriculum'));
assert(report.includes('sinif_dersleri'));
assert(v4.includes('normalized_student_curriculum'));
assert(v4.includes('sinif_dersleri'));

assert(teacher.includes('auth_accessible_student_ids'));
assert(parent.includes('auth_accessible_student_ids'));
assert(auth.includes('function auth_accessible_student_ids'));
assert(auth.includes('function require_api_student_access'));
assert(auth.includes('INNER JOIN kurumlar k ON k.id=kk.kurum_id AND k.aktif=1'),
  'Aktif olmayan kurum, kullanıcı kurum kapsamına dahil edilmemeli.');

assert(normalized.includes('function normalized_student_curriculum'));
assert(matching.includes("function km_save_matching"));
assert(matching.includes('kurum_id'));
assert(matchingApi.includes("section==='eslestirme'"));
assert(migration065.includes('veli_ogrenci'));
assert(migration065.includes('ogretmen_ogrenci'));
assert(migration066.includes('__ilkadim_tenant_relation_schema_guard_failed__'));

assert(updater.includes('ILKADIM_UPDATER_CORE_GENERATION'));
assert(updater.includes('run_legacy_1_1_97_to_1_2_1_recovery'));
assert(updater.includes('065_kurum_bazli_eslestirme_izolasyonu'));
assert(updater.includes('066_kurum_eslestirme_schema_guard'));

assert.strictEqual(version.version,'1.2.11');
assert.strictEqual(release.version,'1.2.11');
assert.strictEqual(manifest.version,'1.2.11');
assert.strictEqual(version.release_revision,1);
assert.strictEqual(release.release_revision,1);
assert.strictEqual(manifest.release_revision,1);

assert(manifest.files.includes('RELEASE-1.2.11.md'));
assert(manifest.files.includes('tests/functional-rebuild-118.cjs'));
assert(workflow.includes('node tests/functional-rebuild-118.cjs'));

console.log('PASS: 1.2.11 functional rebuild contract');
