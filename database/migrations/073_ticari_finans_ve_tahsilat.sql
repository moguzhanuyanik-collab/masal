SET NAMES utf8mb4;

-- Kurumsal sözleşme, tahsilat ve vade takibi.
-- Resmi e-Fatura/e-Arşiv üretmez; yalnız ticari takip verisidir.

SET @tf_kurum_id_type = (
  SELECT COLUMN_TYPE FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id' LIMIT 1
);
SET @tf_kurum_id_type = IFNULL(@tf_kurum_id_type,'BIGINT UNSIGNED');

CREATE TABLE IF NOT EXISTS kurum_sozlesmeleri (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  kurum_id BIGINT UNSIGNED NOT NULL,
  paket_id BIGINT UNSIGNED NULL,
  sozlesme_no VARCHAR(80) NOT NULL,
  baslangic_tarihi DATE NOT NULL,
  bitis_tarihi DATE NULL,
  vade_tarihi DATE NULL,
  toplam_tutar DECIMAL(14,2) NOT NULL DEFAULT 0.00,
  para_birimi CHAR(3) NOT NULL DEFAULT 'TRY',
  durum VARCHAR(20) NOT NULL DEFAULT 'aktif',
  notlar VARCHAR(2000) NULL,
  olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY(id),
  UNIQUE KEY uk_sozlesme_no (sozlesme_no),
  KEY ix_sozlesme_kurum (kurum_id,durum),
  KEY ix_sozlesme_vade (durum,vade_tarihi),
  KEY ix_sozlesme_bitis (durum,bitis_tarihi)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

CREATE TABLE IF NOT EXISTS kurum_tahsilatlari (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  sozlesme_id BIGINT UNSIGNED NOT NULL,
  kurum_id BIGINT UNSIGNED NOT NULL,
  tahsilat_tarihi DATE NOT NULL,
  tutar DECIMAL(14,2) NOT NULL,
  para_birimi CHAR(3) NOT NULL,
  odeme_yontemi VARCHAR(30) NOT NULL DEFAULT 'havale',
  referans_no VARCHAR(120) NULL,
  notlar VARCHAR(1000) NULL,
  durum VARCHAR(20) NOT NULL DEFAULT 'aktif',
  iptal_nedeni VARCHAR(500) NULL,
  iptal_tarihi DATETIME NULL,
  olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id),
  KEY ix_tahsilat_sozlesme (sozlesme_id,durum),
  KEY ix_tahsilat_kurum (kurum_id,tahsilat_tarihi),
  KEY ix_tahsilat_tarih (tahsilat_tarihi,durum)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
