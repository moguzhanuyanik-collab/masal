'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/kurum_ticari_360.php','utf8');
const page=fs.readFileSync('kurum-ticari-360.php','utf8');
const css=fs.readFileSync('kurum-ticari-360.css','utf8');
const dashboard=fs.readFileSync('ticari-dashboard.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const releaseNote=fs.readFileSync('RELEASE-1.2.53.md','utf8');

assert(domain.includes('function kt360_ready('),'360 readiness helper missing');
assert(domain.includes('function kt360_institution('),'institution resolver missing');
assert(domain.includes('function kt360_currency_summary('),'institution currency summary missing');
assert(domain.includes('function kt360_contract_rows('),'institution contract history missing');
assert(domain.includes('function kt360_payment_rows('),'institution payment history missing');
assert(domain.includes('function kt360_renewal_rows('),'institution renewal history missing');
assert(domain.includes('function kt360_reminder_rows('),'institution reminder history missing');
assert(domain.includes('function kt360_counts('),'institution 360 counters missing');

assert(domain.includes("WHERE s.kurum_id=?") || domain.includes("WHERE s.kurum_id=?\n"),
  'contract and summary queries must be institution scoped');
assert(domain.includes("WHERE t.kurum_id=?"),
  'payment history must be institution scoped');
assert(domain.includes("WHERE y.kurum_id=?"),
  'renewal history must be institution scoped');
assert(domain.includes("WHERE h.kurum_id=?"),
  'reminder history must be institution scoped');
assert(domain.includes("WHERE durum='aktif'\n            GROUP BY sozlesme_id"),
  'financial summary must pre-aggregate active payments per contract');
assert(domain.includes("s.durum IN ('aktif','tamamlandi')"),
  'financial summary must exclude draft/cancelled contracts');
assert(domain.includes("COUNT(*) tahsilat_gecmisi"),
  'contract detail must retain full payment-history count');
assert(domain.includes("SUM(CASE WHEN durum='aktif' THEN 1 ELSE 0 END) aktif_tahsilat_sayisi"),
  'contract detail must distinguish active payment count');
assert(domain.includes("lys.yenileme_id"),
  'contract detail must expose renewal lineage when available');
assert(domain.includes("tr.durum risk_durumu"),
  'contract detail must expose collection risk state when available');
assert(domain.includes("hatirlatma_sayisi"),
  'contract detail must expose manager reminder count when available');
assert(!/\bINSERT\b|\bUPDATE\b|\bDELETE\b/.test(domain),
  'institution commercial 360 domain must remain read-only');

assert(page.includes("require_role('super_admin')"),'institution 360 must be Super Admin only');
assert(page.includes('Kurum Ticari 360'),'institution 360 page title missing');
assert(page.includes('Para Birimi Bazında Kurum Portföyü'),'institution financial summary UI missing');
assert(page.includes('Tüm Ticari Sözleşmeler'),'contract history UI missing');
assert(page.includes('Aktif & İptal Tahsilat Geçmişi'),'full payment history UI missing');
assert(page.includes('Yenileme Geçmişi'),'renewal history UI missing');
assert(page.includes('Tahsilat Hatırlatma Geçmişi'),'manager reminder history UI missing');
assert(page.includes('Kurum Ticari 360 salt-okunurdur.'),'read-only disclosure missing');
assert(!page.includes("$_SERVER['REQUEST_METHOD']==='POST'"),
  'institution 360 must not expose write POST actions');

assert(css.includes('.k360-summary'),'institution summary styles missing');
assert(css.includes('.k360-table'),'institution contract table styles missing');
assert(css.includes('.k360-payments'),'institution payment history styles missing');

assert(dashboard.includes('href="kurum-ticari-360.php?kurum_id='),
  'commercial dashboard institution rows must open 360 view');
assert(dashboard.includes('Ticari 360'),
  'commercial dashboard must label institution 360 drilldown');

assert(workflow.includes('node tests/institution-commercial-360-178.cjs'),
  'institution 360 source regression missing from quality gate');
assert(workflow.includes('php tests/institution-commercial-360-db-178.php'),
  'institution 360 MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=53,'institution commercial 360 requires 1.2.53 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(releaseNote.includes('Migration zinciri'), 'release note migration-chain statement missing');
assert(releaseNote.includes('083'), '1.2.53 must document unchanged migration chain 083');

for(const path of [
  'RELEASE-1.2.53.md',
  'src/kurum_ticari_360.php',
  'kurum-ticari-360.php',
  'kurum-ticari-360.css',
  'tests/institution-commercial-360-178.cjs',
  'tests/institution-commercial-360-db-178.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

assert(!manifest.files.includes('database/migrations/084_kurum_ticari_360.sql'),
  'read-only institution 360 release must not invent a migration');

console.log('PASS: institution-scoped read-only commercial 360 source contract');
