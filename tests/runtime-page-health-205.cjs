'use strict';

const fs=require('fs');
const assert=require('assert');

const auth=fs.readFileSync('src/auth.php','utf8');
const status=fs.readFileSync('sistem-durum.php','utf8');
const homework=fs.readFileSync('ogretmen-odevleri.php','utf8');
const questions=fs.readFileSync('ogretmen-sorulari.php','utf8');
const report=fs.readFileSync('ogrenci-raporu.php','utf8');
const teacherContent=fs.readFileSync('ogretmen-icerikleri.php','utf8');
const teacherDetail=fs.readFileSync('ogretmen-icerik-detay.php','utf8');
const institutionDetail=fs.readFileSync('kurum-icerik-detay.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(auth.includes("require_once __DIR__.'/runtime_compat.php';"));
assert(status.includes('Fallback aktif'));
assert(homework.includes('[IlkAdim][teacher-homework-groups]'));
assert(questions.includes('[IlkAdim][teacher-question-groups]'));

assert(report.includes("auth_runtime_column_exists($pdo,'ogrenciler',$studentColumn)"));
assert(report.includes("[IlkAdim][student-report-open]"));
assert(report.includes("[IlkAdim][student-report-summary]"));
assert(report.includes("[IlkAdim][student-report-lessons]"));
assert(report.includes("[IlkAdim][student-report-badges]"));
assert(report.includes("[IlkAdim][super-admin-report-context]"));
assert(report.includes("'completed_steps'=>0"));
assert(report.includes("'correct_answers'=>0"));

assert(teacherContent.includes("[IlkAdim][teacher-content-edit-open]"));
assert(teacherContent.includes("Düzenlenecek içerik şu anda yüklenemedi. Liste görünümünden devam edebilirsin."));
assert(teacherDetail.includes("[IlkAdim][teacher-content-detail-open]"));
assert(teacherDetail.includes("İçerik detayı şu anda yüklenemiyor."));
assert(institutionDetail.includes("[IlkAdim][institution-content-detail-open]"));
assert(institutionDetail.includes("Kurum içerik detayı şu anda yüklenemiyor."));

assert(workflow.includes('node tests/runtime-page-health-205.cjs'));

assert.strictEqual(version.version,'1.2.80');
assert(Number(version.release_revision)>=5);
assert.strictEqual(release.version,version.version);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(manifest.release_revision,version.release_revision);
assert(manifest.files.includes('src/runtime_compat.php'));
assert(manifest.files.includes('tests/runtime-page-health-205.php'));
assert(manifest.files.includes('tests/runtime-page-health-205.cjs'));
assert.strictEqual(manifest.files.length,906);
assert.deepStrictEqual(manifest.files,[...manifest.files].sort());
assert.strictEqual(new Set(manifest.files).size,manifest.files.length);

console.log('PASS: runtime page hardening and guarded page-open contract');
