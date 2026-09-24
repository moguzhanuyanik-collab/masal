SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'hb-okul','Ben ve Okulum','Ben ve Okulum','Okulu, sınıfı, arkadaşlık ilişkilerini ve temel kuralları tanır.','Okulda güvenli ve saygılı davranırız.',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='hb-ben-okulum'
WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'hb-saglik','Sağlığım ve Güvenliğim','Sağlığım ve Güvenliğim','Temizlik, sağlıklı yaşam, kişisel alan, trafik ve acil durum davranışlarını tanır.','Ellerimizi yemeklerden önce ve sonra yıkarız.',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='hb-saglik-guvenlik'
WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'hb-aile','Ailem ve Toplum','Ailem ve Toplum','Ailenin önemini, nezaket kurallarını, görev ve sorumlulukları fark eder.','Evde görevleri paylaşırız.',300,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='hb-ailem-toplum'
WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'hb-ulkem','Yaşadığım Yer ve Ülkem','Yaşadığım Yer ve Ülkem','Yaşadığı çevreyi, Türkiye''yi, millî sembolleri ve özel günleri tanır.','Türkiye''nin başkenti Ankara''dır.',400,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='hb-yer-ulkem'
WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'hb-doga','Doğa ve Çevre','Doğa ve Çevre','Canlı-cansız varlıkları, gökyüzünü, afetleri ve çevreyi korumayı fark eder.','Atıkları türüne göre ayırmak çevreyi korur.',500,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='hb-doga-cevre'
WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'hb-bilim','Bilim, Teknoloji ve Sanat','Bilim, Teknoloji ve Sanat','Merak etmenin, soru sormanın, teknolojiyi güvenli kullanmanın ve sanatın önemini fark eder.','Bir şeyi merak ettiğimizde soru sorabiliriz.',600,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='hb-bilim-teknoloji-sanat'
WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'gs-hayat','Hayat ve Sanat','Hayat ve Sanat','Renkleri, geometrik şekilleri, doğal ve yapay malzemeleri fark eder.','Doğadaki yaprak, taş ve dallar kolajda kullanılabilir.',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='gs-hayat-sanat'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'gs-dil','Sanatın Görsel Dili','Sanatın Görsel Dili','Çizgi, biçim, renk ve düzen gibi görsel özellikleri fark eder.','Kalın ve ince çizgiler farklı etkiler oluşturur.',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='gs-gorsel-dil'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'gs-sanatci','Sanatçılar ve Eserleri','Sanatçılar ve Eserleri','Sanatçı ve eser kavramını temel düzeyde tanır.','Bir ressam resim yapabilir.',300,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='gs-sanatcilar'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'gs-cizim-konu','Çizim ve Görsel İfade','Çizim ve Görsel İfade','Düşünce ve gözlemlerini çizimle ifade eder.','Bir ağacı gözlemleyip çizebiliriz.',400,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='gs-cizim'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'gs-renk','Renk ve Estetik','Renk ve Estetik','Renkleri ve renk uyumlarını fark eder.','Kırmızı, sarı ve mavi temel renklerdir.',500,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='gs-renk-estetik'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'gs-milli','Millî Değerler ve Sanat','Millî Değerler ve Sanat','Millî değerleri sanat yoluyla fark eder.','Bayrak ve millî günler sanat çalışmalarına konu olabilir.',600,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='gs-milli-degerler'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'gs-muze','Müze ve Kültür','Müze ve Kültür','Müze ve kültürel varlıklara saygılı davranır.','Müzede eserlere dokunmadan inceleriz.',700,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='gs-muze-kultur'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'muz-dil','Müzik Dili','Müzik Dili','Çevredeki sesleri fark eder, dinler, söyler ve müziğe hareketle eşlik eder.','Kuş sesi ile zil sesini ayırt edebiliriz.',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='muz-muzik-dili'
WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'muz-kultur','Müzik Kültürü','Müzik Kültürü','Müzik dinleme ve söyleme kurallarını, ritim araçlarını ve ortak eserleri fark eder.','Müzik dinlerken sessizce dinlemek saygılıdır.',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='muz-muzik-kulturu'
WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'be-hareket-konu','Hareket Ediyorum','Hareket Ediyorum','Beden, alan, denge, yer değiştirme ve nesne kontrolü becerilerini güvenli biçimde uygular.','Koşma, atlama, yakalama ve dengede durma temel hareketlerdendir.',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='be-hareket'
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'be-kural-konu','Oyunu Kuralına Göre Oynuyorum','Oyunu Kuralına Göre Oynuyorum','Oyun kurallarına, adil oyuna ve iş birliğine uygun davranır.','Oyunda sırayı beklemek kurala uymaktır.',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='be-kural'
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'be-ritim-konu','Ritimle Hareket Ediyorum','Ritimle Hareket Ediyorum','Ritme uygun bireysel ve grup hareketleri yapar.','Müzik hızlandığında hareket ritme uygun değişebilir.',300,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='be-ritim'
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'be-saglik-konu','Fiziksel Aktiviteye Katılıyorum Sağlıklı Büyüyorum','Fiziksel Aktiviteye Katılıyorum Sağlıklı Büyüyorum','Hareket-sağlık ilişkisini, ısınma, soğuma, beslenme, su ve uygun kıyafeti fark eder.','Etkinlik öncesi ısınmak bedeni hazırlar.',400,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='be-saglik'
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-okul-1','coktan_secmeli','Yeni bir arkadaşın kendini tanıtırken ne yapmalısın?','["Arkanı dönmek","Onu dinlemek","Bağırmak","Koşmak"]',1,'Konuşan kişiyi dinlemek saygılı davranıştır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-okul' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-okul-2','coktan_secmeli','Sınıfta söz almak istediğinde ne yapmalısın?','["Bağırmak","Arkadaşını itmek","Sınıftan çıkmak","El kaldırmak"]',3,'El kaldırıp sıranı beklemek sınıf kuralıdır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-okul' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-okul-3','coktan_secmeli','Koridorda en güvenli davranış hangisidir?','["Koşmak","Dikkatli yürümek","Birini itmek","Kaymak"]',1,'Koridorda dikkatli yürümek kazaları azaltır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-okul' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-okul-4','coktan_secmeli','Ortak kullanılan bir kitabı nasıl kullanmalısın?','["Yırtarak","Üzerine basarak","Saklayarak","Özenli"]',3,'Ortak eşyaları özenli kullanırız.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-okul' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-okul-5','coktan_secmeli','Arkadaşın üzgün görünüyorsa ne yapabilirsin?','["Onunla alay edebilirsin","Nasıl olduğunu sorabilirsin","Eşyasını alabilirsin","Bağırabilirsin"]',1,'Arkadaşımızın duygularını önemsemek dostça davranıştır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-okul' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-okul-6','coktan_secmeli','Sınıfta yere çöp düştüğünde ne yapmalısın?','["Üzerine basmak","Sıranın altına itmek","Bırakmak","Çöp kutusuna atmak"]',3,'Sınıfı temiz tutmak ortak sorumluluktur.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-okul' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-okul-7','coktan_secmeli','Okulda kaybolduğunu düşünürsen kimden yardım isteyebilirsin?','["Tanımadığın birinden okul dışına çıkmak için","Öğretmen veya görevli bir yetişkinden","Hiç kimseden","Tek başına uzaklaşarak"]',1,'Güvenilir okul çalışanlarından yardım istemek doğrudur.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-okul' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-okul-8','coktan_secmeli','Arkadaşının kalemini kullanmak istiyorsan önce ne yapmalısın?','["İzinsiz almak","Saklamak","Kırmak","İzin istemek"]',3,'Başkasının eşyasını kullanmadan önce izin isteriz.',2,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-okul' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-okul-9','coktan_secmeli','Ders sırasında arkadaşın konuşuyorsa en uygun davranış hangisidir?','["Daha yüksek sesle konuşmak","Dersi dinlemeye devam etmek","Sınıfta dolaşmak","Kalem fırlatmak"]',1,'Ders sırasında öğretmeni dinlemek gerekir.',2,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-okul' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-okul-10','coktan_secmeli','Kendi özelliklerini anlatırken hangisini söyleyebilirsin?','["Herkes benim gibi olmalı","Arkadaşımın eşyası benimdir","Kurallar gereksizdir","Sevdiğim etkinlik resim yapmak"]',3,'Sevdiğimiz etkinlikler bireysel özelliklerimizdendir.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-okul' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-saglik-1','coktan_secmeli','Yemekten önce ne yapmalıyız?','["Ayakkabımızı çıkarmalıyız","Koşmalıyız","Oyuncakları saklamalıyız","Ellerimizi yıkamalıyız"]',3,'El yıkamak temizliğe yardımcı olur.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-saglik' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-saglik-2','coktan_secmeli','Dişlerimizi neyle temizleriz?','["Tarakla","Diş fırçası ve uygun diş macunuyla","Kalemle","Havluyla"]',1,'Diş fırçası ağız temizliği için kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-saglik' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-saglik-3','coktan_secmeli','Karşıdan karşıya geçerken en güvenli yer hangisidir?','["Araçların arası","Viraj","Yolun herhangi bir yeri","Yaya geçidi"]',3,'Yaya geçidi yayalar için güvenli geçiş yeridir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-saglik' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-saglik-4','coktan_secmeli','Trafik ışığında yayalar için kırmızı yanıyorsa ne yapmalıyız?','["Koşarak geçmeliyiz","Beklemeliyiz","Yola çıkmalıyız","Gözümüzü kapatmalıyız"]',1,'Kırmızı ışıkta beklenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-saglik' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-saglik-5','coktan_secmeli','Tanımadığın biri kişisel bilgilerini sorarsa ne yapmalısın?','["Her şeyi söylemelisin","Adresini vermelisin","Şifreni paylaşmalısın","Güvendiğin bir yetişkine haber vermelisin"]',3,'Kişisel bilgilerimizi tanımadığımız kişilerle paylaşmayız.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-saglik' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-saglik-6','coktan_secmeli','Acil bir durumda ne yapmak doğrudur?','["Saklanmak","Sakin olup güvenilir bir yetişkinden yardım istemek","Şaka yapmak","Tehlikeye yaklaşmak"]',1,'Acil durumda sakin kalıp yardım istemek önemlidir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-saglik' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-saglik-7','coktan_secmeli','Islak zeminde nasıl yürümeliyiz?','["Koşarak","Zıplayarak","Geri geri hızla","Dikkatli ve yavaş"]',3,'Islak zemin kaygan olabilir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-saglik' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-saglik-8','coktan_secmeli','Sağlıklı bir ara öğün hangisidir?','["Sadece şeker","Meyve","Sadece gazlı içecek","Çok fazla cips"]',1,'Meyve dengeli beslenmenin bir parçası olabilir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-saglik' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-saglik-9','coktan_secmeli','Uyku neden önemlidir?','["Hiçbir işe yaramaz","Sadece hafta sonu gerekir","Yemek yerine geçer","Bedenimizin dinlenmesine yardımcı olur"]',3,'Yeterli uyku büyüme ve dinlenme için önemlidir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-saglik' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-saglik-10','coktan_secmeli','Başkalarının kişisel alanına nasıl davranmalıyız?','["İzinsiz yaklaşmalıyız","Saygı göstermeliyiz","Eşyalarını almalıyız","Onları itmeliyiz"]',1,'Kişisel alana saygı güvenli ve nazik davranıştır.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-saglik' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-saglik-11','coktan_secmeli','Bisiklet veya scooter kullanırken uygun koruyucu nedir?','["Terlik","Atkı","Defter","Kask"]',3,'Kask başı korumaya yardımcı olur.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-saglik' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-saglik-12','coktan_secmeli','Güneşli ve sıcak bir günde ne içmek önemlidir?','["Sadece şekerli içecek","Yeterli su","Hiçbir şey","Çok sıcak çay"]',1,'Su vücudun sıvı ihtiyacını karşılamaya yardımcı olur.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-saglik' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-aile-1','coktan_secmeli','Ailede görevler nasıl yapılabilir?','["Sadece bir kişiye bırakarak","Hiç yapmayarak","Birbirini suçlayarak","Paylaşarak"]',3,'Görev paylaşımı birlikte yaşamı kolaylaştırır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-aile' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-aile-2','coktan_secmeli','Bir aile bireyi konuşurken ne yapmak naziktir?','["Sözünü kesmek","Dinlemek","Bağırmak","Odayı dağıtmak"]',1,'Dinlemek saygılı iletişimin parçasıdır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-aile' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-aile-3','coktan_secmeli','Evde kullandığın oyuncağı ne yapmalısın?','["Yerde bırakmalısın","Kırmalısın","Saklayıp unutmamalısın","İşin bitince yerine koymalısın"]',3,'Eşyalarını toplamak sorumluluktur.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-aile' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-aile-4','coktan_secmeli','Birine çarptığında ne söylemek uygun olur?','["Çekil","Özür dilerim","Bana ne","Sus"]',1,'Hata yaptığımızda özür dilemek nazik davranıştır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-aile' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-aile-5','coktan_secmeli','Sana yardım eden birine ne söyleyebilirsin?','["Git","Vermem","Sus","Teşekkür ederim"]',3,'Teşekkür etmek nezaket göstergesidir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-aile' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-aile-6','coktan_secmeli','Evde suyu gereksiz açık bırakmamak neye örnektir?','["İsrafa","Tasarrufa","Oyuna","Gürültüye"]',1,'Suyu gereksiz kullanmamak tasarruftur.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-aile' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-aile-7','coktan_secmeli','Aile bireylerinin farklı fikirleri olduğunda ne yapmalıyız?','["Bağırmalıyız","Kavga etmeliyiz","Kimse konuşmamalı","Birbirimizi dinlemeliyiz"]',3,'Farklı fikirlere saygı göstermek önemlidir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-aile' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-aile-8','coktan_secmeli','Evde yapabileceğin uygun bir sorumluluk hangisidir?','["Tehlikeli elektrik işini yapmak","Oyuncaklarını toplamak","Ağır eşya taşımak","Tek başına ocak yakmak"]',1,'Yaşına uygun işlerden biri oyuncaklarını toplamaktır.',2,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-aile' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-aile-9','coktan_secmeli','Misafirle karşılaştığında hangisi nazik bir davranıştır?','["Görmezden gelmek","Bağırmak","Eşyasını almak","Selam vermek"]',3,'Selamlaşmak görgü kurallarındandır.',2,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-aile' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-aile-10','coktan_secmeli','Aile içinde sevgi nasıl gösterilebilir?','["Eşyaları kırarak","Nazik söz ve davranışlarla","Bağırarak","Söz keserek"]',1,'Nazik davranışlar sevgi ve saygıyı gösterir.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-aile' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-ulkem-1','coktan_secmeli','Türkiye''nin başkenti neresidir?','["İstanbul","Ankara","İzmir","Konya"]',1,'Türkiye''nin başkenti Ankara''dır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-ulkem' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-ulkem-2','coktan_secmeli','Türk bayrağında hangi renkler bulunur?','["Mavi ve yeşil","Sarı ve mor","Turuncu ve siyah","Kırmızı ve beyaz"]',3,'Türk bayrağı kırmızı zemin üzerinde beyaz ay ve yıldız taşır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-ulkem' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-ulkem-3','coktan_secmeli','İstiklâl Marşı söylenirken nasıl davranmalıyız?','["Koşmalıyız","Saygılı durmalıyız","Konuşmalıyız","Oyun oynamalıyız"]',1,'Millî marşımıza saygı gösteririz.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-ulkem' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-ulkem-4','coktan_secmeli','Mustafa Kemal Atatürk kimdir?','["Bir çizgi film kahramanıdır","Bir spor takımıdır","Bir şehir adıdır","Türkiye Cumhuriyeti''nin kurucusudur"]',3,'Atatürk Türkiye Cumhuriyeti''nin kurucusudur.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-ulkem' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-ulkem-5','coktan_secmeli','29 Ekim hangi bayramdır?','["Çocuk Bayramı","Cumhuriyet Bayramı","Zafer Bayramı","Yeni Yıl"]',1,'29 Ekim Cumhuriyet Bayramı''dır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-ulkem' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-ulkem-6','coktan_secmeli','23 Nisan hangi bayramdır?','["Cumhuriyet Bayramı","Zafer Bayramı","Öğretmenler Günü","Ulusal Egemenlik ve Çocuk Bayramı"]',3,'23 Nisan Ulusal Egemenlik ve Çocuk Bayramı''dır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-ulkem' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-ulkem-7','coktan_secmeli','Yaşadığımız çevreyi tanımak için hangisine bakabiliriz?','["Sadece oyuncaklara","Sokak ve önemli yapılar gibi çevre özelliklerine","Sadece televizyona","Hiçbir şeye"]',1,'Çevremizdeki yapılar yaşadığımız yeri tanımamıza yardım eder.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-ulkem' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-ulkem-8','coktan_secmeli','Bayrağımıza nasıl davranmalıyız?','["Dikkatsiz","Yırtarak","Yere atarak","Saygılı"]',3,'Bayrak millî sembolümüzdür.',2,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-ulkem' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-ulkem-9','coktan_secmeli','Türkiye hangi ülkede yaşadığımızı gösterir?','["Bir oyunu","Kendi ülkemizi","Bir hayvanı","Bir meyveyi"]',1,'Türkiye yaşadığımız ülkenin adıdır.',2,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-ulkem' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-ulkem-10','coktan_secmeli','Millî bayramlarda yapılan uygun bir davranış hangisidir?','["Çevreyi kirletmek","Bağırarak töreni bozmak","Bayrağı yere atmak","Törenlere saygıyla katılmak"]',3,'Millî günlerde saygılı davranırız.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-ulkem' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-doga-1','coktan_secmeli','Hangisi canlıdır?','["Taş","Masa","Kalem","Kedi"]',3,'Kedi canlı bir varlıktır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-doga' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-doga-2','coktan_secmeli','Hangisi cansızdır?','["Ağaç","Taş","Kuş","Çiçek"]',1,'Taş cansız bir varlıktır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-doga' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-doga-3','coktan_secmeli','Bitkilerin büyümesi için hangisi gereklidir?','["Plastik oyuncak","Televizyon","Kalem","Su ve uygun ışık"]',3,'Bitkiler su ve ışığa ihtiyaç duyar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-doga' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-doga-4','coktan_secmeli','Güneş''i en çok ne zaman görürüz?','["Her gece aynı yerde","Gündüz","Sadece yağmurda","Sadece kışın"]',1,'Güneş gündüz gökyüzünde görülür.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-doga' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-doga-5','coktan_secmeli','Ay''ı çoğunlukla ne zaman fark ederiz?','["Sınıf tahtasında","Toprağın altında","Dolabın içinde","Gece gökyüzünde"]',3,'Ay gece gökyüzünde kolayca fark edilir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-doga' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-doga-6','coktan_secmeli','Kâğıt atığını nereye atmak uygundur?','["Yola","Kâğıt geri dönüşüm kutusuna","Dereye","Bahçeye"]',1,'Kâğıdı uygun geri dönüşüm kutusuna atmak doğrudur.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-doga' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-doga-7','coktan_secmeli','Kullanılmış pili ne yapmalıyız?','["Normal çöpe her zaman atmalıyız","Toprağa gömmeliyiz","Suya atmalıyız","Atık pil toplama noktasına bırakmalıyız"]',3,'Atık piller özel toplama noktalarına bırakılmalıdır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-doga' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-doga-8','coktan_secmeli','Çevreyi koruyan davranış hangisidir?','["Suyu gereksiz akıtmak","Çöpü uygun kutuya atmak","Yere çöp atmak","Ağaç dallarını gereksiz kırmak"]',1,'Atıkları doğru yere atmak çevreyi korur.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-doga' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-doga-9','coktan_secmeli','Deprem sırasında öğretmenin yönergesini neden dinlemeliyiz?','["Daha hızlı koşmak için","Oyun oynamak için","Sınıftan tek başına kaçmak için","Güvenli davranmak için"]',3,'Afetlerde güvenli yönergeleri izlemek önemlidir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-doga' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-doga-10','coktan_secmeli','Şiddetli hava olayında en doğru davranış hangisidir?','["Tehlikeye yaklaşmak","Güvenli bir yerde yetişkin yönergesini izlemek","Elektrik direğine dokunmak","Tek başına uzaklaşmak"]',1,'Güvenli yerde kalmak gerekir.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-doga' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-doga-11','coktan_secmeli','Cam şişe hangi tür atığa örnektir?','["Kâğıt","Metal","Organik yemek","Cam"]',3,'Cam şişe cam atıktır.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-doga' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-doga-12','coktan_secmeli','Plastik şişeyi yeniden kullanım veya geri dönüşüme ayırmak ne sağlar?','["Daha çok çöp üretir","Atık miktarını azaltmaya yardımcı olur","Suyu kirletir","Hiç etkisi yoktur"]',1,'Yeniden kullanım ve geri dönüşüm atığı azaltır.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-doga' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-bilim-1','coktan_secmeli','Bir şeyi merak ettiğinde ne yapabilirsin?','["Merakını gizlemelisin","Eşyaları kırmalısın","Tahmin etmeden bırakmalısın","Soru sorabilirsin"]',3,'Soru sormak öğrenmenin yollarındandır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-bilim' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-bilim-2','coktan_secmeli','Bir gözlem yaparken ne kullanabiliriz?','["Sadece tahmini","Duyularımızı ve güvenli araçları","Bağırmayı","Eşyaları atmayı"]',1,'Gözlemde duyular ve uygun araçlar kullanılabilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-bilim' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-bilim-3','coktan_secmeli','Teknolojik bir aracı kullanırken ne yapmalıyız?','["Şifremizi herkesle paylaşmalıyız","Kablolarla oynamalıyız","İzinsiz uygulama açmalıyız","Güvenlik kurallarına uymalıyız"]',3,'Teknolojiyi güvenli kullanmak önemlidir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-bilim' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-bilim-4','coktan_secmeli','Tablet kullanırken kişisel bilgileri kiminle paylaşmalıyız?','["Herkesle","Güvenilir yetişkinin yönlendirmesi dışında paylaşmamalıyız","Tanımadığımız kişilerle","Oyun sohbetindeki herkesle"]',1,'Kişisel bilgiler korunmalıdır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-bilim' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-bilim-5','coktan_secmeli','Sanat etkinliğinde hangisini yapabiliriz?','["Çevreyi kirletmek","Araçları kırmak","Arkadaşı itmek","Resim çizmek"]',3,'Resim çizmek bir sanat etkinliğidir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-bilim' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-bilim-6','coktan_secmeli','Bilimsel merakın başlangıcı hangisi olabilir?','["Hiç soru sormamak","Neden ve nasıl diye sormak","Sonucu uydurmak","Gözlem yapmamak"]',1,'Neden ve nasıl soruları merakı geliştirir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-bilim' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-bilim-7','coktan_secmeli','Bir deneyde önce neye dikkat etmeliyiz?','["En hızlı olmaya","Malzemeleri rastgele karıştırmaya","Yönergeleri görmezden gelmeye","Güvenlik kurallarına"]',3,'Deneylerde güvenlik önemlidir.',2,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-bilim' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb-bilim-8','coktan_secmeli','Bir sanat eserine bakarken farklı insanların farklı düşünmesi normal midir?','["Hayır, herkes aynı düşünmeli","Evet","Sadece öğretmen düşünebilir","Sanat hakkında konuşulmaz"]',1,'Sanat eserleri farklı duygu ve düşünceler oluşturabilir.',2,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='hb-bilim' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-hayat-1','coktan_secmeli','Hangisi doğal bir malzemedir?','["Plastik kaşık","Metal vida","Oyuncak araba","Yaprak"]',3,'Yaprak doğada bulunur.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-hayat' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-hayat-2','coktan_secmeli','Hangisi yapay bir nesnedir?','["Taş","Plastik şişe","Yaprak","Dal"]',1,'Plastik şişe insanlar tarafından üretilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-hayat' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-hayat-3','coktan_secmeli','Kolaj yaparken ne yaparız?','["Sadece yazı yazarız","Koşarız","Top oynarız","Farklı parçaları bir yüzeyde birleştiririz"]',3,'Kolaj farklı malzemelerin birleştirilmesiyle yapılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-hayat' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-hayat-4','coktan_secmeli','Doğadaki bir portakalın rengi çoğunlukla hangisidir?','["Mor","Turuncu","Siyah","Mavi"]',1,'Olgun portakal çoğunlukla turuncudur.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-hayat' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-dil-1','coktan_secmeli','İnce bir çizgi ile kalın bir çizgi arasında ne fark vardır?','["Koku","Tat","Ses","Kalınlık"]',3,'Çizgiler kalınlık bakımından farklı olabilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-dil' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-dil-2','coktan_secmeli','Bir resimde nesneleri yan yana düzenlemek neyle ilgilidir?','["Koku","Yerleşim","Tat","Ağırlık"]',1,'Görsel yerleşim resimdeki düzenle ilgilidir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-dil' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-dil-3','coktan_secmeli','Yuvarlak biçimli bir nesne hangisi olabilir?','["Kitap","Kapı","Cetvel","Top"]',3,'Top yuvarlak biçimlidir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-dil' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-dil-4','coktan_secmeli','Bir resimde tekrar eden şekiller ne oluşturabilir?','["Koku","Düzen ve ritim","Ses","Ağırlık"]',1,'Tekrar görsel bir ritim oluşturabilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-dil' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-sanatci-1','coktan_secmeli','Resim yapan sanatçıya ne denebilir?','["Şoför","Aşçı","Pilot","Ressam"]',3,'Ressam görsel sanat eserleri üretir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-sanatci' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-sanatci-2','coktan_secmeli','Bir sanat eserini incelerken ne yapabiliriz?','["Eseri yırtabiliriz","Renk ve şekillere bakabiliriz","Üzerine yazabiliriz","Görmeden geçebiliriz"]',1,'Eseri dikkatle incelemek uygundur.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-sanatci' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-sanatci-3','coktan_secmeli','Sanatçı eserinde ne anlatabilir?','["Sadece sayıları","Sadece kuralları","Hiçbir şeyi","Duygu ve düşüncelerini"]',3,'Sanat eserleri duygu ve düşünce ifade edebilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-sanatci' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-sanatci-4','coktan_secmeli','Farklı sanat eserleri neden birbirinden farklı olabilir?','["Hepsi aynı olmak zorundadır","Sanatçıların seçimleri farklı olabilir","Renk kullanılamaz","Şekil kullanılamaz"]',1,'Sanatçılar farklı malzeme ve anlatım yolları seçebilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-sanatci' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-cizim-1','coktan_secmeli','Bir ağacı çizerken önce ne yapabilirsin?','["Gözlerini kapatabilirsin","Kâğıdı yırtabilirsin","Kalemi bırakabilirsin","Ağacı gözlemleyebilirsin"]',3,'Gözlem çizime yardımcı olur.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-cizim-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-cizim-2','coktan_secmeli','Çizimde kalem bastırma gücü değişirse ne değişebilir?','["Kâğıdın kokusu","Çizginin koyuluğu","Masanın boyu","Sınıfın sıcaklığı"]',1,'Kalem basıncı çizgiyi açık veya koyu yapabilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-cizim-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-cizim-3','coktan_secmeli','Bir duyguyu resimle anlatmak mümkün müdür?','["Hayır","Sadece sayılarla olur","Sadece yazıyla olur","Evet"]',3,'Resim duygu ve düşünceleri ifade edebilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-cizim-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-cizim-4','coktan_secmeli','Çizim araçlarını nasıl kullanmalıyız?','["Fırlatarak","Özenli ve güvenli","Kırarak","Arkadaşımıza doğru tutarak"]',1,'Sanat araçları güvenli kullanılmalıdır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-cizim-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-renk-1','coktan_secmeli','Kırmızı, sarı ve mavi hangi gruptadır?','["Sadece koyu renkler","Renksizler","Metaller","Temel renkler"]',3,'Kırmızı, sarı ve mavi temel renklerdir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-renk' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-renk-2','coktan_secmeli','Sarı ile mavi karışınca hangi renk oluşabilir?','["Kırmızı","Yeşil","Siyah","Beyaz"]',1,'Sarı ve mavi karışımı yeşil oluşturabilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-renk' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-renk-3','coktan_secmeli','Kırmızı ile sarı karışınca hangi renk oluşabilir?','["Mavi","Yeşil","Mor","Turuncu"]',3,'Kırmızı ve sarı turuncu oluşturabilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-renk' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-renk-4','coktan_secmeli','Renkleri seçerken hangisi yapılabilir?','["Sadece tek renk zorunludur","Çalışmanın duygusuna uygun renkler seçilebilir","Renk kullanmak yasaktır","Kâğıt yırtılmalıdır"]',1,'Renk seçimi anlatımı destekleyebilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-renk' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-milli-1','coktan_secmeli','Türk bayrağını konu alan bir resimde hangi renkler öne çıkar?','["Mavi ve yeşil","Mor ve turuncu","Siyah ve pembe","Kırmızı ve beyaz"]',3,'Türk bayrağında kırmızı ve beyaz bulunur.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-milli' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-milli-2','coktan_secmeli','Millî bayram için hazırlanan afiş neye örnektir?','["Trafik işaretine","Sanatsal görsel çalışmaya","Matematik işlemine","Yemek tarifine"]',1,'Afiş görsel sanat çalışmasıdır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-milli' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-milli-3','coktan_secmeli','Millî değerleri anlatan bir sanat çalışmasına nasıl davranmalıyız?','["Dikkatsiz","Yırtarak","Üzerine basarak","Saygılı"]',3,'Millî değerlere saygı gösteririz.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-milli' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-milli-4','coktan_secmeli','Bir bayram resmi yaparken neyi gözlemleyebilirsin?','["Sadece boş duvarı","Bayraklar ve kutlama görüntülerini","Hiçbir şeyi","Sadece sayıları"]',1,'Kutlamadaki görsel ögeler çalışmaya kaynak olabilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-milli' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-muze-1','coktan_secmeli','Müzede eserlere nasıl yaklaşmalıyız?','["Dokunarak","Koşarak","Bağırarak","Kurallara uygun ve dikkatli"]',3,'Müze eserleri korunmalıdır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-muze' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-muze-2','coktan_secmeli','Müzede neden yüksek sesle bağırmamalıyız?','["Daha hızlı gezmek için","Diğer ziyaretçilere saygı için","Eserleri değiştirmek için","Işıkları kapatmak için"]',1,'Sessiz ve saygılı davranmak gerekir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-muze' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-muze-3','coktan_secmeli','Müze bize neyi tanımada yardımcı olabilir?','["Sadece spor kurallarını","Sadece yemekleri","Sadece trafik ışıklarını","Sanat ve kültür eserlerini"]',3,'Müzeler kültür ve sanat eserlerini tanıtır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-muze' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs-muze-4','coktan_secmeli','Bir eserin fotoğrafını çekmeden önce ne yapmalıyız?','["Her zaman flaş kullanmalıyız","Müze kuralını kontrol etmeliyiz","Eseri yerinden almalıyız","Görevliyi görmezden gelmeliyiz"]',1,'Fotoğraf kuralları müzeye göre değişebilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='gs-muze' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz-dil-1','coktan_secmeli','Hangisi doğadan gelen bir sestir?','["Telefon zili","Araba kornası","Kapı zili","Kuş sesi"]',3,'Kuş sesi doğada duyulabilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='muz-dil' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz-dil-2','coktan_secmeli','Hangisi bir nesnenin çıkardığı sestir?','["Rüzgâr","Zil sesi","Kuş ötüşü","Yağmur"]',1,'Zil bir nesnedir ve ses çıkarır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='muz-dil' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz-dil-3','coktan_secmeli','Müzik dinlerken ne yapmalıyız?','["Sürekli bağırmalıyız","Ses kaynağını kırmalıyız","Kulaklarımızı gereksiz zorlamalıyız","Dikkatle dinlemeliyiz"]',3,'Dikkatli dinleme müziksel dinleme becerisidir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='muz-dil' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz-dil-4','coktan_secmeli','Bir şarkıyı söylerken neye dikkat edebiliriz?','["Herkesten farklı anda bağırmaya","Birlikte başlayıp bitirmeye","Sözleri değiştirmeye","Arkadaşımızı susturmaya"]',1,'Birlikte söylemek uyumu destekler.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='muz-dil' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz-dil-5','coktan_secmeli','Müziğe bedenimizle nasıl eşlik edebiliriz?','["Rastgele eşyaları fırlatarak","Kulaklarımızı kapatarak","Sınıftan çıkarak","Ritme uygun hareket ederek"]',3,'Ritme uygun hareket müziğe eşlik etmenin yoludur.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='muz-dil' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz-dil-6','coktan_secmeli','İstiklâl Marşı söylenirken nasıl davranmalıyız?','["Gülerek konuşarak","Saygılı ve uygun biçimde","Koşarak","Oyun oynayarak"]',1,'İstiklâl Marşı''na saygı gösterilir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='muz-dil' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz-dil-7','coktan_secmeli','Yağmur sesi ile davul sesi aynı mıdır?','["Evet, tamamen aynıdır","İkisi de sessizdir","Davul ses çıkarmaz","Hayır, ses kaynakları farklıdır"]',3,'Yağmur ve davul farklı ses kaynaklarıdır.',2,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='muz-dil' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz-dil-8','coktan_secmeli','Hızlı ritimli bir müziğe eşlik ederken hareketler nasıl olabilir?','["Her zaman hareketsiz","Ritme uygun daha hızlı","Ritimden bağımsız","Gözler kapalı koşarak"]',1,'Hareketler müziğin ritmine uygun olabilir.',2,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='muz-dil' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz-kultur-1','coktan_secmeli','Müzik dinlenen bir ortamda başkalarına nasıl davranmalıyız?','["Gürültülü","İtici","Dikkatsiz","Saygılı"]',3,'Dinleme ortamında saygı önemlidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='muz-kultur' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz-kultur-2','coktan_secmeli','Hangisi ritim vermek için kullanılabilir?','["Yastık kılıfı","Tef","Silgi kutusu kapağı her durumda","Kitap sayfasını yırtmak"]',1,'Tef bir ritim çalgısıdır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='muz-kultur' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz-kultur-3','coktan_secmeli','Şarkı söylerken grup arkadaşlarımızı neden dinlemeliyiz?','["Daha yüksek bağırmak için","Şarkıyı durdurmak için","Kimseyi duymamak için","Birlikte uyumlu söylemek için"]',3,'Birbirini dinlemek uyumu artırır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='muz-kultur' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz-kultur-4','coktan_secmeli','Belirli gün ve haftalarda uygun şarkılar söylemek neyi destekler?','["Çevreyi kirletmeyi","Ortak kültürü ve etkinliğe katılımı","Kuralları bozmayı","Sessizliği yasaklamayı"]',1,'Ortak eserler kültürel paylaşımı destekler.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='muz-kultur' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz-kultur-5','coktan_secmeli','Bir ritmi tekrar etmek için önce ne yapmalıyız?','["Tahmin etmeden vurmalıyız","Bağırmalıyız","Çalgıyı bırakmalıyız","Dikkatle dinlemeliyiz"]',3,'Ritmi doğru tekrar etmek için önce dinlemek gerekir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='muz-kultur' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz-kultur-6','coktan_secmeli','Müzik bittikten sonra alkışlamak hangi davranışa örnek olabilir?','["Eseri bozmayı","Beğeni ve saygı göstermeye","Çalgıyı kırmayı","Konuşmayı yasaklamaya"]',1,'Alkış uygun ortamda beğeni göstergesidir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='muz-kultur' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz-kultur-7','coktan_secmeli','Bir müzik eserinin hızlı veya yavaş olması neyle ilgilidir?','["Rengiyle","Kokusuyla","Ağırlığıyla","Hızıyla"]',3,'Müziğin hızlı-yavaş oluşu temposuyla ilgilidir.',2,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='muz-kultur' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz-kultur-8','coktan_secmeli','Çalgıları kullanırken nasıl davranmalıyız?','["Fırlatarak","Özenli ve kurallara uygun","Kırarak","İzinsiz saklayarak"]',1,'Çalgılar özenle kullanılmalıdır.',2,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='muz-kultur' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-hareket-1','coktan_secmeli','Hangisi yer değiştirme hareketidir?','["Yerinde göz kırpmak","Kitap okumak","Oturmak","Koşmak"]',3,'Koşmak bir yerden başka yere hareket etmektir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-hareket-2','coktan_secmeli','Tek ayak üzerinde kısa süre durmak hangi beceriye örnektir?','["Okuma","Denge","Yazma","Dinleme"]',1,'Tek ayak üzerinde durmak denge gerektirir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-hareket-3','coktan_secmeli','Topu yakalamak hangi beceriyle ilgilidir?','["Sadece uyku","Resim çizme","Okuma","Nesne kontrolü"]',3,'Top yakalamak nesne kontrolü becerisidir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-hareket-4','coktan_secmeli','Oyun alanında başka çocuklar varsa ne yapmalıyız?','["Gözümüzü kapatıp koşmalıyız","Çevremize dikkat etmeliyiz","Birbirimizi itmeliyiz","Kuralları unutmalıyız"]',1,'Alan farkındalığı güvenli hareketi destekler.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-hareket-5','coktan_secmeli','Yukarı uzanmak hangi yön kavramını kullanır?','["Aşağı","Geri","Sol","Yukarı"]',3,'Uzanılan yön yukarıdır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-hareket-6','coktan_secmeli','Yavaş yürüyüş ile hızlı koşu arasındaki fark hangisidir?','["Saç rengi","Hareket hızı","Ayakkabı adı","Sınıf numarası"]',1,'İki hareketin hızları farklıdır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-hareket-7','coktan_secmeli','Topu arkadaşına kontrollü yuvarlamak ne gerektirir?','["Bağırmak","Gözleri kapatmak","Kuralsızlık","Nesne kontrolü"]',3,'Topu yönlendirmek nesne kontrolü gerektirir.',2,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-hareket-8','coktan_secmeli','Kaygan zeminde ne yapmalıyız?','["Hızla koşmalıyız","Dikkatli hareket etmeliyiz","İtmeliyiz","Zıplamalıyız"]',1,'Kaygan zemin risk oluşturabilir.',2,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-kural-1','coktan_secmeli','Oyunda sıran gelmeden başlamak doğru mudur?','["Evet her zaman","Sadece kazanacaksan","Kurallar önemli değil","Hayır"]',3,'Sırayı beklemek oyun kuralına uymaktır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-kural-2','coktan_secmeli','Oyunda kaybedince ne yapmalıyız?','["Oyunu bozmalıyız","Sonuca saygı göstermeliyiz","Arkadaşımızı suçlamalıyız","Eşyaları fırlatmalıyız"]',1,'Adil oyun anlayışı sonuca saygıyı içerir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-kural-3','coktan_secmeli','Takım arkadaşın hata yaptığında ne yapabilirsin?','["Alay edebilirsin","İtebilirsin","Oyundan kovabilirsin","Destek olabilirsin"]',3,'Destek olmak iş birliğini güçlendirir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-kural-4','coktan_secmeli','Oyun kuralını anlamadıysan ne yapmalısın?','["Rastgele oynamalısın","Sormalısın","Kuralları değiştirmelisin","Oyunu bozmalısın"]',1,'Kuralı sormak doğru uygulamaya yardım eder.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-kural-5','coktan_secmeli','Adil oyun davranışı hangisidir?','["Hile yapmak","Sırayı bozmak","Rakibi itmek","Kurala uymak"]',3,'Kurala uymak adil oyundur.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-kural-6','coktan_secmeli','Grup oyununda iletişim neden önemlidir?','["Daha çok bağırmak için","Birlikte hareket etmek için","Kuralları unutmak için","Oyunu bırakmak için"]',1,'İletişim iş birliğini kolaylaştırır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-kural-7','coktan_secmeli','Kazanan arkadaşını tebrik etmek neye örnektir?','["Hileye","Kuralsızlığa","Dikkatsizliğe","Sportmenliğe"]',3,'Tebrik etmek adil oyun davranışıdır.',2,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-kural-8','coktan_secmeli','Hakem veya öğretmen oyunu durdurduğunda ne yapmalısın?','["Oynamaya devam etmelisin","Durup yönergeyi dinlemelisin","Koşarak uzaklaşmalısın","Topu fırlatmalısın"]',1,'Yönergeleri izlemek güvenli ve kurallı oyundur.',2,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-ritim-1','coktan_secmeli','Ritim hızlanırsa hareketin nasıl değişebilir?','["Her zaman durur","Ritimle ilgisi yoktur","Geriye döner","Ritme uygun hızlanabilir"]',3,'Hareket ritme uygun değişebilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-ritim-2','coktan_secmeli','Grupla ritmik hareket yaparken ne önemlidir?','["Herkesin farklı anda başlaması","Uyum","Birbirini itmek","Müziği dinlememek"]',1,'Grup hareketinde uyum önemlidir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-ritim-3','coktan_secmeli','Alkışlarla verilen ritmi tekrar etmek için önce ne yaparsın?','["Koşarsın","Gözlerini kapatırsın","Oyunu bırakırsın","Dinlersin"]',3,'Ritmi algılamak için önce dinlemek gerekir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-ritim-4','coktan_secmeli','Müzik yavaşladığında hangi hareket uygun olabilir?','["Her zaman daha hızlı koşmak","Daha yavaş hareket","Ritmi önemsememek","Bağırmak"]',1,'Hareket müziğin hızına uyarlanabilir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-ritim-5','coktan_secmeli','Eşinle birlikte hareket ederken ne yapmalısın?','["Onu itmelisin","Sırtını dönmelisin","Kuralları yok saymalısın","Onunla uyum sağlamalısın"]',3,'Eşle hareket uyum ve iş birliği gerektirir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-ritim-6','coktan_secmeli','Ritimle yürümek ne demektir?','["Rastgele koşmak","Adımları ritme uygun atmak","Durmadan bağırmak","Gözleri kapatmak"]',1,'Ritmik yürüyüşte adımlar ritme uyar.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-ritim-7','coktan_secmeli','Grup lideri ne yapmalıdır?','["Arkadaşlarını dışlamalıdır","Kuralları bozmalıdır","Tek başına uzaklaşmalıdır","Gruba uygun ve güvenli yönerge vermelidir"]',3,'Liderlik sorumluluk ve iletişim gerektirir.',2,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-ritim-8','coktan_secmeli','Ritmik harekette yaratıcılık ne olabilir?','["Kuralları tehlikeli biçimde bozmak","Ritme uygun yeni hareket önermek","Müziği kapatmak","Arkadaşı itmek"]',1,'Ritme uygun yeni hareketler üretmek yaratıcılıktır.',2,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-saglik-1','coktan_secmeli','Etkinlikten önce ısınmak neden yararlıdır?','["Daha çok yorulmak için","Su içmemek için","Uyumak için","Bedeni harekete hazırlar"]',3,'Isınma bedeni etkinliğe hazırlar.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-saglik-2','coktan_secmeli','Etkinlikten sonra soğuma hareketleri neye yardımcı olur?','["Daha hızlı koşmaya devam etmeye","Bedenin sakinleşmesine","Hiç durmamaya","Susuz kalmaya"]',1,'Soğuma etkinlik sonrası geçişi destekler.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-saglik-3','coktan_secmeli','Spor yaparken neden su içmeliyiz?','["Daha ağır olmak için","Ayakkabıyı temizlemek için","Oyunu uzatmak için","Sıvı ihtiyacımızı karşılamak için"]',3,'Fiziksel etkinlikte su ihtiyacı artabilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-saglik-4','coktan_secmeli','Hareket için uygun kıyafet hangisidir?','["Çok uzun takılan aksesuarlar","Rahat ve güvenli kıyafet","Kaygan terlik","Hareketi engelleyen kıyafet"]',1,'Rahat ve güvenli kıyafet hareketi kolaylaştırır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-saglik-5','coktan_secmeli','Dengeli beslenmek neyi destekler?','["Sadece oyun kazanmayı","Daha az uyumayı","Temizliği bırakmayı","Sağlıklı büyümeyi"]',3,'Dengeli beslenme sağlıklı büyümeyi destekler.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-saglik-6','coktan_secmeli','Fiziksel aktiviteden sonra terlediysen ne yapmalısın?','["Islak kıyafetle uzun süre kalmalısın","Temizliğine dikkat etmelisin","Ellerini hiç yıkamamalısın","Su içmemelisin"]',1,'Etkinlik sonrası temizlik sağlıklıdır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-saglik-7','coktan_secmeli','Yeterli uyku ile hareket arasında nasıl bir ilişki vardır?','["Uyku gereksizdir","Uyku hareketi tamamen engeller","Sadece yetişkinler uyur","Dinlenmiş beden etkinliğe daha hazır olabilir"]',3,'Yeterli uyku dinlenmeye yardımcı olur.',2,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be-saglik-8','coktan_secmeli','Her gün yaşına uygun hareket etmek neyi destekleyebilir?','["Düzensizliği","Sağlığı","Susuzluğu","Kuralsızlığı"]',1,'Düzenli fiziksel aktivite sağlıklı yaşamın parçasıdır.',2,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='be-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;
