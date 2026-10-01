SET NAMES utf8mb4;

-- Versiyonlu yasal belge ve kullanıcı onay kayıtları.
-- Kurulumdan sonra aktif belge yaratılmaz; zorunluluk yalnız Süper Admin bir sürümü yayınladığında başlar.

SET @yl_user_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='id' LIMIT 1
);
SET @yl_user_id_type = IFNULL(@yl_user_id_type,'BIGINT UNSIGNED');

CREATE TABLE IF NOT EXISTS yasal_belgeler (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  belge_turu VARCHAR(40) NOT NULL,
  surum VARCHAR(40) NOT NULL,
  baslik VARCHAR(190) NOT NULL,
  icerik MEDIUMTEXT NOT NULL,
  icerik_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  zorunlu TINYINT(1) NOT NULL DEFAULT 1,
  hedef_roller VARCHAR(150) NOT NULL,
  durum VARCHAR(20) NOT NULL DEFAULT 'taslak',
  yururluk_tarihi DATE NULL,
  yayin_tarihi DATETIME NULL,
  arsiv_tarihi DATETIME NULL,
  olusturan_kullanici_id BIGINT UNSIGNED NOT NULL,
  olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY(id),
  UNIQUE KEY uk_yasal_belge_tur_surum (belge_turu,surum),
  KEY ix_yasal_belge_yayin (belge_turu,durum,zorunlu,yururluk_tarihi),
  KEY ix_yasal_belge_durum (durum,yayin_tarihi)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS yasal_belge_onaylari (',
  'belge_id BIGINT UNSIGNED NOT NULL,',
  'kullanici_id ',@yl_user_id_type,' NOT NULL,',
  'onay_rolu VARCHAR(30) NOT NULL,',
  'belge_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,',
  'onay_ip_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NULL,',
  'user_agent_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NULL,',
  'onay_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY(belge_id,kullanici_id),',
  'KEY ix_yasal_onay_kullanici (kullanici_id,onay_tarihi),',
  'KEY ix_yasal_onay_tarih (onay_tarihi)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
