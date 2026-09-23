-- İlkAdım V1.0.69
-- V1.0.68 sonrasında kalmış olabilecek eski kurum FK bağlarını güvenli biçimde temizler.
-- Süper Admin hesabı bulunamazsa kullanıcı temizliği yapmaz.

SET NAMES utf8mb4;
SET @ilkadim_old_fk_checks = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;
START TRANSACTION;

SET @super_admin_id = (
  SELECT id
  FROM kullanicilar
  WHERE email='m.oguzhanuyanik@gmail.com'
  ORDER BY id
  LIMIT 1
);

DELETE FROM kurum_kullanicilari
WHERE @super_admin_id IS NOT NULL;

DELETE FROM veli_ogrenci
WHERE @super_admin_id IS NOT NULL;

DELETE FROM ogretmen_ogrenci
WHERE @super_admin_id IS NOT NULL;

DELETE FROM ogrenci_oturum_tokenlari
WHERE @super_admin_id IS NOT NULL;

DELETE FROM veliler
WHERE @super_admin_id IS NOT NULL;

DELETE FROM ogretmenler
WHERE @super_admin_id IS NOT NULL;

DELETE FROM ogrenciler
WHERE @super_admin_id IS NOT NULL;

DELETE FROM kullanici_oturum_tokenlari
WHERE @super_admin_id IS NOT NULL
  AND kullanici_id<>@super_admin_id;

DELETE FROM kullanici_rolleri
WHERE @super_admin_id IS NOT NULL
  AND kullanici_id<>@super_admin_id;

DELETE FROM kullanicilar
WHERE @super_admin_id IS NOT NULL
  AND id<>@super_admin_id;

UPDATE kullanicilar
SET ad_soyad='Süper Admin',
    ana_rol='super_admin',
    aktif=1,
    son_giris_tarihi=NULL,
    son_giris_ip=NULL
WHERE id=@super_admin_id;

INSERT IGNORE INTO kullanici_rolleri (kullanici_id,rol)
SELECT @super_admin_id,'super_admin'
WHERE @super_admin_id IS NOT NULL;

COMMIT;
SET FOREIGN_KEY_CHECKS = @ilkadim_old_fk_checks;
