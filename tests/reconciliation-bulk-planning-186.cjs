'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_mutabakat_planlama.php','utf8');
const page=fs.readFileSync('ticari-mutabakat-planlama.php','utf8');
const css=fs.readFileSync('ticari-mutabakat-planlama.css','utf8');
const action=fs.readFileSync('ticari-mutabakat-aksiyon.php','utf8');
const health=fs.readFileSync('ticari-mutabakat-saglik.php','utf8');
const dashboard=fs.readFileSync('ticari-dashboard.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const note=fs.readFileSync('RELEASE-1.2.61.md','utf8');

assert(domain.includes('function map_tables_ready('),'planning readiness helper missing');
assert(domain.includes('function map_super_admin_rows('),'active Super Admin list helper missing');
assert(domain.includes('function map_validate_owner('),'owner validation helper missing');
assert(domain.includes('function map_normalize_case_ids('),'case-id normalization missing');
assert(domain.includes('function map_bulk_plan('),'atomic bulk planning flow missing');
assert(domain.includes('function map_recent_planning('),'planning audit feed missing');

assert(domain.includes("if(count($ids)>100)"),'100-case bulk operation ceiling missing');
assert(domain.includes("auth_user_has_role($owner,'super_admin')"),
  'bulk owner must be validated as active Super Admin');
assert(domain.includes("ORDER BY id\n            FOR UPDATE"),
  'selected cases must be locked in stable order');
assert(domain.includes("in_array((string)$case['durum'],ma_open_stages(),true)"),
  'closed cases must be rejected');
assert(domain.includes('ma_case_source_still_open($pdo,$case)'),
  'stale source-resolved cases must be rejected before planning');
assert(domain.includes("sonraki_aksiyon_tarihi geçmişte olamaz") || domain.includes("Sonraki aksiyon tarihi geçmişte olamaz"),
  'past action dates must be rejected');
assert(domain.includes("'planlama','toplu_planlama'"),
  'bulk planning must append auditable history');
assert(!domain.includes("'takip_notu'"),
  'bulk ownership/date planning must not masquerade as first intervention');
assert(!domain.includes("'asama_"),
  'bulk planning must not silently change case stage');
assert(!/UPDATE\s+(kurum_sozlesmeleri|kurum_tahsilatlari|ticari_belgeler|ticari_belge_tahsilat_eslemeleri)/i.test(domain),
  'bulk planning must not mutate financial source records');

assert(page.includes("require_role('super_admin')"),'planning center must be Super Admin only');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),'bulk planning POST must require CSRF');
assert(page.includes('name="vaka_id[]"'),'multi-case checkbox selection missing');
assert(page.includes('name="sorumlu_kullanici_id"'),'owner selection missing');
assert(page.includes('name="sonraki_aksiyon_tarihi"'),'next-action date missing');
assert(page.includes('Seçili Vakaları Planla'),'bulk planning submit action missing');
assert(page.includes('Tek vaka bile kapanmış veya kaynak sorunu çözülmüşse tüm toplu işlem rollback edilir.'),
  'atomic rollback behavior must be disclosed in UI');
assert(page.includes('Atama tek başına “ilk müdahale” metriğini kapatmaz'),
  'health metric semantics disclosure missing');
assert(css.includes('.map-plan-grid'),'planning form styles missing');
assert(css.includes('.map-row'),'case-selection styles missing');

assert(action.includes('href="ticari-mutabakat-planlama.php"'),'action-center planning link missing');
assert(health.includes('href="ticari-mutabakat-planlama.php"'),'health-dashboard planning link missing');
assert(dashboard.includes('aria-label="Mutabakat Planlama"'),'commercial dashboard planning shortcut missing');
assert(admin.includes('Mutabakat Toplu Planlama'),'Super Admin planning navigation missing');

assert(workflow.includes('node tests/reconciliation-bulk-planning-186.cjs'),
  'bulk planning source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-bulk-planning-db-186.php'),
  'bulk planning MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=61,'bulk planning requires 1.2.61 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(note.includes('Migration zinciri') && note.includes('086'),
  '1.2.61 must document unchanged migration chain 086');
assert(!manifest.files.includes('database/migrations/087_mutabakat_toplu_planlama.sql'),
  'bulk planning must reuse existing action schema without fake migration');

for(const path of [
  'RELEASE-1.2.61.md',
  'src/ticari_mutabakat_planlama.php',
  'ticari-mutabakat-planlama.php',
  'ticari-mutabakat-planlama.css',
  'tests/reconciliation-bulk-planning-186.cjs',
  'tests/reconciliation-bulk-planning-db-186.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: atomic reconciliation bulk owner/date planning and audit source contract');
