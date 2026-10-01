SET NAMES utf8mb4;

-- Kurum sınıf / grup yapısı.
-- Migration idempotenttir; mevcut kullanıcı ve eşleştirme kayıtlarını değiştirmez.

SET @ks_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @ks_ogrenci_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='ogrenciler' AND column_name='id' LIMIT 1
);
SET @ks_kurum_id_type = IFNULL(@ks_kurum_id_type,'BIGINT UNSIGNED');
SET @ks_ogrenci_id_type = IFNULL(@ks_ogrenci_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS kurum_siniflari (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'kurum_id ',@ks_kurum_id_type,' NOT NULL,',
  'ad VARCHAR(120) NOT NULL,',
  'tur VARCHAR(20) NOT NULL DEFAULT ''sinif'',',
  'sinif_seviyesi TINYINT UNSIGNED NULL,',
  'aktif TINYINT(1) NOT NULL DEFAULT 1,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,',
  'PRIMARY KEY (id),',
  'UNIQUE KEY uk_kurum_sinif_ad (kurum_id,ad),',
  'KEY ix_kurum_sinif_liste (kurum_id,aktif,tur,sinif_seviyesi)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS kurum_sinif_ogrencileri (',
  'kurum_sinif_id BIGINT UNSIGNED NOT NULL,',
  'kurum_id ',@ks_kurum_id_type,' NOT NULL,',
  'ogrenci_id ',@ks_ogrenci_id_type,' NOT NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY (kurum_sinif_id,ogrenci_id),',
  'KEY ix_kso_kurum_ogrenci (kurum_id,ogrenci_id),',
  'KEY ix_kso_kurum_sinif (kurum_id,kurum_sinif_id)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
