SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS pwa_sync_islemleri (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  ogrenci_id INT UNSIGNED NOT NULL,
  islem_anahtari CHAR(36) NOT NULL,
  olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_pwa_ogrenci_islem (ogrenci_id, islem_anahtari),
  KEY ix_pwa_sync_tarih (olusturulma_tarihi),
  CONSTRAINT fk_pwa_sync_ogrenci FOREIGN KEY (ogrenci_id)
    REFERENCES ogrenciler(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;