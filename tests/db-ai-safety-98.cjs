'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const limiter=fs.readFileSync('src/adimbot_rate_limit.php','utf8');
const chat=fs.readFileSync('api/adimbot-ai.php','utf8');
const voice=fs.readFileSync('api/adimbot-transcribe.php','utf8');
const migration=fs.readFileSync('database/migrations/064_adimbot_rate_limit_ve_migration_checkpoint.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));

const retired=new Set([
  '000_v3_kurum_kullanicilari_onarim',
  '007_icerik_paketi_geri_al',
  '024_tek_aktif_super_admin',
  '025_tek_super_admin_sert_temizlik',
  '026_tek_aktif_super_admin_duzeltme',
  '027_tek_super_admin_kesin_sifirlama',
  '028_legacy_kurum_fk_temizlik',
  '032_test_ilerleme_sifirlama'
]);

const historical=fs.readdirSync('database/migrations')
  .filter(name=>/^\d{3}_.+\.sql$/.test(name))
  .map(name=>name.replace(/\.sql$/,''))
  .filter(name=>{
    const number=Number(name.slice(0,3));
    return number>=1 && number<=63 && !retired.has(name);
  })
  .sort();

assert.strictEqual(historical.length,53,'Historical migration checkpoint size changed.');
for(const name of historical){
  assert(migration.includes("'"+name+"'"),'Checkpoint missing '+name);
}
assert(migration.includes('CREATE TABLE IF NOT EXISTS adimbot_rate_limitleri'));
assert(migration.includes('@ilkadim_expected_history = 53'));
assert(migration.includes('__ilkadim_migration_history_incomplete__'));

assert(limiter.includes('function adimbot_rate_limit_check_and_record'));
assert(limiter.includes("'student_ip'"));
assert(limiter.includes("'student'"));
assert(limiter.includes("'ip'"));
assert(limiter.includes('INSERT IGNORE INTO adimbot_rate_limitleri'));
assert(limiter.includes('FOR UPDATE'));
assert(limiter.includes('DELETE FROM adimbot_rate_limitleri'));

for(const source of [chat,voice]){
  assert(source.includes("adimbot_rate_limit.php"));
  assert(source.includes('adimbot_rate_limit_check_and_record('));
  assert(source.includes("'persistent'=>false"));
}
assert(chat.includes("$_SESSION['adimbot_ai_requests']"));
assert(voice.includes("$_SESSION['adimbot_voice_requests']"));

assert(updater.includes('function assert_historical_migration_history'));
assert(updater.includes("version_compare($localVersion,'1.1.98','<')"));
assert(updater.includes("run_pending_migrations($pdo,$sourceRoot,$localVersion)"));
assert(updater.includes("migration_sequence_number($name)>=65"));
assert(updater.includes('ILKADIM_ALLOW_TRANSACTIONAL_DELETE'));
assert(updater.includes('migration_should_run_transactionally'));

assert(workflow.includes('tests/adimbot-rate-limit-98.php'));
assert(workflow.includes('for file in tests/adimbot-*.cjs'));
assert(workflow.includes('tests/adimbot-transcript-behavior.php'));

assert(/^1\.1\.(?:9[8-9]|[1-9][0-9]{2,})$/.test(String(version.version)),'version must be 1.1.98 or newer');
console.log('1.1.98 DB and AI safety checks passed');
