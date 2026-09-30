SET NAMES utf8mb4;

-- Kurum tablosu yeni kurulumlarda tam şemayla oluşur.
CREATE TABLE IF NOT EXISTS kurumlar (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  kod VARCHAR(80) NOT NULL,
  ad VARCHAR(190) NOT NULL,
  tur VARCHAR(30) NOT NULL DEFAULT 'okul',
  icerik_kaynagi VARCHAR(30) NOT NULL DEFAULT 'kurum',
  logo VARCHAR(255) NULL,
  email VARCHAR(190) NULL,
  telefon VARCHAR(30) NULL,
  adres TEXT NULL,
  aktif TINYINT(1) NOT NULL DEFAULT 1,
  olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_kurum_kod (kod),
  KEY ix_kurum_aktif (aktif,tur)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- Eski kurulumlarda kurumlar tablosu zaten var olabilir.
-- Var olan kayıtları silmeden V1.0.40+ kurum modülünün ihtiyaç duyduğu kolonları ekle.
SET @has_kurum_id = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id'
);
SET @sql = IF(@has_kurum_id=0,
  'ALTER TABLE kurumlar ADD COLUMN id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_kurum_kod = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='kod'
);
SET @sql = IF(@has_kurum_kod=0,
  'ALTER TABLE kurumlar ADD COLUMN kod VARCHAR(80) NULL AFTER id',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_kurum_ad = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='ad'
);
SET @sql = IF(@has_kurum_ad=0,
  'ALTER TABLE kurumlar ADD COLUMN ad VARCHAR(190) NOT NULL DEFAULT ''Kurum'' AFTER kod',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_kurum_tur = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='tur'
);
SET @sql = IF(@has_kurum_tur=0,
  'ALTER TABLE kurumlar ADD COLUMN tur VARCHAR(30) NOT NULL DEFAULT ''okul'' AFTER ad',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_kurum_icerik = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='icerik_kaynagi'
);
SET @sql = IF(@has_kurum_icerik=0,
  'ALTER TABLE kurumlar ADD COLUMN icerik_kaynagi VARCHAR(30) NOT NULL DEFAULT ''kurum'' AFTER tur',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_kurum_logo = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='logo'
);
SET @sql = IF(@has_kurum_logo=0,
  'ALTER TABLE kurumlar ADD COLUMN logo VARCHAR(255) NULL AFTER icerik_kaynagi',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_kurum_email = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='email'
);
SET @sql = IF(@has_kurum_email=0,
  'ALTER TABLE kurumlar ADD COLUMN email VARCHAR(190) NULL AFTER logo',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_kurum_telefon = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='telefon'
);
SET @sql = IF(@has_kurum_telefon=0,
  'ALTER TABLE kurumlar ADD COLUMN telefon VARCHAR(30) NULL AFTER email',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_kurum_adres = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='adres'
);
SET @sql = IF(@has_kurum_adres=0,
  'ALTER TABLE kurumlar ADD COLUMN adres TEXT NULL AFTER telefon',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_kurum_aktif = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='aktif'
);
SET @sql = IF(@has_kurum_aktif=0,
  'ALTER TABLE kurumlar ADD COLUMN aktif TINYINT(1) NOT NULL DEFAULT 1 AFTER adres',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_kurum_created = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='olusturulma_tarihi'
);
SET @sql = IF(@has_kurum_created=0,
  'ALTER TABLE kurumlar ADD COLUMN olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER aktif',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_kurum_updated = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='guncellenme_tarihi'
);
SET @sql = IF(@has_kurum_updated=0,
  'ALTER TABLE kurumlar ADD COLUMN guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER olusturulma_tarihi',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Eski kayıtların boş kurum kodlarını benzersiz ve geriye dönük güvenli biçimde doldur.
UPDATE kurumlar
SET kod=CONCAT('kurum-',id)
WHERE kod IS NULL OR TRIM(kod)='';

-- İlişki tablosunda FK tipi çakışmaması için canlı tabloların gerçek id tiplerini kullan.
SET @kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id'
  LIMIT 1
);
SET @kullanici_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='id'
  LIMIT 1
);
SET @kurum_id_type = IFNULL(@kurum_id_type,'BIGINT UNSIGNED');
SET @kullanici_id_type = IFNULL(@kullanici_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS kurum_kullanicilari (',
  'kurum_id ',@kurum_id_type,' NOT NULL,',
  'kullanici_id ',@kullanici_id_type,' NOT NULL,',
  'kurum_rolu VARCHAR(30) NOT NULL,',
  'aktif TINYINT(1) NOT NULL DEFAULT 1,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY (kurum_id,kullanici_id,kurum_rolu),',
  'KEY ix_kurum_kullanici_user (kullanici_id,aktif),',
  'KEY ix_kurum_kullanici_role (kurum_id,kurum_rolu,aktif)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Önceki yarım veya eski kurulumlarda ilişki tablosu farklı/eksik oluşmuşsa tamamla.
-- Eski satırlar korunur; yeni kimlik kolonları önce NULL eklenir ve yeni kayıtlar açık değerlerle yazılır.
SET @has_kk_kurum_id = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurum_kullanicilari' AND column_name='kurum_id'
);
SET @sql = IF(@has_kk_kurum_id=0,
  CONCAT('ALTER TABLE kurum_kullanicilari ADD COLUMN kurum_id ',@kurum_id_type,' NULL FIRST'),
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_kk_kullanici_id = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurum_kullanicilari' AND column_name='kullanici_id'
);
SET @sql = IF(@has_kk_kullanici_id=0,
  CONCAT('ALTER TABLE kurum_kullanicilari ADD COLUMN kullanici_id ',@kullanici_id_type,' NULL AFTER kurum_id'),
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_kk_rol = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurum_kullanicilari' AND column_name='kurum_rolu'
);
SET @sql = IF(@has_kk_rol=0,
  'ALTER TABLE kurum_kullanicilari ADD COLUMN kurum_rolu VARCHAR(30) NOT NULL DEFAULT ''ogrenci''',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_kk_aktif = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurum_kullanicilari' AND column_name='aktif'
);
SET @sql = IF(@has_kk_aktif=0,
  'ALTER TABLE kurum_kullanicilari ADD COLUMN aktif TINYINT(1) NOT NULL DEFAULT 1',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_kk_created = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurum_kullanicilari' AND column_name='olusturulma_tarihi'
);
SET @sql = IF(@has_kk_created=0,
  'ALTER TABLE kurum_kullanicilari ADD COLUMN olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_kk_user_index = (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema=DATABASE() AND table_name='kurum_kullanicilari' AND index_name='ix_kurum_kullanici_user'
);
SET @sql = IF(@has_kk_user_index=0,
  'ALTER TABLE kurum_kullanicilari ADD KEY ix_kurum_kullanici_user (kullanici_id,aktif)',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_kk_role_index = (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema=DATABASE() AND table_name='kurum_kullanicilari' AND index_name='ix_kurum_kullanici_role'
);
SET @sql = IF(@has_kk_role_index=0,
  'ALTER TABLE kurum_kullanicilari ADD KEY ix_kurum_kullanici_role (kurum_id,kurum_rolu,aktif)',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- İlkAdım bizim kendi kurumumuzdur. Global öğrenciler/veliler kurumdan bağımsız tutulur.
INSERT INTO kurumlar (kod,ad,tur,icerik_kaynagi,aktif)
SELECT 'ilkadim','İlkAdım','platform','sistem',1
WHERE NOT EXISTS (
  SELECT 1 FROM kurumlar WHERE kod='ilkadim'
);

UPDATE kurumlar
SET ad='İlkAdım', tur='platform', icerik_kaynagi='sistem', aktif=1
WHERE kod='ilkadim';

SET @ilkadim_kurum_id = (
  SELECT id FROM kurumlar WHERE kod='ilkadim' ORDER BY id LIMIT 1
);

-- Yalnızca yönetim hesaplarını bizim kurumumuza bağla.
-- Öğrenci/veli/öğretmen global kullanıcıları 020 migration tarafından kurumdan ayrılır.
INSERT IGNORE INTO kurum_kullanicilari (kurum_id,kullanici_id,kurum_rolu,aktif)
SELECT @ilkadim_kurum_id,k.id,'yonetici',1
FROM kullanicilar k
INNER JOIN kullanici_rolleri r ON r.kullanici_id=k.id
WHERE @ilkadim_kurum_id IS NOT NULL
  AND k.aktif=1
  AND r.rol IN ('super_admin','yonetici');
