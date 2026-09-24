SET NAMES utf8mb4;

-- HAZIRLIK DOSYASI: otomatik migration değildir.
-- İlkAdım 2. sınıf MEB içerikleri.
-- Mevcut HTML/CSS tasarımına dokunmaz.

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

-- İngilizce dersi sistemde yoksa oluştur.
INSERT INTO dersler
(kod,ad,haftalik_saat,emoji,sanat,sanat_sinifi,renk,yazi_renk,aciklama,sira,aktif)
SELECT 'ingilizce','İngilizce',2,'🇬🇧','','','#E8F2FF','#143A66','2. sınıftan itibaren MEB İngilizce dersi.',8,1
WHERE NOT EXISTS (SELECT 1 FROM dersler WHERE kod='ingilizce' OR ad='İngilizce');

-- 2. sınıf ders eşlemeleri.
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',2,d.id,x.saat,x.sira,1
FROM dersler d
JOIN (
 SELECT 'turkce' kod,'Türkçe' ad,10 saat,10 sira
 UNION ALL SELECT 'matematik','Matematik',5,20
 UNION ALL SELECT 'hayat','Hayat Bilgisi',4,30
 UNION ALL SELECT 'ingilizce','İngilizce',2,40
 UNION ALL SELECT 'gorsel','Görsel Sanatlar',1,50
 UNION ALL SELECT 'muzik','Müzik',1,60
 UNION ALL SELECT 'beden','Beden Eğitimi ve Oyun',5,70
) x ON d.kod=x.kod OR d.ad=x.ad
ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;

-- Yalnız 2. sınıf hazırlık verisini temizle.
DELETE s FROM ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2;
DELETE FROM ders_konulari WHERE kademe_kodu='temel_egitim' AND sinif_seviyesi=2;
DELETE FROM ders_bolumleri
WHERE kademe_kodu='temel_egitim' AND sinif_seviyesi=2;

-- TÜRKÇE: 8 tema
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',2,'tema',x.kod,x.ad,x.aciklama,x.sira,1
FROM dersler d JOIN (
 SELECT 'tr2-degerler' kod,'Değerlerimizle Varız' ad,'Nezaket, erdemler, okuma-anlama ve anlatım becerileri.' aciklama,10 sira
 UNION ALL SELECT 'tr2-ataturk','Atatürk ve Çocuk','Atatürk, millî egemenlik, millî kimlik ve vatanseverlik.',20
 UNION ALL SELECT 'tr2-doga','Doğada Neler Oluyor?','Doğa, çevre ve canlı yaşamı üzerinden dil becerileri.',30
 UNION ALL SELECT 'tr2-okuma','Okuma Serüvenimiz','Kitap, okuma kültürü, metin ve bilgi kaynakları.',40
 UNION ALL SELECT 'tr2-yetenek','Yeteneklerimizi Tanıyoruz','Yetenek, ilgi, üretim ve kendini ifade etme.',50
 UNION ALL SELECT 'tr2-mucit','Mucit Çocuk','Merak, bilim, teknoloji, tasarım ve üretme.',60
 UNION ALL SELECT 'tr2-kultur','Kültür Hazinemiz','Kültürel miras, gelenek, sanat ve ortak değerler.',70
 UNION ALL SELECT 'tr2-haklar','Haklarımızı Biliyoruz','Çocuk hakları, sorumluluklar ve adalet.',80
) x WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;

-- MATEMATİK: 6 tema
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',2,'tema',x.kod,x.ad,x.aciklama,x.sira,1
FROM dersler d JOIN (
 SELECT 'mat2-sayilar-1' kod,'Sayılar ve Nicelikler (1)' ad,'100’e kadar sayılar, çözümleme, sıralama, ritmik sayma, örüntü ve tahmin.' aciklama,10 sira
 UNION ALL SELECT 'mat2-sayilar-2','Sayılar ve Nicelikler (2)','Bütün-yarım-çeyrek, para, zaman, uzunluk ve kütle ölçme.',20
 UNION ALL SELECT 'mat2-islemler','İşlemlerden Cebirsel Düşünmeye','Toplama, çıkarma, çarpma, bölme, eşitlik ve problemler.',30
 UNION ALL SELECT 'mat2-geometri-1','Nesnelerin Geometrisi (1)','Geometrik cisimler ve şekiller, model oluşturma ve sıvı miktarı.',40
 UNION ALL SELECT 'mat2-geometri-2','Nesnelerin Geometrisi (2)','Yer-yön bulma ve simetri.',50
 UNION ALL SELECT 'mat2-veri','Veriye Dayalı Araştırma','İki veri grubuyla çetele, sıklık ve şekil grafiği.',60
) x WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;

