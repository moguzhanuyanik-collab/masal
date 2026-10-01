'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/lisans_yenileme_ticari.php','utf8');
const renewalPage=fs.readFileSync('lisans-yenilemeleri.php','utf8');
const financePage=fs.readFileSync('ticari-finans.php','utf8');
const migration=fs.readFileSync('database/migrations/081_yenileme_sozlesme_tahsilat_baglantisi.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('function lyt_tables_ready('),'renewal commercial readiness helper missing');
assert(domain.includes('function lyt_contract_relation('),'renewal contract relation query missing');
assert(domain.includes('function lyt_contract_start_date('),'renewal contract start-date helper missing');
assert(domain.includes('function lyt_create_contract_draft('),'renewal contract draft creation missing');
assert(domain.includes('function lyt_contract_links('),'finance renewal lineage map missing');
assert(domain.includes('function lyt_revenue_summary('),'renewal revenue summary missing');
assert(domain.includes('function lyt_gap_rows('),'renewal commercial gap scanner missing');
assert(domain.includes('function lyt_gap_summary('),'renewal commercial gap summary missing');

assert(domain.includes("if((string)$case['durum']!=='yenilendi')"),
  'commercial draft must require a renewed license case');
assert(domain.includes("SELECT sozlesme_id FROM lisans_yenileme_sozlesmeleri WHERE yenileme_id=? LIMIT 1 FOR UPDATE"),
  'renewal mapping must be locked before draft creation');
assert(domain.includes("durum'=>'taslak'"),
  'renewal-created contract must begin as draft');
assert(domain.includes("Lisans yenileme #'.$renewalId.' için oluşturulan sözleşme taslağı."),
  'contract source note missing');
assert(domain.includes("ly_add_history(") && domain.includes("'ticari','sozlesme_taslak'"),
  'renewal history must record commercial draft creation');
assert(!domain.includes('DELETE FROM lisans_yenileme_sozlesmeleri'),
  'renewal/contract relation must not be physically deleted');

assert(domain.includes("CASE") && domain.includes("'sozlesme_yok'"),
  'renewed-without-contract gap state missing');
assert(domain.includes("'sozlesme_taslak'"),
  'draft-contract gap state missing');
assert(domain.includes("'tahsilat_yok'"),
  'no-payment gap state missing');
assert(domain.includes("'kismi_tahsilat'"),
  'partial-payment gap state missing');
assert(domain.includes("'tamam'"),
  'commercially-complete state missing');

assert(renewalPage.includes("require __DIR__.'/src/lisans_yenileme_ticari.php';"),
  'renewal center must load commercial linkage domain');
assert(renewalPage.includes('name="action" value="contract_draft"'),
  'renewal center contract-draft action missing');
assert(renewalPage.includes('Sözleşme Taslağı Oluştur'),
  'renewal center contract draft UI missing');
assert(renewalPage.includes('Toplam tutar otomatik hesaplanmaz'),
  'renewal center must not infer commercial total from package monthly price');
assert(renewalPage.includes('Yenileme → Sözleşme → Tahsilat'),
  'commercial completion dashboard missing');
assert(renewalPage.includes('Yenilendi · sözleşme yok'),
  'renewed-without-contract visibility missing');
assert(renewalPage.includes('Aktif sözleşme · tahsilat yok'),
  'renewed-without-payment visibility missing');
assert(renewalPage.includes('Tahsilat / yenileme sözleşmesi'),
  'renewal revenue summary UI missing');

assert(financePage.includes("require __DIR__.'/src/lisans_yenileme_ticari.php';"),
  'finance must load renewal linkage domain');
assert(financePage.includes('lyt_contract_links('),
  'finance must load renewal lineage for contract rows');
assert(financePage.includes('Yenileme #'),
  'finance contract UI must expose renewal lineage');

assert(migration.includes('CREATE TABLE IF NOT EXISTS lisans_yenileme_sozlesmeleri'),
  'renewal/contract mapping table missing');
assert(migration.includes('PRIMARY KEY(yenileme_id)'),
  'one contract per renewal invariant missing');
assert(migration.includes('UNIQUE KEY uk_yenileme_sozlesme (sozlesme_id)'),
  'one renewal per contract invariant missing');
assert(!migration.includes('ALTER TABLE kurum_sozlesmeleri'),
  'release must not mutate legacy contract table for linkage');

assert(workflow.includes('node tests/renewal-commercial-link-174.cjs'),
  'renewal commercial source regression missing from quality gate');
assert(workflow.includes('php tests/renewal-commercial-link-db-174.php'),
  'renewal commercial DB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=49,'renewal commercial linkage requires 1.2.49 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.49.md',
  'database/migrations/081_yenileme_sozlesme_tahsilat_baglantisi.sql',
  'src/lisans_yenileme_ticari.php',
  'tests/renewal-commercial-link-174.cjs',
  'tests/renewal-commercial-link-db-174.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: renewal-contract-payment linkage, commercial gaps and renewal revenue source contract');
