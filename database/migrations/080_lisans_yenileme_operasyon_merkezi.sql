SET NAMES utf8mb4;

-- Kurum lisans yenileme operasyon merkezi.
-- Her lisans bitiş dönemi ayrı vaka olarak izlenir; geçmiş append-only tutulur.

SET @ly_license_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurum_lisanslari' AND column_name='id' LIMIT 1
);
SET @ly_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @ly_user_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='id' LIMIT 1
);
SET @ly_license_id_type = IFNULL(@ly_license_id_type,'BIGINT UNSIGNED');
SET @ly_kurum_id_type = IFNULL(@ly_kurum_id_type,'BIGINT UNSIGNED');
SET @ly_user_id_type = IFNULL(@ly_user_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS kurum_lisans_yenilemeleri (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'lisans_id ',@ly_license_id_type,' NOT NULL,',
  'kurum_id ',@ly_kurum_id_type,' NOT NULL,',
  'hedef_bitis_tarihi DATE NOT NULL,',
  'durum VARCHAR(20) NOT NULL DEFAULT ''acik'',',
  'sorumlu_kullanici_id ',@ly_user_id_type,' NULL,',
  'son_temas_tarihi DATE NULL,',
  'sonraki_takip_tarihi DATE NULL,',
  'sonuc_paket_id BIGINT UNSIGNED NULL,',
  'sonuc_bitis_tarihi DATE NULL,',
  'kapanma_tarihi DATETIME NULL,',
  'olusturan_kullanici_id ',@ly_user_id_type,' NULL,',
  'guncelleyen_kullanici_id ',@ly_user_id_type,' NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'UNIQUE KEY uk_lisans_yenileme_donem (lisans_id,hedef_bitis_tarihi),',
  'KEY ix_lisans_yenileme_kuyruk (durum,hedef_bitis_tarihi),',
  'KEY ix_lisans_yenileme_takip (durum,sonraki_takip_tarihi),',
  'KEY ix_lisans_yenileme_kurum (kurum_id,id)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS kurum_lisans_yenileme_gecmisi (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'yenileme_id BIGINT UNSIGNED NOT NULL,',
  'lisans_id ',@ly_license_id_type,' NOT NULL,',
  'kurum_id ',@ly_kurum_id_type,' NOT NULL,',
  'kullanici_id ',@ly_user_id_type,' NULL,',
  'tur VARCHAR(20) NOT NULL,',
  'kod VARCHAR(40) NULL,',
  'not_metni VARCHAR(2000) NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'KEY ix_lisans_yenileme_gecmis_vaka (yenileme_id,id),',
  'KEY ix_lisans_yenileme_gecmis_kurum (kurum_id,id),',
  'KEY ix_lisans_yenileme_gecmis_kod (yenileme_id,tur,kod)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
