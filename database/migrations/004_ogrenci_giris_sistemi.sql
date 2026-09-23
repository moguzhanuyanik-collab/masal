SET NAMES utf8mb4;

ALTER TABLE ogrenciler
  ADD COLUMN email VARCHAR(190) NULL AFTER ad,
  ADD COLUMN sifre_hash VARCHAR(255) NULL AFTER email,
  ADD COLUMN son_giris_tarihi DATETIME NULL AFTER sifre_hash,
  ADD COLUMN son_giris_ip VARCHAR(45) NULL AFTER son_giris_tarihi,
  ADD UNIQUE KEY uk_ogrenci_email (email);

CREATE TABLE IF NOT EXISTS ogrenci_oturum_tokenlari (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  ogrenci_id INT UNSIGNED NOT NULL,
  token_hash CHAR(64) NOT NULL,
  son_kullanma_tarihi DATETIME NOT NULL,
  olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_oturum_token (token_hash),
  KEY ix_oturum_ogrenci (ogrenci_id),
  KEY ix_oturum_son_kullanma (son_kullanma_tarihi),
  CONSTRAINT fk_oturum_ogrenci FOREIGN KEY (ogrenci_id) REFERENCES ogrenciler(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO ogrenciler (ad,email,sifre_hash,avatar,aktif)
SELECT 'Test Ogrenci','test@ilkadim.local','$2y$12$td5kRxufy7iaDTRbHzwk.e0zRcNl0OSPdxd7cDo3AbS7L6XFeZs0a','🌞',1
WHERE NOT EXISTS (SELECT 1 FROM ogrenciler WHERE aktif=1);

UPDATE ogrenciler
SET email='test@ilkadim.local',
    sifre_hash='$2y$12$td5kRxufy7iaDTRbHzwk.e0zRcNl0OSPdxd7cDo3AbS7L6XFeZs0a'
WHERE id=(
  SELECT id FROM (
    SELECT id FROM ogrenciler WHERE aktif=1 ORDER BY id LIMIT 1
  ) AS ilk_ogrenci
);
