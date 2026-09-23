-- İlkAdım V1.0.69
-- V1.0.68 FK uyumluluk düzeltmesi.
-- Öğrenci HTML/CSS/JS dosyalarına dokunmaz.
-- Eski kurum_kullanicilari şemalarındaki veli/öğretmen/öğrenci FK bağlarını
-- profil kayıtlarından önce tamamen temizler.
-- Sonuçta yalnızca mevcut Süper Admin hesabı aktif kullanıcı olarak kalır.

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

DELETE FROM kurum_kullanicilari;
DELETE FROM veli_ogrenci;
DELETE FROM ogretmen_ogrenci;
DELETE FROM ogrenci_oturum_tokenlari;

DELETE FROM veliler;
DELETE FROM ogretmenler;
DELETE FROM ogrenciler;

DELETE FROM kullanici_oturum_tokenlari
WHERE kullanici_id<>@super_admin_id OR @super_admin_id IS NULL;

DELETE FROM kullanici_rolleri
WHERE kullanici_id<>@super_admin_id OR @super_admin_id IS NULL;

DELETE FROM kullanicilar
WHERE id<>@super_admin_id OR @super_admin_id IS NULL;

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
