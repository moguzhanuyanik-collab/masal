SET NAMES utf8mb4;

-- Lisans yenileme vakası ile ticari sözleşme arasında birebir bağlantı.
-- Eski kurum_sozlesmeleri tablosuna kolon eklemek yerine güvenli mapping tablosu kullanılır.

SET @rc_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @rc_user_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='id' LIMIT 1
);
SET @rc_kurum_id_type = IFNULL(@rc_kurum_id_type,'BIGINT UNSIGNED');
SET @rc_user_id_type = IFNULL(@rc_user_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS lisans_yenileme_sozlesmeleri (',
  'yenileme_id BIGINT UNSIGNED NOT NULL,',
  'sozlesme_id BIGINT UNSIGNED NOT NULL,',
  'kurum_id ',@rc_kurum_id_type,' NOT NULL,',
  'olusturan_kullanici_id ',@rc_user_id_type,' NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY(yenileme_id),',
  'UNIQUE KEY uk_yenileme_sozlesme (sozlesme_id),',
  'KEY ix_yenileme_sozlesme_kurum (kurum_id,olusturulma_tarihi)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
