SET NAMES utf8mb4;

-- Merkezi kurum duyuruları, alıcı snapshot'ı ve okunma takibi.

SET @bd_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @bd_user_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='id' LIMIT 1
);
SET @bd_kurum_id_type = IFNULL(@bd_kurum_id_type,'BIGINT UNSIGNED');
SET @bd_user_id_type = IFNULL(@bd_user_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS kurum_duyurulari (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'kurum_id ',@bd_kurum_id_type,' NOT NULL,',
  'gonderen_kullanici_id ',@bd_user_id_type,' NOT NULL,',
  'tur VARCHAR(20) NOT NULL DEFAULT ''duyuru'',',
  'kaynak_turu VARCHAR(40) NULL,',
  'kaynak_id BIGINT UNSIGNED NULL,',
  'baslik VARCHAR(190) NOT NULL,',
  'mesaj VARCHAR(4000) NOT NULL,',
  'onem VARCHAR(20) NOT NULL DEFAULT ''normal'',',
  'hedef_roller VARCHAR(120) NOT NULL,',
  'baglanti VARCHAR(255) NULL,',
  'son_gosterim_tarihi DATE NULL,',
  'aktif TINYINT(1) NOT NULL DEFAULT 1,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'UNIQUE KEY uk_duyuru_kaynak (kurum_id,kaynak_turu,kaynak_id),',
  'KEY ix_duyuru_kurum (kurum_id,aktif,olusturulma_tarihi),',
  'KEY ix_duyuru_son_gosterim (aktif,son_gosterim_tarihi)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS kurum_duyuru_alicilari (',
  'duyuru_id BIGINT UNSIGNED NOT NULL,',
  'kurum_id ',@bd_kurum_id_type,' NOT NULL,',
  'kullanici_id ',@bd_user_id_type,' NOT NULL,',
  'kurum_rolu VARCHAR(30) NOT NULL,',
  'okundu_tarihi DATETIME NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY(duyuru_id,kullanici_id),',
  'KEY ix_duyuru_alici_okunmamis (kullanici_id,okundu_tarihi),',
  'KEY ix_duyuru_alici_kurum (kurum_id,kullanici_id)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
