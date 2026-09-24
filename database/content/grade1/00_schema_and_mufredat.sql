SET NAMES utf8mb4;

-- HAZIRLIK DOSYASI: otomatik migration değildir.
-- İlkAdım 1. sınıf içerikleri için Ders -> Bölüm -> Konu -> Soru Havuzu yapısı.

CREATE TABLE IF NOT EXISTS ders_konulari (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  ders_id BIGINT UNSIGNED NOT NULL,
  bolum_id BIGINT UNSIGNED NULL,
  kademe_kodu VARCHAR(30) NOT NULL DEFAULT 'temel_egitim',
  sinif_seviyesi TINYINT UNSIGNED NOT NULL,
  konu_kodu VARCHAR(120) NOT NULL,
  ad VARCHAR(190) NOT NULL,
  aciklama TEXT NULL,
  anlatim TEXT NULL,
  ornek_metni TEXT NULL,
  sira INT NOT NULL DEFAULT 0,
  aktif TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ders_konu (ders_id,kademe_kodu,sinif_seviyesi,konu_kodu),
  KEY ix_ders_konu_sira (kademe_kodu,sinif_seviyesi,ders_id,aktif,sira),
  KEY ix_ders_konu_bolum (bolum_id,aktif,sira)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS ders_sorulari (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  konu_id BIGINT UNSIGNED NOT NULL,
  soru_kodu VARCHAR(160) NOT NULL,
  soru_turu VARCHAR(30) NOT NULL DEFAULT 'coktan_secmeli',
  soru TEXT NOT NULL,
  secenekler_json LONGTEXT NOT NULL,
  dogru_cevap_indeksi TINYINT UNSIGNED NOT NULL,
  aciklama TEXT NULL,
  zorluk TINYINT UNSIGNED NOT NULL DEFAULT 1,
  gorsel_anahtari VARCHAR(190) NULL,
  ses_metni TEXT NULL,
  sira INT NOT NULL DEFAULT 0,
  aktif TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ders_soru_kodu (soru_kodu),
  KEY ix_ders_soru_konu (konu_id,aktif,sira)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Hazırlık aktivasyonu sırasında yalnız 1. sınıf ders içeriği temizlenir.
DELETE s FROM ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1;

DELETE FROM ders_konulari
WHERE kademe_kodu='temel_egitim' AND sinif_seviyesi=1;

DELETE FROM ders_bolumleri
WHERE kademe_kodu='temel_egitim' AND sinif_seviyesi=1
  AND ders_id IN (
    SELECT id FROM dersler
    WHERE kod IN ('turkce','matematik','hayat','gorsel','muzik','beden')
       OR ad IN ('Türkçe','Matematik','Hayat Bilgisi','Görsel Sanatlar','Müzik','Beden Eğitimi ve Oyun')
  );

-- TÜRKÇE
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',1,'tema',x.kod,x.ad,x.aciklama,x.sira,1
FROM dersler d JOIN (
 SELECT 'tr-guzel-davranislarimiz' kod,'Güzel Davranışlarımız' ad,'İlk okuma yazma; a, n, e, t sesleri ve güzel davranışlar.' aciklama,10 sira
 UNION ALL SELECT 'tr-ataturk','Mustafa Kemal’den Atatürk’e','İlk okuma yazma; i, l, o, k, u sesleri ve Atatürk teması.',20
 UNION ALL SELECT 'tr-cevremizdeki-yasam','Çevremizdeki Yaşam','İlk okuma yazma ve çevremizdeki yaşam.',30
 UNION ALL SELECT 'tr-kitaplar','Yol Arkadaşımız Kitaplar','İlk okuma yazmanın tamamlanması, kitap ve okuma kültürü.',40
 UNION ALL SELECT 'tr-yetenekler','Yeteneklerimizi Keşfediyoruz','Okuma, anlama, konuşma ve yazma becerileri.',50
 UNION ALL SELECT 'tr-minik-kasifler','Minik Kâşifler','Bilim, merak, tahmin ve okuduğunu anlama.',60
 UNION ALL SELECT 'tr-atalarimiz','Atalarımızın İzleri','Millî kültür, okuma ve anlatma becerileri.',70
 UNION ALL SELECT 'tr-sorumluluklar','Sorumluluklarımızın Farkındayız','Haklar, sorumluluklar ve metin anlama.',80
) x WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;

-- MATEMATİK
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',1,'tema',x.kod,x.ad,x.aciklama,x.sira,1
FROM dersler d JOIN (
 SELECT 'mat-sayilar-1' kod,'Sayılar ve Nicelikler (1)' ad,'20’ye kadar sayılar, karşılaştırma, ritmik sayma, örüntüler ve tahmin.' aciklama,10 sira
 UNION ALL SELECT 'mat-sayilar-2','Sayılar ve Nicelikler (2)','Standart olmayan ölçme araçlarıyla uzunluk ve kütle.',20
 UNION ALL SELECT 'mat-sayilar-3','Sayılar ve Nicelikler (3)','Türk paraları ve değer ilişkileri.',30
 UNION ALL SELECT 'mat-islemler','İşlemlerden Cebirsel Düşünmeye','Toplama, çıkarma, eşitlik, bilinmeyen ve problemler.',40
 UNION ALL SELECT 'mat-geometri-1','Nesnelerin Geometrisi (1)','Konum, yön ve mekânsal ilişkiler.',50
 UNION ALL SELECT 'mat-geometri-2','Nesnelerin Geometrisi (2)','Geometrik şekiller ve özellikleri.',60
 UNION ALL SELECT 'mat-veri','Veriye Dayalı Araştırma','Basit veri toplama, tablo ve nesne grafiği.',70
) x WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;

-- HAYAT BİLGİSİ
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',1,'ogrenme_alani',x.kod,x.ad,x.aciklama,x.sira,1
FROM dersler d JOIN (
 SELECT 'hb-ben-okulum' kod,'Ben ve Okulum' ad,'Tanışma, okul ortamı, kurallar ve bireysel özellikler.' aciklama,10 sira
 UNION ALL SELECT 'hb-saglik-guvenlik','Sağlığım ve Güvenliğim','Sağlık, temizlik, kişisel alan, trafik ve acil durumlar.',20
 UNION ALL SELECT 'hb-ailem-toplum','Ailem ve Toplum','Aile bireyleri, nezaket, görev ve sorumluluklar.',30
 UNION ALL SELECT 'hb-yer-ulkem','Yaşadığım Yer ve Ülkem','Yaşadığı çevre, Türkiye, bayrak, marş, Atatürk ve bayramlar.',40
 UNION ALL SELECT 'hb-doga-cevre','Doğa ve Çevre','Canlı-cansız varlıklar, gökyüzü, afetler ve geri dönüşüm.',50
 UNION ALL SELECT 'hb-bilim-teknoloji-sanat','Bilim, Teknoloji ve Sanat','Merak, bilim, teknolojik ürünler ve sanat.',60
) x WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;

-- GÖRSEL SANATLAR
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',1,'tema',x.kod,x.ad,'1. sınıf Görsel Sanatlar teması.',x.sira,1
FROM dersler d JOIN (
 SELECT 'gs-hayat-sanat' kod,'Hayat ve Sanat' ad,10 sira
 UNION ALL SELECT 'gs-gorsel-dil','Sanatın Görsel Dili',20
 UNION ALL SELECT 'gs-sanatcilar','Sanatçılar ve Eserleri',30
 UNION ALL SELECT 'gs-cizim','Çizim ve Görsel İfade',40
 UNION ALL SELECT 'gs-renk-estetik','Renk ve Estetik',50
 UNION ALL SELECT 'gs-milli-degerler','Millî Değerler ve Sanat',60
 UNION ALL SELECT 'gs-muze-kultur','Müze ve Kültür',70
) x WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),sira=VALUES(sira),aktif=1;

-- MÜZİK
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',1,'tema',x.kod,x.ad,'1. sınıf Müzik teması.',x.sira,1
FROM dersler d JOIN (
 SELECT 'muz-muzik-dili' kod,'Müzik Dili' ad,10 sira
 UNION ALL SELECT 'muz-muzik-kulturu','Müzik Kültürü',20
) x WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),sira=VALUES(sira),aktif=1;

-- BEDEN EĞİTİMİ VE OYUN
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',1,'tema',x.kod,x.ad,'1. sınıf Beden Eğitimi ve Oyun teması.',x.sira,1
FROM dersler d JOIN (
 SELECT 'be-hareket' kod,'Hareket Ediyorum' ad,10 sira
 UNION ALL SELECT 'be-kural','Oyunu Kuralına Göre Oynuyorum',20
 UNION ALL SELECT 'be-ritim','Ritimle Hareket Ediyorum',30
 UNION ALL SELECT 'be-saglik','Fiziksel Aktiviteye Katılıyorum Sağlıklı Büyüyorum',40
) x WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),sira=VALUES(sira),aktif=1;
