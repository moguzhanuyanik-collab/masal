SET NAMES utf8mb4;

-- Paket ve kurum lisansı altyapısı.
-- Geriye uyumluluk: kurum_lisanslari kaydı olmayan kurumlara hiçbir limit uygulanmaz.

SET @kl_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @kl_kurum_id_type = IFNULL(@kl_kurum_id_type,'BIGINT UNSIGNED');

CREATE TABLE IF NOT EXISTS paketler (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  kod VARCHAR(80) NOT NULL,
  ad VARCHAR(120) NOT NULL,
  aciklama VARCHAR(1000) NULL,
  ogrenci_limiti INT UNSIGNED NOT NULL DEFAULT 0,
  ogretmen_limiti INT UNSIGNED NOT NULL DEFAULT 0,
  veli_limiti INT UNSIGNED NOT NULL DEFAULT 0,
  ai_aylik_kota INT UNSIGNED NOT NULL DEFAULT 0,
  aylik_fiyat DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  para_birimi CHAR(3) NOT NULL DEFAULT 'TRY',
  aktif TINYINT(1) NOT NULL DEFAULT 1,
  olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_paket_kod (kod),
  KEY ix_paket_aktif (aktif,ad)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS kurum_lisanslari (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'kurum_id ',@kl_kurum_id_type,' NOT NULL,',
  'paket_id BIGINT UNSIGNED NOT NULL,',
  'baslangic_tarihi DATE NOT NULL,',
  'bitis_tarihi DATE NULL,',
  'durum VARCHAR(20) NOT NULL DEFAULT ''aktif'',',
  'notlar VARCHAR(2000) NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,',
  'PRIMARY KEY (id),',
  'UNIQUE KEY uk_kurum_lisans (kurum_id),',
  'KEY ix_lisans_paket (paket_id,durum),',
  'KEY ix_lisans_tarih (durum,baslangic_tarihi,bitis_tarihi)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
