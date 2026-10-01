'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('kurum-icerikleri.php','utf8');
const domain=fs.readFileSync('src/kurum_icerik_dashboard.php','utf8');
const css=fs.readFileSync('kurum-icerikleri-dashboard.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(page.includes("require __DIR__.'/src/kurum_icerik_dashboard.php';"),'institution content dashboard domain missing');
assert(page.includes('name="performans"'),'performance filter missing');
assert(/kic_contents\(\$pdo,\$institutionId,\$teacherId,\$type,\$publication(?:,\$groupId)?\)/.test(page),'institution content list must use dashboard domain with optional group scope');
assert(page.includes('kic_filter_performance($allContents,$performance)'),'performance filter pipeline missing');
assert(page.includes('kic_summary($contents)'),'dashboard summary missing');
assert(page.includes('Dikkat gereken yayın'),'attention summary stat missing');
assert(page.includes('Yanlış öğrenci cevabı'),'wrong answer summary missing');
assert(page.includes('Geciken öğrenci ödevi'),'overdue homework summary missing');
assert(page.includes('Soru doğruluğu'),'question accuracy summary missing');
assert(page.includes('Ödev tamamlama'),'homework completion summary missing');
assert(page.includes('kic_performance_label((string)$item[\'performans_durumu\'])'),'performance status badge missing');
assert(page.includes("<?=(int)$item['yanlis_sayisi']?> yanlış"),'question wrong count missing');
assert(page.includes("<?=(int)$item['geciken_sayisi']?> gecikti"),'homework overdue count missing');
assert(/kurum-icerikleri-dashboard\.css\?v=1\.2\.(?:2[8-9]|[3-9]\d)/.test(page),'dashboard stylesheet must be versioned at 1.2.28 or newer');

assert(domain.includes('function kic_contents('),'dashboard content provider missing');
assert(domain.includes("tk.kurum_id=oi.kurum_id"),'teacher membership must match content institution');
assert(domain.includes("oo.kurum_id=oi.kurum_id"),'teacher-student relation must match content institution');
assert(domain.includes("sk.kurum_id=oi.kurum_id"),'student membership must match content institution');
assert(domain.includes("oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL"),'selected target semantics missing');
assert(domain.includes("COUNT(DISTINCT CASE WHEN {$validTarget}"),'valid target aggregation missing');
assert(domain.includes("AND c.dogru=0 THEN o.id END) yanlis_sayisi"),'wrong answer aggregation missing');
assert(domain.includes("AND oi.teslim_tarihi<NOW()"),'overdue homework aggregation missing');
assert(domain.includes('function kic_performance_state('),'performance state helper missing');
assert(domain.includes("return 'attention';"),'attention state missing');
assert(domain.includes('function kic_filter_performance('),'performance filter helper missing');
assert(domain.includes('function kic_summary('),'dashboard summary helper missing');
assert(domain.includes("$summary['question_accuracy']"),'question accuracy calculation missing');
assert(domain.includes("$summary['homework_completion']"),'homework completion calculation missing');

assert(css.includes('.institution-performance-badge.attention'),'attention badge styling missing');
assert(css.includes('.institution-performance-stats'),'performance summary styling missing');

assert(workflow.includes('node tests/institution-content-performance-153.cjs'),'source regression must run');
assert(workflow.includes('php tests/institution-content-performance-db-153.php'),'DB regression must run');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in 1.2.x line');
assert(Number(version.version.split('.')[2])>=28,'institution content performance dashboard requires 1.2.28 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.28.md',
  'src/kurum_icerik_dashboard.php',
  'kurum-icerikleri-dashboard.css',
  'tests/institution-content-performance-153.cjs',
  'tests/institution-content-performance-db-153.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: institution content performance dashboard source contract');
