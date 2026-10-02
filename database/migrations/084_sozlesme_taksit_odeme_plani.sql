SET NAMES utf8mb4;

-- Sözleşme taksit / ödeme planı.
-- Plan finansal borcu çoğaltmaz; mevcut sözleşme toplamını vade dilimlerine böler.
-- Plan revizyonları fiziksel silme yerine sürüm numarasıyla korunur.

SET @tp_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @tp_user_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='id' LIMIT 1
);
SET @tp_kurum_id_type = IFNULL(@tp_kurum_id_type,'BIGINT UNSIGNED');
SET @tp_user_id_type = IFNULL(@tp_user_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS kurum_sozlesme_taksit_planlari (',
  'sozlesme_id BIGINT UNSIGNED NOT NULL,',
  'kurum_id ',@tp_kurum_id_type,' NOT NULL,',
  'durum VARCHAR(20) NOT NULL DEFAULT ''taslak'',',
  'aktif_surum INT UNSIGNED NOT NULL DEFAULT 1,',
  'olusturan_kullanici_id ',@tp_user_id_type,' NULL,',
  'guncelleyen_kullanici_id ',@tp_user_id_type,' NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,',
  'PRIMARY KEY(sozlesme_id),',
  'KEY ix_taksit_plan_kurum (kurum_id,durum)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS kurum_sozlesme_taksitleri (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'sozlesme_id BIGINT UNSIGNED NOT NULL,',
  'kurum_id ',@tp_kurum_id_type,' NOT NULL,',
  'surum_no INT UNSIGNED NOT NULL,',
  'sira_no INT UNSIGNED NOT NULL,',
  'vade_tarihi DATE NOT NULL,',
  'tutar DECIMAL(14,2) NOT NULL,',
  'aciklama VARCHAR(500) NULL,',
  'olusturan_kullanici_id ',@tp_user_id_type,' NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'UNIQUE KEY uk_taksit_surum_sira (sozlesme_id,surum_no,sira_no),',
  'KEY ix_taksit_sozlesme_surum (sozlesme_id,surum_no,vade_tarihi),',
  'KEY ix_taksit_kurum_vade (kurum_id,vade_tarihi)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS kurum_sozlesme_taksit_gecmisi (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'sozlesme_id BIGINT UNSIGNED NOT NULL,',
  'kurum_id ',@tp_kurum_id_type,' NOT NULL,',
  'kullanici_id ',@tp_user_id_type,' NULL,',
  'tur VARCHAR(20) NOT NULL,',
  'kod VARCHAR(40) NULL,',
  'surum_no INT UNSIGNED NULL,',
  'not_metni VARCHAR(2000) NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'KEY ix_taksit_gecmis_sozlesme (sozlesme_id,id),',
  'KEY ix_taksit_gecmis_kurum (kurum_id,id)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
