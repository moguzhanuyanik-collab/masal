SET NAMES utf8mb4;

-- Mutabakat hedef-risk bildirim geçmişi.
-- Bir vaka + açık döngü + tarihsel politika + eşik + alıcı için tek bildirim tutulur.

SET @hrb_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @hrb_user_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='id' LIMIT 1
);
SET @hrb_kurum_id_type = IFNULL(@hrb_kurum_id_type,'BIGINT UNSIGNED');
SET @hrb_user_id_type = IFNULL(@hrb_user_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ticari_mutabakat_hedef_risk_bildirimleri (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'vaka_id BIGINT UNSIGNED NOT NULL,',
  'kurum_id ',@hrb_kurum_id_type,' NOT NULL,',
  'hedef_politika_id BIGINT UNSIGNED NOT NULL,',
  'alici_kullanici_id ',@hrb_user_id_type,' NOT NULL,',
  'dongu_anahtari CHAR(64) NOT NULL,',
  'esik_kodu VARCHAR(40) NOT NULL,',
  'risk_kodu VARCHAR(30) NOT NULL,',
  'kullanim_orani DECIMAL(7,2) NULL,',
  'duyuru_id BIGINT UNSIGNED NULL,',
  'gonderen_kullanici_id ',@hrb_user_id_type,' NULL,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'UNIQUE KEY uk_hedef_risk_bildirim (vaka_id,dongu_anahtari,hedef_politika_id,esik_kodu,alici_kullanici_id),',
  'KEY ix_hedef_risk_bildirim_kurum (kurum_id,olusturulma_tarihi),',
  'KEY ix_hedef_risk_bildirim_alici (alici_kullanici_id,olusturulma_tarihi),',
  'KEY ix_hedef_risk_bildirim_duyuru (duyuru_id)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
