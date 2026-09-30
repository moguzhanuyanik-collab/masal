'use strict';
const fs=require('fs');
const assert=require('assert');

const repair=fs.readFileSync('tools/repair-1.1.97-memberships.php','utf8');
const rollback=fs.readFileSync('tools/rollback-1.1.97-memberships.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));

assert(repair.includes("installed!=='1.1.97'"));
assert(repair.includes('rescue197_collect_memberships'));
assert(repair.includes('Çözümlenemeyen legacy üyelikler bulundu; hiçbir değişiklik yapılmadı'));
assert(repair.includes('RENAME TABLE kurum_kullanicilari TO'));
assert(repair.includes('kurum_kullanicilari_legacy_backup_1_1_97'));
assert(repair.includes("--apply"));
assert(rollback.includes("installed!=='1.1.97'"));
assert(workflow.includes('tests/update-197-membership-bridge-113.php'));
assert(workflow.includes('tests/update-197-membership-bridge-113.cjs'));
assert.strictEqual(version.version,'1.1.113');
console.log('PASS: 1.1.113 legacy 1.1.97 bridge source contract');
