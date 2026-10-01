SET NAMES utf8mb4;

-- Öğretmen içeriklerinde yayın anındaki sınıf/grup hedefini öğrenci bazında snapshot olarak saklar.
-- Böylece grup üyeliği sonradan değişse bile eski yayının hangi grup öğrencilerine gönderildiği korunur.

SET @oihg_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @oihg_ogrenci_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='ogrenciler' AND column_name='id' LIMIT 1
);
SET @oihg_kurum_id_type = IFNULL(@oihg_kurum_id_type,'BIGINT UNSIGNED');
SET @oihg_ogrenci_id_type = IFNULL(@oihg_ogrenci_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ogretmen_icerik_hedef_gruplari (',
  'icerik_id BIGINT UNSIGNED NOT NULL,',
  'kurum_sinif_id BIGINT UNSIGNED NOT NULL,',
  'kurum_id ',@oihg_kurum_id_type,' NOT NULL,',
  'ogrenci_id ',@oihg_ogrenci_id_type,' NOT NULL,',
  'grup_adi VARCHAR(120) NOT NULL,',
  'grup_turu VARCHAR(20) NOT NULL,',
  'sinif_seviyesi TINYINT UNSIGNED NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY (icerik_id,kurum_sinif_id,ogrenci_id),',
  'KEY ix_oihg_icerik_grup (icerik_id,kurum_sinif_id),',
  'KEY ix_oihg_kurum_grup (kurum_id,kurum_sinif_id),',
  'KEY ix_oihg_ogrenci (ogrenci_id,icerik_id)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
