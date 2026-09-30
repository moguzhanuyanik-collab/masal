SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS ogrenci_ilerleme (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  ogrenci_id INT UNSIGNED NOT NULL,
  ders_kodu VARCHAR(50) NOT NULL,
  modul_indeksi INT UNSIGNED NOT NULL,
  tamamlandi TINYINT(1) NOT NULL DEFAULT 1,
  tamamlanma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ogrenci_ilerleme (ogrenci_id, ders_kodu, modul_indeksi),
  KEY ix_ilerleme_ders (ders_kodu),
  CONSTRAINT fk_ilerleme_ogrenci FOREIGN KEY (ogrenci_id) REFERENCES ogrenciler(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS ogrenci_cevaplari (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  ogrenci_id INT UNSIGNED NOT NULL,
  ders_kodu VARCHAR(50) NOT NULL,
  soru_anahtari VARCHAR(190) NOT NULL,
  secilen_cevap LONGTEXT NULL,
  dogru TINYINT(1) NOT NULL DEFAULT 0,
  sure_ms INT UNSIGNED NOT NULL DEFAULT 0,
  cevap_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY ix_cevap_ogrenci_tarih (ogrenci_id, cevap_tarihi),
  KEY ix_cevap_ders (ders_kodu),
  CONSTRAINT fk_cevap_ogrenci FOREIGN KEY (ogrenci_id) REFERENCES ogrenciler(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS favoriler (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  ogrenci_id INT UNSIGNED NOT NULL,
  ders_kodu VARCHAR(50) NOT NULL,
  eklenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_favori (ogrenci_id, ders_kodu),
  CONSTRAINT fk_favori_ogrenci FOREIGN KEY (ogrenci_id) REFERENCES ogrenciler(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS oyun_tamamlamalari (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  ogrenci_id INT UNSIGNED NOT NULL,
  oyun_kodu VARCHAR(50) NOT NULL,
  tamamlanma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_oyun_tamamlama (ogrenci_id, oyun_kodu),
  CONSTRAINT fk_oyun_tamamlama_ogrenci FOREIGN KEY (ogrenci_id) REFERENCES ogrenciler(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS okuma_kayitlari (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  ogrenci_id INT UNSIGNED NOT NULL,
  hikaye_kodu VARCHAR(50) NOT NULL,
  okuma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY ix_okuma_ogrenci_tarih (ogrenci_id, okuma_tarihi),
  CONSTRAINT fk_okuma_ogrenci FOREIGN KEY (ogrenci_id) REFERENCES ogrenciler(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS calisma_oturumlari (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  ogrenci_id INT UNSIGNED NOT NULL,
  olay_turu VARCHAR(30) NOT NULL,
  olay_anahtari VARCHAR(190) NOT NULL,
  baslik VARCHAR(255) NOT NULL,
  tamamlanma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY ix_oturum_ogrenci_tarih (ogrenci_id, tamamlanma_tarihi),
  CONSTRAINT fk_oturum_ogrenci FOREIGN KEY (ogrenci_id) REFERENCES ogrenciler(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS gunluk_kullanim (
  ogrenci_id INT UNSIGNED NOT NULL,
  tarih DATE NOT NULL,
  sure_saniye INT UNSIGNED NOT NULL DEFAULT 0,
  guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (ogrenci_id, tarih),
  CONSTRAINT fk_gunluk_kullanim_ogrenci FOREIGN KEY (ogrenci_id) REFERENCES ogrenciler(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS ogrenci_yildizlari (
  ogrenci_id INT UNSIGNED NOT NULL,
  toplam_yildiz INT UNSIGNED NOT NULL DEFAULT 0,
  guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (ogrenci_id),
  CONSTRAINT fk_yildiz_ogrenci FOREIGN KEY (ogrenci_id) REFERENCES ogrenciler(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS rozetler (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  kod VARCHAR(50) NOT NULL,
  ad VARCHAR(100) NOT NULL,
  emoji VARCHAR(32) NULL,
  aciklama VARCHAR(255) NULL,
  sira INT NOT NULL DEFAULT 0,
  aktif TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  UNIQUE KEY uk_rozet_kod (kod)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS ogrenci_rozetleri (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  ogrenci_id INT UNSIGNED NOT NULL,
  rozet_id INT UNSIGNED NOT NULL,
  kazanma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ogrenci_rozet (ogrenci_id, rozet_id),
  CONSTRAINT fk_ogrenci_rozet_ogrenci FOREIGN KEY (ogrenci_id) REFERENCES ogrenciler(id) ON DELETE CASCADE,
  CONSTRAINT fk_ogrenci_rozet_rozet FOREIGN KEY (rozet_id) REFERENCES rozetler(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS gunluk_gorevler (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  ogrenci_id INT UNSIGNED NOT NULL,
  tarih DATE NOT NULL,
  gorev_kodu VARCHAR(80) NOT NULL,
  tamamlandi TINYINT(1) NOT NULL DEFAULT 0,
  odul_alindi TINYINT(1) NOT NULL DEFAULT 0,
  guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_gunluk_gorev (ogrenci_id, tarih, gorev_kodu),
  CONSTRAINT fk_gunluk_gorev_ogrenci FOREIGN KEY (ogrenci_id) REFERENCES ogrenciler(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO rozetler (kod,ad,emoji,aciklama,sira,aktif) VALUES
('ilk_adim','İlk Adım','🌱','1 ders adımı tamamla',1,1),
('merakli_okur','Meraklı Okur','📚','Bir dersin bütün konularını bitir',2,1),
('oyun_kasifi','Oyun Kaşifi','🎮','1 oyunu tamamla',3,1),
('renk_ustasi','Renk Ustası','🎨','Renk Laboratuvarı oyununu tamamla',4,1),
('istikrarli_kasif','İstikrarlı Kaşif','🔥','3 gün üst üste etkinlik yap',5,1),
('buyuk_kasif','Büyük Kaşif','🏆','Bütün derslerdeki konuları tamamla',6,1),
('sayi_dostu','Sayı Dostu','🔢','10 matematik sorusunu doğru çöz',7,1),
('ilk_hikayem','İlk Hikâyem','📖','1 kısa hikâye bitir',8,1),
('yedi_gunluk_kasif','7 Günlük Kaşif','🔥','7 gün üst üste etkinlik yap',9,1),
('turkce_ustasi','Türkçe Ustası','✍️','Türkçe konularının tamamını bitir',10,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=VALUES(aktif);
