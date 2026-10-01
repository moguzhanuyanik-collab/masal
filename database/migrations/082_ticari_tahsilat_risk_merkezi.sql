SET NAMES utf8mb4;

-- Ticari tahsilat risk merkezi.
-- Finansal bakiye kopyalanmaz; yalnız operasyonel takip durumu ve append-only geçmiş tutulur.

SET @tr_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @tr_user_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='id' LIMIT 1
);
SET @tr_kurum_id_type = IFNULL(@tr_kurum_id_type,'BIGINT UNSIGNED');
SET @tr_user_id_type = IFNULL(@tr_user_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ticari_tahsilat_takipleri (',
  'sozlesme_id BIGINT UNSIGNED NOT NULL,',
  'kurum_id ',@tr_kurum_id_type,' NOT NULL,',
  'durum VARCHAR(20) NOT NULL DEFAULT ''acik'',',
  'sorumlu_kullanici_id ',@tr_user_id_type,' NULL,',
  'son_temas_tarihi DATE NULL,',
  'sonraki_aksiyon_tarihi DATE NULL,',
  'kapanma_kodu VARCHAR(40) NULL,',
  'kapanma_tarihi DATETIME NULL,',
  'olusturan_kullanici_id ',@tr_user_id_type,' NULL,',
  'guncelleyen_kullanici_id ',@tr_user_id_type,' NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,',
  'PRIMARY KEY(sozlesme_id),',
  'KEY ix_tahsilat_takip_kurum (kurum_id,durum),',
  'KEY ix_tahsilat_takip_aksiyon (durum,sonraki_aksiyon_tarihi)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ticari_tahsilat_takip_gecmisi (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'sozlesme_id BIGINT UNSIGNED NOT NULL,',
  'kurum_id ',@tr_kurum_id_type,' NOT NULL,',
  'kullanici_id ',@tr_user_id_type,' NULL,',
  'tur VARCHAR(20) NOT NULL,',
  'kod VARCHAR(40) NULL,',
  'not_metni VARCHAR(2000) NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'KEY ix_tahsilat_takip_gecmis_sozlesme (sozlesme_id,id),',
  'KEY ix_tahsilat_takip_gecmis_kurum (kurum_id,id)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
