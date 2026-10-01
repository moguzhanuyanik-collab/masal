SET NAMES utf8mb4;

-- Tahsilat hatırlatma gönderim geçmişi.
-- Her sözleşme + vade dönemi + eşik için tek gönderim kaydı tutulur.

SET @th_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @th_user_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='id' LIMIT 1
);
SET @th_kurum_id_type = IFNULL(@th_kurum_id_type,'BIGINT UNSIGNED');
SET @th_user_id_type = IFNULL(@th_user_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ticari_tahsilat_hatirlatmalari (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'sozlesme_id BIGINT UNSIGNED NOT NULL,',
  'kurum_id ',@th_kurum_id_type,' NOT NULL,',
  'vade_tarihi DATE NOT NULL,',
  'esik_kodu VARCHAR(30) NOT NULL,',
  'acik_tutar DECIMAL(14,2) NOT NULL,',
  'para_birimi CHAR(3) NOT NULL,',
  'duyuru_id BIGINT UNSIGNED NULL,',
  'alici_sayisi INT UNSIGNED NOT NULL DEFAULT 0,',
  'gonderen_kullanici_id ',@th_user_id_type,' NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'UNIQUE KEY uk_tahsilat_hatirlatma (sozlesme_id,vade_tarihi,esik_kodu),',
  'KEY ix_tahsilat_hatirlatma_kurum (kurum_id,olusturulma_tarihi),',
  'KEY ix_tahsilat_hatirlatma_duyuru (duyuru_id)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
