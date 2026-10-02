'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_mutabakat_hedef_risk_takip_kurtarma.php','utf8');
const page=fs.readFileSync('ticari-mutabakat-hedef-risk-takip-kurtarma.php','utf8');
const css=fs.readFileSync('ticari-mutabakat-hedef-risk-takip-kurtarma.css','utf8');
const healthPage=fs.readFileSync('ticari-mutabakat-hedef-risk-takip-saglik.php','utf8');
const interventionPage=fs.readFileSync('ticari-mutabakat-hedef-risk-takip-mudahale.php','utf8');
const followPage=fs.readFileSync('ticari-mutabakat-hedef-risk-takip.php','utf8');
const inbox=fs.readFileSync('ticari-mutabakat-is-kutusu.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const releaseNote=fs.readFileSync('RELEASE-1.2.79.md','utf8');

for(const fn of [
  'mrtr_tables_ready','mrtr_allowed_states','mrtr_state_labels',
  'mrtr_normalize_case_ids','mrtr_current_map','mrtr_rows',
  'mrtr_visible_case_ids','mrtr_summary','mrtr_recover_selected'
]) assert(domain.includes('function '+fn+'('),fn+' missing');

for(const state of ['owner_degisti','dongu_degisti','sinyal_degisti','bildirim_degisti','plan_bildirimi_yok'])
  assert(domain.includes("'"+state+"'"),'stale recovery state missing: '+state);

for(const forbidden of ['okundu','risk_cozuldu','vaka_kapandi','aksiyon_gecikmis','aksiyon_bugun','aksiyon_tarihi_yok','planli_okunmadi']){
  const allowedBlock=domain.match(/function mrtr_allowed_states\(\): array \{([\s\S]*?)\n\}/);
  assert(allowedBlock && !allowedBlock[1].includes("'"+forbidden+"'"),
    'non-stale state must not enter recovery allowlist: '+forbidden);
}

assert(domain.includes('mrt_rows($pdo,$actor,$currentFilters,2000)'),
  'stale recovery must intersect with exact current unread rows');
assert(domain.includes("ma_sync_cases($pdo,$actor)"),
  'recovery must sync cases before POST allowlist revalidation');
assert(domain.includes("mrt_rows($pdo,$actor,["),
  'POST must independently recompute exact current unread allowlist');
assert(domain.includes("map_bulk_reschedule_preserve_owners("),
  'recovery must use owner-preserving planning engine');
assert(!domain.includes('map_bulk_plan('),
  'stale recovery must not use owner-changing bulk planner');
assert(domain.includes("if(count($ids)>50)"),
  'stale recovery hard 50-case cap missing');
assert(domain.includes('artık stale plan kurtarma allowlistinde değil'),
  'stale-health revalidation guard missing');
assert(domain.includes('artık exact current owner/döngü/sinyal/bildirim okunmamış allowlistinde değil'),
  'exact-current revalidation guard missing');

assert(page.includes("require_role('super_admin')"),
  'stale recovery center must be Super Admin only');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),
  'stale recovery write must require CSRF');
assert(page.includes("if((string)($_POST['action']??'')!=='recover_stale')"),
  'stale recovery must use a closed POST action whitelist');
assert(
  page.includes('Eski Planı Taşımadan') && page.includes('Güncel Bağlamda Yeni Takip Planı Oluştur'),
  'recovery intent disclosure missing'
);
assert(page.includes('Eski plan') && page.includes('Güncel'),
  'old-vs-current context comparison UI missing');
assert(page.includes('İlk 50 görünür adayı seç'),
  'recovery selection helper missing');
assert(page.includes('owner değiştirmez'),
  'owner-preservation disclosure missing');
assert(page.includes('Okundu') && page.includes('Risk Çözüldü') && page.includes('Vaka Kapandı'),
  'non-recoverable state disclosure missing');
assert(!page.includes('name="new_owner_id"'),
  'stale recovery must not expose owner reassignment control');

for(const [name,content] of [
  ['health',healthPage],['intervention',interventionPage],
  ['follow-up',followPage],['inbox',inbox]
]){
  assert(content.includes('ticari-mutabakat-hedef-risk-takip-kurtarma.php'),
    name+' navigation to stale recovery missing');
}
assert(!admin.includes('Stale Hedef Risk Takip Kurtarma'),'legacy commercial navigation must stay hidden from the education-focused Super Admin');

assert(css.includes('.mrtr-summary'),'stale recovery summary styles missing');
assert(css.includes('.mrtr-context'),'old/current context comparison styles missing');

assert(workflow.includes('node tests/reconciliation-target-risk-followup-recovery-204.cjs'),
  '204 source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-target-risk-followup-recovery-db-204.php'),
  '204 MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=79,'stale target-risk recovery requires 1.2.79 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(releaseNote.includes('090'),'1.2.79 must document unchanged migration chain 090');

for(const path of [
  'RELEASE-1.2.79.md',
  'src/ticari_mutabakat_hedef_risk_takip_kurtarma.php',
  'ticari-mutabakat-hedef-risk-takip-kurtarma.php',
  'ticari-mutabakat-hedef-risk-takip-kurtarma.css',
  'tests/reconciliation-target-risk-followup-recovery-204.cjs',
  'tests/reconciliation-target-risk-followup-recovery-db-204.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

assert(!manifest.files.some(p=>/database\/migrations\/091_.*kurtarma/i.test(p)),
  'stale recovery release must not invent migration 091');

console.log('PASS: stale follow-up recovery intersects stale health with exact current unread context and preserves current owner');
