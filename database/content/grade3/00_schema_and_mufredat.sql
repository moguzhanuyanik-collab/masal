SET NAMES utf8mb4;

-- HAZIRLIK DOSYASI: otomatik migration değildir.
-- İlkAdım 3. sınıf 2026-2027 MEB / Türkiye Yüzyılı Maarif Modeli içerikleri.
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

-- Fen Bilimleri dersi sistemde yoksa oluştur.
INSERT INTO dersler
(kod,ad,haftalik_saat,emoji,sanat,sanat_sinifi,renk,yazi_renk,aciklama,sira,aktif)
SELECT 'fen','Fen Bilimleri',3,'🔬','','','#E8F8F1','#174C3C','3. sınıftan itibaren MEB Fen Bilimleri dersi.',35,1
WHERE NOT EXISTS (SELECT 1 FROM dersler WHERE kod='fen' OR ad='Fen Bilimleri');

-- İngilizce dersi sistemde yoksa oluştur.
INSERT INTO dersler
(kod,ad,haftalik_saat,emoji,sanat,sanat_sinifi,renk,yazi_renk,aciklama,sira,aktif)
SELECT 'ingilizce','İngilizce',2,'🇬🇧','','','#E8F2FF','#143A66','MEB İngilizce dersi.',40,1
WHERE NOT EXISTS (SELECT 1 FROM dersler WHERE kod='ingilizce' OR ad='İngilizce');

-- 3. sınıf ders eşlemeleri.
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',3,d.id,x.saat,x.sira,1
FROM dersler d
JOIN (
 SELECT 'turkce' kod,'Türkçe' ad,8 saat,10 sira
 UNION ALL SELECT 'matematik','Matematik',5,20
 UNION ALL SELECT 'hayat','Hayat Bilgisi',3,30
 UNION ALL SELECT 'fen','Fen Bilimleri',3,35
 UNION ALL SELECT 'ingilizce','İngilizce',2,40
 UNION ALL SELECT 'gorsel','Görsel Sanatlar',1,50
 UNION ALL SELECT 'muzik','Müzik',1,60
 UNION ALL SELECT 'beden','Beden Eğitimi ve Oyun',5,70
) x ON d.kod=x.kod OR d.ad=x.ad
ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;

-- Yalnız 3. sınıf hazırlık verisini temizle.
DELETE s FROM ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3;
DELETE FROM ders_konulari WHERE kademe_kodu='temel_egitim' AND sinif_seviyesi=3;
DELETE FROM ders_bolumleri WHERE kademe_kodu='temel_egitim' AND sinif_seviyesi=3;

-- TÜRKÇE: 8 tema
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',3,'tema',x.kod,x.ad,x.aciklama,x.sira,1
FROM dersler d JOIN (
 SELECT 'tr3-degerler' kod,'Değerlerimizle Yaşıyoruz' ad,'Erdemler, nezaket, dinleme, okuma, konuşma ve yazma becerileri.' aciklama,10 sira
 UNION ALL SELECT 'tr3-ataturk','Atatürk ve Kahramanlarımız','Atatürk, kahramanlık, millî kimlik ve vatanseverlik üzerinden dil becerileri.',20
 UNION ALL SELECT 'tr3-doga','Doğayı Tanıyoruz','Doğa ve çevre temalı metinlerde anlama, çıkarım ve anlatım.',30
 UNION ALL SELECT 'tr3-bilgi','Bilgi Hazinemiz','Bilgi kaynakları, okuma kültürü, özetleme ve bilgiye ulaşma.',40
 UNION ALL SELECT 'tr3-yetenek','Yeteneklerimizi Kullanıyoruz','Sanat, spor ve edebiyat üzerinden kendini ifade etme ve metin çözümleme.',50
 UNION ALL SELECT 'tr3-bilim','Bilim Yolculuğu','Bilim ve teknoloji metinlerinde sorgulama, çıkarım ve bilgi kullanma.',60
 UNION ALL SELECT 'tr3-kultur','Millî Kültürümüz','Türk kültürü, millî ve manevi değerler üzerinden okuma ve yazma.',70
 UNION ALL SELECT 'tr3-haklar','Hak ve Sorumluluklarımız','Temel haklar, özgürlükler ve sorumluluklar üzerinden dil becerileri.',80
) x WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;

