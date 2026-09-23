SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS kurumlar (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  kod VARCHAR(80) NOT NULL,
  ad VARCHAR(190) NOT NULL,
  tur VARCHAR(30) NOT NULL DEFAULT 'okul',
  icerik_kaynagi VARCHAR(30) NOT NULL DEFAULT 'kurum',
  logo VARCHAR(255) NULL,
  email VARCHAR(190) NULL,
  telefon VARCHAR(30) NULL,
  adres TEXT NULL,
  aktif TINYINT(1) NOT NULL DEFAULT 1,
  olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_kurum_kod (kod),
  KEY ix_kurum_aktif (aktif,tur)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

CREATE TABLE IF NOT EXISTS kurum_kullanicilari (
  kurum_id BIGINT UNSIGNED NOT NULL,
  kullanici_id BIGINT UNSIGNED NOT NULL,
  kurum_rolu VARCHAR(30) NOT NULL,
  aktif TINYINT(1) NOT NULL DEFAULT 1,
  olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (kurum_id,kullanici_id,kurum_rolu),
  KEY ix_kurum_kullanici_user (kullanici_id,aktif),
  KEY ix_kurum_kullanici_role (kurum_id,kurum_rolu,aktif),
  CONSTRAINT fk_kurum_kullanici_kurum FOREIGN KEY (kurum_id)
    REFERENCES kurumlar(id) ON DELETE CASCADE,
  CONSTRAINT fk_kurum_kullanici_user FOREIGN KEY (kullanici_id)
    REFERENCES kullanicilar(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

INSERT INTO kurumlar (kod,ad,tur,icerik_kaynagi,aktif)
VALUES ('ilkadim','İlkAdım','platform','sistem',1)
ON DUPLICATE KEY UPDATE aktif=1, tur='platform', icerik_kaynagi='sistem';

SET @ilkadim_kurum_id = (
  SELECT id FROM kurumlar WHERE kod='ilkadim' LIMIT 1
);

INSERT IGNORE INTO kurum_kullanicilari (kurum_id,kullanici_id,kurum_rolu,aktif)
SELECT @ilkadim_kurum_id,k.id,
  CASE
    WHEN r.rol IN ('super_admin','yonetici') THEN 'yonetici'
    WHEN r.rol='ogretmen' THEN 'ogretmen'
    WHEN r.rol='veli' THEN 'veli'
    ELSE 'ogrenci'
  END,
  1
FROM kullanicilar k
INNER JOIN kullanici_rolleri r ON r.kullanici_id=k.id
WHERE k.aktif=1
  AND r.rol IN ('super_admin','yonetici','ogretmen','veli','ogrenci');

INSERT IGNORE INTO kurum_kullanicilari (kurum_id,kullanici_id,kurum_rolu,aktif)
SELECT @ilkadim_kurum_id,k.id,'ogrenci',1
FROM kullanicilar k
INNER JOIN ogrenciler o ON o.kullanici_id=k.id
WHERE k.aktif=1 AND o.aktif=1;
