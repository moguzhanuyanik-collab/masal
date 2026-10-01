'use strict';
const fs=require('fs');
const assert=require('assert');

const bridge=fs.readFileSync('rescue-1.1.97-to-1.1.98.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));

assert(bridge.includes("auth_effective_role($user)!=='super_admin'"));
assert(bridge.includes("verify_csrf($_POST['csrf']??null)"));
assert(bridge.includes("$installed!=='1.1.97'"));
assert(bridge.includes('rescue_branch_head_sha'));
assert(bridge.includes('rescue_ref_file'));
assert(bridge.includes('rescue_atomic_replace($payload,$target)'));
assert(bridge.includes("'mode'=>'direct-updater-core-recovery'"));
assert(bridge.includes("'database_changed'=>false"));
assert(bridge.includes("'migrations_run'=>false"));
assert(!bridge.includes('kurum_kullanicilari_legacy_197_backup'));
assert(!/\\b(?:DROP|TRUNCATE)\\s+TABLE\\b/i.test(bridge));
assert(!/\\bDELETE\\s+FROM\\b/i.test(bridge));
assert(workflow.includes('tests/web-rescue-197-198-113.php'));
assert(workflow.includes('tests/web-rescue-197-198-113.cjs'));
assert(/^1\.2\.\d+$/.test(String(version.version)) || /^1\.1\.(?:1(?:1[3-9])|[2-9]\d)$/.test(String(version.version)));

console.log('PASS: direct 1.1.97 web rescue source contract');
