SET NAMES utf8mb4;

-- Mutabakat iç operasyon eskalasyon gönderim geçmişi.
-- Finansal/vaka state kopyalanmaz; yalnız döngü + eşik + alıcı bazlı dedup tutulur.

SET @me_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @me_user_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='id' LIMIT 1
);
SET @me_kurum_id_type = IFNULL(@me_kurum_id_type,'BIGINT UNSIGNED');
SET @me_user_id_type = IFNULL(@me_user_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ticari_mutabakat_eskalasyonlari (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'vaka_id BIGINT UNSIGNED NOT NULL,',
  'kurum_id ',@me_kurum_id_type,' NOT NULL,',
  'alici_kullanici_id ',@me_user_id_type,' NOT NULL,',
  'dongu_anahtari CHAR(64) NOT NULL,',
  'dongu_baslangic_tarihi DATETIME NOT NULL,',
  'esik_kodu VARCHAR(30) NOT NULL,',
  'acik_gun INT UNSIGNED NOT NULL DEFAULT 0,',
  'duyuru_id BIGINT UNSIGNED NULL,',
  'gonderen_kullanici_id ',@me_user_id_type,' NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'UNIQUE KEY uk_mutabakat_eskalasyon (vaka_id,dongu_anahtari,esik_kodu,alici_kullanici_id),',
  'KEY ix_mutabakat_eskalasyon_alici (alici_kullanici_id,olusturulma_tarihi),',
  'KEY ix_mutabakat_eskalasyon_kurum (kurum_id,olusturulma_tarihi),',
  'KEY ix_mutabakat_eskalasyon_duyuru (duyuru_id)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
