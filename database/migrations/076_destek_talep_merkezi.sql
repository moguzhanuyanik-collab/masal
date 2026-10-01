SET NAMES utf8mb4;

-- Destek / talep merkezi.
-- Talepler ve mesaj geçmişi fiziksel olarak silinmez.

SET @ds_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @ds_user_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='id' LIMIT 1
);
SET @ds_kurum_id_type = IFNULL(@ds_kurum_id_type,'BIGINT UNSIGNED');
SET @ds_user_id_type = IFNULL(@ds_user_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS destek_talepleri (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'kurum_id ',@ds_kurum_id_type,' NOT NULL,',
  'acani_kullanici_id ',@ds_user_id_type,' NOT NULL,',
  'acani_rolu VARCHAR(30) NOT NULL,',
  'atanan_kullanici_id ',@ds_user_id_type,' NULL,',
  'kategori VARCHAR(30) NOT NULL,',
  'oncelik VARCHAR(20) NOT NULL DEFAULT ''normal'',',
  'konu VARCHAR(190) NOT NULL,',
  'durum VARCHAR(30) NOT NULL DEFAULT ''acik'',',
  'son_hareket_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'cozum_tarihi DATETIME NULL,',
  'kapanis_tarihi DATETIME NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'KEY ix_destek_kurum_durum (kurum_id,durum,oncelik),',
  'KEY ix_destek_acan (acani_kullanici_id,durum,son_hareket_tarihi),',
  'KEY ix_destek_kuyruk (durum,oncelik,son_hareket_tarihi),',
  'KEY ix_destek_atanan (atanan_kullanici_id,durum)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS destek_talep_mesajlari (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'talep_id BIGINT UNSIGNED NOT NULL,',
  'kurum_id ',@ds_kurum_id_type,' NOT NULL,',
  'gonderen_kullanici_id ',@ds_user_id_type,' NOT NULL,',
  'gonderen_rolu VARCHAR(30) NOT NULL,',
  'mesaj VARCHAR(5000) NOT NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'KEY ix_destek_mesaj_talep (talep_id,id),',
  'KEY ix_destek_mesaj_kurum (kurum_id,talep_id)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
