SET NAMES utf8mb4;

-- Öğretmen sorularındaki yıldız ödüllerini, tarayıcı ilerlemesinden türetilen
-- ogrenci_yildizlari toplamından ayrı tutar. Böylece state senkronizasyonu
-- öğretmen bonuslarını ezmez ve aynı soru için ödül yalnız bir kez kazanılır.

SET @oi_reward_student_id_type = (
  SELECT COLUMN_TYPE
  FROM information_schema.columns
  WHERE table_schema=DATABASE()
    AND table_name='ogrenciler'
    AND column_name='id'
  LIMIT 1
);
SET @oi_reward_student_id_type = IFNULL(@oi_reward_student_id_type,'INT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ogretmen_icerik_yildiz_odulleri (',
  'icerik_id BIGINT UNSIGNED NOT NULL,',
  'ogrenci_id ',@oi_reward_student_id_type,' NOT NULL,',
  'yildiz_degeri INT UNSIGNED NOT NULL DEFAULT 0,',
  'kazanma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY (icerik_id,ogrenci_id),',
  'KEY ix_oi_yildiz_ogrenci (ogrenci_id,kazanma_tarihi)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
