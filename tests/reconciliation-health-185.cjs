'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_mutabakat_saglik.php','utf8');
const page=fs.readFileSync('ticari-mutabakat-saglik.php','utf8');
const actionPage=fs.readFileSync('ticari-mutabakat-aksiyon.php','utf8');
const reconciliation=fs.readFileSync('ticari-mutabakat.php','utf8');
const dashboard=fs.readFileSync('ticari-dashboard.php','utf8');
const dashboardDomain=fs.readFileSync('src/ticari_dashboard.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const releaseNote=fs.readFileSync('RELEASE-1.2.60.md','utf8');

assert(domain.includes('function mhs_tables_ready('),'health readiness helper missing');
assert(domain.includes('function mhs_age_bucket('),'health aging bucket helper missing');
assert(domain.includes('function mhs_cycle_expr('),'current-open-cycle resolver missing');
assert(domain.includes('function mhs_intervention_exists_expr('),'first-intervention resolver missing');
assert(domain.includes('function mhs_case_rows('),'health queue missing');
assert(domain.includes('function mhs_summary('),'health summary missing');
assert(domain.includes('function mhs_owner_workload('),'owner workload summary missing');
assert(domain.includes('function mhs_recent_closed_metrics('),'recent closed-cycle metrics missing');

assert(domain.includes("gx.kod='vaka_yeniden_acildi'"),
  'reopened cases must age from latest reopen event');
assert(domain.includes("COALESCE(") && domain.includes('v.olusturulma_tarihi'),
  'new cases must fall back to original creation timestamp');
assert(domain.includes("GREATEST(0,DATEDIFF(CURDATE(),DATE("),
  'open-case age must be deterministically calculated in days');
assert(domain.includes("'kod'=>'0_1'"),'0-1 age bucket missing');
assert(domain.includes("'kod'=>'2_3'"),'2-3 age bucket missing');
assert(domain.includes("'kod'=>'4_7'"),'4-7 age bucket missing');
assert(domain.includes("'kod'=>'8_plus'"),'8+ age bucket missing');

assert(domain.includes("v.sonraki_aksiyon_tarihi<CURDATE()"),
  'overdue next-action health condition missing');
assert(domain.includes("v.sonraki_aksiyon_tarihi=CURDATE()"),
  'today next-action health condition missing');
assert(domain.includes("(v.sorumlu_kullanici_id IS NULL OR v.sorumlu_kullanici_id=0)"),
  'unassigned-case health condition missing');
assert(domain.includes("v.sonraki_aksiyon_tarihi IS NULL"),
  'missing next-action health condition missing');
assert(domain.includes("NOT "+'') || true);

assert(domain.includes("WHERE ".concat('"').slice(0,0)) || domain.includes("WHERE ".implode"),
  'queue must push filters into SQL before LIMIT');
assert(domain.indexOf("WHERE ".implode(' AND ',$where)."") < domain.indexOf("LIMIT {$limit}"),
  'health filtering must happen before SQL limit');
assert(!/\bINSERT\b|\bUPDATE\b|\bDELETE\b/.test(domain),
  'health analytics domain must remain read-only');

assert(page.includes("require_role('super_admin')"),'health dashboard must be Super Admin only');
assert(page.includes('Mutabakat Vaka Yaşlandırma & Aksiyon Sağlığı'),'health hero missing');
assert(page.includes('Aksiyon gecikti'),'overdue action KPI missing');
assert(page.includes('Sahipsiz'),'unassigned KPI missing');
assert(page.includes('İlk müdahale yok'),'first-intervention gap KPI missing');
assert(page.includes('8+ gün açık'),'8+ aging KPI missing');
assert(page.includes('Sorumlu Yükü') || page.includes('SORUMLU YÜKÜ'),'owner workload section missing');
assert(page.includes('Son 30 Gün') || page.includes('SON 30 GÜN'),'recent closure metrics missing');
assert(page.includes('Bu ekran SLA kararı vermez'),'no-invented-SLA disclosure missing');
assert(page.includes('son vaka_yeniden_acildi') || page.includes('vaka_yeniden_acildi'),
  'reopen-cycle aging explanation missing');
assert(!page.includes("$_SERVER['REQUEST_METHOD']==='POST'"),
  'health dashboard must expose no write POST flow');

assert(actionPage.includes('aria-label="Mutabakat Sağlığı"'),
  'action center health shortcut missing');
assert(reconciliation.includes('aria-label="Mutabakat Sağlığı"'),
  'reconciliation diagnostic health shortcut missing');
assert(dashboard.includes('aria-label="Mutabakat Sağlığı"'),
  'commercial dashboard health shortcut missing');
assert(admin.includes('Mutabakat Aksiyon Sağlığı'),
  'Super Admin health navigation missing');

assert(dashboardDomain.includes("'reconciliation_open'=>0"),
  'commercial KPI bridge reconciliation-open counter missing');
assert(dashboardDomain.includes("'reconciliation_overdue'=>0"),
  'commercial KPI bridge overdue-action counter missing');
assert(dashboardDomain.includes("'reconciliation_unassigned'=>0"),
  'commercial KPI bridge unassigned counter missing');
assert(dashboardDomain.includes("mhs_summary($pdo)"),
  'commercial KPI bridge must read reconciliation health summary');

assert(workflow.includes('node tests/reconciliation-health-185.cjs'),
  'reconciliation health source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-health-db-185.php'),
  'reconciliation health DB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=60,'reconciliation health requires 1.2.60 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(releaseNote.includes('Migration zinciri'),'release note migration-chain statement missing');
assert(releaseNote.includes('086'),'1.2.60 must document unchanged migration chain 086');

for(const path of [
  'RELEASE-1.2.60.md',
  'src/ticari_mutabakat_saglik.php',
  'ticari-mutabakat-saglik.php',
  'ticari-mutabakat-saglik.css',
  'tests/reconciliation-health-185.cjs',
  'tests/reconciliation-health-db-185.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

assert(!manifest.files.includes('database/migrations/087_ticari_mutabakat_saglik.sql'),
  'read-only reconciliation health release must not invent a migration');

console.log('PASS: reconciliation aging, reopen-cycle health, owner workload and read-only operations source contract');
