'use strict';

const fs=require('fs');
const assert=require('assert');

const source=fs.readFileSync('database/content/grade1/20_matematik_soru_havuzu.sql','utf8');
const normalizedSource=source.replace(/''/g,"'");
const migration=fs.readFileSync('database/migrations/091_1_sinif_matematik_soru_kalitesi.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

const insertCount=(source.match(/INSERT INTO ders_sorulari/g)||[]).length;
assert.strictEqual(insertCount,395,'grade1 math source must keep 395 question identities');

assert(!/Hangi seçenek \d+ sayısını gösterir\?/u.test(normalizedSource),'mechanical number-identification prompts must be removed');
assert(!/\d+ \+ \d+ işleminin sonucu kaçtır\?/u.test(normalizedSource),'mechanical addition prompt pattern must be removed');
assert(!/\d+ - \d+ işleminin sonucu kaçtır\?/u.test(normalizedSource),'mechanical subtraction prompt pattern must be removed');
assert(!/sayısından hemen önce hangi sayı gelir\?/u.test(normalizedSource),'mechanical previous-number prompt must be removed');
assert(!/sayısından hemen sonra hangi sayı gelir\?/u.test(normalizedSource),'mechanical next-number prompt must be removed');

assert(source.includes("Sayı yolunda 5'den"));
assert(normalizedSource.includes('daha çok boncuğu gösteren sayı'));
assert(normalizedSource.includes('kaç çıkartması var?'));
assert(normalizedSource.includes('kaç balon kaldı?'));
assert(normalizedSource.includes('yaklaşık kaç tane görüyorsun?'));
assert(normalizedSource.includes('▭ Bu işaret hangi şekle benzer?'));
assert(normalizedSource.includes('Kırmızı: 🔴🔴🔴🔴🔴🔴'));

const updateCount=(migration.match(/UPDATE ders_sorulari s/g)||[]).length;
assert.strictEqual(updateCount,295,'migration must apply all curated grade1 math rewrites');
assert(!/DELETE\s+FROM\s+ders_sorulari/i.test(migration),'quality migration must not delete question identities');
assert(!/SET\s+s\.aktif\s*=\s*0/i.test(migration),'quality migration must not deactivate existing questions');
assert(migration.includes("s.soru_kodu='mat-sayi-0'"));
assert(migration.includes("s.soru_kodu='mat-top-"));
assert(migration.includes("s.soru_kodu='mat-cik-"));
assert(migration.includes("k.sinif_seviyesi=1"));
assert(migration.includes("d.kod='matematik'"));

assert(workflow.includes('node tests/grade1-math-quality-208.cjs'));

assert.strictEqual(version.version,'1.2.81');
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.version,version.version);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(manifest.release_revision,version.release_revision);
assert(manifest.files.includes('database/migrations/091_1_sinif_matematik_soru_kalitesi.sql'));
assert(manifest.files.includes('tests/grade1-math-quality-208.cjs'));
assert.strictEqual(manifest.files.length,910);
assert.deepStrictEqual(manifest.files,[...manifest.files].sort());
assert.strictEqual(new Set(manifest.files).size,manifest.files.length);

console.log('PASS: grade1 math question bank is concrete, varied and identity-preserving');
