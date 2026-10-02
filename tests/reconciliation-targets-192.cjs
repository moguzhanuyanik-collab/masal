'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_mutabakat_hedef.php','utf8');
const page=fs.readFileSync('ticari-mutabakat-hedefleri.php','utf8');
const performance=fs.readFileSync('ticari-mutabakat-performans.php','utf8');
const health=fs.readFileSync('ticari-mutabakat-saglik.php','utf8');
const escalation=fs.readFileSync('ticari-mutabakat-eskalasyon.php','utf8');
const escalationDomain=fs.readFileSync('src/ticari_mutabakat_eskalasyon.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const migration=fs.readFileSync('database/migrations/089_mutabakat_operasyon_hedef_politikalari.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

for(const fn of [
  'mh_tables_ready','mh_scope_labels','mh_policy_versions','mh_resolve_policy',
  'mh_current_policy','mh_effective_current_policies','mh_publish_policy',
  'mh_closed_cycles','mh_closed_target_summary','mh_open_target_rows',
  'mh_open_target_summary','mh_issue_target_summary'
]) assert(domain.includes('function '+fn+'('),fn+' missing');

assert(domain.includes("WHERE h.kapsam=? AND h.gecerlilik_baslangici<=NOW()"),
  'current policy must respect effective start');
assert(domain.includes("if($scope===$issueType && $specific===null)"),
  'issue-specific policy precedence missing');
assert(domain.includes("return $specific??$general"),
  'general fallback policy missing');
assert(domain.includes("gecerlilik_baslangici"),
  'policy effective-time contract missing');
assert(domain.includes("mhs_cycle_expr("),
  'target evaluation must reuse reconciliation cycle start');
assert(domain.includes("mp_first_intervention_expr("),
  'target evaluation must reuse first-intervention contract');
assert(!/\bUPDATE\b|\bDELETE\b/.test(domain),
  'target policy domain must remain append-only; no update/delete allowed');

assert(migration.includes('CREATE TABLE IF NOT EXISTS ticari_mutabakat_hedef_politikalari'),
  'target policy table missing');
assert(migration.includes("'genel',48,8"),
  'initial 48h / 8d general policy seed missing');
assert(migration.includes("WHERE NOT EXISTS"),
  'initial general policy seed must be idempotent');
assert(!migration.includes('ALTER TABLE ticari_mutabakat_vakalari'),
  'target policy release must not mutate reconciliation case schema');

assert(page.includes("require_role('super_admin')"),'target policy center must be Super Admin only');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),'target policy publish must require CSRF');
assert(page.includes('Yeni Politika Versiyonunu Yayınla'),'append-only policy publish UI missing');
assert(page.includes('sözleşmesel SLA'),'non-contractual policy disclosure missing');
assert(page.includes('1.2.65 eskalasyon eşikleri bu sürümde değiştirilmez'),
  'fixed escalation separation disclosure missing');
assert(page.includes('Politika öncesi'),'pre-policy historical handling UI missing');

for(const content of [performance,health,escalation,admin])
  assert(content.includes('ticari-mutabakat-hedefleri.php'),'target policy navigation missing');

assert(performance.includes('mh_closed_target_summary('),
  'performance dashboard target compliance missing');
assert(performance.includes('Çevrim hedef içi'),
  'performance target cycle KPI missing');
assert(performance.includes('İlk müdahale hedef içi'),
  'performance first-intervention target KPI missing');

assert(health.includes('mh_open_target_summary('),
  'health dashboard open target summary missing');
assert(health.includes('Çevrim hedefi dışında'),
  'health target breach KPI missing');

assert(escalation.includes('2/4/8/14/30+ eskalasyon eşikleri 1.2.65 davranışı olarak sabit kalır'),
  'escalation/target separation note missing');
assert(escalationDomain.includes("if($days>=30)") && escalationDomain.includes("if($days>=14)")
  && escalationDomain.includes("if($days>=8)") && escalationDomain.includes("if($days>=4)"),
  '1.2.65 fixed escalation milestones must remain unchanged');

assert(workflow.includes('node tests/reconciliation-targets-192.cjs'),
  'target policy source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-targets-db-192.php'),
  'target policy MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=67,'reconciliation target policies require 1.2.67 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.67.md',
  'database/migrations/089_mutabakat_operasyon_hedef_politikalari.sql',
  'src/ticari_mutabakat_hedef.php',
  'ticari-mutabakat-hedefleri.php',
  'ticari-mutabakat-hedefleri.css',
  'tests/reconciliation-targets-192.cjs',
  'tests/reconciliation-targets-db-192.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: versioned append-only reconciliation target policies and non-retroactive target compliance source contract');
