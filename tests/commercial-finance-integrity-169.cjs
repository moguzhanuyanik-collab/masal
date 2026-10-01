'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_finans.php','utf8');
const page=fs.readFileSync('ticari-finans.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('function tf_contract_payment_counts('),'payment history counter missing');
assert(domain.includes('function tf_normalize_contract_status('),'contract status normalizer missing');
assert(domain.includes('function tf_integrity_issues('),'commercial integrity scanner missing');

assert(domain.includes("SELECT sozlesme_id,COALESCE(SUM(tutar),0) tahsil_edilen"),
  'financial summary must pre-aggregate active payments by contract');
assert(domain.includes("WHERE s.durum IN ('aktif','tamamlandi')"),
  'financial summary must exclude draft/cancelled contracts');
assert(!domain.includes("SUM(CASE WHEN s.durum IN ('aktif','tamamlandi') THEN s.toplam_tutar ELSE 0 END)"),
  'financial summary must not multiply contract totals across payment join rows');

assert(domain.includes('Tahsilat geçmişi olan sözleşmenin kurumu değiştirilemez.'),
  'institution mutation guard after payment history missing');
assert(domain.includes('Tahsilat geçmişi olan sözleşmenin para birimi değiştirilemez.'),
  'currency mutation guard after payment history missing');
assert(domain.includes('Aktif tahsilatı olan sözleşme iptal edilemez. Önce aktif tahsilatları iptal et.'),
  'contract cancellation guard with active payments missing');
assert(domain.includes('Tahsilat geçmişi olan sözleşme taslak durumuna alınamaz.'),
  'draft regression guard after payment history missing');

assert(domain.includes("CASE WHEN s.kurum_id<>t.kurum_id THEN 1 ELSE 0 END kurum_tutarsiz"),
  'legacy payment/institution mismatch visibility missing');
assert(domain.includes('INNER JOIN kurum_sozlesmeleri s ON s.id=t.sozlesme_id'),
  'payment history must remain visible even when legacy institution ids mismatch');
assert(!domain.includes('INNER JOIN kurum_sozlesmeleri s ON s.id=t.sozlesme_id AND s.kurum_id=t.kurum_id'),
  'legacy mismatched payments must not disappear from payment history');

assert(page.includes('VERİ BÜTÜNLÜĞÜ'),'integrity warning UI missing');
assert(page.includes('Tahsilat geçmişi başladıktan sonra kurum ve para birimi değiştirilemez'),
  'commercial edit integrity guidance missing');
assert(page.includes('Tamamlandı · tahsilata göre otomatik'),
  'completed contract status should be communicated as derived');
assert(page.includes('Tahsilatın kayıtlı kurumu ile sözleşmenin güncel kurumu farklı'),
  'legacy mismatch warning in payment history missing');

assert(workflow.includes('node tests/commercial-finance-integrity-169.cjs'),
  'commercial integrity source test missing from quality gate');
assert(workflow.includes('php tests/commercial-finance-integrity-db-169.php'),
  'commercial integrity DB test missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=44,'finance integrity hardening requires 1.2.44 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.44.md',
  'tests/commercial-finance-integrity-169.cjs',
  'tests/commercial-finance-integrity-db-169.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: commercial finance aggregation, immutable tenant/currency history and derived contract status source contract');
