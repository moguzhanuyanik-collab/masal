'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/ticari_belgeler.php','utf8');
const page=fs.readFileSync('ticari-belgeler.php','utf8');
const migration=fs.readFileSync('database/migrations/085_ticari_belge_tahakkuk_merkezi.sql','utf8');
const admin=fs.readFileSync('super-admin.php','utf8');
const dashboard=fs.readFileSync('ticari-dashboard.php','utf8');
const finance=fs.readFileSync('ticari-finans.php','utf8');
const calendar=fs.readFileSync('tahsilat-takvimi.php','utf8');
const institution360=fs.readFileSync('kurum-ticari-360.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

for(const fn of [
  'tb_tables_ready','tb_document_types','tb_contract_document_total','tb_document_mapping_count',
  'tb_document_effective_allocated','tb_payment_effective_allocated','tb_contract_options',
  'tb_document_rows','tb_document_row','tb_save_document','tb_cancel_document',
  'tb_available_payments','tb_allocate_payment','tb_unallocate_payment',
  'tb_document_mappings','tb_history_rows','tb_currency_summary'
]) assert(domain.includes('function '+fn+'('),fn+' missing');

assert(domain.includes("'fatura_referansi'=>'Harici Fatura / e-Belge Referansı'"),
  'external invoice/e-document reference type missing');
assert(domain.includes("'tahakkuk'=>'İç Tahakkuk'"),'internal accrual type missing');
assert(domain.includes("Yalnız aktif veya tamamlanmış sözleşmeye ticari belge bağlanabilir."),
  'document-to-contract status guard missing');
assert(domain.includes("Aktif belge toplamı sözleşme toplam tutarını aşamaz."),
  'contract document-total cap missing');
assert(domain.includes("Tahsilat eşleme geçmişi olan belgenin türü, numarası, tarihi veya tutarı değiştirilemez."),
  'document identity immutability after allocation history missing');
assert(domain.includes("Belge ve tahsilat aynı kurum ve sözleşmeye ait olmalı."),
  'institution/contract allocation isolation missing');
assert(domain.includes("Belge ve tahsilat para birimi eşleşmiyor."),
  'allocation currency guard missing');
assert(domain.includes("Eşleme tutarı belgenin kalan tutarını aşamaz."),
  'document remaining allocation guard missing');
assert(domain.includes("Eşleme tutarı tahsilatın kullanılabilir tutarını aşamaz."),
  'payment remaining allocation guard missing');
assert(domain.includes("FROM kurum_tahsilatlari WHERE id=? LIMIT 1 FOR UPDATE"),
  'payment row lock missing');
assert(domain.includes("FROM ticari_belgeler WHERE id=? LIMIT 1 FOR UPDATE"),
  'document row lock missing');
assert(domain.includes("'tahsilat_eslendi'"),'allocation history event missing');
assert(domain.includes("'tahsilat_esleme_iptal'"),'unallocation history event missing');
assert(domain.includes("'iptal'"),'document cancellation lifecycle missing');
assert(!domain.includes('DELETE FROM ticari_belgeler'),'documents must not be physically deleted');
assert(!domain.includes('DELETE FROM ticari_belge_tahsilat_eslemeleri'),'allocation records must not be physically deleted');
assert(!domain.includes('DELETE FROM ticari_belge_gecmisi'),'document history must not be physically deleted');
assert(!domain.includes('INSERT INTO kurum_tahsilatlari'),'document domain must not create financial payments');
assert(!domain.includes('UPDATE kurum_tahsilatlari'),'document domain must not mutate financial payments');
assert(!domain.includes('UPDATE kurum_sozlesmeleri'),'document domain must not mutate contract debt');

assert(page.includes("require_role('super_admin')"),'commercial document center must be Super Admin only');
assert(page.includes("verify_csrf($_POST['csrf']??null)"),'commercial document writes must require CSRF');
assert(page.includes('Bu modül yasal e-Fatura/e-Arşiv üretmez'),
  'legal non-issuance disclaimer missing');
assert(page.includes('Belge Referansını Kaydet'),'reference-only action wording missing');
assert(!page.includes('Fatura Kes'),'UI must not claim legal invoice issuance');
assert(!page.includes('e-Fatura Oluştur'),'UI must not claim e-invoice creation');
assert(page.includes('Tahsilatı Belgeye Eşle'),'payment allocation UI missing');
assert(page.includes('Eşlemeyi Kaldır'),'allocation cancellation UI missing');
assert(page.includes('Belge Audit Geçmişi'),'append-only audit UI missing');
assert(page.includes('kurum_id'),'institution-scoped filter support missing');

assert(migration.includes('CREATE TABLE IF NOT EXISTS ticari_belgeler'),'commercial document table missing');
assert(migration.includes('CREATE TABLE IF NOT EXISTS ticari_belge_tahsilat_eslemeleri'),'document/payment mapping table missing');
assert(migration.includes('CREATE TABLE IF NOT EXISTS ticari_belge_gecmisi'),'document audit table missing');
assert(migration.includes('UNIQUE KEY uk_ticari_belge_no (kurum_id,belge_turu,belge_no)'),
  'institution/type/document-number uniqueness missing');
assert(migration.includes('PRIMARY KEY(belge_id,tahsilat_id)'),
  'one current mapping pair invariant missing');
assert(!migration.includes('ALTER TABLE kurum_sozlesmeleri'),'release must not mutate contract source schema');
assert(!migration.includes('ALTER TABLE kurum_tahsilatlari'),'release must not mutate payment source schema');

assert(!admin.includes('Ticari Belge & Tahakkuk'),'legacy commercial navigation must stay hidden from the education-focused Super Admin');
assert(dashboard.includes('aria-label="Ticari Belgeler"'),'dashboard document shortcut missing');
assert(finance.includes('aria-label="Ticari Belgeler"'),'finance document shortcut missing');
assert(calendar.includes('aria-label="Ticari Belgeler"'),'calendar document shortcut missing');
assert(institution360.includes('ticari-belgeler.php?kurum_id='),
  'institution 360 scoped document shortcut missing');

assert(workflow.includes('node tests/commercial-documents-182.cjs'),
  'commercial document source regression missing from quality gate');
assert(workflow.includes('php tests/commercial-documents-db-182.php'),
  'commercial document DB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=57,'commercial document center requires 1.2.57 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.57.md',
  'database/migrations/085_ticari_belge_tahakkuk_merkezi.sql',
  'src/ticari_belgeler.php',
  'ticari-belgeler.php',
  'ticari-belgeler.css',
  'tests/commercial-documents-182.cjs',
  'tests/commercial-documents-db-182.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: commercial document reference, allocation caps, audit history and legal non-issuance source contract');
