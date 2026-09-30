'use strict';
const fs=require('fs');
const assert=require('assert');

const bridge=fs.readFileSync('rescue-1.1.97-to-1.1.98.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));

assert(bridge.includes("auth_effective_role($user)!=='super_admin'"));
assert(bridge.includes("verify_csrf($_POST['csrf']??null)"));
assert(bridge.includes("$installed!=='1.1.97'"));
assert(bridge.includes("is_link($target)"));
assert(bridge.includes("hash_equals($oldHash,$backupHash)"));
assert(bridge.includes("rescue_atomic_restore($backup,$target)"));
assert(bridge.includes("'target_version'=>'1.1.98'"));
assert(workflow.includes('tests/web-rescue-197-198-113.php'));
assert(workflow.includes('tests/web-rescue-197-198-113.cjs'));
assert.strictEqual(version.version,'1.1.113');
console.log('PASS: 1.1.113 web rescue source contract');
