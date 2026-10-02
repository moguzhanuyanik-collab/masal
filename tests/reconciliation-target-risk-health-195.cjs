'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_mutabakat_hedef_risk_saglik.php','utf8');
const page=fs.readFileSync('ticari-mutabakat-hedef-risk-saglik.php','utf8');
const css=fs.readFileSync('ticari-mutabakat-hedef-risk-saglik.css','utf8');
const sendPage=fs.readFileSync('ticari-mutabakat-hedef-risk-bildirim.php','utf8');
const riskPage=fs.readFileSync('ticari-mutabakat-hedef-risk.php','utf8');
const targetPage=fs.readFileSync('ticari-mutabakat-hedefleri.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('function mrh_tables_ready('),'notification health readiness helper missing');
assert(domain.includes('function mrh_cycle_expr('),'reopen-aware current cycle expression missing');
assert(domain.includes('function mrh_cycle_key('),'current cycle key helper missing');
assert(domain.includes('function mrh_window_days('),'health dashboard time-window guard missing');
assert(domain.includes('function mrh_rows('),'notification health history resolver missing');
assert(domain.includes('function mrh_summary('),'notification health summary missing');
assert(domain.includes('function mrh_owner_rows('),'owner notification-health summary missing');
assert(domain.includes('function mrh_policy_rows('),'policy notification-health summary missing');
assert(domain.includes('function mrh_owner_options('),'owner filter options missing');

assert(domain.includes("gx.kod='vaka_yeniden_acildi'"),
  'health dashboard cycle resolver must be reopen-aware');
assert(domain.includes("hash('sha256',$caseId.'|'.trim($cycleStart))"),
  'health dashboard cycle key must match notification dedup key');
assert(domain.includes("LEFT JOIN kurum_duyuru_alicilari da"),
  'recipient read-state join missing');
assert(domain.includes("da.okundu_tarihi"),
  'recipient read timestamp missing');
assert(domain.includes("hash_equals((string)$row['dongu_anahtari'],$currentCycleKey)"),
  'old reopen-cycle notifications must not be treated as current cycle');
assert(domain.includes("'guncel_acik_vaka'"),
  'current open-cycle notification flag missing');
assert(domain.includes("'eski_dongu_bildirimi'"),
  'old-cycle history flag missing');
assert(domain.includes("'acik_hedef_disinda'"),
  'current open target-outside flag missing');
assert(domain.includes("'okunma_dakika'"),
  'read-latency metric missing');
assert(domain.includes("'kapanma_dakika'"),
  'notification-to-resolution metric missing');
assert(!/\bINSERT\b|\bUPDATE\b|\bDELETE\b/.test(domain),
  'notification health domain must remain read-only');

assert(page.includes("require_role('super_admin')"),'notification health dashboard must be Super Admin only');
assert(page.includes('Hedef Risk Müdahale Dashboardu'),'notification health hero missing');
assert(page.includes('Güncel döngü hâlâ açık'),'current open-cycle KPI missing');
assert(page.includes('Açık + okunmadı'),'open unread KPI missing');
assert(page.includes('Hedef dışı + açık'),'open target-outside KPI missing');
assert(page.includes('Ort. okunma süresi'),'average read-latency KPI missing');
assert(page.includes('Bildirim sonrası ort. kapanma'),'post-notification resolution KPI missing');
assert(page.includes('Bildirim & Açık Vaka Yükü'),'owner workload section missing');
assert(page.includes('Tarihsel Hedef Politikası Dağılımı'),'policy distribution section missing');
assert(page.includes('Eski reopen döngülerine ait bildirimler'),'reopen history explanation missing');
assert(page.includes('Bu dashboard salt-okunurdur.'),'read-only disclosure missing');
assert(!page.includes("$_SERVER['REQUEST_METHOD']==='POST'"),
  'health dashboard must not expose write POST actions');

assert(css.includes('.mrh-summary'),'notification health KPI styles missing');
assert(css.includes('.mrh-owner-grid'),'owner health styles missing');
assert(css.includes('.mrh-policy-grid'),'policy health styles missing');

assert(admin.includes('Hedef Risk Bildirim Sağlığı'),'Super Admin health navigation missing');
assert(sendPage.includes('aria-label="Bildirim Sağlığı"'),'send center health shortcut missing');
assert(riskPage.includes('aria-label="Bildirim Sağlığı"'),'target-risk queue health shortcut missing');
assert(targetPage.includes('aria-label="Bildirim Sağlığı"'),'target policy health shortcut missing');

assert(workflow.includes('node tests/reconciliation-target-risk-health-195.cjs'),
  '195 source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-target-risk-health-db-195.php'),
  '195 DB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=70,'target-risk notification health requires 1.2.70 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.70.md',
  'src/ticari_mutabakat_hedef_risk_saglik.php',
  'ticari-mutabakat-hedef-risk-saglik.php',
  'ticari-mutabakat-hedef-risk-saglik.css',
  'tests/reconciliation-target-risk-health-195.cjs',
  'tests/reconciliation-target-risk-health-db-195.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

assert(!manifest.files.includes('database/migrations/091_mutabakat_hedef_risk_saglik.sql'),
  'read-only health release must not invent a migration');

console.log('PASS: reopen-aware read-only target-risk notification health and intervention dashboard source contract');
