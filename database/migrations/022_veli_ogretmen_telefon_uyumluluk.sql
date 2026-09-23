SET NAMES utf8mb4;

-- Eski kurulumlarda veli ve öğretmen profil tablolarında telefon kolonu eksik olabilir.
-- Mevcut veriyi silmeden yalnızca eksik kolonu ekle.

SET @has_veli_telefon = (
  SELECT COUNT(*)
  FROM information_schema.columns
  WHERE table_schema=DATABASE()
    AND table_name='veliler'
    AND column_name='telefon'
);
SET @sql = IF(
  @has_veli_telefon=0,
  'ALTER TABLE veliler ADD COLUMN telefon VARCHAR(30) NULL AFTER ad_soyad',
  'SET @ilkadim_noop = 1'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_ogretmen_telefon = (
  SELECT COUNT(*)
  FROM information_schema.columns
  WHERE table_schema=DATABASE()
    AND table_name='ogretmenler'
    AND column_name='telefon'
);
SET @sql = IF(
  @has_ogretmen_telefon=0,
  'ALTER TABLE ogretmenler ADD COLUMN telefon VARCHAR(30) NULL AFTER ad_soyad',
  'SET @ilkadim_noop = 1'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
