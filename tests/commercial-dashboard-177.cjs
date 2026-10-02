'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_dashboard.php','utf8');
const page=fs.readFileSync('ticari-dashboard.php','utf8');
const css=fs.readFileSync('ticari-dashboard.css','utf8');
const finance=fs.readFileSync('ticari-finans.php','utf8');
const risk=fs.readFileSync('tahsilat-risk.php','utf8');
const renewal=fs.readFileSync('lisans-yenilemeleri.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const releaseNote=fs.readFileSync('RELEASE-1.2.52.md','utf8');

assert(domain.includes('function td_tables_ready('),'dashboard readiness helper missing');
assert(domain.includes('function td_currency_kpis('),'currency KPI helper missing');
assert(domain.includes('function td_monthly_collections('),'monthly collection trend missing');
assert(domain.includes('function td_institution_rows('),'institution commercial summary missing');
assert(domain.includes('function td_recent_payments('),'recent payment feed missing');
assert(domain.includes('function td_operational_counts('),'operational KPI bridge missing');

assert(domain.includes("WHERE durum='aktif'\n            GROUP BY sozlesme_id"),
  'payments must be pre-aggregated per contract before KPI join');
assert(domain.includes("WHERE s.durum IN ('aktif','tamamlandi')"),
  'commercial portfolio must exclude draft/cancelled contracts');
assert(domain.includes("GROUP BY s.para_birimi"),
  'top-level financial KPI must remain currency-separated');
assert(domain.includes("COUNT(DISTINCT s.kurum_id) kurum_sayisi"),
  'currency KPI institution count missing');
assert(domain.includes("SUM(CASE WHEN s.durum='aktif' THEN s.toplam_tutar ELSE 0 END)"),
  'active contract value must be separate from total portfolio');
assert(domain.includes("lys.yenileme_id IS NOT NULL"),
  'renewal revenue linkage missing');
assert(domain.includes("t.durum='aktif'"),
  'monthly and recent payment data must ignore cancelled collections');
assert(domain.includes("s.durum IN ('aktif','tamamlandi')"),
  'monthly and recent payment feeds must stay inside valid commercial portfolio');
assert(domain.includes("s.kurum_id,k.ad kurum_adi,k.kod kurum_kodu,s.para_birimi"),
  'institution+currency aggregation contract missing');
assert(domain.includes("kalan_bakiye DESC"),
  'institution remaining-balance ordering missing');
assert(!/\bINSERT\b|\bUPDATE\b|\bDELETE\b/.test(domain),
  'commercial dashboard domain must remain read-only');

assert(page.includes("require_role('super_admin')"),'commercial dashboard must be Super Admin only');
assert(page.includes('Gelir, Tahsilat ve Risk KPI Merkezi'),'dashboard hero missing');
assert(page.includes('Aktif sözleşme değeri'),'active contract value KPI missing');
assert(page.includes('Ticari portföy'),'commercial portfolio KPI missing');
assert(page.includes('Gecikmiş bakiye'),'overdue balance KPI missing');
assert(page.includes('Yenileme sözleşmeleri'),'renewal revenue KPI missing');
assert(page.includes('6 AYLIK TREND'),'six-month collection trend missing');
assert(page.includes('Kurum Bazlı') || page.includes('KURUM BAZLI'),'institution KPI section missing');
assert(page.includes('Bu dashboard salt-okunurdur.'),'read-only UI disclosure missing');
assert(!page.includes("$_SERVER['REQUEST_METHOD']==='POST'"),
  'dashboard page must not expose write POST actions');

assert(css.includes('.td-kpi-grid'),'dashboard KPI styles missing');
assert(css.includes('.td-trend'),'dashboard trend styles missing');
assert(css.includes('.td-table'),'dashboard institution table styles missing');

assert(admin.includes('href="ticari-dashboard.php"'),'Super Admin dashboard navigation missing');
assert(finance.includes('aria-label="Ticari Dashboard"'),'finance dashboard shortcut missing');
assert(risk.includes('aria-label="Ticari Dashboard"'),'risk dashboard shortcut missing');
assert(renewal.includes('aria-label="Ticari Dashboard"'),'renewal dashboard shortcut missing');

assert(workflow.includes('node tests/commercial-dashboard-177.cjs'),
  'commercial dashboard source regression missing from quality gate');
assert(workflow.includes('php tests/commercial-dashboard-db-177.php'),
  'commercial dashboard MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=52,'commercial dashboard requires 1.2.52 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(releaseNote.includes('Migration zinciri'), 'release note migration-chain statement missing');
assert(releaseNote.includes('083'), '1.2.52 must document unchanged migration chain 083');

for(const path of [
  'RELEASE-1.2.52.md',
  'src/ticari_dashboard.php',
  'ticari-dashboard.php',
  'ticari-dashboard.css',
  'tests/commercial-dashboard-177.cjs',
  'tests/commercial-dashboard-db-177.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

assert(!manifest.files.includes('database/migrations/084_ticari_dashboard.sql'),
  'read-only dashboard release must not invent a migration');

console.log('PASS: read-only currency-safe commercial KPI dashboard source contract');
