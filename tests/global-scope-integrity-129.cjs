'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('yetkilendirme.php','utf8');
const globalMatching=fs.readFileSync('global-eslestirme.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');

assert(page.includes("auth_runtime_column_exists($pdo,'veli_ogrenci','kurum_id')"));
assert(page.includes("auth_runtime_column_exists($pdo,'ogretmen_ogrenci','kurum_id')"));
assert(page.includes("Yönetici hesabını Kurumlar bölümünden bir kuruma bağlayarak oluştur."));
assert(page.includes("Yönetici rolü Kurumlar bölümünden kurum üyeliğiyle birlikte verilmelidir."));
assert(!page.includes('<option value="yonetici">Yönetici</option>'));

assert(page.includes('INSERT IGNORE INTO veli_ogrenci (veli_id,ogrenci_id,kurum_id) VALUES (?,?,0)'));
assert(page.includes('INSERT IGNORE INTO ogretmen_ogrenci (ogretmen_id,ogrenci_id,kurum_id) VALUES (?,?,0)'));
assert(page.includes('DELETE FROM veli_ogrenci WHERE veli_id=? AND ogrenci_id=? AND kurum_id=0'));
assert(page.includes('DELETE FROM ogretmen_ogrenci WHERE ogretmen_id=? AND ogrenci_id=? AND kurum_id=0'));
assert(page.includes('WHERE vo.kurum_id=0'));
assert(page.includes('WHERE oo.kurum_id=0'));

const tenantFilter="NOT EXISTS (\n        SELECT 1 FROM kurum_kullanicilari kk";
assert(page.includes(tenantFilter));
assert(page.includes("Kurum kullanıcısı bu ekrandan global eşleştirmeye eklenemez."));
assert(page.includes("Global öğrenci bulunamadı."));

assert(page.includes("foreach (['ogrenciler','veliler','ogretmenler'] as $profileTable)"));
assert(page.includes('UPDATE {$profileTable} SET aktif=? WHERE kullanici_id=?'));
assert(globalMatching.includes('DELETE FROM veli_ogrenci WHERE veli_id=? AND ogrenci_id=? AND kurum_id=0'));
assert(globalMatching.includes('SELECT veli_id,ogrenci_id FROM veli_ogrenci WHERE kurum_id=0'));
assert(workflow.includes('node tests/global-scope-integrity-129.cjs'));

console.log('PASS: global/tenant matching and manager scope integrity contract');
