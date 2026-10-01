SET NAMES utf8mb4;

-- Güvenli şifre kurtarma:
-- * ham token hiçbir zaman veritabanına yazılmaz
-- * token 30 dakika / tek kullanım
-- * istekler e-posta ve IP hash'i üzerinden rate-limit edilir
-- * oturum_surumu parola sıfırlamasında artırılarak eski oturumlar geçersizleştirilir

SET @pr_user_id_type = (
  SELECT COLUMN_TYPE
  FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='id'
  LIMIT 1
);
SET @pr_user_id_type = IFNULL(@pr_user_id_type,'BIGINT UNSIGNED');

SET @has_auth_version = (
  SELECT COUNT(*)
  FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='oturum_surumu'
);
SET @sql = IF(
  @has_auth_version=0,
  'ALTER TABLE kullanicilar ADD COLUMN oturum_surumu INT UNSIGNED NOT NULL DEFAULT 1',
  'SET @ilkadim_noop = 1'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS sifre_sifirlama_tokenlari (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'kullanici_id ',@pr_user_id_type,' NOT NULL,',
  'token_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,',
  'son_kullanma_tarihi DATETIME NOT NULL,',
  'kullanildi_tarihi DATETIME NULL,',
  'iptal_tarihi DATETIME NULL,',
  'talep_ip_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'UNIQUE KEY uk_sifre_token_hash (token_hash),',
  'KEY ix_sifre_token_kullanici (kullanici_id,kullanildi_tarihi,iptal_tarihi),',
  'KEY ix_sifre_token_sure (son_kullanma_tarihi)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

CREATE TABLE IF NOT EXISTS sifre_sifirlama_guvenlik (
  kapsam VARCHAR(20) NOT NULL,
  kapsam_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  deneme_sayisi INT UNSIGNED NOT NULL DEFAULT 0,
  pencere_baslangici DATETIME NOT NULL,
  engel_bitis DATETIME NULL,
  son_deneme DATETIME NOT NULL,
  PRIMARY KEY(kapsam,kapsam_hash),
  KEY ix_sifre_guvenlik_engel (engel_bitis),
  KEY ix_sifre_guvenlik_son (son_deneme)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
