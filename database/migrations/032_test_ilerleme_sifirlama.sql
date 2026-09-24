SET NAMES utf8mb4;

-- İlkAdım v1.1.32
-- TEST ilerlemesini sıfırlar. Öğrenci hesapları, profil bilgileri,
-- favoriler ve ders/soru içerikleri korunur.

DELETE FROM ogrenci_ilerleme;
DELETE FROM ogrenci_cevaplari;
DELETE FROM oyun_tamamlamalari;
DELETE FROM okuma_kayitlari;
DELETE FROM calisma_oturumlari;
DELETE FROM gunluk_kullanim;
DELETE FROM ogrenci_rozetleri;
DELETE FROM gunluk_gorevler;

UPDATE ogrenci_yildizlari
SET toplam_yildiz=0;

UPDATE ogrenci_durumlari
SET durum_json=JSON_SET(
  CASE WHEN JSON_VALID(durum_json) THEN durum_json ELSE '{}' END,
  '$.steps', JSON_ARRAY(),
  '$.attempts', JSON_ARRAY(),
  '$.history', JSON_ARRAY(),
  '$.games', JSON_ARRAY(),
  '$.readings', JSON_ARRAY(),
  '$.days', JSON_ARRAY(),
  '$.claimed', JSON_ARRAY(),
  '$.usage', JSON_OBJECT()
);
