'use strict';
const fs=require('fs');
const assert=require('assert');
const bridge=fs.readFileSync('rescue-1.1.97-to-1.1.98.php','utf8');
const canonical=fs.readFileSync('tools/updater-1.1.98-rescue.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
assert(bridge.includes("auth_effective_role($user)!=='super_admin'"));
assert(bridge.includes("verify_csrf($_POST['csrf']??null)"));
assert(bridge.includes("$installed!=='1.1.97'"));
assert(bridge.includes("rescue_atomic_restore($backup,$target)"));
assert(bridge.includes("'mode'=>'lossless-web-rescue'"));
assert(bridge.includes('kurum_kullanicilari_legacy_197_backup'));
assert(canonical.includes('kurum_kullanicilari_legacy_197_backup'));
assert(workflow.includes('tests/web-rescue-197-198-113.php'));
assert(workflow.includes('tests/web-rescue-197-198-113.cjs'));
{
 const parts=String(version.version).split('.').map(Number);
 assert(parts.length===3&&parts[0]===1&&parts[1]===1&&parts[2]>=113);
}
console.log('PASS: lossless web rescue source contract');
