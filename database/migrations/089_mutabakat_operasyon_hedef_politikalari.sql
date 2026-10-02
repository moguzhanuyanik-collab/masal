SET NAMES utf8mb4;

-- Mutabakat iç operasyon hedef politikaları.
-- Politikalar append-only sürümlenir; eski hedefler geriye dönük değiştirilmez.

SET @mh_user_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kullanicilar' AND column_name='id' LIMIT 1
);
SET @mh_user_id_type = IFNULL(@mh_user_id_type,'BIGINT UNSIGNED');

SET @sql = CONCAT(
  'CREATE TABLE IF NOT EXISTS ticari_mutabakat_hedef_politikalari (',
  'id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
  'kapsam VARCHAR(20) NOT NULL,',
  'ilk_mudahale_saat INT UNSIGNED NOT NULL,',
  'cevrim_gun INT UNSIGNED NOT NULL,',
  'aciklama VARCHAR(1000) NULL,',
  'olusturan_kullanici_id ',@mh_user_id_type,' NULL,',
  'gecerlilik_baslangici DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,',
  'PRIMARY KEY(id),',
  'KEY ix_mutabakat_hedef_kapsam_tarih (kapsam,gecerlilik_baslangici,id),',
  'KEY ix_mutabakat_hedef_olusturan (olusturan_kullanici_id,olusturulma_tarihi)',
  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

INSERT INTO ticari_mutabakat_hedef_politikalari
(kapsam,ilk_mudahale_saat,cevrim_gun,aciklama,olusturan_kullanici_id)
SELECT
  'genel',48,8,
  '1.2.67 başlangıç genel operasyon hedefi. Mevcut 2 günlük ilk müdahale ve 8+ gün sağlık görünürlüğüyle uyumludur.',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM ticari_mutabakat_hedef_politikalari WHERE kapsam='genel'
);
