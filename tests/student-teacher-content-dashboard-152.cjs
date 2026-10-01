'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('ogretmenim.php','utf8');
const domain=fs.readFileSync('src/ogrenci_ogretmenim_dashboard.php','utf8');
const css=fs.readFileSync('ogretmenim-dashboard.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(page.includes("require __DIR__.'/src/ogrenci_ogretmenim_dashboard.php';"),'student teacher-content dashboard domain missing');
assert(page.includes('std_institutions($contents)'),'institution options must derive from accessible content');
assert(page.includes('name="kurum_id"'),'institution filter missing');
assert(page.includes('name="tur"'),'content type filter missing');
assert(page.includes('name="durum"'),'status filter missing');
assert(page.includes("http_response_code(403);\n    echo 'Bu kurum için aktif öğretmen içeriği erişimin yok.'"),'foreign institution filter must be rejected');
assert(page.includes('std_summary($institutionContents)'),'dashboard summary missing');
assert(page.includes('std_filter_contents($institutionContents,0,$typeFilter,$statusFilter)'),'combined filter pipeline missing');
assert(page.includes('Soru doğruluğu'),'question accuracy stat missing');
assert(page.includes('Tamamlanan ödev'),'homework completion stat missing');
assert(page.includes('Dikkat gereken'),'attention stat/filter missing');
assert(page.includes('std_item_status($item)'),'content cards must expose normalized status');
assert(page.includes('std_status_label($itemStatus)'),'content cards must show status label');
assert(page.includes('action="ogretmenim.php<?=$filterQuery!==\'\'?\'?\'.oi_h($filterQuery):\'\'?>"'),'answer form must preserve active filters');
assert(page.includes('ogretmenim-dashboard.css?v=1.2.27'),'dashboard stylesheet must be versioned');

assert(domain.includes('function std_institutions('),'student content institution provider missing');
assert(domain.includes('function std_item_status('),'content status helper missing');
assert(domain.includes("if($type==='soru')"),'question status semantics missing');
assert(domain.includes("if($type==='odev')"),'homework status semantics missing');
assert(domain.includes("return (int)($item['cevap_dogru']??0)===1?'completed':'attention';"),'wrong question must be attention');
assert(domain.includes("if((new DateTimeImmutable($due))<$now) return 'attention';"),'overdue homework must be attention');
assert(domain.includes('function std_filter_contents('),'combined content filter helper missing');
assert(domain.includes("['tum','waiting','attention','completed','info']"),'supported status filters missing');
assert(domain.includes('function std_summary('),'student content summary helper missing');
assert(domain.includes("$summary['question_accuracy']"),'question accuracy calculation missing');
assert(domain.includes("$summary['homework_completion']"),'homework completion calculation missing');
assert(domain.includes("$summary['attention']=$summary['question_wrong']+$summary['homework_overdue'];"),'attention aggregation missing');

assert(css.includes('.teacher-dashboard'),'dashboard styling missing');
assert(css.includes('.teacher-dashboard-filter'),'filter styling missing');
assert(css.includes('.teacher-status.bad'),'attention status styling missing');

assert(workflow.includes('node tests/student-teacher-content-dashboard-152.cjs'),'source regression must run');
assert(workflow.includes('php tests/student-teacher-content-dashboard-db-152.php'),'DB regression must run');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in 1.2.x line');
assert(Number(version.version.split('.')[2])>=27,'student teacher-content dashboard requires 1.2.27 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.27.md',
  'src/ogrenci_ogretmenim_dashboard.php',
  'ogretmenim-dashboard.css',
  'tests/student-teacher-content-dashboard-152.cjs',
  'tests/student-teacher-content-dashboard-db-152.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: student teacher-content dashboard source contract');
