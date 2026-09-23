-- İlkAdım V1.0.70
-- Eski V3 kurum_kullanicilari tablosunu diğer migrationlardan önce onarır.
-- Yeni/fresh kurulumlarda gerekli tablolar henüz yoksa güvenli biçimde no-op olur.

SET NAMES utf8mb4;

SET @has_kk = (
  SELECT COUNT(*) FROM information_schema.tables
  WHERE table_schema=DATABASE() AND table_name='kurum_kullanicilari'
);

SET @has_kurumlar = (
  SELECT COUNT(*) FROM information_schema.tables
  WHERE table_schema=DATABASE() AND table_name='kurumlar'
);

SET @has_kullanicilar = (
  SELECT COUNT(*) FROM information_schema.tables
  WHERE table_schema=DATABASE() AND table_name='kullanicilar'
);

SET @has_legacy_cols = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema=DATABASE()
    AND table_name='kurum_kullanicilari'
    AND column_name IN ('veli_id','ogretmen_id','ogrenci_id','yonetici_id')
);

SET @needs_repair = IF(
  @has_kk>0 AND @has_kurumlar>0 AND @has_kullanicilar>0 AND @has_legacy_cols>0,
  1,
  0
);

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

SET @old_fk_checks = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;

SET @sql = IF(
  @needs_repair=1,
  'DROP TABLE kurum_kullanicilari',
  'SET @ilkadim_noop = 1'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = IF(
  @needs_repair=1,
  CONCAT(
    'CREATE TABLE kurum_kullanicilari (',
    'kurum_id ',@kurum_id_type,' NOT NULL,',
    'kullanici_id ',@kullanici_id_type,' NOT NULL,',
    'kurum_rolu VARCHAR(30) NOT NULL,',
    'aktif TINYINT(1) NOT NULL DEFAULT 1,',
    'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
    'PRIMARY KEY (kurum_id,kullanici_id,kurum_rolu),',
    'KEY ix_kurum_kullanici_user (kullanici_id,aktif),',
    'KEY ix_kurum_kullanici_role (kurum_id,kurum_rolu,aktif),',
    'CONSTRAINT fk_kurum_kullanici_kurum FOREIGN KEY (kurum_id) REFERENCES kurumlar(id) ON DELETE CASCADE,',
    'CONSTRAINT fk_kurum_kullanici_user FOREIGN KEY (kullanici_id) REFERENCES kullanicilar(id) ON DELETE CASCADE',
    ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
  ),
  'SET @ilkadim_noop = 1'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET FOREIGN_KEY_CHECKS = @old_fk_checks;
