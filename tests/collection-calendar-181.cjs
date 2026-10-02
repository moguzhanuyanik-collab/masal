'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/tahsilat_takvimi.php','utf8');
const page=fs.readFileSync('tahsilat-takvimi.php','utf8');
const css=fs.readFileSync('tahsilat-takvimi.css','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const dashboard=fs.readFileSync('ticari-dashboard.php','utf8');
const finance=fs.readFileSync('ticari-finans.php','utf8');
const risk=fs.readFileSync('tahsilat-risk.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const releaseNote=fs.readFileSync('RELEASE-1.2.56.md','utf8');

assert(domain.includes('function ttk_tables_ready('),'calendar readiness helper missing');
assert(domain.includes('function ttk_installment_ready('),'installment readiness helper missing');
assert(domain.includes('function ttk_window('),'calendar date-window helper missing');
assert(domain.includes('function ttk_base_contracts('),'base receivable contract query missing');
assert(domain.includes('function ttk_installment_rows('),'batch installment query missing');
assert(domain.includes('function ttk_obligations('),'open obligation builder missing');
assert(domain.includes('function ttk_filter_rows('),'calendar filtering missing');
assert(domain.includes('function ttk_summary('),'collection calendar summary missing');
assert(domain.includes('function ttk_monthly_forecast('),'monthly cash-flow forecast missing');

assert(domain.includes("WHERE s.durum='aktif'"),
  'forecast must be limited to active contracts');
assert(domain.includes("WHERE durum='aktif'\n            GROUP BY sozlesme_id"),
  'active payments must be pre-aggregated per contract');
assert(domain.includes("pl.aktif_surum=t.surum_no") && domain.includes("pl.durum='aktif'"),
  'forecast must use only current active installment version');
assert(domain.includes("$remainingPaid=$paid"),
  'FIFO allocation state missing');
assert(domain.includes("$allocated=min($amount,$remainingPaid)"),
  'FIFO installment allocation missing');
assert(domain.includes("if($remaining<=0.009) continue"),
  'fully paid installment must not remain in expected cash flow');
assert(domain.includes("'kaynak'=>'tek_vade'"),
  'legacy single-due contract fallback missing');
assert(domain.includes("'kod'=>'vadesiz'"),
  'missing-due open balance classification missing');
assert(domain.includes("if((int)$a->diff($b)->days>366)"),
  'calendar date range must be capped at 366 days');
assert(!/\bINSERT\b|\bUPDATE\b|\bDELETE\b/.test(domain),
  'collection calendar domain must remain read-only');

assert(page.includes("require_role('super_admin')"),'collection calendar must be Super Admin only');
assert(page.includes('Tahsilat Takvimi & Beklenen Nakit Akışı'),'calendar hero missing');
assert(page.includes('Gecikmiş'),'overdue summary missing');
assert(page.includes('1–7 gün'),'1-7 day bucket missing');
assert(page.includes('8–30 gün'),'8-30 day bucket missing');
assert(page.includes('31–60 gün'),'31-60 day bucket missing');
assert(page.includes('61–90 gün'),'61-90 day bucket missing');
assert(page.includes('90+ gün'),'90+ day bucket missing');
assert(page.includes('Vadesiz'),'missing-due bucket missing');
assert(page.includes('6 AYLIK BEKLENTİ'),'six-month forecast missing');
assert(page.includes('Gecikmişleri dahil et'),'overdue filter missing');
assert(page.includes('Vadesizleri dahil et'),'missing-due filter missing');
assert(page.includes('Bu takvim salt-okunurdur.'),'read-only disclosure missing');
assert(!page.includes("$_SERVER['REQUEST_METHOD']==='POST'"),
  'collection calendar must not expose write POST flow');

assert(css.includes('.ttk-summary'),'calendar summary styles missing');
assert(css.includes('.ttk-forecast'),'forecast styles missing');
assert(css.includes('.ttk-filter'),'calendar filters styles missing');

assert(!admin.includes('href="tahsilat-takvimi.php"'),'legacy commercial navigation must stay hidden from the education-focused Super Admin');
assert(dashboard.includes('aria-label="Tahsilat Takvimi"'),'dashboard calendar shortcut missing');
assert(finance.includes('aria-label="Tahsilat Takvimi"'),'finance calendar shortcut missing');
assert(risk.includes('aria-label="Tahsilat Takvimi"'),'risk calendar shortcut missing');

assert(workflow.includes('node tests/collection-calendar-181.cjs'),
  'collection calendar source regression missing from quality gate');
assert(workflow.includes('php tests/collection-calendar-db-181.php'),
  'collection calendar MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=56,'collection calendar requires 1.2.56 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(releaseNote.includes('Migration zinciri'), 'release note migration-chain statement missing');
assert(releaseNote.includes('084'), '1.2.56 must document unchanged migration chain 084');

for(const path of [
  'RELEASE-1.2.56.md',
  'src/tahsilat_takvimi.php',
  'tahsilat-takvimi.php',
  'tahsilat-takvimi.css',
  'tests/collection-calendar-181.cjs',
  'tests/collection-calendar-db-181.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

assert(!manifest.files.includes('database/migrations/085_tahsilat_takvimi.sql'),
  'read-only collection calendar must not invent migration 085');

console.log('PASS: read-only FIFO installment collection calendar and currency-safe forecast source contract');
