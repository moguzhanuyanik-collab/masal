SET NAMES utf8mb4;

-- Demo / deneme kurumu ve satış dönüşüm merkezi.
-- Mevcut kurum_lisanslari tablosundaki tek kurum lisansı korunur; satış yaşam döngüsü ayrı izlenir.

SET @st_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @st_user_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='id' LIMIT 1
);
SET @st_kurum_id_type = IFNULL(@st_kurum_id_type,'BIGINT UNSIGNED');
SET @st_user_id_type = IFNULL(@st_user_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS kurum_deneme_satislari (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'kurum_id ',@st_kurum_id_type,' NOT NULL,',
  'deneme_paket_id BIGINT UNSIGNED NOT NULL,',
  'deneme_baslangic_tarihi DATE NOT NULL,',
  'deneme_bitis_tarihi DATE NOT NULL,',
  'durum VARCHAR(20) NOT NULL DEFAULT ''deneme'',',
  'kaynak VARCHAR(80) NULL,',
  'sorumlu_kullanici_id ',@st_user_id_type,' NULL,',
  'donusum_paket_id BIGINT UNSIGNED NULL,',
  'donusum_tarihi DATETIME NULL,',
  'kayip_nedeni VARCHAR(500) NULL,',
  'son_temas_tarihi DATE NULL,',
  'olusturan_kullanici_id ',@st_user_id_type,' NOT NULL,',
  'guncelleyen_kullanici_id ',@st_user_id_type,' NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'UNIQUE KEY uk_deneme_satis_kurum (kurum_id),',
  'KEY ix_deneme_satis_durum_bitis (durum,deneme_bitis_tarihi),',
  'KEY ix_deneme_satis_sorumlu (sorumlu_kullanici_id,durum),',
  'KEY ix_deneme_satis_donusum (donusum_tarihi,donusum_paket_id)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS kurum_satis_notlari (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'satis_id BIGINT UNSIGNED NOT NULL,',
  'kurum_id ',@st_kurum_id_type,' NOT NULL,',
  'kullanici_id ',@st_user_id_type,' NOT NULL,',
  'tur VARCHAR(20) NOT NULL DEFAULT ''not'',',
  'not_metni VARCHAR(2000) NOT NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'KEY ix_satis_not_satis (satis_id,id),',
  'KEY ix_satis_not_kurum (kurum_id,id)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
