SET NAMES utf8mb4;

-- Öğretmenim modülü kimlik tiplerini mevcut canlı tablolardan okur.
SET @oi_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @oi_ogretmen_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='ogretmenler' AND column_name='id' LIMIT 1
);
SET @oi_ogrenci_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='ogrenciler' AND column_name='id' LIMIT 1
);
SET @oi_ders_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='dersler' AND column_name='id' LIMIT 1
);
SET @oi_modul_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='ders_modulleri' AND column_name='id' LIMIT 1
);

SET @oi_kurum_id_type = IFNULL(@oi_kurum_id_type,'BIGINT UNSIGNED');
SET @oi_ogretmen_id_type = IFNULL(@oi_ogretmen_id_type,'BIGINT UNSIGNED');
SET @oi_ogrenci_id_type = IFNULL(@oi_ogrenci_id_type,'INT UNSIGNED');
SET @oi_ders_id_type = IFNULL(@oi_ders_id_type,'BIGINT UNSIGNED');
SET @oi_modul_id_type = IFNULL(@oi_modul_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ogretmen_icerikleri (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'kurum_id ',@oi_kurum_id_type,' NOT NULL,',
  'ogretmen_id ',@oi_ogretmen_id_type,' NOT NULL,',
  'ders_id ',@oi_ders_id_type,' NOT NULL,',
  'ders_modulu_id ',@oi_modul_id_type,' NULL,',
  'konu_basligi VARCHAR(190) NULL,',
  'icerik_turu VARCHAR(30) NOT NULL DEFAULT ''soru'',',
  'baslik VARCHAR(190) NOT NULL,',
  'icerik_metni TEXT NULL,',
  'soru TEXT NULL,',
  'secenekler_json LONGTEXT NULL,',
  'dogru_cevap_indeksi INT NULL,',
  'aciklama TEXT NULL,',
  'yildiz_degeri INT UNSIGNED NOT NULL DEFAULT 0,',
  'hedef_turu VARCHAR(30) NOT NULL DEFAULT ''tum_ogrenciler'',',
  'aktif TINYINT(1) NOT NULL DEFAULT 1,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,',
  'PRIMARY KEY (id),',
  'KEY ix_oi_ogretmen (ogretmen_id,aktif,olusturulma_tarihi),',
  'KEY ix_oi_kurum_ders (kurum_id,ders_id,aktif),',
  'KEY ix_oi_modul (ders_modulu_id,aktif)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ogretmen_icerik_hedefleri (',
  'icerik_id BIGINT UNSIGNED NOT NULL,',
  'ogrenci_id ',@oi_ogrenci_id_type,' NOT NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY (icerik_id,ogrenci_id),',
  'KEY ix_oi_hedef_ogrenci (ogrenci_id,icerik_id)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ogretmen_icerik_cevaplari (',
  'icerik_id BIGINT UNSIGNED NOT NULL,',
  'ogrenci_id ',@oi_ogrenci_id_type,' NOT NULL,',
  'secilen_cevap_indeksi INT NULL,',
  'dogru TINYINT(1) NOT NULL DEFAULT 0,',
  'deneme_sayisi INT UNSIGNED NOT NULL DEFAULT 1,',
  'cevap_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,',
  'PRIMARY KEY (icerik_id,ogrenci_id),',
  'KEY ix_oi_cevap_ogrenci (ogrenci_id,guncellenme_tarihi)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
