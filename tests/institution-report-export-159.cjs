'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('kurum-raporlari.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(page.includes("strtolower(trim((string)($_GET['format']??'')))==='csv'"),'CSV format switch missing');
assert(page.includes("header('Content-Type: text/csv; charset=UTF-8')"),'CSV content type missing');
assert(page.includes("header('X-Content-Type-Options: nosniff')"),'CSV nosniff header missing');
assert(page.includes('fwrite($out,"\\xEF\\xBB\\xBF")'),'Excel UTF-8 BOM missing');
assert(page.includes("fputcsv($out"),'CSV writer missing');
assert(page.includes("kr_csv_value("),'spreadsheet formula injection guard missing');
assert(page.includes("in_array($trimmed[0],['=','+','-','@'],true)"),'dangerous spreadsheet formula prefixes must be guarded');
assert(page.includes("kr_report_rows($pdo,$institutionId,$grade,$groupId,$start,$end)"),'export must reuse tenant-scoped report rows');
assert(page.includes('>CSV İndir</a>'),'CSV download action missing');
assert(page.includes("http_build_query($exportParams,'','&',PHP_QUERY_RFC3986)"),'export link must preserve filters safely');
assert(!page.includes("email','Sınıf"),'CSV must not add student e-mail as a new export column');

assert(workflow.includes('node tests/institution-report-export-159.cjs'),'CSV export source regression must run in quality gate');
assert.strictEqual(version.version,'1.2.34');
assert.strictEqual(release.version,'1.2.34');
assert.strictEqual(manifest.version,'1.2.34');
assert.strictEqual(version.release_revision,1);
assert.strictEqual(release.release_revision,1);
assert.strictEqual(manifest.release_revision,1);
for(const path of ['RELEASE-1.2.34.md','tests/institution-report-export-159.cjs']){
  assert(manifest.files.includes(path),'manifest missing '+path);
}

console.log('PASS: institution report secure CSV export source contract');
