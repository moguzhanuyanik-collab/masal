'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('veli-icerikleri.php','utf8');
const domain=fs.readFileSync('src/veli_icerik_dashboard.php','utf8');
const parentDomain=fs.readFileSync('src/veli_icerikleri.php','utf8');
const css=fs.readFileSync('veli-icerikleri-dashboard.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(page.includes("require __DIR__.'/src/veli_icerik_dashboard.php';"),'parent performance domain missing');
assert(page.includes('name="durum"'),'parent content status filter missing');
assert(page.includes("['tum','attention','waiting','completed','info']"),'parent supported status filters missing');
assert(page.includes('vpd_summary($allContents)'),'parent performance summary missing');
assert(page.includes('vpd_filter($allContents,$statusFilter)'),'parent status filter pipeline missing');
assert(page.includes('Dikkat gereken'),'attention filter/stat missing');
assert(page.includes('Bekleyen'),'waiting filter/stat missing');
assert(page.includes('Yanlış soru'),'wrong question stat missing');
assert(page.includes('Geciken ödev'),'overdue homework stat missing');
assert(page.includes('vpd_item_status($item)'),'parent cards must use normalized status');
assert(page.includes('vpd_status_label($normalizedStatus)'),'parent cards must show normalized status label');
assert(page.includes('veli-icerikleri-dashboard.css?v=1.2.29'),'parent performance stylesheet must be versioned');

assert(domain.includes('function vpd_item_status('),'parent item status helper missing');
assert(domain.includes("return (int)($item['cevap_dogru']??0)===1?'completed':'attention';"),'wrong question must map to attention');
assert(domain.includes("if((new DateTimeImmutable($due))<$now) return 'attention';"),'overdue homework must map to attention');
assert(domain.includes("return 'info';"),'informational content status missing');
assert(domain.includes('function vpd_filter('),'parent status filter helper missing');
assert(domain.includes('function vpd_summary('),'parent dashboard summary helper missing');
assert(domain.includes("$summary['attention']++"),'attention summary aggregation missing');
assert(domain.includes("$summary['question_accuracy']"),'question accuracy summary missing');
assert(domain.includes("$summary['homework_completion']"),'homework completion summary missing');

assert(parentDomain.includes('vo.kurum_id=oi.kurum_id'),'parent-child relation tenant guard must remain intact');
assert(parentDomain.includes("vk.kurum_id=oi.kurum_id"),'parent membership tenant guard must remain intact');
assert(parentDomain.includes("sk.kurum_id=oi.kurum_id"),'student membership tenant guard must remain intact');
assert(parentDomain.includes('oo.kurum_id=oi.kurum_id'),'teacher-student tenant guard must remain intact');

assert(css.includes('.parent-content-performance-stats'),'parent performance stats styling missing');
assert(css.includes('.parent-content-status.info'),'informational status styling missing');

assert(workflow.includes('node tests/parent-content-performance-154.cjs'),'source regression must run');
assert(workflow.includes('php tests/parent-content-performance-db-154.php'),'DB regression must run');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in 1.2.x line');
assert(Number(version.version.split('.')[2])>=29,'parent content performance dashboard requires 1.2.29 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.29.md',
  'src/veli_icerik_dashboard.php',
  'veli-icerikleri-dashboard.css',
  'tests/parent-content-performance-154.cjs',
  'tests/parent-content-performance-db-154.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: parent content performance dashboard source contract');