-- MATEMATİK: 6 tema
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',3,'tema',x.kod,x.ad,x.aciklama,x.sira,1
FROM dersler d JOIN (
 SELECT 'mat3-sayilar-1' kod,'Sayılar ve Nicelikler (1)' ad,'1000’e kadar sayılar, çözümleme, sıralama, yuvarlama, ritmik sayma, tek-çift, örüntü ve tahmin.' aciklama,10 sira
 UNION ALL SELECT 'mat3-sayilar-2','Sayılar ve Nicelikler (2)','Kesirler, saat-dakika-saniye, uzunluk, kütle ve para dönüşümleri.',20
 UNION ALL SELECT 'mat3-islemler','İşlemlerden Cebirsel Düşünmeye','Toplama, çıkarma, çarpma, bölme, tahmin, zihinden işlem, eşitlik ve problemler.',30
 UNION ALL SELECT 'mat3-geometri-1','Nesnelerin Geometrisi (1)','Geometrik cisimler, çokgenler, çizim, çevre ve sıvı miktarı.',40
 UNION ALL SELECT 'mat3-geometri-2','Nesnelerin Geometrisi (2)','Simetri doğruları ve simetrik şekil yapılandırma.',50
 UNION ALL SELECT 'mat3-veri','Veriye Dayalı Araştırma','Tek veri grubunda kategorik ve sayma verisiyle istatistiksel araştırma.',60
) x WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;

-- HAYAT BİLGİSİ: 6 öğrenme alanı
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',3,'ogrenme_alani',x.kod,x.ad,x.aciklama,x.sira,1
FROM dersler d JOIN (
 SELECT 'hb3-okul' kod,'Ben ve Okulum' ad,'Okul yaşamı, bireysel özellikler, demokratik katılım, iletişim ve sorumluluk.' aciklama,10 sira
 UNION ALL SELECT 'hb3-saglik','Sağlığım ve Güvenliğim','Sağlıklı yaşam, riskleri değerlendirme, trafik, güvenli teknoloji ve acil durumlar.',20
 UNION ALL SELECT 'hb3-aile','Ailem ve Toplum','Aile-toplum ilişkisi, yardımseverlik, meslekler ve sosyal katılım.',30
 UNION ALL SELECT 'hb3-ulkem','Yaşadığım Yer ve Ülkem','Yakın çevre, yerel yönetim, kültürel miras, millî değerler ve vatandaşlık.',40
 UNION ALL SELECT 'hb3-doga','Doğa ve Çevre','Doğal çevre, kaynaklar, sürdürülebilirlik, afetler ve çevre sorumluluğu.',50
 UNION ALL SELECT 'hb3-bilim','Bilim, Teknoloji ve Sanat','Bilimsel merak, teknolojik ürünler, güvenli dijital yaşam, tasarım ve sanat.',60
) x WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;

-- FEN BİLİMLERİ: 8 ünite
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',3,'unite',x.kod,x.ad,x.aciklama,x.sira,1
FROM dersler d JOIN (
 SELECT 'fen3-kesif' kod,'Bilimsel Keşif Yolculuğu' ad,'Bilimsel bilgiye ulaşma yolları ve bilim insanlarının özellikleri.' aciklama,10 sira
 UNION ALL SELECT 'fen3-canlilar','Canlılar Dünyasına Yolculuk','Canlıların sınıflandırılması, duyu organları ve yaşam döngüleri.',20
 UNION ALL SELECT 'fen3-yer','Yer Bilimciler İş Başında','Kayaçlar, madenler, mineraller, fosiller ve paleontoloji.',30
 UNION ALL SELECT 'fen3-madde','Maddeyi Tanıyalım, Karıştırıp Ayıralım','Katı-sıvı-gaz, karışımlar, ayırma yöntemleri ve atık ayrıştırma.',40
 UNION ALL SELECT 'fen3-hareket','Hareketi Keşfediyorum','Hareket türleri ve kuvvetin nesneler üzerindeki etkileri.',50
 UNION ALL SELECT 'fen3-elektrik','Yaşamımızı Kolaylaştıran Elektrik','Elektrikli araçlar, güvenli kullanım ve enerji tasarrufu.',60
 UNION ALL SELECT 'fen3-toprak','Toprağı Tanıyorum, Tarımı Keşfediyorum','Toprağın oluşumu ve yapısı ile bitki yetiştirme koşulları.',70
 UNION ALL SELECT 'fen3-yasam','Canlıların Yaşam Alanlarına Yolculuk','Yaşam alanları, canlı çeşitliliği ve habitatların korunması.',80
) x WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;

