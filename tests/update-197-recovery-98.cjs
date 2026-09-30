'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const migration=fs.readFileSync('database/migrations/001_197_history_recovery.sql','utf8');
const checkpoint=fs.readFileSync('database/migrations/064_adimbot_rate_limit_ve_migration_checkpoint.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));

const expected=[...checkpoint.matchAll(/'(\d{3}_[^']+)'/g)].map(m=>m[1]);
assert.strictEqual(new Set(expected).size,53,'Checkpoint must contain 53 historical migrations.');
for(const name of new Set(expected)){
  assert(migration.includes("('"+name+"')"),'Recovery bridge missing '+name);
}

assert(migration.includes("onceki_surumu='1.1.97'"));
assert(migration.includes("yeni_surumu='1.1.98'"));
assert(migration.includes("durum='basladi'"));
for(const table of ['giris_guvenlik','ders_bolumleri','ders_konulari','ders_sorulari','sinif_dersleri']){
  assert(migration.includes("'"+table+"'"),'Recovery preflight missing '+table);
}
assert(migration.includes('__ilkadim_197_recovery_precondition_failed__'));
assert(!/\b(?:DROP|TRUNCATE)\s+TABLE\b/i.test(migration));
assert(!/\bDELETE\s+FROM\b/i.test(migration));

assert(updater.includes("if($localVersion==='1.1.98')"));
assert(updater.includes("14db8cf61b633d81937346f41758b39bf09a1706"));
assert(updater.includes("!=='1.1.101'"));
assert(workflow.includes("'update-197-recovery-*'"));
assert(workflow.includes('tests/update-197-recovery-98.cjs'));
assert.strictEqual(version.version,'1.1.98');
assert.strictEqual(manifest.version,'1.1.98');
assert(manifest.files.includes('database/migrations/001_197_history_recovery.sql'));
assert(manifest.files.includes('tests/update-197-recovery-98.cjs'));

console.log('1.1.97 -> 1.1.98 recovery bridge checks passed');
