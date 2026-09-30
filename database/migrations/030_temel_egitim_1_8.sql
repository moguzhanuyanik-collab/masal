SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS egitim_kademeleri (
  id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  kod VARCHAR(30) NOT NULL,
  ad VARCHAR(100) NOT NULL,
  baslangic_sinifi TINYINT UNSIGNED NOT NULL DEFAULT 1,
  bitis_sinifi TINYINT UNSIGNED NOT NULL DEFAULT 8,
  aktif TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  UNIQUE KEY uk_egitim_kademe_kod (kod)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO egitim_kademeleri (kod,ad,baslangic_sinifi,bitis_sinifi,aktif)
VALUES ('temel_egitim','Temel Eğitim',1,8,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),baslangic_sinifi=1,bitis_sinifi=8,aktif=1;

CREATE TABLE IF NOT EXISTS siniflar (
  id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  kademe_kodu VARCHAR(30) NOT NULL DEFAULT 'temel_egitim',
  seviye TINYINT UNSIGNED NOT NULL,
  ad VARCHAR(50) NOT NULL,
  aktif TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  UNIQUE KEY uk_sinif_kademe_seviye (kademe_kodu,seviye),
  KEY ix_sinif_aktif (kademe_kodu,aktif,seviye)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO siniflar (kademe_kodu,seviye,ad,aktif) VALUES
('temel_egitim',1,'1. Sınıf',1),('temel_egitim',2,'2. Sınıf',1),
('temel_egitim',3,'3. Sınıf',1),('temel_egitim',4,'4. Sınıf',1),
('temel_egitim',5,'5. Sınıf',1),('temel_egitim',6,'6. Sınıf',1),
('temel_egitim',7,'7. Sınıf',1),('temel_egitim',8,'8. Sınıf',1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aktif=1;

SET @has_ogrenci_kademe=(SELECT COUNT(*) FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name='ogrenciler' AND column_name='egitim_kademesi');
SET @sql=IF(@has_ogrenci_kademe=0,'ALTER TABLE ogrenciler ADD COLUMN egitim_kademesi VARCHAR(30) NOT NULL DEFAULT ''temel_egitim'' AFTER profil_fotografi','SET @ilkadim_noop=1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
UPDATE ogrenciler SET egitim_kademesi='temel_egitim';
UPDATE ogrenciler SET sinif_seviyesi=1 WHERE sinif_seviyesi<1;
UPDATE ogrenciler SET sinif_seviyesi=8 WHERE sinif_seviyesi>8;

SET @has_sd_kademe=(SELECT COUNT(*) FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name='sinif_dersleri' AND column_name='kademe_kodu');
SET @sql=IF(@has_sd_kademe=0,'ALTER TABLE sinif_dersleri ADD COLUMN kademe_kodu VARCHAR(30) NOT NULL DEFAULT ''temel_egitim'' AFTER id','SET @ilkadim_noop=1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
UPDATE sinif_dersleri SET kademe_kodu='temel_egitim';
DELETE FROM sinif_dersleri WHERE sinif_seviyesi<1 OR sinif_seviyesi>8;

SET @has_sd_kademe_index=(SELECT COUNT(*) FROM information_schema.statistics WHERE table_schema=DATABASE() AND table_name='sinif_dersleri' AND index_name='ix_sinif_ders_kademe');
SET @sql=IF(@has_sd_kademe_index=0,'ALTER TABLE sinif_dersleri ADD KEY ix_sinif_ders_kademe (kademe_kodu,sinif_seviyesi,aktif,sira)','SET @ilkadim_noop=1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @has_dm_kademe=(SELECT COUNT(*) FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name='ders_modulleri' AND column_name='kademe_kodu');
SET @sql=IF(@has_dm_kademe=0,'ALTER TABLE ders_modulleri ADD COLUMN kademe_kodu VARCHAR(30) NOT NULL DEFAULT ''temel_egitim'' AFTER ders_id','SET @ilkadim_noop=1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
UPDATE ders_modulleri SET kademe_kodu='temel_egitim';
UPDATE ders_modulleri SET sinif_seviyesi=1 WHERE sinif_seviyesi<1 OR sinif_seviyesi>8;

SET @ders_id_type=(SELECT COLUMN_TYPE FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name='dersler' AND column_name='id' LIMIT 1);
SET @ders_id_type=IFNULL(@ders_id_type,'INT UNSIGNED');
SET @sql=CONCAT(
  'CREATE TABLE IF NOT EXISTS ders_bolumleri (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'ders_id ',@ders_id_type,' NOT NULL,',
  'kademe_kodu VARCHAR(30) NOT NULL DEFAULT ''temel_egitim'',',
  'sinif_seviyesi TINYINT UNSIGNED NOT NULL,',
  'tur VARCHAR(30) NOT NULL DEFAULT ''unite'',',
  'kod VARCHAR(80) NOT NULL,',
  'ad VARCHAR(190) NOT NULL,',
  'aciklama TEXT NULL,',
  'sira INT NOT NULL DEFAULT 0,',
  'aktif TINYINT(1) NOT NULL DEFAULT 1,',
  'PRIMARY KEY (id),',
  'UNIQUE KEY uk_ders_bolum (ders_id,kademe_kodu,sinif_seviyesi,kod),',
  'KEY ix_ders_bolum_sira (kademe_kodu,sinif_seviyesi,ders_id,aktif,sira)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @has_dm_bolum=(SELECT COUNT(*) FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name='ders_modulleri' AND column_name='bolum_id');
SET @sql=IF(@has_dm_bolum=0,'ALTER TABLE ders_modulleri ADD COLUMN bolum_id BIGINT UNSIGNED NULL AFTER sinif_seviyesi','SET @ilkadim_noop=1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @has_dm_class_index=(SELECT COUNT(*) FROM information_schema.statistics WHERE table_schema=DATABASE() AND table_name='ders_modulleri' AND index_name='ix_ders_modul_kademe_sinif');
SET @sql=IF(@has_dm_class_index=0,'ALTER TABLE ders_modulleri ADD KEY ix_ders_modul_kademe_sinif (kademe_kodu,sinif_seviyesi,ders_id,aktif,sira)','SET @ilkadim_noop=1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
