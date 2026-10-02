SET NAMES utf8mb4;

-- Ticari belge / tahakkuk referanslari ve tahsilat eslemeleri.
-- Bu tablolar yasal e-Fatura/e-Arsiv uretmez; yalniz harici belge referansi ve ic tahakkuk takibi yapar.

SET @tb_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @tb_user_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='id' LIMIT 1
);
SET @tb_kurum_id_type = IFNULL(@tb_kurum_id_type,'BIGINT UNSIGNED');
SET @tb_user_id_type = IFNULL(@tb_user_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ticari_belgeler (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'sozlesme_id BIGINT UNSIGNED NOT NULL,',
  'kurum_id ',@tb_kurum_id_type,' NOT NULL,',
  'belge_turu VARCHAR(30) NOT NULL,',
  'belge_no VARCHAR(120) NOT NULL,',
  'belge_tarihi DATE NOT NULL,',
  'tutar DECIMAL(14,2) NOT NULL,',
  'para_birimi CHAR(3) NOT NULL,',
  'durum VARCHAR(20) NOT NULL DEFAULT ''aktif'',',
  'notlar VARCHAR(2000) NULL,',
  'iptal_nedeni VARCHAR(500) NULL,',
  'iptal_tarihi DATETIME NULL,',
  'olusturan_kullanici_id ',@tb_user_id_type,' NULL,',
  'guncelleyen_kullanici_id ',@tb_user_id_type,' NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'UNIQUE KEY uk_ticari_belge_no (kurum_id,belge_turu,belge_no),',
  'KEY ix_ticari_belge_sozlesme (sozlesme_id,durum),',
  'KEY ix_ticari_belge_kurum_tarih (kurum_id,belge_tarihi)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ticari_belge_tahsilat_eslemeleri (',
  'belge_id BIGINT UNSIGNED NOT NULL,',
  'tahsilat_id BIGINT UNSIGNED NOT NULL,',
  'sozlesme_id BIGINT UNSIGNED NOT NULL,',
  'kurum_id ',@tb_kurum_id_type,' NOT NULL,',
  'tutar DECIMAL(14,2) NOT NULL,',
  'durum VARCHAR(20) NOT NULL DEFAULT ''aktif'',',
  'iptal_nedeni VARCHAR(500) NULL,',
  'iptal_tarihi DATETIME NULL,',
  'olusturan_kullanici_id ',@tb_user_id_type,' NULL,',
  'guncelleyen_kullanici_id ',@tb_user_id_type,' NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,',
  'PRIMARY KEY(belge_id,tahsilat_id),',
  'KEY ix_ticari_belge_esleme_tahsilat (tahsilat_id,durum),',
  'KEY ix_ticari_belge_esleme_sozlesme (sozlesme_id,kurum_id,durum)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ticari_belge_gecmisi (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'belge_id BIGINT UNSIGNED NOT NULL,',
  'sozlesme_id BIGINT UNSIGNED NOT NULL,',
  'kurum_id ',@tb_kurum_id_type,' NOT NULL,',
  'kullanici_id ',@tb_user_id_type,' NULL,',
  'tur VARCHAR(30) NOT NULL,',
  'kod VARCHAR(40) NULL,',
  'detay VARCHAR(2000) NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'KEY ix_ticari_belge_gecmis_belge (belge_id,id),',
  'KEY ix_ticari_belge_gecmis_kurum (kurum_id,id)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