-- HAYAT BİLGİSİ: 6 öğrenme alanı
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',2,'ogrenme_alani',x.kod,x.ad,x.aciklama,x.sira,1
FROM dersler d JOIN (
 SELECT 'hb2-okul' kod,'Ben ve Okulum' ad,'Bireysel özellikler, okul yaşamı, iletişim ve sorumluluk.' aciklama,10 sira
 UNION ALL SELECT 'hb2-saglik','Sağlığım ve Güvenliğim','Sağlıklı yaşam, güvenlik, trafik ve kişisel sınırlar.',20
 UNION ALL SELECT 'hb2-aile','Ailem ve Toplum','Aile, görev paylaşımı, toplumsal yaşam, nezaket ve dayanışma.',30
 UNION ALL SELECT 'hb2-ulkem','Yaşadığım Yer ve Ülkem','Yakın çevre, ülke, millî değerler ve ortak yaşam.',40
 UNION ALL SELECT 'hb2-doga','Doğa ve Çevre','Canlılar, doğa olayları, kaynaklar, çevre ve afet farkındalığı.',50
 UNION ALL SELECT 'hb2-bilim','Bilim, Teknoloji ve Sanat','Merak, araştırma, teknoloji, tasarım ve sanat.',60
) x WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;

-- İNGİLİZCE: 6 tema
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',2,'theme',x.kod,x.ad,x.aciklama,x.sira,1
FROM dersler d JOIN (
 SELECT 'eng2-school' kod,'School Life' ad,'Greetings, introductions, people and places at school, days and celebrations.' aciklama,10 sira
 UNION ALL SELECT 'eng2-classroom','Classroom Life','Classroom instructions, furniture, devices, objects and colours.',20
 UNION ALL SELECT 'eng2-personal','Personal Life','Body parts, physical features, clothes, ages, birthdays and weather.',30
 UNION ALL SELECT 'eng2-family','Family Life','Family members and physical appearance.',40
 UNION ALL SELECT 'eng2-home','Homes, Houses & Neighbourhoods','Rooms, furniture and pets in the house.',50
 UNION ALL SELECT 'eng2-city','Life in the City & the World','Basic food types, food items and meals.',60
) x WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;

-- GÖRSEL SANATLAR: 7 tema
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',2,'tema',x.kod,x.ad,'2. sınıf Görsel Sanatlar teması.',x.sira,1
FROM dersler d JOIN (
 SELECT 'gs2-hayat' kod,'Hayat ve Sanat' ad,10 sira
 UNION ALL SELECT 'gs2-dil','Sanatın Görsel Dili',20
 UNION ALL SELECT 'gs2-sanatci','Sanatçılar ve Eserleri',30
 UNION ALL SELECT 'gs2-cizim','Çizim ve Görsel İfade',40
 UNION ALL SELECT 'gs2-renk','Renk ve Estetik',50
 UNION ALL SELECT 'gs2-milli','Millî Değerler ve Sanat',60
 UNION ALL SELECT 'gs2-muze','Müze ve Kültür',70
) x WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),sira=VALUES(sira),aktif=1;

-- MÜZİK: 2 tema
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',2,'tema',x.kod,x.ad,'2. sınıf Müzik teması.',x.sira,1
FROM dersler d JOIN (
 SELECT 'muz2-dil' kod,'Müzik Dili' ad,10 sira
 UNION ALL SELECT 'muz2-kultur','Müzik Kültürü',20
) x WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),sira=VALUES(sira),aktif=1;

-- BEDEN EĞİTİMİ VE OYUN: 4 tema
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',2,'tema',x.kod,x.ad,x.aciklama,x.sira,1
FROM dersler d JOIN (
 SELECT 'be2-hareket' kod,'Hareketimi Geliştiriyorum' ad,'Temel hareket, nesne kontrolü, denge ve grupla hareket.' aciklama,10 sira
 UNION ALL SELECT 'be2-kural','Oyunun Kurallarını Uyguluyorum','Hareket kavramları, oyun kuralları, taktik ve strateji.',20
 UNION ALL SELECT 'be2-ritim','Ritimle Hareket Ediyorum','Tempo, ritim ve eşle/grupla uyumlu hareket.',30
 UNION ALL SELECT 'be2-saglik','Sağlığım İçin Fiziksel Aktiviteye Katılıyorum','Fiziksel aktivite, sağlık, hedef ve güvenli ortam.',40
) x WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
