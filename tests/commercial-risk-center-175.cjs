'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/tahsilat_risk.php','utf8');
const page=fs.readFileSync('tahsilat-risk.php','utf8');
const css=fs.readFileSync('tahsilat-risk.css','utf8');
const finance=fs.readFileSync('ticari-finans.php','utf8');
const renewals=fs.readFileSync('lisans-yenilemeleri.php','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const migration=fs.readFileSync('database/migrations/082_ticari_tahsilat_risk_merkezi.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('function tr_tables_ready('),'risk tables readiness helper missing');
assert(domain.includes('function tr_risk_bucket('),'aging/risk bucket resolver missing');
assert(domain.includes('function tr_should_track('),'collection risk eligibility helper missing');
assert(domain.includes('function tr_sync_cases('),'collection risk sync missing');
assert(domain.includes('function tr_queue_rows('),'collection risk queue missing');
assert(domain.includes('function tr_summary('),'collection risk summary missing');
assert(domain.includes('function tr_currency_exposure('),'currency exposure summary missing');
assert(domain.includes('function tr_case_detail('),'risk case detail resolver missing');
assert(domain.includes('function tr_history_rows('),'risk append-only history reader missing');
assert(domain.includes('function tr_set_stage('),'collection follow-up stage flow missing');
assert(domain.includes('function tr_add_note('),'collection follow-up note flow missing');

assert(domain.includes("'kod'=>'yaklasan'"),'upcoming due bucket missing');
assert(domain.includes("'kod'=>'0_7'"),'0-7 aging bucket missing');
assert(domain.includes("'kod'=>'8_15'"),'8-15 aging bucket missing');
assert(domain.includes("'kod'=>'16_30'"),'16-30 aging bucket missing');
assert(domain.includes("'kod'=>'31_plus'"),'31+ aging bucket missing');
assert(domain.includes("'kod'=>'vade_yok'"),'missing-due bucket missing');
assert(domain.includes("'seviye'=>'kritik'"),'31+ deterministic critical severity missing');

assert(domain.includes("s.vade_tarihi<=DATE_ADD(CURDATE(),INTERVAL 7 DAY)"),
  'sync must include only near-due, overdue or missing-due active receivables');
assert(domain.includes("s.toplam_tutar-COALESCE(("),
  'sync must calculate remaining amount from active payments, not copied risk balance');
assert(domain.includes("SELECT id FROM kurum_sozlesmeleri WHERE id=? LIMIT 1 FOR UPDATE"),
  'contract row must be explicitly locked before financial risk reconciliation');
assert(domain.includes("'tahsilat_tamamlandi'"),
  'fully collected risk case auto-close code missing');
assert(domain.includes("'risk_penceresi_disinda'"),
  'moved-future-due auto-close code missing');
assert(domain.includes("'vaka_yeniden_acildi'"),
  'risk case reopen history missing');
assert(domain.includes("sorumlu_kullanici_id=COALESCE(sorumlu_kullanici_id,?)"),
  'follow-up actor must become responsible owner');
assert(!domain.includes('function tr_manual_close('),
  'financial risk must not expose a manual close bypass');
assert(!domain.includes('DELETE FROM ticari_tahsilat_takipleri'),
  'risk cases must not be physically deleted');
assert(!domain.includes('DELETE FROM ticari_tahsilat_takip_gecmisi'),
  'risk history must not be physically deleted');

assert(page.includes("require_role('super_admin')"),'risk center must be Super Admin only');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),'risk writes must require CSRF');
assert(page.includes('Risk Kuyruğunu Senkronize Et'),'explicit risk sync action missing');
assert(page.includes('0–7 gün'),'0-7 aging UI missing');
assert(page.includes('8–15 gün'),'8-15 aging UI missing');
assert(page.includes('16–30 gün'),'16-30 aging UI missing');
assert(page.includes('31+ gün'),'31+ aging UI missing');
assert(page.includes('Yenileme kaynaklı gecikme'),'renewal overdue filter missing');
assert(page.includes('Risk merkezi borç bakiyesini veya tahsilat kayıtlarını değiştirmez.'),
  'risk center financial-source-of-truth explanation missing');
assert(!page.includes("tr_sync_cases($pdo,$user);\n    }catch"),
  'GET page load must not silently synchronize/write risk cases');
assert(css.includes('.role-pill.critical'),'critical risk styling missing');

assert(finance.includes('href="tahsilat-risk.php"'),'commercial finance risk-center shortcut missing');
assert(renewals.includes('href="tahsilat-risk.php"'),'renewal center risk-center shortcut missing');
assert(!admin.includes('Tahsilat Risk Merkezi'),'legacy commercial navigation must stay hidden from the education-focused Super Admin');

assert(migration.includes('CREATE TABLE IF NOT EXISTS ticari_tahsilat_takipleri'),'risk tracking table missing');
assert(migration.includes('PRIMARY KEY(sozlesme_id)'),'one risk case per contract invariant missing');
assert(migration.includes('CREATE TABLE IF NOT EXISTS ticari_tahsilat_takip_gecmisi'),'risk history table missing');
assert(!migration.includes('ALTER TABLE kurum_sozlesmeleri'),'release must not mutate legacy finance schema for risk tracking');

assert(workflow.includes('node tests/commercial-risk-center-175.cjs'),
  'commercial risk source regression missing from quality gate');
assert(workflow.includes('php tests/commercial-risk-center-db-175.php'),
  'commercial risk MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=50,'commercial risk center requires 1.2.50 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.50.md',
  'database/migrations/082_ticari_tahsilat_risk_merkezi.sql',
  'src/tahsilat_risk.php',
  'tahsilat-risk.php',
  'tahsilat-risk.css',
  'tests/commercial-risk-center-175.cjs',
  'tests/commercial-risk-center-db-175.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: collection aging, financial-source-of-truth risk queue, reopen/close policy and Super Admin follow-up source contract');
