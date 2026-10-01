SET NAMES utf8mb4;

-- Paket / lisans veri bütünlüğü ve append-only lisans geçmişi.
-- Mevcut lisans satırlarını değiştirmez; yalnız bundan sonraki değişiklikler geçmişe yazılır.

SET @li_license_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurum_lisanslari' AND column_name='id' LIMIT 1
);
SET @li_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @li_user_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='id' LIMIT 1
);

SET @li_license_id_type = IFNULL(@li_license_id_type,'BIGINT UNSIGNED');
SET @li_kurum_id_type = IFNULL(@li_kurum_id_type,'BIGINT UNSIGNED');
SET @li_user_id_type = IFNULL(@li_user_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS kurum_lisans_gecmisi (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'lisans_id ',@li_license_id_type,' NOT NULL,',
  'kurum_id ',@li_kurum_id_type,' NOT NULL,',
  'islem VARCHAR(40) NOT NULL,',
  'eski_paket_id BIGINT UNSIGNED NULL,',
  'yeni_paket_id BIGINT UNSIGNED NULL,',
  'eski_durum VARCHAR(20) NULL,',
  'yeni_durum VARCHAR(20) NULL,',
  'eski_baslangic_tarihi DATE NULL,',
  'yeni_baslangic_tarihi DATE NULL,',
  'eski_bitis_tarihi DATE NULL,',
  'yeni_bitis_tarihi DATE NULL,',
  'eski_not_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NULL,',
  'yeni_not_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NULL,',
  'kullanici_id ',@li_user_id_type,' NULL,',
  'aciklama VARCHAR(500) NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'KEY ix_lisans_gecmis_lisans (lisans_id,id),',
  'KEY ix_lisans_gecmis_kurum (kurum_id,id),',
  'KEY ix_lisans_gecmis_tarih (olusturulma_tarihi)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
