-- İlkAdım V1.0.65
-- Tek seferlik kullanıcı temizliği.
-- Projenin güvenli silme kuralına göre mevcut hesaplar fiziksel olarak silinmez; pasife alınır.
-- Güncelleme sonunda yalnızca belirtilen Süper Admin hesabı aktif kalır.

SET NAMES utf8mb4;

START TRANSACTION;

UPDATE kullanicilar SET aktif=0;
UPDATE ogrenciler SET aktif=0;
UPDATE veliler SET aktif=0;
UPDATE ogretmenler SET aktif=0;
UPDATE kurum_kullanicilari SET aktif=0;
UPDATE ogretmen_icerikleri SET aktif=0;
UPDATE kullanici_oturum_tokenlari SET son_kullanma_tarihi=NOW();
UPDATE ogrenci_oturum_tokenlari SET son_kullanma_tarihi=NOW();

INSERT INTO kullanicilar
(email,sifre_hash,ad_soyad,ana_rol,aktif,son_giris_tarihi,son_giris_ip)
VALUES
(
  'm.oguzhanuyanik@gmail.com',
  '$2y$12$.8SKLdhRDpK4B0wlxV0afu2RfxUZLWthTMpnumrmNFGBXEse4EIzq',
  'Süper Admin',
  'super_admin',
  1,
  NULL,
  NULL
)
ON DUPLICATE KEY UPDATE
  id=LAST_INSERT_ID(id),
  sifre_hash=VALUES(sifre_hash),
  ad_soyad=VALUES(ad_soyad),
  ana_rol='super_admin',
  aktif=1,
  son_giris_tarihi=NULL,
  son_giris_ip=NULL;

SET @super_admin_id=LAST_INSERT_ID();

INSERT IGNORE INTO kullanici_rolleri (kullanici_id,rol)
VALUES (@super_admin_id,'super_admin');

INSERT INTO kurum_kullanicilari
(kurum_id,kullanici_id,kurum_rolu,aktif)
SELECT id,@super_admin_id,'yonetici',1
FROM kurumlar
WHERE kod='ilkadim'
ORDER BY id
LIMIT 1
ON DUPLICATE KEY UPDATE aktif=1;

COMMIT;
