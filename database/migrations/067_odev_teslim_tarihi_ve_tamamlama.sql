SET NAMES utf8mb4;

-- Ödev teslim tarihi ve öğrenci tamamlama durumu.
-- Migration idempotenttir; veri silmez ve mevcut ödev kayıtlarını değiştirmez.

SET @has_due = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE()
    AND table_name='ogretmen_icerikleri'
    AND column_name='teslim_tarihi'
);
SET @sql = IF(
  @has_due=0,
  'ALTER TABLE ogretmen_icerikleri ADD COLUMN teslim_tarihi DATETIME NULL AFTER hedef_turu',
  'SET @ilkadim_067_noop = 1'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_due_index = (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema=DATABASE()
    AND table_name='ogretmen_icerikleri'
    AND index_name='ix_oi_odev_teslim'
);
SET @sql = IF(
  @has_due_index=0,
  'ALTER TABLE ogretmen_icerikleri ADD KEY ix_oi_odev_teslim (icerik_turu,aktif,teslim_tarihi)',
  'SET @ilkadim_067_noop = 1'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @oi_ogrenci_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='ogrenciler' AND column_name='id' LIMIT 1
);
SET @oi_ogrenci_id_type = IFNULL(@oi_ogrenci_id_type,'INT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ogrenci_odev_durumlari (',
  'icerik_id BIGINT UNSIGNED NOT NULL,',
  'ogrenci_id ',@oi_ogrenci_id_type,' NOT NULL,',
  'tamamlandi TINYINT(1) NOT NULL DEFAULT 0,',
  'tamamlanma_tarihi DATETIME NULL,',
  'guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,',
  'PRIMARY KEY (icerik_id,ogrenci_id),',
  'KEY ix_ood_ogrenci (ogrenci_id,tamamlandi,guncellenme_tarihi)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
