-- İlkAdım V1.0.66
-- Mevcut kullanıcı verilerini gerçekten temizler ve tek Süper Admin bırakır.
-- Kurumlar ve sistem içerikleri korunur.

SET NAMES utf8mb4;

START TRANSACTION;

DELETE FROM veli_ogrenci;
DELETE FROM ogretmen_ogrenci;

DELETE FROM ogretmen_icerik_cevaplari;
DELETE FROM ogretmen_icerik_hedefleri;
DELETE FROM ogretmen_icerikleri;

DELETE FROM yonetici_yetkileri;
DELETE FROM kurum_kullanicilari;
DELETE FROM kullanici_oturum_tokenlari;
DELETE FROM ogrenci_oturum_tokenlari;
DELETE FROM kullanici_rolleri;

DELETE FROM veliler;
DELETE FROM ogretmenler;
DELETE FROM ogrenciler;
DELETE FROM kullanicilar;

INSERT INTO kullanicilar
(email,sifre_hash,ad_soyad,ana_rol,aktif,son_giris_tarihi,son_giris_ip)
VALUES
(
  'm.oguzhanuyanik@gmail.com',
  '$2y$12$4oF8yVL/WdILEIL13tg1NeaD8yiAbCsSsMJKEgQLCYJKlFXS9co0G',
  'Süper Admin',
  'super_admin',
  1,
  NULL,
  NULL
);

SET @super_admin_id=LAST_INSERT_ID();

INSERT INTO kullanici_rolleri (kullanici_id,rol)
VALUES (@super_admin_id,'super_admin');

INSERT INTO kurum_kullanicilari
(kurum_id,kullanici_id,kurum_rolu,aktif)
SELECT id,@super_admin_id,'yonetici',1
FROM kurumlar
WHERE kod='ilkadim'
ORDER BY id
LIMIT 1;

COMMIT;
