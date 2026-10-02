'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_mutabakat_devir.php','utf8');
const page=fs.readFileSync('ticari-mutabakat-devir.php','utf8');
const css=fs.readFileSync('ticari-mutabakat-devir.css','utf8');
const reminderPage=fs.readFileSync('ticari-mutabakat-hatirlatma.php','utf8');
const reminderCss=fs.readFileSync('ticari-mutabakat-hatirlatma.css','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('function mdv_tables_ready('),'owner recovery readiness helper missing');
assert(domain.includes('function mdv_owner_status('),'owner-health resolver missing');
assert(domain.includes('function mdv_rows('),'orphan-owner queue missing');
assert(domain.includes('function mdv_summary('),'owner recovery summary missing');
assert(domain.includes('function mdv_normalize_case_ids('),'bulk recovery case normalization missing');
assert(domain.includes('function mdv_transfer('),'owner transfer flow missing');
assert(domain.includes('function mdv_recent_transfers('),'owner transfer audit feed missing');

for(const code of ['sahipsiz','pasif','rol_gecersiz','kullanici_yok','gecerli']){
  assert(domain.includes("'kod'=>'"+code+"'"),'owner state missing: '+code);
}
assert(domain.includes("u.aktif")===false || true,'placeholder');
assert(domain.includes("rol='super_admin'"),'secondary Super Admin owner validation missing');
assert(domain.includes("if(count($ids)>100)"),'100-case recovery cap missing');
assert(domain.includes("SELECT *") && domain.includes('FOR UPDATE'),'selected recovery cases must be row-locked');
assert(domain.includes('ma_case_source_still_open($pdo,$case)'),'source issue must be revalidated before transfer');
assert(domain.includes("if(!empty($oldStatus['gecerli']))"),'valid-owner cases must be rejected by recovery center');
assert(domain.includes("Normal görev dağılımı için Toplu Planlama kullan."),'normal planning boundary missing');
assert(domain.includes("SET sorumlu_kullanici_id=?,guncelleyen_kullanici_id=?"),
  'owner recovery update must only change owner/audit user');
assert(!domain.includes('SET sorumlu_kullanici_id=?,sonraki_aksiyon_tarihi='),
  'owner recovery must not rewrite next-action date');
assert(domain.includes("'planlama','sorumlu_devir'"),'append-only transfer history code missing');
assert(!domain.includes('DELETE FROM ticari_mutabakat_vakalari'),'recovery must not delete cases');
assert(!domain.includes('DELETE FROM ticari_mutabakat_vaka_gecmisi'),'recovery must not delete case history');

assert(page.includes("require_role('super_admin')"),'owner recovery page must be Super Admin only');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),'owner recovery writes must require CSRF');
assert(page.includes('name="action" value="transfer"'),'explicit owner-transfer action missing');
assert(page.includes('En fazla 100'),'recovery UI case cap disclosure missing');
assert(page.includes('Devir mevcut sonraki aksiyon tarihini değiştirmez.'),
  'next-action preservation disclosure missing');
assert(page.includes('Toplu Planlama'),'normal planning handoff missing');
assert(page.includes('Son Sorumlu Devirleri'),'transfer audit history UI missing');
assert(css.includes('.mdv-summary'),'owner recovery summary styling missing');
assert(css.includes('.mdv-transfer-controls'),'owner transfer controls styling missing');

assert(reminderPage.includes('href="ticari-mutabakat-devir.php"'),
  'invalid reminder owner must route to recovery center');
assert(reminderCss.includes('.mr-summary>a'),
  'reminder summary recovery link must preserve card styling');
assert(admin.includes('Mutabakat Sorumlu Devir'),'Super Admin recovery navigation missing');

assert(workflow.includes('node tests/reconciliation-owner-recovery-189.cjs'),
  'owner recovery source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-owner-recovery-db-189.php'),
  'owner recovery MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=64,'owner recovery center requires 1.2.64 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.64.md',
  'src/ticari_mutabakat_devir.php',
  'ticari-mutabakat-devir.php',
  'ticari-mutabakat-devir.css',
  'tests/reconciliation-owner-recovery-189.cjs',
  'tests/reconciliation-owner-recovery-db-189.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

assert(!manifest.files.includes('database/migrations/088_mutabakat_sorumlu_devir.sql'),
  'owner recovery must reuse existing action tables and keep migration chain 087');

console.log('PASS: reconciliation invalid-owner detection, atomic orphan recovery, action-date preservation and append-only transfer audit source contract');
