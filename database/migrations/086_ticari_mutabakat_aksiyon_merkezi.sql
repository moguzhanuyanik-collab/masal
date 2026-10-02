SET NAMES utf8mb4;

-- Ticari mutabakat tespitlerini operasyonel vaka ve append-only takip geçmişine dönüştürür.
-- Finansal kaynak verileri bu tablolarda kopyalanmaz veya otomatik düzeltilmez.

SET @ma_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @ma_user_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='id' LIMIT 1
);
SET @ma_kurum_id_type = IFNULL(@ma_kurum_id_type,'BIGINT UNSIGNED');
SET @ma_user_id_type = IFNULL(@ma_user_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ticari_mutabakat_vakalari (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'anahtar CHAR(64) NOT NULL,',
  'kaynak_turu VARCHAR(30) NOT NULL,',
  'kaynak_kodu VARCHAR(40) NOT NULL,',
  'kaynak_id BIGINT UNSIGNED NULL,',
  'kaynak_alt_id BIGINT UNSIGNED NULL,',
  'sozlesme_id BIGINT UNSIGNED NULL,',
  'kurum_id ',@ma_kurum_id_type,' NULL,',
  'para_birimi CHAR(3) NULL,',
  'sorun_turu VARCHAR(20) NOT NULL,',
  'durum VARCHAR(20) NOT NULL DEFAULT ''acik'',',
  'sorumlu_kullanici_id ',@ma_user_id_type,' NULL,',
  'sonraki_aksiyon_tarihi DATE NULL,',
  'son_tespit_tarihi DATETIME NULL,',
  'son_aciklama VARCHAR(2000) NULL,',
  'kapanma_kodu VARCHAR(40) NULL,',
  'kapanma_tarihi DATETIME NULL,',
  'olusturan_kullanici_id ',@ma_user_id_type,' NULL,',
  'guncelleyen_kullanici_id ',@ma_user_id_type,' NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'UNIQUE KEY uk_mutabakat_vaka_anahtar (anahtar),',
  'KEY ix_mutabakat_vaka_kuyruk (durum,sorun_turu,sonraki_aksiyon_tarihi),',
  'KEY ix_mutabakat_vaka_kurum (kurum_id,durum),',
  'KEY ix_mutabakat_vaka_sozlesme (sozlesme_id,durum)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ticari_mutabakat_vaka_gecmisi (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'vaka_id BIGINT UNSIGNED NOT NULL,',
  'kullanici_id ',@ma_user_id_type,' NULL,',
  'tur VARCHAR(20) NOT NULL,',
  'kod VARCHAR(40) NULL,',
  'not_metni VARCHAR(2000) NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'KEY ix_mutabakat_vaka_gecmis (vaka_id,id)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
