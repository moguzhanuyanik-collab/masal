SET NAMES utf8mb4;

SET @has_ogrenci_sinif=(SELECT COUNT(*) FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name='ogrenciler' AND column_name='sinif_seviyesi');
SET @sql=IF(@has_ogrenci_sinif=0,'ALTER TABLE ogrenciler ADD COLUMN sinif_seviyesi TINYINT UNSIGNED NOT NULL DEFAULT 1 AFTER profil_fotografi','SET @ilkadim_noop=1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @has_modul_sinif=(SELECT COUNT(*) FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name='ders_modulleri' AND column_name='sinif_seviyesi');
SET @sql=IF(@has_modul_sinif=0,'ALTER TABLE ders_modulleri ADD COLUMN sinif_seviyesi TINYINT UNSIGNED NOT NULL DEFAULT 1 AFTER ders_id','SET @ilkadim_noop=1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @has_modul_sinif_index=(SELECT COUNT(*) FROM information_schema.statistics WHERE table_schema=DATABASE() AND table_name='ders_modulleri' AND index_name='ix_ders_modul_sinif');
SET @sql=IF(@has_modul_sinif_index=0,'ALTER TABLE ders_modulleri ADD KEY ix_ders_modul_sinif (ders_id,sinif_seviyesi,aktif,sira)','SET @ilkadim_noop=1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @ders_id_type=(SELECT COLUMN_TYPE FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name='dersler' AND column_name='id' LIMIT 1);
SET @ders_id_type=IFNULL(@ders_id_type,'INT UNSIGNED');
SET @sql=CONCAT(
  'CREATE TABLE IF NOT EXISTS sinif_dersleri (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'sinif_seviyesi TINYINT UNSIGNED NOT NULL,',
  'ders_id ',@ders_id_type,' NOT NULL,',
  'haftalik_saat SMALLINT UNSIGNED NOT NULL DEFAULT 0,',
  'sira INT NOT NULL DEFAULT 0,',
  'aktif TINYINT(1) NOT NULL DEFAULT 1,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,',
  'PRIMARY KEY (id),',
  'UNIQUE KEY uk_sinif_ders (sinif_seviyesi,ders_id),',
  'KEY ix_sinif_ders_sira (sinif_seviyesi,aktif,sira)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

INSERT INTO sinif_dersleri (sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 1,id,COALESCE(haftalik_saat,0),COALESCE(sira,0),aktif FROM dersler
ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=VALUES(aktif);

SET @has_ilerleme_sinif=(SELECT COUNT(*) FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name='ogrenci_ilerleme' AND column_name='sinif_seviyesi');
SET @sql=IF(@has_ilerleme_sinif=0,'ALTER TABLE ogrenci_ilerleme ADD COLUMN sinif_seviyesi TINYINT UNSIGNED NOT NULL DEFAULT 1 AFTER ogrenci_id','SET @ilkadim_noop=1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @has_old_ilerleme_unique=(SELECT COUNT(*) FROM information_schema.statistics WHERE table_schema=DATABASE() AND table_name='ogrenci_ilerleme' AND index_name='uk_ogrenci_ilerleme');
SET @sql=IF(@has_old_ilerleme_unique>0,'ALTER TABLE ogrenci_ilerleme DROP INDEX uk_ogrenci_ilerleme','SET @ilkadim_noop=1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
ALTER TABLE ogrenci_ilerleme ADD UNIQUE KEY uk_ogrenci_ilerleme (ogrenci_id,sinif_seviyesi,ders_kodu,modul_indeksi);

SET @has_cevap_sinif=(SELECT COUNT(*) FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name='ogrenci_cevaplari' AND column_name='sinif_seviyesi');
SET @sql=IF(@has_cevap_sinif=0,'ALTER TABLE ogrenci_cevaplari ADD COLUMN sinif_seviyesi TINYINT UNSIGNED NOT NULL DEFAULT 1 AFTER ogrenci_id','SET @ilkadim_noop=1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @has_cevap_sinif_index=(SELECT COUNT(*) FROM information_schema.statistics WHERE table_schema=DATABASE() AND table_name='ogrenci_cevaplari' AND index_name='ix_cevap_ogrenci_sinif_tarih');
SET @sql=IF(@has_cevap_sinif_index=0,'ALTER TABLE ogrenci_cevaplari ADD KEY ix_cevap_ogrenci_sinif_tarih (ogrenci_id,sinif_seviyesi,cevap_tarihi)','SET @ilkadim_noop=1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
