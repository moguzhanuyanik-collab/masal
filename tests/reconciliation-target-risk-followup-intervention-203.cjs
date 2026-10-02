'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_mutabakat_hedef_risk_takip_mudahale.php','utf8');
const page=fs.readFileSync('ticari-mutabakat-hedef-risk-takip-mudahale.php','utf8');
const css=fs.readFileSync('ticari-mutabakat-hedef-risk-takip-mudahale.css','utf8');
const healthPage=fs.readFileSync('ticari-mutabakat-hedef-risk-takip-saglik.php','utf8');
const followPage=fs.readFileSync('ticari-mutabakat-hedef-risk-takip.php','utf8');
const inbox=fs.readFileSync('ticari-mutabakat-is-kutusu.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const releaseNote=fs.readFileSync('RELEASE-1.2.78.md','utf8');

for(const fn of [
  'mrtm_tables_ready','mrtm_allowed_states','mrtm_state_labels',
  'mrtm_normalize_case_ids','mrtm_rows','mrtm_visible_case_ids',
  'mrtm_summary','mrtm_reschedule_selected'
]) assert(domain.includes('function '+fn+'('),fn+' missing');

for(const state of ['aksiyon_gecikmis','aksiyon_bugun','aksiyon_tarihi_yok'])
  assert(domain.includes("'"+state+"'"),'intervention state missing: '+state);

assert(!domain.includes("'planli_okunmadi'"),
  'future planned unread state must not be an intervention candidate');
assert(!domain.includes("'owner_degisti'") && !domain.includes("'dongu_degisti'"),
  'stale owner/cycle states must not be directly writable intervention candidates');
assert(domain.includes("if(count($ids)>50)"),
  'intervention hard 50-case cap missing');
assert(domain.includes("ma_sync_cases($pdo,$actor)"),
  'intervention must resync reconciliation cases before POST allowlist validation');
assert(domain.includes("mrtm_rows($pdo,$actor,$filters,1000)"),
  'health intervention allowlist must be recomputed on POST');
assert(domain.includes("mrt_rows($pdo,$actor,['days'=>$days],1500)"),
  'exact current unread follow-up allowlist must be independently rechecked');
assert(domain.includes("map_bulk_reschedule_preserve_owners("),
  'intervention must reuse owner-preserving planning engine');
assert(domain.includes("artık gecikmiş, bugün veya tarihsiz current-context"),
  'health-state stale selection fail-closed guard missing');
assert(domain.includes("artık exact current owner/döngü/sinyal/bildirim okunmamış"),
  'exact current notification stale selection fail-closed guard missing');
assert(!domain.includes('map_bulk_plan('),
  'intervention must never use owner-changing bulk planning engine');

assert(page.includes("require_role('super_admin')"),
  'intervention center must be Super Admin only');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),
  'intervention write must require CSRF');
assert(page.includes("if((string)($_POST['action']??'')!=='reschedule_attention')"),
  'intervention page must use closed POST action whitelist');
assert(page.includes('İlk 50 görünür adayı seç'),
  'intervention selection helper missing');
assert(page.includes('owner değiştirmez'),
  'owner preservation disclosure missing');
assert(page.includes('current owner, current reopen döngüsü, exact current hedef-risk sinyali'),
  'current-context disclosure missing');
assert(!page.includes('name="owner_id"') || page.includes('type="hidden" name="owner_id"'),
  'intervention form must not expose owner reassignment control');

assert(healthPage.includes('aria-label="Takip Sağlığı Müdahale"'),
  'health page intervention shortcut missing');
assert(healthPage.includes('Sağlık Müdahalesi →'),
  'health page intervention CTA missing');
assert(!healthPage.includes("$_SERVER['REQUEST_METHOD']==='POST'"),
  '1.2.77 health page must remain read-only');
assert(followPage.includes('aria-label="Takip Sağlığı Müdahale"'),
  'follow-up planner intervention shortcut missing');
assert(inbox.includes('aria-label="Takip Sağlığı Müdahale"'),
  'daily inbox intervention shortcut missing');
assert(admin.includes('Takip Sağlığı Müdahale'),
  'Super Admin intervention navigation missing');

assert(css.includes('.mrtm-summary'),'intervention summary styles missing');
assert(css.includes('.mrtm-row'),'intervention candidate styles missing');

assert(workflow.includes('node tests/reconciliation-target-risk-followup-intervention-203.cjs'),
  '203 source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-target-risk-followup-intervention-db-203.php'),
  '203 MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=78,'target-risk follow-up intervention requires 1.2.78 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(releaseNote.includes('090'),'1.2.78 must document unchanged migration chain 090');

for(const path of [
  'RELEASE-1.2.78.md',
  'src/ticari_mutabakat_hedef_risk_takip_mudahale.php',
  'ticari-mutabakat-hedef-risk-takip-mudahale.php',
  'ticari-mutabakat-hedef-risk-takip-mudahale.css',
  'tests/reconciliation-target-risk-followup-intervention-203.cjs',
  'tests/reconciliation-target-risk-followup-intervention-db-203.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

assert(!manifest.files.includes('database/migrations/091_mutabakat_hedef_risk_takip_mudahale.sql'),
  'intervention release must not invent a migration');

console.log('PASS: current-context follow-up health intervention and owner-preserving stale-safe reschedule source contract');
