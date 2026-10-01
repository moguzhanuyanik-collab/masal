'use strict';
const fs=require('fs');
const assert=require('assert');
const rescue=fs.readFileSync('tools/updater-1.1.98-rescue.php','utf8');
const apply=fs.readFileSync('tools/apply-updater-1.1.98-rescue.php','utf8');
const release=JSON.parse(fs.readFileSync('version.json','utf8'));
assert(rescue.includes("return $localVersion==='1.1.97' && $remoteVersion==='1.1.98';"));
assert(rescue.includes("apply_1_1_98_recovery"));
assert(rescue.includes("'064_adimbot_rate_limit_ve_migration_checkpoint'"));
assert(apply.includes("installed!=='1.1.97'"));
{
  const parts=String(release.version).split('.').map(Number);
  assert((parts.length===3 && parts[0]===1 && parts[1]===1 && Number.isInteger(parts[2]) && parts[2]>=110) || /^1\.2\.\d+$/.test(String(release.version)),'version must be 1.1.110 or newer');
}
console.log('1.1.110 1.1.98 rescue checks passed');