-- İNGİLİZCE: 6 tema
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',3,'theme',x.kod,x.ad,x.aciklama,x.sira,1
FROM dersler d JOIN (
 SELECT 'eng3-school' kod,'School Life' ad,'School routines, people, places, days, dates and celebrations.' aciklama,10 sira
 UNION ALL SELECT 'eng3-classroom','Classroom Life','Instructions, classroom language, objects, positions and learning activities.',20
 UNION ALL SELECT 'eng3-personal','Personal Life','Appearance, clothes, feelings, age, birthday, seasons and weather.',30
 UNION ALL SELECT 'eng3-family','Family Life','Family members, jobs, routines and simple descriptions.',40
 UNION ALL SELECT 'eng3-home','Homes, Houses & The Neighbourhood','Rooms, furniture, locations, pets and neighbourhood places.',50
 UNION ALL SELECT 'eng3-city','Life in the City & The World','Food, meals, likes, shopping and simple city/world contexts.',60
) x WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;

-- GÖRSEL SANATLAR: 7 tema
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',3,'tema',x.kod,x.ad,'3. sınıf Görsel Sanatlar teması.',x.sira,1
FROM dersler d JOIN (
 SELECT 'gs3-hayat' kod,'Hayat ve Sanat' ad,10 sira
 UNION ALL SELECT 'gs3-dil','Sanatın Görsel Dili',20
 UNION ALL SELECT 'gs3-sanatci','Sanatçılar ve Eserleri',30
 UNION ALL SELECT 'gs3-cizim','Çizim ve Görsel İfade',40
 UNION ALL SELECT 'gs3-renk','Renk ve Estetik',50
 UNION ALL SELECT 'gs3-milli','Millî Değerler ve Sanat',60
 UNION ALL SELECT 'gs3-muze','Müze ve Kültür',70
) x WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),sira=VALUES(sira),aktif=1;

-- MÜZİK: 2 tema
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',3,'tema',x.kod,x.ad,'3. sınıf Müzik teması.',x.sira,1
FROM dersler d JOIN (
 SELECT 'muz3-dil' kod,'Müzik Dili' ad,10 sira
 UNION ALL SELECT 'muz3-kultur','Müzik Kültürü',20
) x WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),sira=VALUES(sira),aktif=1;

-- BEDEN EĞİTİMİ VE OYUN: 6 tema
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',3,'tema',x.kod,x.ad,x.aciklama,x.sira,1
FROM dersler d JOIN (
 SELECT 'be3-isbirligi' kod,'İş Birlikli Oyunlarla Hareket Ediyorum' ad,'İş birlikli oyunlarda hareket, iletişim ve takım çalışması.' aciklama,10 sira
 UNION ALL SELECT 'be3-kural','Oyunun Kurallarını Yeniden Oluşturuyorum','Basit oyun kuralları, adil oyun ve kuralları yeniden yapılandırma.',20
 UNION ALL SELECT 'be3-ritim','Farklı Ritimlerle Hareket Ediyorum','Farklı tempo ve ritimlerle bireysel ve grup hareketleri.',30
 UNION ALL SELECT 'be3-saglik','Sağlığım İçin Fiziksel Aktiviteye Katılıyorum','Fiziksel aktivite, sağlık, güvenlik ve öz değerlendirme.',40
 UNION ALL SELECT 'be3-cevre','Hareket Ederek Çevremi Keşfediyorum','Açık alan, yön, çevre farkındalığı ve güvenli hareket.',50
 UNION ALL SELECT 'be3-gelenek','Kültürel Birikimlerimiz ve Geleneksel Oyunlar','Geleneksel çocuk oyunları, kültür ve birlikte oyun.',60
) x WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
