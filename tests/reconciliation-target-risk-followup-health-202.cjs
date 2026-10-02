'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_mutabakat_hedef_risk_takip_saglik.php','utf8');
const page=fs.readFileSync('ticari-mutabakat-hedef-risk-takip-saglik.php','utf8');
const css=fs.readFileSync('ticari-mutabakat-hedef-risk-takip-saglik.css','utf8');
const planning=fs.readFileSync('ticari-mutabakat-hedef-risk-takip.php','utf8');
const health=fs.readFileSync('ticari-mutabakat-hedef-risk-saglik.php','utf8');
const inbox=fs.readFileSync('ticari-mutabakat-is-kutusu.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

for(const fn of [
  'mrts_tables_ready','mrts_state_labels','mrts_state_priority','mrts_is_open_stage',
  'mrts_classify','mrts_base_rows','mrts_rows','mrts_summary','mrts_owner_rows','mrts_owner_options'
]) assert(domain.includes('function '+fn+'('),fn+' missing');

for(const state of [
  'owner_degisti','dongu_degisti','sinyal_degisti','bildirim_degisti',
  'aksiyon_gecikmis','aksiyon_bugun','aksiyon_tarihi_yok','planli_okunmadi',
  'okundu','risk_cozuldu','vaka_kapandi','plan_bildirimi_yok'
]) assert(domain.includes("'"+state+"'"),'health state missing: '+state);

assert(domain.includes("g.kod='toplu_takip_planlama'"),
  'follow-up health must be based on append-only follow-up planning history');
assert(domain.includes('SELECT MAX(g2.id)'),
  'only latest follow-up plan per case must enter current health');
assert(domain.includes('b2.olusturulma_tarihi<=g.olusturulma_tarihi'),
  'planned notification must be resolved from notification timeline at planning time');
assert(domain.includes('mi_target_risk_map('),
  'health must reuse exact current notification resolver');
assert(domain.includes('mrh_cycle_key('),
  'health must reuse reopen-aware cycle-key contract');
assert(domain.includes("['hedef_75','hedef_disinda']"),
  'health must only treat current notification-producing target signals as active');
assert(domain.includes("plan_okundu_tarihi"),
  'planned notification read-state snapshot join missing');
assert(!/\bINSERT\b|\bUPDATE\b|\bDELETE\b/.test(domain),
  'follow-up health domain must remain read-only');

assert(page.includes("require_role('super_admin')"),'health center must be Super Admin only');
assert(page.includes('Planlanan Okunmamış Risklerin Son Durumu'),'health center hero missing');
assert(page.includes('Güncel Sorumlu Bazlı Takip Yükü'),'owner workload view missing');
assert(page.includes('Bu ekran salt-okunurdur.'),'read-only disclosure missing');
assert(!page.includes("$_SERVER['REQUEST_METHOD']==='POST'"),
  'health center must not expose write POST actions');

assert(css.includes('.mrts-summary'),'summary styles missing');
assert(css.includes('.mrts-row.stale'),'stale-context styles missing');
assert(css.includes('.mrts-owner-table'),'owner table styles missing');

for(const content of [planning,health,inbox,admin]){
  assert(content.includes('ticari-mutabakat-hedef-risk-takip-saglik.php'),
    'navigation integration missing');
}

assert(workflow.includes('node tests/reconciliation-target-risk-followup-health-202.cjs'),
  'follow-up health source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-target-risk-followup-health-db-202.php'),
  'follow-up health MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=77,'target-risk follow-up health requires 1.2.77 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.77.md',
  'src/ticari_mutabakat_hedef_risk_takip_saglik.php',
  'ticari-mutabakat-hedef-risk-takip-saglik.php',
  'ticari-mutabakat-hedef-risk-takip-saglik.css',
  'tests/reconciliation-target-risk-followup-health-202.cjs',
  'tests/reconciliation-target-risk-followup-health-db-202.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

assert(!manifest.files.some(p=>/^database\/migrations\/091_.*(?:mutabakat|hedef|risk|takip)/i.test(p)),
  'read-only follow-up health release must not own or invent a reconciliation migration 091');

console.log('PASS: latest-plan, current-owner/current-cycle/current-signal follow-up health source contract');
