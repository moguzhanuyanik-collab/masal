'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_taksit.php','utf8');
const financeDomain=fs.readFileSync('src/ticari_finans.php','utf8');
const riskDomain=fs.readFileSync('src/tahsilat_risk.php','utf8');
const reminderDomain=fs.readFileSync('src/tahsilat_hatirlatma.php','utf8');
const financePage=fs.readFileSync('ticari-finans.php','utf8');
const riskPage=fs.readFileSync('tahsilat-risk.php','utf8');
const view360=fs.readFileSync('kurum-ticari-360.php','utf8');
const view360Domain=fs.readFileSync('src/kurum_ticari_360.php','utf8');
const migration=fs.readFileSync('database/migrations/084_sozlesme_taksit_odeme_plani.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

for(const name of [
  'tp_tables_ready','tp_plan_row','tp_current_rows','tp_parse_rows',
  'tp_save_plan','tp_activate_plan','tp_deactivate_plan','tp_schedule_state',
  'tp_plan_summaries','tp_history_rows'
]) assert(domain.includes('function '+name+'('),name+' missing');

assert(domain.includes('Bir sözleşmede en fazla 24 taksit olabilir.'),'24 installment cap missing');
assert(domain.includes('Taksit planı için en az 2 vade satırı gerekli.'),'minimum installment guard missing');
assert(domain.includes('Taksit vadeleri artan sırada ve birbirinden farklı olmalı.'),'strict due-order guard missing');
assert(domain.includes('Taksit toplamı sözleşme toplamına eşit olmalı.'),'plan/contract total equality guard missing');
assert(domain.includes("durum='taslak',aktif_surum=?"),'new plan revision must return plan to draft');
assert(domain.includes('aktif_surum']+1') || domain.includes("aktif_surum']+1"),'version increment missing');
assert(domain.includes("WHERE sozlesme_id=? AND surum_no=?"),'current-version installment lookup missing');
assert(domain.includes("Tahsilat geçmişi başlayan sözleşmenin taksit planı değiştirilemez."),
  'payment-history structural lock missing');
assert(domain.includes("Aktif tahsilatı bulunan sözleşmenin taksit planı pasif hale getirilemez."),
  'active-payment deactivation guard missing');
assert(domain.includes("'plan_pasif'"),'safe plan deactivation history missing');
assert(domain.includes("$allocated=min($amount,$remainingPaid)"),'FIFO payment allocation missing');
assert(domain.includes("'gecikmis_kismi'"),'partial overdue installment state missing');
assert(!domain.includes('DELETE FROM kurum_sozlesme_taksitleri'),'installment versions must not be physically deleted');
assert(!domain.includes('DELETE FROM kurum_sozlesme_taksit_gecmisi'),'plan history must not be physically deleted');

assert(financeDomain.includes("kurum_sozlesme_taksit_planlari"),'contract drift guard must detect installment plan');
assert(financeDomain.includes('Aktif taksit planı olan sözleşmenin toplam tutarı değiştirilemez.'),
  'active plan total drift guard missing');
assert(financeDomain.includes('Aktif taksit planı olan sözleşmenin para birimi değiştirilemez.'),
  'active plan currency drift guard missing');
assert(financeDomain.includes('Aktif taksit planı olan sözleşmenin kurumu değiştirilemez.'),
  'active plan institution drift guard missing');

assert(riskDomain.includes('$planDuePredicate'),'risk candidate installment predicate missing');
assert(riskDomain.includes('kurum_sozlesme_taksit_planlari'),'risk candidate must inspect active installment plans');
assert(riskDomain.includes("function_exists('tp_schedule_state')"),'risk financial-state installment override missing');
assert(riskDomain.includes("row['vade_tarihi']=(string)$schedule['sonraki_vade']"),
  'risk due date must move to first unpaid installment');
assert(reminderDomain.includes("Taksit vadesi yaklaşıyor"),'installment manager reminder wording missing');

assert(financePage.includes("require __DIR__.'/src/ticari_taksit.php';"),'finance page must load installment domain');
assert(financePage.includes('name="action" value="installment_save"'),'plan save POST action missing');
assert(financePage.includes('name="action" value="installment_activate"'),'plan activation POST action missing');
assert(financePage.includes('name="action" value="installment_deactivate"'),'plan deactivation POST action missing');
assert(financePage.includes('Taksit & Çoklu Vade'),'installment plan UI missing');
assert(financePage.includes('data-tp-plan'),'installment dynamic form hook missing');
assert(financePage.includes('Tahsilat geçmişi nedeniyle kilitli'),'locked plan UI disclosure missing');

assert(riskPage.includes("require __DIR__.'/src/ticari_taksit.php';"),'risk page must load installment domain');
assert(riskPage.includes('Sonraki Taksit Vadesi'),'risk detail installment due label missing');
assert(view360.includes("require __DIR__.'/src/ticari_taksit.php';"),'commercial 360 must load installment domain');
assert(view360.includes('<th>Taksit Planı</th>'),'commercial 360 installment column missing');
assert(view360Domain.includes("function_exists('tp_plan_summaries')"),'commercial 360 installment augmentation missing');

assert(migration.includes('CREATE TABLE IF NOT EXISTS kurum_sozlesme_taksit_planlari'),'plan table missing');
assert(migration.includes('CREATE TABLE IF NOT EXISTS kurum_sozlesme_taksitleri'),'installment table missing');
assert(migration.includes('CREATE TABLE IF NOT EXISTS kurum_sozlesme_taksit_gecmisi'),'plan history table missing');
assert(migration.includes('UNIQUE KEY uk_taksit_surum_sira (sozlesme_id,surum_no,sira_no)'),
  'versioned installment uniqueness missing');

assert(workflow.includes('node tests/installment-plan-180.cjs'),'source regression missing from Quality Gate');
assert(workflow.includes('php tests/installment-plan-db-180.php'),'MariaDB regression missing from Quality Gate');

assert.strictEqual(version.version,'1.2.55');
assert.strictEqual(release.version,'1.2.55');
assert.strictEqual(manifest.version,'1.2.55');

for(const path of [
  'RELEASE-1.2.55.md',
  'database/migrations/084_sozlesme_taksit_odeme_plani.sql',
  'src/ticari_taksit.php',
  'ticari-taksit.css',
  'ticari-taksit.js',
  'tests/installment-plan-180.cjs',
  'tests/installment-plan-db-180.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: versioned installment plan, contract drift guards, FIFO schedule, risk/reminder and commercial 360 integration');
