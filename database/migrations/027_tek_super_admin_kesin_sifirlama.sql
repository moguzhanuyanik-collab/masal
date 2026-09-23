-- İlkAdım V1.0.68
-- V1.0.67 tabanı üzerinde kullanıcı temizliği.
-- Öğrenci HTML/CSS/JS dosyalarına dokunmaz.
-- Mevcut ve doğrulanmış Süper Admin hesabını korur.

SET NAMES utf8mb4;
SET @ilkadim_old_fk_checks = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;
START TRANSACTION;

DELETE FROM veli_ogrenci;
DELETE FROM ogretmen_ogrenci;
DELETE FROM ogrenci_oturum_tokenlari;
DELETE FROM veliler;
DELETE FROM ogretmenler;
DELETE FROM ogrenciler;

SET @super_admin_id = (
  SELECT id
  FROM kullanicilar
  WHERE email='m.oguzhanuyanik@gmail.com'
  ORDER BY id
  LIMIT 1
);

DELETE FROM kurum_kullanicilari
WHERE kullanici_id<>@super_admin_id OR @super_admin_id IS NULL;

DELETE FROM kullanici_oturum_tokenlari
WHERE kullanici_id<>@super_admin_id OR @super_admin_id IS NULL;

DELETE FROM kullanici_rolleri
WHERE kullanici_id<>@super_admin_id OR @super_admin_id IS NULL;

DELETE FROM kullanicilar
WHERE id<>@super_admin_id OR @super_admin_id IS NULL;

UPDATE kullanicilar
SET ad_soyad='Süper Admin',ana_rol='super_admin',aktif=1,son_giris_tarihi=NULL,son_giris_ip=NULL
WHERE id=@super_admin_id;

INSERT IGNORE INTO kullanici_rolleri (kullanici_id,rol)
SELECT @super_admin_id,'super_admin'
WHERE @super_admin_id IS NOT NULL;

COMMIT;
SET FOREIGN_KEY_CHECKS = @ilkadim_old_fk_checks;
