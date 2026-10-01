SET NAMES utf8mb4;

-- Kurum bazlı aylık AdımBot AI kullanım sayacı.
-- Paket lisansı olmayan kurumlarda sayaç takip amaçlıdır; kota engeli uygulanmaz.

SET @ak_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @ak_ogrenci_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='ogrenciler' AND column_name='id' LIMIT 1
);
SET @ak_kurum_id_type = IFNULL(@ak_kurum_id_type,'BIGINT UNSIGNED');
SET @ak_ogrenci_id_type = IFNULL(@ak_ogrenci_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS adimbot_ai_kullanimlari (',
  'kurum_id ',@ak_kurum_id_type,' NOT NULL,',
  'donem_baslangici DATE NOT NULL,',
  'kullanim_sayisi INT UNSIGNED NOT NULL DEFAULT 0,',
  'son_ogrenci_id ',@ak_ogrenci_id_type,' NULL,',
  'son_saglayici VARCHAR(20) NULL,',
  'son_model VARCHAR(120) NULL,',
  'son_kullanim DATETIME NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,',
  'PRIMARY KEY (kurum_id,donem_baslangici),',
  'KEY ix_adimbot_ai_donem (donem_baslangici,kullanim_sayisi),',
  'KEY ix_adimbot_ai_son_ogrenci (son_ogrenci_id,son_kullanim)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
