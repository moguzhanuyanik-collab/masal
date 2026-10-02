SET NAMES utf8mb4;

-- Etkinliklerde ara ilerleme kaydı.
-- Çocuk etkinliği yarıda bırakırsa sonraki girişte kaldığı sorudan devam eder.
-- ogrenciler.id tipi kurulumlar arasında INT/BIGINT değişebildiği için FK tipi canlı şemadan alınır.
SET @ogrenci_id_type=(
  SELECT COLUMN_TYPE
  FROM information_schema.columns
  WHERE table_schema=DATABASE()
    AND table_name='ogrenciler'
    AND column_name='id'
  LIMIT 1
);
SET @ogrenci_id_type=IFNULL(@ogrenci_id_type,'INT UNSIGNED');

SET @sql=CONCAT(
'CREATE TABLE IF NOT EXISTS etkinlik_ilerleme (',
'  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,',
'  ogrenci_id ',@ogrenci_id_type,' NOT NULL,',
'  oyun_kodu VARCHAR(50) NOT NULL,',
'  sonraki_soru_indeksi SMALLINT UNSIGNED NOT NULL DEFAULT 0,',
'  tamamlandi TINYINT(1) NOT NULL DEFAULT 0,',
'  guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,',
'  PRIMARY KEY (id),',
'  UNIQUE KEY uk_etkinlik_ilerleme (ogrenci_id,oyun_kodu),',
'  KEY ix_etkinlik_ilerleme_ogrenci (ogrenci_id,tamamlandi,guncellenme_tarihi),',
'  CONSTRAINT fk_etkinlik_ilerleme_ogrenci FOREIGN KEY (ogrenci_id) REFERENCES ogrenciler(id) ON DELETE CASCADE',
') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

INSERT INTO etkinlik_ilerleme (ogrenci_id,oyun_kodu,sonraki_soru_indeksi,tamamlandi)
SELECT ogrenci_id,oyun_kodu,0,1
FROM oyun_tamamlamalari
ON DUPLICATE KEY UPDATE tamamlandi=1;
