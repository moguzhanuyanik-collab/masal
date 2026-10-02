SET NAMES utf8mb4;

-- Mutabakat aksiyon tarihleri için Süper Admin hatırlatma gönderim geçmişi.
-- Her vaka + aksiyon tarihi + eşik + alıcı için tek gönderim kaydı tutulur.

SET @mr_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @mr_user_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='id' LIMIT 1
);
SET @mr_kurum_id_type = IFNULL(@mr_kurum_id_type,'BIGINT UNSIGNED');
SET @mr_user_id_type = IFNULL(@mr_user_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ticari_mutabakat_aksiyon_hatirlatmalari (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'vaka_id BIGINT UNSIGNED NOT NULL,',
  'kurum_id ',@mr_kurum_id_type,' NOT NULL,',
  'alici_kullanici_id ',@mr_user_id_type,' NOT NULL,',
  'aksiyon_tarihi DATE NOT NULL,',
  'esik_kodu VARCHAR(30) NOT NULL,',
  'duyuru_id BIGINT UNSIGNED NULL,',
  'gonderen_kullanici_id ',@mr_user_id_type,' NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'UNIQUE KEY uk_mutabakat_hatirlatma (vaka_id,aksiyon_tarihi,esik_kodu,alici_kullanici_id),',
  'KEY ix_mutabakat_hatirlatma_alici (alici_kullanici_id,olusturulma_tarihi),',
  'KEY ix_mutabakat_hatirlatma_kurum (kurum_id,olusturulma_tarihi),',
  'KEY ix_mutabakat_hatirlatma_duyuru (duyuru_id)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
