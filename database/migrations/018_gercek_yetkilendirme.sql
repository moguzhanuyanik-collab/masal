SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS kullanicilar (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  email VARCHAR(190) NOT NULL,
  sifre_hash VARCHAR(255) NOT NULL,
  ad_soyad VARCHAR(190) NOT NULL DEFAULT '',
  ana_rol VARCHAR(30) NOT NULL DEFAULT 'ogrenci',
  aktif TINYINT(1) NOT NULL DEFAULT 1,
  son_giris_tarihi DATETIME NULL,
  son_giris_ip VARCHAR(45) NULL,
  olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_kullanicilar_email (email),
  KEY ix_kullanicilar_rol (ana_rol,aktif)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS kullanici_rolleri (
  kullanici_id BIGINT UNSIGNED NOT NULL,
  rol VARCHAR(30) NOT NULL,
  olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (kullanici_id,rol),
  KEY ix_kullanici_rolleri_rol (rol),
  CONSTRAINT fk_kullanici_rolleri_kullanici FOREIGN KEY (kullanici_id)
    REFERENCES kullanicilar(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS kullanici_oturum_tokenlari (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  kullanici_id BIGINT UNSIGNED NOT NULL,
  token_hash CHAR(64) NOT NULL,
  son_kullanma_tarihi DATETIME NOT NULL,
  olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_kullanici_token (token_hash),
  KEY ix_kullanici_token_user (kullanici_id,son_kullanma_tarihi),
  CONSTRAINT fk_kullanici_token_user FOREIGN KEY (kullanici_id)
    REFERENCES kullanicilar(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS veliler (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  kullanici_id BIGINT UNSIGNED NOT NULL,
  ad_soyad VARCHAR(190) NOT NULL,
  telefon VARCHAR(30) NULL,
  aktif TINYINT(1) NOT NULL DEFAULT 1,
  olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_veli_kullanici (kullanici_id),
  CONSTRAINT fk_veli_kullanici FOREIGN KEY (kullanici_id)
    REFERENCES kullanicilar(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS ogretmenler (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  kullanici_id BIGINT UNSIGNED NOT NULL,
  ad_soyad VARCHAR(190) NOT NULL,
  telefon VARCHAR(30) NULL,
  aktif TINYINT(1) NOT NULL DEFAULT 1,
  olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ogretmen_kullanici (kullanici_id),
  CONSTRAINT fk_ogretmen_kullanici FOREIGN KEY (kullanici_id)
    REFERENCES kullanicilar(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Eski veritabanlarında veliler/ogretmenler tabloları daha önceden var olabilir.
-- Var olan veriyi silmeden yalnızca V1.0.35 yetkilendirmesinin ihtiyaç duyduğu eksik kolonları ekle.
SET @has_veli_kullanici_id = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='veliler' AND column_name='kullanici_id'
);
SET @sql = IF(@has_veli_kullanici_id=0,
  'ALTER TABLE veliler ADD COLUMN kullanici_id BIGINT UNSIGNED NULL',
  'SELECT 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_veli_ad_soyad = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='veliler' AND column_name='ad_soyad'
);
SET @sql = IF(@has_veli_ad_soyad=0,
  'ALTER TABLE veliler ADD COLUMN ad_soyad VARCHAR(190) NULL',
  'SELECT 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_veli_aktif = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='veliler' AND column_name='aktif'
);
SET @sql = IF(@has_veli_aktif=0,
  'ALTER TABLE veliler ADD COLUMN aktif TINYINT(1) NOT NULL DEFAULT 1',
  'SELECT 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_ogretmen_kullanici_id = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='ogretmenler' AND column_name='kullanici_id'
);
SET @sql = IF(@has_ogretmen_kullanici_id=0,
  'ALTER TABLE ogretmenler ADD COLUMN kullanici_id BIGINT UNSIGNED NULL',
  'SELECT 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_ogretmen_ad_soyad = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='ogretmenler' AND column_name='ad_soyad'
);
SET @sql = IF(@has_ogretmen_ad_soyad=0,
  'ALTER TABLE ogretmenler ADD COLUMN ad_soyad VARCHAR(190) NULL',
  'SELECT 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_ogretmen_aktif = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='ogretmenler' AND column_name='aktif'
);
SET @sql = IF(@has_ogretmen_aktif=0,
  'ALTER TABLE ogretmenler ADD COLUMN aktif TINYINT(1) NOT NULL DEFAULT 1',
  'SELECT 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @veli_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='veliler' AND column_name='id'
  LIMIT 1
);
SET @ogrenci_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='ogrenciler' AND column_name='id'
  LIMIT 1
);
SET @veli_id_type = IFNULL(@veli_id_type,'BIGINT UNSIGNED');
SET @ogrenci_id_type = IFNULL(@ogrenci_id_type,'INT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS veli_ogrenci (',
  'veli_id ',@veli_id_type,' NOT NULL,',
  'ogrenci_id ',@ogrenci_id_type,' NOT NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY (veli_id,ogrenci_id),',
  'KEY ix_veli_ogrenci_ogrenci (ogrenci_id)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @ogretmen_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='ogretmenler' AND column_name='id'
  LIMIT 1
);
SET @ogretmen_id_type = IFNULL(@ogretmen_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ogretmen_ogrenci (',
  'ogretmen_id ',@ogretmen_id_type,' NOT NULL,',
  'ogrenci_id ',@ogrenci_id_type,' NOT NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY (ogretmen_id,ogrenci_id),',
  'KEY ix_ogretmen_ogrenci_ogrenci (ogrenci_id)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

CREATE TABLE IF NOT EXISTS yetki_loglari (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  yapan_kullanici_id BIGINT UNSIGNED NULL,
  hedef_kullanici_id BIGINT UNSIGNED NULL,
  islem VARCHAR(80) NOT NULL,
  detay TEXT NULL,
  ip VARCHAR(45) NULL,
  olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY ix_yetki_log_yapan (yapan_kullanici_id,olusturulma_tarihi),
  KEY ix_yetki_log_hedef (hedef_kullanici_id,olusturulma_tarihi),
  CONSTRAINT fk_yetki_log_yapan FOREIGN KEY (yapan_kullanici_id) REFERENCES kullanicilar(id) ON DELETE SET NULL,
  CONSTRAINT fk_yetki_log_hedef FOREIGN KEY (hedef_kullanici_id) REFERENCES kullanicilar(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET @has_kullanici_id = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='ogrenciler' AND column_name='kullanici_id'
);
SET @sql = IF(@has_kullanici_id=0,
  'ALTER TABLE ogrenciler ADD COLUMN kullanici_id BIGINT UNSIGNED NULL AFTER id',
  'SELECT 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

INSERT INTO kullanicilar (email,sifre_hash,ad_soyad,ana_rol,aktif,son_giris_tarihi,son_giris_ip)
SELECT LOWER(TRIM(o.email)),o.sifre_hash,COALESCE(NULLIF(TRIM(o.ad),''),SUBSTRING_INDEX(LOWER(TRIM(o.email)),'@',1)),'ogrenci',o.aktif,o.son_giris_tarihi,o.son_giris_ip
FROM ogrenciler o
WHERE o.email IS NOT NULL AND TRIM(o.email)<>'' AND o.sifre_hash IS NOT NULL AND o.sifre_hash<>''
ON DUPLICATE KEY UPDATE
  sifre_hash=VALUES(sifre_hash),
  aktif=VALUES(aktif);

INSERT IGNORE INTO kullanici_rolleri (kullanici_id,rol)
SELECT k.id,'ogrenci'
FROM kullanicilar k
INNER JOIN ogrenciler o ON LOWER(TRIM(o.email))=k.email
WHERE o.email IS NOT NULL AND TRIM(o.email)<>'';

UPDATE ogrenciler o
INNER JOIN kullanicilar k ON LOWER(TRIM(o.email))=k.email
SET o.kullanici_id=k.id
WHERE o.kullanici_id IS NULL;

SET @has_ogrenci_user_index = (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema=DATABASE() AND table_name='ogrenciler' AND index_name='uk_ogrenciler_kullanici'
);
SET @sql = IF(@has_ogrenci_user_index=0,
  'ALTER TABLE ogrenciler ADD UNIQUE KEY uk_ogrenciler_kullanici (kullanici_id)',
  'SELECT 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_ogrenci_user_fk = (
  SELECT COUNT(*) FROM information_schema.table_constraints
  WHERE constraint_schema=DATABASE() AND table_name='ogrenciler'
    AND constraint_name='fk_ogrenciler_kullanici' AND constraint_type='FOREIGN KEY'
);
SET @sql = IF(@has_ogrenci_user_fk=0,
  'ALTER TABLE ogrenciler ADD CONSTRAINT fk_ogrenciler_kullanici FOREIGN KEY (kullanici_id) REFERENCES kullanicilar(id) ON DELETE SET NULL',
  'SELECT 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
