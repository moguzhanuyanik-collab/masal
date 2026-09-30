'use strict';

const fs=require('fs');
const assert=require('assert');

const updater=fs.readFileSync('src/updater.php','utf8');
const auth=fs.readFileSync('src/auth.php','utf8');
const config=fs.readFileSync('config/app.php','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));

const retired=[
  '000_v3_kurum_kullanicilari_onarim',
  '007_icerik_paketi_geri_al',
  '024_tek_aktif_super_admin',
  '025_tek_super_admin_sert_temizlik',
  '026_tek_aktif_super_admin_duzeltme',
  '027_tek_super_admin_kesin_sifirlama',
  '028_legacy_kurum_fk_temizlik',
  '032_test_ilerleme_sifirlama'
];

const stripSqlComments=value=>String(value)
  .replace(/\/\*[\s\S]*?\*\//g,' ')
  .replace(/^\s*--.*$/gm,' ');

for(const name of retired){
  assert(updater.includes("'"+name+"'=>true"),'retired list missing '+name);
  const path='database/migrations/'+name+'.sql';
  const sql=stripSqlComments(fs.readFileSync(path,'utf8')).replace(/`/g,'');
  assert(!/\b(?:DROP|TRUNCATE)\s+TABLE\b/i.test(sql),name+' still drops/truncates tables');
  assert(!/\bDELETE\s+FROM\b/i.test(sql),name+' still deletes data');
  assert(!/\bUPDATE\s+[A-Za-z0-9_]+\s+SET\s+aktif\s*=\s*0\b/i.test(sql),name+' still disables all records');
}

assert(updater.includes("SELECT COUNT(*) FROM kurum_kullanicilari"));
assert(updater.includes("if($rowCount>0)"));
assert(updater.includes("assert_automatic_migration_safe($name,$file)"));
assert(updater.includes("$rel==='config/local.php'||$rel==='.env'||str_starts_with($rel,'storage/')"));

assert(auth.includes("'email_ip'"));
assert(auth.includes("INSERT IGNORE INTO giris_guvenlik"));
assert(auth.includes("'email_ip'=>[5,600]"));
assert(auth.includes("'email'=>[20,600]"));
assert(auth.includes("'ip'=>[30,900]"));
assert(auth.includes("login_rate_failure_failed"));

const preserve=config.match(/'preserve'\s*=>\s*\[([\s\S]*?)\]/);
assert(preserve,'preserve list missing');
assert(!preserve[1].includes("'styles.css'"));
assert(!preserve[1].includes("'app-style.css'"));
assert(!preserve[1].includes("'features-style.css'"));

assert(/^1\.1\.(?:9[3-9]|[1-9][0-9]{2,})$/.test(String(version.version)),'version must be 1.1.93 or newer');

console.log('1.1.93 migration and login safety checks passed');
