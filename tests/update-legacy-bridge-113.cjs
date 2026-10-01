'use strict';
const fs=require('fs');
const assert=require('assert');
for(const path of ['src/updater.php','tools/updater-1.1.98-rescue.php']){
  const s=fs.readFileSync(path,'utf8');
  const a=s.indexOf('function repair_legacy_institution_membership_schema');
  const b=s.indexOf('function retired_automatic_migrations',a);
  const block=s.slice(a,b);
  assert(block.includes('legacy_membership_profile_user_id'));
  assert(block.includes('legacy_membership_manager_user_id'));
  assert(block.includes('kurum_kullanicilari_v4_bridge'));
  assert(block.includes('kurum_kullanicilari_legacy_197_backup'));
  assert(block.includes('RENAME TABLE kurum_kullanicilari TO'));
  assert(block.includes('REFERENCED_TABLE_NAME=\'kurum_kullanicilari\''));
  assert(block.includes('Legacy kurum üyeliği kullanıcı eşlemesi çözülemedi'));
  assert(!block.includes('DROP TABLE kurum_kullanicilari\''));
}
const rescue=fs.readFileSync('tools/updater-1.1.98-rescue.php','utf8');
const transition=rescue.indexOf("if(is_1_1_98_rescue_transition");
const repair=rescue.indexOf('repair_legacy_institution_membership_schema($pdo);',transition);
const recovery=rescue.indexOf('apply_1_1_98_recovery($pdo,$sourceRoot)',transition);
assert(transition>=0 && repair>transition && recovery>repair);
console.log('PASS: 1.1.97 lossless institution bridge contract');
