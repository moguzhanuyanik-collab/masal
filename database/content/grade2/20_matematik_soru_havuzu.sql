SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-100','100''e Kadar Sayılar','100''e Kadar Sayılar','100''e kadar doğal sayıları okur, yazar, sayar ve sayı doğrusunda gösterir.','47 sayısını kırk yedi diye okuruz.',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-sayilar-1'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-basamak','Onluk ve Birlik','Onluk ve Birlik','İki basamaklı sayıları onluk ve birliklerine ayırır, basamak değerini fark eder.','36 = 3 onluk + 6 birlik.',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-sayilar-1'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-karsilastirma','Sayıları Karşılaştırma ve Sıralama','Sayıları Karşılaştırma ve Sıralama','100''e kadar sayıları büyüklüklerine göre karşılaştırır ve sıralar.','42 < 58.',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-sayilar-1'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-yuvarlama','En Yakın Onluğu Fark Ediyorum','En Yakın Onluğu Fark Ediyorum','Sayıların onluklara yakınlığını sayı doğrusu üzerinden yorumlar.','28, 30''a 20''den daha yakındır.',130,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-sayilar-1'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-ritmik','Ritmik Sayma','Ritmik Sayma','2''şer, 3''er, 4''er, 5''er ve 10''ar ritmik sayma örüntülerini sürdürür.','3, 6, 9, 12...',140,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-sayilar-1'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-oruntu','Sayı Örüntüleri','Sayı Örüntüleri','Artan, azalan ve tekrar eden sayı örüntülerinin kuralını bulur.','12, 16, 20, 24...',150,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-sayilar-1'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-tahmin','Nesne Sayısını Tahmin','Nesne Sayısını Tahmin','50''ye kadar nesne sayısını tahmin eder ve sayarak kontrol eder.','Önce tahmin et, sonra sayarak kontrol et.',160,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-sayilar-1'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-kesir','Bütün, Yarım ve Çeyrek','Bütün, Yarım ve Çeyrek','Bir bütünü eş parçalara ayırarak yarım ve çeyrek kavramlarını fark eder.','Bir bütün iki eş parçaya ayrılırsa her parça yarımdır.',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-sayilar-2'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-para','Paralarımız','Paralarımız','TL ve kuruşu tanır, paraları karşılaştırır ve basit alışveriş durumlarını çözer.','20 TL + 10 TL = 30 TL.',210,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-sayilar-2'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-zaman','Zamanı Okuyorum','Zamanı Okuyorum','Tam ve yarım saatleri, günleri ve basit zaman ilişkilerini yorumlar.','Saat 08.30: sekiz buçuk.',220,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-sayilar-2'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-uzunluk','Standart Uzunluk Ölçme','Standart Uzunluk Ölçme','Metre ve santimetreyi, uygun ölçme aracını ve basit karşılaştırmaları kullanır.','Kalem santimetre, sınıf metre ile ölçülebilir.',230,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-sayilar-2'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-kutle','Kütle Ölçme','Kütle Ölçme','Kilogram ve gramı günlük yaşam örneklerinde ayırt eder ve karşılaştırır.','Karpuz kilogramla ölçülebilir.',240,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-sayilar-2'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-toplama','100''e Kadar Toplama','100''e Kadar Toplama','100''ü geçmeyen toplama işlemlerini zihinden, modelle veya işlem stratejileriyle yapar.','34 + 25 = 59.',300,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-islemler'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-cikarma','100''e Kadar Çıkarma','100''e Kadar Çıkarma','100''e kadar sayılarla çıkarma yapar ve toplama-çıkarma ilişkisini kullanır.','63 - 21 = 42.',310,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-islemler'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-esitlik','Eşitlik ve Eksik Sayı','Eşitlik ve Eksik Sayı','Eşitlikte eksik olan sayıyı ve iki tarafın aynı değerde olması gerektiğini bulur.','25 + __ = 40.',320,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-islemler'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-carpma','Çarpmanın Anlamı','Çarpmanın Anlamı','Eşit grupları tekrarlı toplama ile ilişkilendirir.','3 grup 4 = 4 + 4 + 4.',330,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-islemler'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-bolme','Bölmenin Anlamı','Bölmenin Anlamı','Nesneleri eşit paylaşma ve eşit gruplama durumlarını yorumlar.','12 nesneyi 3 eş gruba ayırınca her grupta 4 olur.',340,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-islemler'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-problem','İşlem Problemleri','İşlem Problemleri','Günlük yaşamda toplama, çıkarma, eş gruplama ve paylaşma problemlerini çözer.','Problemi okuyup uygun işlemi seç.',350,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-islemler'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-cisimler','Geometrik Cisimler','Geometrik Cisimler','Küp, dikdörtgenler prizması, kare prizma, üçgen prizma, küre ve silindiri günlük nesnelerle ilişkilendirir.','Futbol topu küreye benzer.',400,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-geometri-1'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-sekiller','Geometrik Şekiller ve Modeller','Geometrik Şekiller ve Modeller','Üçgen, kare, dikdörtgen ve çemberleri tanır; şekillerden modeller oluşturur.','İki üçgen bir araya gelerek farklı bir model oluşturabilir.',410,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-geometri-1'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-sivi','Sıvı Miktarını Karşılaştırma','Sıvı Miktarını Karşılaştırma','Standart olmayan kaplarla sıvı miktarını karşılaştırır ve tahmin eder.','Aynı bardakla 5 bardak su alan kap, 3 bardak alandan daha çok sıvı alır.',420,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-geometri-1'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-yon','Yer ve Yön Bulma','Yer ve Yön Bulma','Basit krokolarda sağ-sol, ileri-geri ve başlangıç-hedef ilişkilerini kullanır.','Başlangıçtan iki adım ileri, bir adım sağa.',500,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-geometri-2'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-simetri','Simetri','Simetri','Basit şekillerde simetriyi ve iki tarafın aynalanma ilişkisini fark eder.','Kelebeğin iki kanadı simetriyi çağrıştırabilir.',510,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-geometri-2'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'mat2-veri','Veri Toplama ve Grafik','Veri Toplama ve Grafik','İki veri grubunu çetele, sıklık ve şekil grafiğiyle düzenler ve yorumlar.','Kırmızı 6, mavi 4 ise kırmızı daha fazladır.',600,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='mat2-veri'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-10','coktan_secmeli','10 sayısını gösteren seçenek hangisidir?','["11","9","10","20"]',2,'Doğru sayı 10''dir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-13','coktan_secmeli','13 sayısını gösteren seçenek hangisidir?','["14","12","13","23"]',2,'Doğru sayı 13''dir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-16','coktan_secmeli','16 sayısını gösteren seçenek hangisidir?','["17","15","16","26"]',2,'Doğru sayı 16''dir.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-19','coktan_secmeli','19 sayısını gösteren seçenek hangisidir?','["20","18","19","29"]',2,'Doğru sayı 19''dir.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-22','coktan_secmeli','22 sayısını gösteren seçenek hangisidir?','["23","21","22","32"]',2,'Doğru sayı 22''dir.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-25','coktan_secmeli','25 sayısını gösteren seçenek hangisidir?','["26","24","25","35"]',2,'Doğru sayı 25''dir.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-28','coktan_secmeli','28 sayısını gösteren seçenek hangisidir?','["29","27","28","38"]',2,'Doğru sayı 28''dir.',1,28,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-31','coktan_secmeli','31 sayısını gösteren seçenek hangisidir?','["32","30","31","41"]',2,'Doğru sayı 31''dir.',1,31,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-34','coktan_secmeli','34 sayısını gösteren seçenek hangisidir?','["35","33","34","44"]',2,'Doğru sayı 34''dir.',1,34,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-37','coktan_secmeli','37 sayısını gösteren seçenek hangisidir?','["38","36","37","47"]',2,'Doğru sayı 37''dir.',1,37,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-40','coktan_secmeli','40 sayısını gösteren seçenek hangisidir?','["41","39","40","50"]',2,'Doğru sayı 40''dir.',1,40,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-43','coktan_secmeli','43 sayısını gösteren seçenek hangisidir?','["44","42","43","53"]',2,'Doğru sayı 43''dir.',1,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-46','coktan_secmeli','46 sayısını gösteren seçenek hangisidir?','["47","45","46","56"]',2,'Doğru sayı 46''dir.',1,46,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-49','coktan_secmeli','49 sayısını gösteren seçenek hangisidir?','["50","48","49","59"]',2,'Doğru sayı 49''dir.',1,49,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-52','coktan_secmeli','52 sayısını gösteren seçenek hangisidir?','["53","51","52","62"]',2,'Doğru sayı 52''dir.',1,52,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-55','coktan_secmeli','55 sayısını gösteren seçenek hangisidir?','["56","54","55","65"]',2,'Doğru sayı 55''dir.',1,55,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-58','coktan_secmeli','58 sayısını gösteren seçenek hangisidir?','["59","57","58","68"]',2,'Doğru sayı 58''dir.',1,58,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-61','coktan_secmeli','61 sayısını gösteren seçenek hangisidir?','["62","60","61","71"]',2,'Doğru sayı 61''dir.',1,61,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-64','coktan_secmeli','64 sayısını gösteren seçenek hangisidir?','["65","63","64","74"]',2,'Doğru sayı 64''dir.',1,64,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-67','coktan_secmeli','67 sayısını gösteren seçenek hangisidir?','["68","66","67","77"]',2,'Doğru sayı 67''dir.',1,67,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-70','coktan_secmeli','70 sayısını gösteren seçenek hangisidir?','["71","69","70","80"]',2,'Doğru sayı 70''dir.',1,70,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-73','coktan_secmeli','73 sayısını gösteren seçenek hangisidir?','["74","72","73","83"]',2,'Doğru sayı 73''dir.',1,73,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-76','coktan_secmeli','76 sayısını gösteren seçenek hangisidir?','["77","75","76","86"]',2,'Doğru sayı 76''dir.',1,76,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-79','coktan_secmeli','79 sayısını gösteren seçenek hangisidir?','["80","78","79","89"]',2,'Doğru sayı 79''dir.',1,79,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-82','coktan_secmeli','82 sayısını gösteren seçenek hangisidir?','["83","81","82","92"]',2,'Doğru sayı 82''dir.',1,82,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-85','coktan_secmeli','85 sayısını gösteren seçenek hangisidir?','["86","84","85","95"]',2,'Doğru sayı 85''dir.',1,85,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-88','coktan_secmeli','88 sayısını gösteren seçenek hangisidir?','["89","87","88","98"]',2,'Doğru sayı 88''dir.',1,88,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-91','coktan_secmeli','91 sayısını gösteren seçenek hangisidir?','["92","90","91","100"]',2,'Doğru sayı 91''dir.',1,91,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-94','coktan_secmeli','94 sayısını gösteren seçenek hangisidir?','["95","93","94","100"]',2,'Doğru sayı 94''dir.',1,94,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-97','coktan_secmeli','97 sayısını gösteren seçenek hangisidir?','["98","96","97","100"]',2,'Doğru sayı 97''dir.',1,97,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sayi-100','coktan_secmeli','100 sayısını gösteren seçenek hangisidir?','["99","90","100","98"]',2,'Doğru sayı 100''dir.',1,100,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-11','coktan_secmeli','11 sayısından hemen sonra hangi sayı gelir?','["10","13","12","21"]',2,'11''den bir ileri sayınca 12 gelir.',1,131,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-11','coktan_secmeli','11 sayısından hemen önce hangi sayı gelir?','["12","9","21","10"]',3,'11''den bir geri sayınca 10 gelir.',1,231,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-15','coktan_secmeli','15 sayısından hemen sonra hangi sayı gelir?','["16","14","17","25"]',0,'15''den bir ileri sayınca 16 gelir.',1,135,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-15','coktan_secmeli','15 sayısından hemen önce hangi sayı gelir?','["16","14","13","25"]',1,'15''den bir geri sayınca 14 gelir.',1,235,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-19','coktan_secmeli','19 sayısından hemen sonra hangi sayı gelir?','["18","21","20","29"]',2,'19''den bir ileri sayınca 20 gelir.',1,139,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-19','coktan_secmeli','19 sayısından hemen önce hangi sayı gelir?','["20","17","29","18"]',3,'19''den bir geri sayınca 18 gelir.',1,239,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-23','coktan_secmeli','23 sayısından hemen sonra hangi sayı gelir?','["24","22","25","33"]',0,'23''den bir ileri sayınca 24 gelir.',1,143,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-23','coktan_secmeli','23 sayısından hemen önce hangi sayı gelir?','["24","22","21","33"]',1,'23''den bir geri sayınca 22 gelir.',1,243,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-27','coktan_secmeli','27 sayısından hemen sonra hangi sayı gelir?','["26","29","28","37"]',2,'27''den bir ileri sayınca 28 gelir.',1,147,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-27','coktan_secmeli','27 sayısından hemen önce hangi sayı gelir?','["28","25","37","26"]',3,'27''den bir geri sayınca 26 gelir.',1,247,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-31','coktan_secmeli','31 sayısından hemen sonra hangi sayı gelir?','["32","30","33","41"]',0,'31''den bir ileri sayınca 32 gelir.',1,151,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-31','coktan_secmeli','31 sayısından hemen önce hangi sayı gelir?','["32","30","29","41"]',1,'31''den bir geri sayınca 30 gelir.',1,251,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-35','coktan_secmeli','35 sayısından hemen sonra hangi sayı gelir?','["34","37","36","45"]',2,'35''den bir ileri sayınca 36 gelir.',1,155,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-35','coktan_secmeli','35 sayısından hemen önce hangi sayı gelir?','["36","33","45","34"]',3,'35''den bir geri sayınca 34 gelir.',1,255,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-39','coktan_secmeli','39 sayısından hemen sonra hangi sayı gelir?','["40","38","41","49"]',0,'39''den bir ileri sayınca 40 gelir.',1,159,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-39','coktan_secmeli','39 sayısından hemen önce hangi sayı gelir?','["40","38","37","49"]',1,'39''den bir geri sayınca 38 gelir.',1,259,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-43','coktan_secmeli','43 sayısından hemen sonra hangi sayı gelir?','["42","45","44","53"]',2,'43''den bir ileri sayınca 44 gelir.',1,163,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-43','coktan_secmeli','43 sayısından hemen önce hangi sayı gelir?','["44","41","53","42"]',3,'43''den bir geri sayınca 42 gelir.',1,263,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-47','coktan_secmeli','47 sayısından hemen sonra hangi sayı gelir?','["48","46","49","57"]',0,'47''den bir ileri sayınca 48 gelir.',1,167,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-47','coktan_secmeli','47 sayısından hemen önce hangi sayı gelir?','["48","46","45","57"]',1,'47''den bir geri sayınca 46 gelir.',1,267,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-51','coktan_secmeli','51 sayısından hemen sonra hangi sayı gelir?','["50","53","52","61"]',2,'51''den bir ileri sayınca 52 gelir.',1,171,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-51','coktan_secmeli','51 sayısından hemen önce hangi sayı gelir?','["52","49","61","50"]',3,'51''den bir geri sayınca 50 gelir.',1,271,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-55','coktan_secmeli','55 sayısından hemen sonra hangi sayı gelir?','["56","54","57","65"]',0,'55''den bir ileri sayınca 56 gelir.',1,175,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-55','coktan_secmeli','55 sayısından hemen önce hangi sayı gelir?','["56","54","53","65"]',1,'55''den bir geri sayınca 54 gelir.',1,275,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-59','coktan_secmeli','59 sayısından hemen sonra hangi sayı gelir?','["58","61","60","69"]',2,'59''den bir ileri sayınca 60 gelir.',1,179,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-59','coktan_secmeli','59 sayısından hemen önce hangi sayı gelir?','["60","57","69","58"]',3,'59''den bir geri sayınca 58 gelir.',1,279,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-63','coktan_secmeli','63 sayısından hemen sonra hangi sayı gelir?','["64","62","65","73"]',0,'63''den bir ileri sayınca 64 gelir.',1,183,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-63','coktan_secmeli','63 sayısından hemen önce hangi sayı gelir?','["64","62","61","73"]',1,'63''den bir geri sayınca 62 gelir.',1,283,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-67','coktan_secmeli','67 sayısından hemen sonra hangi sayı gelir?','["66","69","68","77"]',2,'67''den bir ileri sayınca 68 gelir.',1,187,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-67','coktan_secmeli','67 sayısından hemen önce hangi sayı gelir?','["68","65","77","66"]',3,'67''den bir geri sayınca 66 gelir.',1,287,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-71','coktan_secmeli','71 sayısından hemen sonra hangi sayı gelir?','["72","70","73","81"]',0,'71''den bir ileri sayınca 72 gelir.',1,191,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-71','coktan_secmeli','71 sayısından hemen önce hangi sayı gelir?','["72","70","69","81"]',1,'71''den bir geri sayınca 70 gelir.',1,291,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-75','coktan_secmeli','75 sayısından hemen sonra hangi sayı gelir?','["74","77","76","85"]',2,'75''den bir ileri sayınca 76 gelir.',1,195,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-75','coktan_secmeli','75 sayısından hemen önce hangi sayı gelir?','["76","73","85","74"]',3,'75''den bir geri sayınca 74 gelir.',1,295,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-79','coktan_secmeli','79 sayısından hemen sonra hangi sayı gelir?','["80","78","81","89"]',0,'79''den bir ileri sayınca 80 gelir.',1,199,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-79','coktan_secmeli','79 sayısından hemen önce hangi sayı gelir?','["80","78","77","89"]',1,'79''den bir geri sayınca 78 gelir.',1,299,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-83','coktan_secmeli','83 sayısından hemen sonra hangi sayı gelir?','["82","85","84","93"]',2,'83''den bir ileri sayınca 84 gelir.',1,203,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-83','coktan_secmeli','83 sayısından hemen önce hangi sayı gelir?','["84","81","93","82"]',3,'83''den bir geri sayınca 82 gelir.',1,303,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sonra-87','coktan_secmeli','87 sayısından hemen sonra hangi sayı gelir?','["88","86","89","97"]',0,'87''den bir ileri sayınca 88 gelir.',1,207,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-once-87','coktan_secmeli','87 sayısından hemen önce hangi sayı gelir?','["88","86","85","97"]',1,'87''den bir geri sayınca 86 gelir.',1,307,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-1','coktan_secmeli','31, 32, __, 34 dizisinde eksik sayı hangisidir?','["32","34","43","33"]',3,'Sayılar birer artar; eksik sayı 33''dir.',1,400,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-2','coktan_secmeli','47, 48, __, 50 dizisinde eksik sayı hangisidir?','["48","49","50","59"]',1,'Sayılar birer artar; eksik sayı 49''dir.',1,401,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-3','coktan_secmeli','65, 67, __, 68 dizisinde eksik sayı hangisidir?','["65","67","76","66"]',3,'Sayılar birer artar; eksik sayı 66''dir.',1,402,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-4','coktan_secmeli','72, 73, __, 75 dizisinde eksik sayı hangisidir?','["73","74","75","84"]',1,'Sayılar birer artar; eksik sayı 74''dir.',1,403,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-5','coktan_secmeli','88, 90, __, 91 dizisinde eksik sayı hangisidir?','["88","90","99","89"]',3,'Sayılar birer artar; eksik sayı 89''dir.',1,404,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-6','coktan_secmeli','96, 97, __, 99 dizisinde eksik sayı hangisidir?','["97","98","99","100"]',1,'Sayılar birer artar; eksik sayı 98''dir.',1,405,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-100' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-12','coktan_secmeli','12 sayısı kaç onluk ve kaç birlikten oluşur?','["2 onluk 1 birlik","1 onluk 2 birlik","2 onluk 2 birlik","1 onluk 3 birlik"]',1,'12 = 1 onluk + 2 birliktir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-12','coktan_secmeli','12 sayısında onluk basamağının değeri kaçtır?','["10","1","2","12"]',0,'Onluk basamağındaki 1, 10 değerindedir.',2,162,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-16','coktan_secmeli','16 sayısı kaç onluk ve kaç birlikten oluşur?','["6 onluk 1 birlik","2 onluk 6 birlik","1 onluk 7 birlik","1 onluk 6 birlik"]',3,'16 = 1 onluk + 6 birliktir.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-16','coktan_secmeli','16 sayısında onluk basamağının değeri kaçtır?','["1","6","10","16"]',2,'Onluk basamağındaki 1, 10 değerindedir.',2,166,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-20','coktan_secmeli','20 sayısı kaç onluk ve kaç birlikten oluşur?','["0 onluk 2 birlik","2 onluk 0 birlik","3 onluk 0 birlik","2 onluk 1 birlik"]',1,'20 = 2 onluk + 0 birliktir.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-20','coktan_secmeli','20 sayısında onluk basamağının değeri kaçtır?','["20","2","0","21"]',0,'Onluk basamağındaki 2, 20 değerindedir.',2,170,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-24','coktan_secmeli','24 sayısı kaç onluk ve kaç birlikten oluşur?','["4 onluk 2 birlik","3 onluk 4 birlik","2 onluk 5 birlik","2 onluk 4 birlik"]',3,'24 = 2 onluk + 4 birliktir.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-24','coktan_secmeli','24 sayısında onluk basamağının değeri kaçtır?','["2","4","20","24"]',2,'Onluk basamağındaki 2, 20 değerindedir.',2,174,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-28','coktan_secmeli','28 sayısı kaç onluk ve kaç birlikten oluşur?','["8 onluk 2 birlik","2 onluk 8 birlik","3 onluk 8 birlik","2 onluk 9 birlik"]',1,'28 = 2 onluk + 8 birliktir.',1,28,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-28','coktan_secmeli','28 sayısında onluk basamağının değeri kaçtır?','["20","2","8","28"]',0,'Onluk basamağındaki 2, 20 değerindedir.',2,178,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-32','coktan_secmeli','32 sayısı kaç onluk ve kaç birlikten oluşur?','["2 onluk 3 birlik","4 onluk 2 birlik","3 onluk 3 birlik","3 onluk 2 birlik"]',3,'32 = 3 onluk + 2 birliktir.',1,32,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-32','coktan_secmeli','32 sayısında onluk basamağının değeri kaçtır?','["3","2","30","32"]',2,'Onluk basamağındaki 3, 30 değerindedir.',2,182,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-36','coktan_secmeli','36 sayısı kaç onluk ve kaç birlikten oluşur?','["6 onluk 3 birlik","3 onluk 6 birlik","4 onluk 6 birlik","3 onluk 7 birlik"]',1,'36 = 3 onluk + 6 birliktir.',1,36,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-36','coktan_secmeli','36 sayısında onluk basamağının değeri kaçtır?','["30","3","6","36"]',0,'Onluk basamağındaki 3, 30 değerindedir.',2,186,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-40','coktan_secmeli','40 sayısı kaç onluk ve kaç birlikten oluşur?','["0 onluk 4 birlik","5 onluk 0 birlik","4 onluk 1 birlik","4 onluk 0 birlik"]',3,'40 = 4 onluk + 0 birliktir.',1,40,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-40','coktan_secmeli','40 sayısında onluk basamağının değeri kaçtır?','["4","0","40","41"]',2,'Onluk basamağındaki 4, 40 değerindedir.',2,190,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-44','coktan_secmeli','44 sayısı kaç onluk ve kaç birlikten oluşur?','["5 onluk 4 birlik","4 onluk 4 birlik","4 onluk 5 birlik","Yanlış 1"]',1,'44 = 4 onluk + 4 birliktir.',1,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-44','coktan_secmeli','44 sayısında onluk basamağının değeri kaçtır?','["40","4","44","41"]',0,'Onluk basamağındaki 4, 40 değerindedir.',2,194,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-48','coktan_secmeli','48 sayısı kaç onluk ve kaç birlikten oluşur?','["8 onluk 4 birlik","5 onluk 8 birlik","4 onluk 9 birlik","4 onluk 8 birlik"]',3,'48 = 4 onluk + 8 birliktir.',1,48,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-48','coktan_secmeli','48 sayısında onluk basamağının değeri kaçtır?','["4","8","40","48"]',2,'Onluk basamağındaki 4, 40 değerindedir.',2,198,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-52','coktan_secmeli','52 sayısı kaç onluk ve kaç birlikten oluşur?','["2 onluk 5 birlik","5 onluk 2 birlik","6 onluk 2 birlik","5 onluk 3 birlik"]',1,'52 = 5 onluk + 2 birliktir.',1,52,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-52','coktan_secmeli','52 sayısında onluk basamağının değeri kaçtır?','["50","5","2","52"]',0,'Onluk basamağındaki 5, 50 değerindedir.',2,202,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-56','coktan_secmeli','56 sayısı kaç onluk ve kaç birlikten oluşur?','["6 onluk 5 birlik","6 onluk 6 birlik","5 onluk 7 birlik","5 onluk 6 birlik"]',3,'56 = 5 onluk + 6 birliktir.',1,56,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-56','coktan_secmeli','56 sayısında onluk basamağının değeri kaçtır?','["5","6","50","56"]',2,'Onluk basamağındaki 5, 50 değerindedir.',2,206,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-60','coktan_secmeli','60 sayısı kaç onluk ve kaç birlikten oluşur?','["0 onluk 6 birlik","6 onluk 0 birlik","7 onluk 0 birlik","6 onluk 1 birlik"]',1,'60 = 6 onluk + 0 birliktir.',1,60,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-60','coktan_secmeli','60 sayısında onluk basamağının değeri kaçtır?','["60","6","0","61"]',0,'Onluk basamağındaki 6, 60 değerindedir.',2,210,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-64','coktan_secmeli','64 sayısı kaç onluk ve kaç birlikten oluşur?','["4 onluk 6 birlik","7 onluk 4 birlik","6 onluk 5 birlik","6 onluk 4 birlik"]',3,'64 = 6 onluk + 4 birliktir.',1,64,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-64','coktan_secmeli','64 sayısında onluk basamağının değeri kaçtır?','["6","4","60","64"]',2,'Onluk basamağındaki 6, 60 değerindedir.',2,214,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-68','coktan_secmeli','68 sayısı kaç onluk ve kaç birlikten oluşur?','["8 onluk 6 birlik","6 onluk 8 birlik","7 onluk 8 birlik","6 onluk 9 birlik"]',1,'68 = 6 onluk + 8 birliktir.',1,68,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-68','coktan_secmeli','68 sayısında onluk basamağının değeri kaçtır?','["60","6","8","68"]',0,'Onluk basamağındaki 6, 60 değerindedir.',2,218,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-72','coktan_secmeli','72 sayısı kaç onluk ve kaç birlikten oluşur?','["2 onluk 7 birlik","8 onluk 2 birlik","7 onluk 3 birlik","7 onluk 2 birlik"]',3,'72 = 7 onluk + 2 birliktir.',1,72,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-72','coktan_secmeli','72 sayısında onluk basamağının değeri kaçtır?','["7","2","70","72"]',2,'Onluk basamağındaki 7, 70 değerindedir.',2,222,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-76','coktan_secmeli','76 sayısı kaç onluk ve kaç birlikten oluşur?','["6 onluk 7 birlik","7 onluk 6 birlik","8 onluk 6 birlik","7 onluk 7 birlik"]',1,'76 = 7 onluk + 6 birliktir.',1,76,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-76','coktan_secmeli','76 sayısında onluk basamağının değeri kaçtır?','["70","7","6","76"]',0,'Onluk basamağındaki 7, 70 değerindedir.',2,226,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-80','coktan_secmeli','80 sayısı kaç onluk ve kaç birlikten oluşur?','["0 onluk 8 birlik","9 onluk 0 birlik","8 onluk 1 birlik","8 onluk 0 birlik"]',3,'80 = 8 onluk + 0 birliktir.',1,80,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-80','coktan_secmeli','80 sayısında onluk basamağının değeri kaçtır?','["8","0","80","81"]',2,'Onluk basamağındaki 8, 80 değerindedir.',2,230,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-84','coktan_secmeli','84 sayısı kaç onluk ve kaç birlikten oluşur?','["4 onluk 8 birlik","8 onluk 4 birlik","9 onluk 4 birlik","8 onluk 5 birlik"]',1,'84 = 8 onluk + 4 birliktir.',1,84,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-84','coktan_secmeli','84 sayısında onluk basamağının değeri kaçtır?','["80","8","4","84"]',0,'Onluk basamağındaki 8, 80 değerindedir.',2,234,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-88','coktan_secmeli','88 sayısı kaç onluk ve kaç birlikten oluşur?','["9 onluk 8 birlik","8 onluk 9 birlik","Yanlış 1","8 onluk 8 birlik"]',3,'88 = 8 onluk + 8 birliktir.',1,88,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-88','coktan_secmeli','88 sayısında onluk basamağının değeri kaçtır?','["8","88","80","81"]',2,'Onluk basamağındaki 8, 80 değerindedir.',2,238,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-92','coktan_secmeli','92 sayısı kaç onluk ve kaç birlikten oluşur?','["2 onluk 9 birlik","9 onluk 2 birlik","10 onluk 2 birlik","9 onluk 3 birlik"]',1,'92 = 9 onluk + 2 birliktir.',1,92,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-92','coktan_secmeli','92 sayısında onluk basamağının değeri kaçtır?','["90","9","2","92"]',0,'Onluk basamağındaki 9, 90 değerindedir.',2,242,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cozum-96','coktan_secmeli','96 sayısı kaç onluk ve kaç birlikten oluşur?','["6 onluk 9 birlik","10 onluk 6 birlik","9 onluk 7 birlik","9 onluk 6 birlik"]',3,'96 = 9 onluk + 6 birliktir.',1,96,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-onluk-deger-96','coktan_secmeli','96 sayısında onluk basamağının değeri kaçtır?','["9","6","90","96"]',2,'Onluk basamağındaki 9, 90 değerindedir.',2,246,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bas-1','coktan_secmeli','54 sayısında birler basamağının değeri kaçtır?','["54","4","5","14"]',1,'Doğru basamak değeri 4''dir.',2,400,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bas-2','coktan_secmeli','72 sayısında birler basamağının değeri kaçtır?','["72","7","12","2"]',3,'Doğru basamak değeri 2''dir.',2,401,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bas-3','coktan_secmeli','39 sayısında onlar basamağının değeri kaçtır?','["39","30","3","9"]',1,'Doğru basamak değeri 30''dir.',2,402,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bas-4','coktan_secmeli','81 sayısında birler basamağının değeri kaçtır?','["81","8","11","1"]',3,'Doğru basamak değeri 1''dir.',2,403,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bas-5','coktan_secmeli','46 sayısında onlar basamağının değeri kaçtır?','["46","40","4","6"]',1,'Doğru basamak değeri 40''dir.',2,404,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bas-6','coktan_secmeli','95 sayısında birler basamağının değeri kaçtır?','["95","9","15","5"]',3,'Doğru basamak değeri 5''dir.',2,405,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bas-7','coktan_secmeli','67 sayısında onlar basamağının değeri kaçtır?','["67","60","6","7"]',1,'Doğru basamak değeri 60''dir.',2,406,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bas-8','coktan_secmeli','20 sayısında birler basamağının değeri kaçtır?','["20","2","10","0"]',3,'Doğru basamak değeri 0''dir.',2,407,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-basamak' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-buyuk-1','coktan_secmeli','24 ve 42 sayılarından hangisi daha büyüktür?','["24","42","Eşit","Bilinemez"]',1,'42, 24''den büyüktür.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-buyuk-2','coktan_secmeli','57 ve 49 sayılarından hangisi daha büyüktür?','["49","Eşit","57","Bilinemez"]',2,'57, 49''den büyüktür.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-buyuk-3','coktan_secmeli','63 ve 68 sayılarından hangisi daha büyüktür?','["63","Eşit","Bilinemez","68"]',3,'68, 63''den büyüktür.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-buyuk-4','coktan_secmeli','91 ve 19 sayılarından hangisi daha büyüktür?','["91","19","Eşit","Bilinemez"]',0,'91, 19''den büyüktür.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kars-5','coktan_secmeli','35 ile 35 nasıl karşılaştırılır?','["36","Eşit","34","Bilinemez"]',1,'İki sayı aynıdır; eşittir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-buyuk-6','coktan_secmeli','76 ve 67 sayılarından hangisi daha büyüktür?','["67","Eşit","76","Bilinemez"]',2,'76, 67''den büyüktür.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-buyuk-7','coktan_secmeli','82 ve 28 sayılarından hangisi daha büyüktür?','["28","Eşit","Bilinemez","82"]',3,'82, 28''den büyüktür.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-buyuk-8','coktan_secmeli','44 ve 54 sayılarından hangisi daha büyüktür?','["54","44","Eşit","Bilinemez"]',0,'54, 44''den büyüktür.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-buyuk-9','coktan_secmeli','99 ve 89 sayılarından hangisi daha büyüktür?','["89","99","Eşit","Bilinemez"]',1,'99, 89''den büyüktür.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-buyuk-10','coktan_secmeli','10 ve 100 sayılarından hangisi daha büyüktür?','["10","Eşit","100","Bilinemez"]',2,'100, 10''den büyüktür.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-buyuk-11','coktan_secmeli','71 ve 70 sayılarından hangisi daha büyüktür?','["70","Eşit","Bilinemez","71"]',3,'71, 70''den büyüktür.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-buyuk-12','coktan_secmeli','56 ve 65 sayılarından hangisi daha büyüktür?','["65","56","Eşit","Bilinemez"]',0,'65, 56''den büyüktür.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sirala-1','coktan_secmeli','23, 41, 35 sayılarını küçükten büyüğe doğru sıralayan seçenek hangisidir?','["35, 41, 23","23, 35, 41","41, 35, 23","Yanlış 1"]',1,'Küçükten büyüğe doğru sıra 23, 35, 41 olur.',2,100,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sirala-2','coktan_secmeli','66, 62, 69 sayılarını küçükten büyüğe doğru sıralayan seçenek hangisidir?','["69, 62, 66","69, 66, 62","62, 66, 69","66, 69, 62"]',2,'Küçükten büyüğe doğru sıra 62, 66, 69 olur.',2,101,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sirala-3','coktan_secmeli','91, 19, 49 sayılarını küçükten büyüğe doğru sıralayan seçenek hangisidir?','["49, 19, 91","91, 49, 19","Yanlış 1","19, 49, 91"]',3,'Küçükten büyüğe doğru sıra 19, 49, 91 olur.',2,102,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sirala-4','coktan_secmeli','54, 45, 50 sayılarını küçükten büyüğe doğru sıralayan seçenek hangisidir?','["45, 50, 54","50, 45, 54","54, 50, 45","Yanlış 1"]',0,'Küçükten büyüğe doğru sıra 45, 50, 54 olur.',2,103,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sirala-5','coktan_secmeli','8, 80, 18 sayılarını küçükten büyüğe doğru sıralayan seçenek hangisidir?','["18, 80, 8","8, 18, 80","80, 18, 8","Yanlış 1"]',1,'Küçükten büyüğe doğru sıra 8, 18, 80 olur.',2,104,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sirala-6','coktan_secmeli','72, 27, 70 sayılarını küçükten büyüğe doğru sıralayan seçenek hangisidir?','["70, 27, 72","72, 70, 27","27, 70, 72","Yanlış 1"]',2,'Küçükten büyüğe doğru sıra 27, 70, 72 olur.',2,105,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sirala-7','coktan_secmeli','99, 90, 9 sayılarını küçükten büyüğe doğru sıralayan seçenek hangisidir?','["99, 90, 9","99, 9, 90","Yanlış 1","9, 90, 99"]',3,'Küçükten büyüğe doğru sıra 9, 90, 99 olur.',2,106,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sirala-8','coktan_secmeli','31, 13, 30 sayılarını küçükten büyüğe doğru sıralayan seçenek hangisidir?','["13, 30, 31","30, 13, 31","31, 30, 13","Yanlış 1"]',0,'Küçükten büyüğe doğru sıra 13, 30, 31 olur.',2,107,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-12','coktan_secmeli','12 sayısı hangi onluğa daha yakındır?','["20","10","0","12"]',1,'12, 10 onluğuna daha yakındır.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-14','coktan_secmeli','14 sayısı hangi onluğa daha yakındır?','["10","20","0","14"]',0,'14, 10 onluğuna daha yakındır.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-16','coktan_secmeli','16 sayısı hangi onluğa daha yakındır?','["10","30","16","20"]',3,'16, 20 onluğuna daha yakındır.',2,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-18','coktan_secmeli','18 sayısı hangi onluğa daha yakındır?','["10","30","20","18"]',2,'18, 20 onluğuna daha yakındır.',2,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-21','coktan_secmeli','21 sayısı hangi onluğa daha yakındır?','["30","10","20","21"]',2,'21, 20 onluğuna daha yakındır.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-24','coktan_secmeli','24 sayısı hangi onluğa daha yakındır?','["30","10","20","24"]',2,'24, 20 onluğuna daha yakındır.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-26','coktan_secmeli','26 sayısı hangi onluğa daha yakındır?','["20","30","40","26"]',1,'26, 30 onluğuna daha yakındır.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-29','coktan_secmeli','29 sayısı hangi onluğa daha yakındır?','["20","30","40","29"]',1,'29, 30 onluğuna daha yakındır.',2,29,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-31','coktan_secmeli','31 sayısı hangi onluğa daha yakındır?','["30","40","20","31"]',0,'31, 30 onluğuna daha yakındır.',2,31,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-34','coktan_secmeli','34 sayısı hangi onluğa daha yakındır?','["30","40","20","34"]',0,'34, 30 onluğuna daha yakındır.',2,34,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-36','coktan_secmeli','36 sayısı hangi onluğa daha yakındır?','["30","50","36","40"]',3,'36, 40 onluğuna daha yakındır.',2,36,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-39','coktan_secmeli','39 sayısı hangi onluğa daha yakındır?','["30","50","39","40"]',3,'39, 40 onluğuna daha yakındır.',2,39,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-42','coktan_secmeli','42 sayısı hangi onluğa daha yakındır?','["50","30","42","40"]',3,'42, 40 onluğuna daha yakındır.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-44','coktan_secmeli','44 sayısı hangi onluğa daha yakındır?','["50","30","40","44"]',2,'44, 40 onluğuna daha yakındır.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-46','coktan_secmeli','46 sayısı hangi onluğa daha yakındır?','["40","50","60","46"]',1,'46, 50 onluğuna daha yakındır.',2,46,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-48','coktan_secmeli','48 sayısı hangi onluğa daha yakındır?','["50","40","60","48"]',0,'48, 50 onluğuna daha yakındır.',2,48,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-52','coktan_secmeli','52 sayısı hangi onluğa daha yakındır?','["60","50","40","52"]',1,'52, 50 onluğuna daha yakındır.',2,52,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-54','coktan_secmeli','54 sayısı hangi onluğa daha yakındır?','["50","60","40","54"]',0,'54, 50 onluğuna daha yakındır.',2,54,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-57','coktan_secmeli','57 sayısı hangi onluğa daha yakındır?','["60","50","70","57"]',0,'57, 60 onluğuna daha yakındır.',2,57,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-59','coktan_secmeli','59 sayısı hangi onluğa daha yakındır?','["50","70","59","60"]',3,'59, 60 onluğuna daha yakındır.',2,59,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-63','coktan_secmeli','63 sayısı hangi onluğa daha yakındır?','["60","70","50","63"]',0,'63, 60 onluğuna daha yakındır.',2,63,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-66','coktan_secmeli','66 sayısı hangi onluğa daha yakındır?','["70","60","80","66"]',0,'66, 70 onluğuna daha yakındır.',2,66,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-72','coktan_secmeli','72 sayısı hangi onluğa daha yakındır?','["80","60","72","70"]',3,'72, 70 onluğuna daha yakındır.',2,72,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-77','coktan_secmeli','77 sayısı hangi onluğa daha yakındır?','["70","80","90","77"]',1,'77, 80 onluğuna daha yakındır.',2,77,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-84','coktan_secmeli','84 sayısı hangi onluğa daha yakındır?','["90","80","70","84"]',1,'84, 80 onluğuna daha yakındır.',2,84,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-88','coktan_secmeli','88 sayısı hangi onluğa daha yakındır?','["80","100","90","88"]',2,'88, 90 onluğuna daha yakındır.',2,88,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-93','coktan_secmeli','93 sayısı hangi onluğa daha yakındır?','["90","100","80","93"]',0,'93, 90 onluğuna daha yakındır.',2,93,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yakin-97','coktan_secmeli','97 sayısı hangi onluğa daha yakındır?','["90","100","97","99"]',1,'97, 100 onluğuna daha yakındır.',2,97,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-1','coktan_secmeli','Diziyi tamamla: 2, 4, 6, 8, __','["11","9","10","15"]',2,'Ritmik sayma kuralına göre 10 gelir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-2','coktan_secmeli','Diziyi tamamla: 12, 14, 16, __','["18","19","17","23"]',0,'Ritmik sayma kuralına göre 18 gelir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-3','coktan_secmeli','Diziyi tamamla: 20, 18, 16, __','["15","13","14","19"]',2,'Ritmik sayma kuralına göre 14 gelir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-4','coktan_secmeli','Diziyi tamamla: 3, 6, 9, __','["12","13","11","17"]',0,'Ritmik sayma kuralına göre 12 gelir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-5','coktan_secmeli','Diziyi tamamla: 12, 15, 18, __','["22","20","21","26"]',2,'Ritmik sayma kuralına göre 21 gelir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-6','coktan_secmeli','Diziyi tamamla: 30, 27, 24, __','["21","22","20","26"]',0,'Ritmik sayma kuralına göre 21 gelir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-7','coktan_secmeli','Diziyi tamamla: 4, 8, 12, __','["17","15","16","21"]',2,'Ritmik sayma kuralına göre 16 gelir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-8','coktan_secmeli','Diziyi tamamla: 20, 24, 28, __','["32","33","31","37"]',0,'Ritmik sayma kuralına göre 32 gelir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-9','coktan_secmeli','Diziyi tamamla: 40, 36, 32, __','["29","27","28","33"]',2,'Ritmik sayma kuralına göre 28 gelir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-10','coktan_secmeli','Diziyi tamamla: 5, 10, 15, __','["20","21","19","25"]',0,'Ritmik sayma kuralına göre 20 gelir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-11','coktan_secmeli','Diziyi tamamla: 45, 50, 55, __','["61","59","60","65"]',2,'Ritmik sayma kuralına göre 60 gelir.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-12','coktan_secmeli','Diziyi tamamla: 100, 95, 90, __','["85","86","84","90"]',0,'Ritmik sayma kuralına göre 85 gelir.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-13','coktan_secmeli','Diziyi tamamla: 10, 20, 30, __','["41","39","40","45"]',2,'Ritmik sayma kuralına göre 40 gelir.',2,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-14','coktan_secmeli','Diziyi tamamla: 50, 60, 70, __','["80","81","79","85"]',0,'Ritmik sayma kuralına göre 80 gelir.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-15','coktan_secmeli','Diziyi tamamla: 100, 90, 80, __','["71","69","70","75"]',2,'Ritmik sayma kuralına göre 70 gelir.',2,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-16','coktan_secmeli','Diziyi tamamla: 6, 8, 10, __','["12","13","11","17"]',0,'Ritmik sayma kuralına göre 12 gelir.',2,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-17','coktan_secmeli','Diziyi tamamla: 9, 12, 15, __','["19","17","18","23"]',2,'Ritmik sayma kuralına göre 18 gelir.',2,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-18','coktan_secmeli','Diziyi tamamla: 16, 20, 24, __','["28","29","27","33"]',0,'Ritmik sayma kuralına göre 28 gelir.',2,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-19','coktan_secmeli','Diziyi tamamla: 25, 30, 35, __','["41","39","40","45"]',2,'Ritmik sayma kuralına göre 40 gelir.',2,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-ritim-20','coktan_secmeli','Diziyi tamamla: 60, 70, 80, __','["90","91","89","95"]',0,'Ritmik sayma kuralına göre 90 gelir.',2,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-oruntu-1','coktan_secmeli','Örüntüyü tamamla: 10, 15, 20, 25, __','["31","29","30","35"]',2,'Örüntü kuralına göre 30 gelir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-oruntu-2','coktan_secmeli','Örüntüyü tamamla: 8, 12, 16, __','["20","21","19","25"]',0,'Örüntü kuralına göre 20 gelir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-oruntu-3','coktan_secmeli','Örüntüyü tamamla: 42, 39, 36, __','["34","32","33","38"]',2,'Örüntü kuralına göre 33 gelir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-oruntu-4','coktan_secmeli','Örüntüyü tamamla: 5, 10, 20, 25, 30, __','["40","41","39","45"]',0,'Örüntü kuralına göre 40 gelir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-oruntu-5','coktan_secmeli','Örüntüyü tamamla: 70, 60, 50, __','["41","39","40","45"]',2,'Örüntü kuralına göre 40 gelir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-oruntu-6','coktan_secmeli','Örüntüyü tamamla: 11, 21, 31, __','["41","42","40","46"]',0,'Örüntü kuralına göre 41 gelir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-oruntu-7','coktan_secmeli','Örüntüyü tamamla: 4, 7, 10, __','["14","12","13","18"]',2,'Örüntü kuralına göre 13 gelir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-oruntu-8','coktan_secmeli','Örüntüyü tamamla: 90, 85, 80, __','["75","76","74","80"]',0,'Örüntü kuralına göre 75 gelir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-oruntu-9','coktan_secmeli','Örüntüyü tamamla: 2, 6, 10, __','["15","13","14","19"]',2,'Örüntü kuralına göre 14 gelir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-oruntu-10','coktan_secmeli','Örüntüyü tamamla: 33, 43, 53, __','["63","64","62","68"]',0,'Örüntü kuralına göre 63 gelir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-oruntu-11','coktan_secmeli','Örüntüyü tamamla: 100, 80, 60, __','["41","39","40","45"]',2,'Örüntü kuralına göre 40 gelir.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-oruntu-12','coktan_secmeli','Örüntüyü tamamla: 12, 22, 32, __','["42","43","41","47"]',0,'Örüntü kuralına göre 42 gelir.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-oruntu-13','coktan_secmeli','Örüntüyü tamamla: 50, 45, 40, __','["36","34","35","40"]',2,'Örüntü kuralına göre 35 gelir.',2,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-oruntu-14','coktan_secmeli','Örüntüyü tamamla: 1, 4, 7, __','["10","11","9","15"]',0,'Örüntü kuralına göre 10 gelir.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-oruntu-15','coktan_secmeli','Örüntüyü tamamla: 24, 28, 32, __','["37","35","36","41"]',2,'Örüntü kuralına göre 36 gelir.',2,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-oruntu-16','coktan_secmeli','Örüntüyü tamamla: 3, 8, 13, __','["18","19","17","23"]',0,'Örüntü kuralına göre 18 gelir.',2,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-oruntu-17','coktan_secmeli','Örüntüyü tamamla: 62, 52, 42, __','["33","31","32","37"]',2,'Örüntü kuralına göre 32 gelir.',2,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-oruntu-18','coktan_secmeli','Örüntüyü tamamla: 9, 19, 29, __','["39","40","38","44"]',0,'Örüntü kuralına göre 39 gelir.',2,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tahmin-1','coktan_secmeli','Bir kutuda yaklaşık 18 boncuk görüyorsun. En uygun tahmin hangisidir?','["5","40","50","20"]',3,'18''e yakın bir tahmin 20 olabilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tahmin-2','coktan_secmeli','Bir sepette yaklaşık 32 elma varsa en uygun tahmin hangisidir?','["10","30","50","5"]',1,'32''ye yakın onluk 30''dur.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tahmin-3','coktan_secmeli','Yaklaşık 47 kalem görülen gruba en uygun tahmin hangisidir?','["20","5","10","50"]',3,'47 sayısı 50''ye yakındır.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tahmin-4','coktan_secmeli','Tahmini kontrol etmenin en iyi yolu nedir?','["Rengini değiştirmek","Nesneleri saymak","Kutuyu kapatmak","Tahmini silmek"]',1,'Sayarak gerçek miktarı buluruz.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tahmin-5','coktan_secmeli','Tahmin ile gerçek sonuç farklıysa ne yapmalıyız?','["Tahmini zorla doğru saymalıyız","Nesneleri saklamalıyız","Sayımı silmeliyiz","Gerçek sayımı kabul etmeliyiz"]',3,'Sayım gerçek miktarı verir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tahmin-6','coktan_secmeli','Bir sınıfta yaklaşık 25 öğrenci olabilir. Hangisi makul değildir?','["24","1000","26","25"]',1,'1000 öğrenci tek sınıf için gerçekçi değildir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tahmin-7','coktan_secmeli','Küçük bir kalem kutusunda kaç kalem olabileceğine uygun tahmin hangisidir?','["80","800","100","8"]',3,'8 küçük bir kalem kutusu için makul bir tahmindir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tahmin-8','coktan_secmeli','Bir tabakta 9 kurabiye görüyorsun. Hangisi en yakın tahmindir?','["30","10","50","1"]',1,'9 sayısı 10''a çok yakındır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tahmin-9','coktan_secmeli','Yaklaşık 41 düğme için uygun tahmin hangisidir?','["4","10","90","40"]',3,'41''e yakın tahmin 40''tır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tahmin-10','coktan_secmeli','Tahmin yaparken neye bakmak yararlıdır?','["Sadece rengine","Grubun büyüklüğüne ve düzenine","Sadece kutunun adına","Gözlerimizi kapatmaya"]',1,'Nesne grubunu gözlemek daha iyi tahmin sağlar.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kesir-1','coktan_secmeli','Bir bütün iki eş parçaya ayrılırsa her parça nedir?','["Çeyrek","Yarım","Bütün","Üçte bir"]',1,'İki eş parçanın her biri yarımdır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kesir-2','coktan_secmeli','Bir bütün dört eş parçaya ayrılırsa her parça nedir?','["Yarım","Bütün","İki kat","Çeyrek"]',3,'Dört eş parçanın her biri çeyrektir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kesir-3','coktan_secmeli','İki yarım bir araya gelince ne olur?','["Bir çeyrek","Bir bütün","Üç bütün","Hiçbir şey"]',1,'İki yarım bir bütünü oluşturur.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kesir-4','coktan_secmeli','Dört çeyrek bir araya gelince ne olur?','["Bir yarım","İki bütün","Üçte bir","Bir bütün"]',3,'Dört çeyrek bir bütündür.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kesir-5','coktan_secmeli','Bir elma iki eş parçaya bölündü. Bir parça ne kadardır?','["Çeyrek elma","Yarım elma","İki elma","Bir buçuk elma"]',1,'İki eş parçadan biri yarımdır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kesir-6','coktan_secmeli','Bir pizza dört eş dilime ayrıldı. Bir dilim ne kadardır?','["Yarım pizza","Bütün pizza","İki pizza","Çeyrek pizza"]',3,'Dört eş dilimden biri çeyrektir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kesir-7','coktan_secmeli','Hangisi bütünün yarısını gösterir?','["4 eş parçadan 1''i","2 eş parçadan 1''i","4 eş parçadan 4''ü","3 eş parçadan 1''i"]',1,'Yarım, iki eş parçadan biridir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kesir-8','coktan_secmeli','Hangisi bütünün çeyreğini gösterir?','["2 eş parçadan 1''i","4 eş parçadan 2''si","1 bütün","4 eş parçadan 1''i"]',3,'Çeyrek, dört eş parçadan biridir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kesir-9','coktan_secmeli','İki çeyrek kaç yarım eder?','["2 yarım","1 yarım","4 yarım","Hiç"]',1,'İki çeyrek bir yarımdır.',2,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kesir-10','coktan_secmeli','Bir bütün kaç yarım eder?','["1 yarım","4 yarım","3 yarım","2 yarım"]',3,'Bir bütünde iki yarım vardır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kesir-11','coktan_secmeli','Bir bütün kaç çeyrek eder?','["2 çeyrek","4 çeyrek","1 çeyrek","8 çeyrek"]',1,'Bir bütünde dört çeyrek vardır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kesir-12','coktan_secmeli','Bir sandviç iki eş parçaya bölünürse paylaşım nasıl olur?','["Dört çeyrek demek zorunlu","Bir bütün bir yarım","Üç eş parça","İki yarım"]',3,'İki eş parça iki yarımdır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kesir-13','coktan_secmeli','Yarım mı çeyrek mi daha büyüktür?','["Çeyrek","Yarım","Eşit","Bilinemez"]',1,'Aynı bütün için yarım çeyrekten büyüktür.',2,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kesir-14','coktan_secmeli','Bir bütünün iki çeyreği ne kadardır?','["Bütün","Bir çeyrek","İki bütün","Yarım"]',3,'İki çeyrek bir yarımdır.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kesir-15','coktan_secmeli','Bir kek dört eş parçaya bölündü ve iki parçası yenildi. Ne kadarı yenmiştir?','["Çeyreği","Yarısı","Tamamı","Hiçbiri"]',1,'Dört eş parçanın ikisi yarımdır.',2,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-1','coktan_secmeli','İki tane 20 TL toplam kaç TL eder?','["40 TL","20 TL","30 TL","50 TL"]',0,'20+20=40 TL.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-2','coktan_secmeli','50 TL ile 20 TL birlikte kaç TL eder?','["60 TL","80 TL","70 TL","30 TL"]',2,'50+20=70 TL.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-3','coktan_secmeli','100 TL''den 30 TL harcarsan kaç TL kalır?','["70 TL","60 TL","80 TL","90 TL"]',0,'100-30=70 TL.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-4','coktan_secmeli','1 TL kaç kuruştur?','["10 kuruş","50 kuruş","100 kuruş","20 kuruş"]',2,'1 TL, 100 kuruştur.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-5','coktan_secmeli','50 kuruş + 50 kuruş kaç TL eder?','["1 TL","50 kuruş","2 TL","100 TL"]',0,'İki 50 kuruş toplam 100 kuruş yani 1 TL eder.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-6','coktan_secmeli','25 kuruş + 25 kuruş kaç kuruştur?','["25 kuruş","75 kuruş","50 kuruş","100 kuruş"]',2,'25+25=50 kuruş.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-7','coktan_secmeli','Bir kalem 18 TL, 20 TL verirsen kaç TL para üstü alırsın?','["2 TL","1 TL","3 TL","8 TL"]',0,'20-18=2 TL.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-8','coktan_secmeli','Bir defter 24 TL, silgi 6 TL. Toplam kaç TL?','["28 TL","32 TL","30 TL","18 TL"]',2,'24+6=30 TL.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-9','coktan_secmeli','35 TL''n var, 12 TL harcadın. Kaç TL kaldı?','["23 TL","22 TL","24 TL","47 TL"]',0,'35-12=23 TL.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-10','coktan_secmeli','Hangisi daha değerlidir?','["20 TL","10 TL","50 TL","5 TL"]',2,'50 TL daha büyük değerdedir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-11','coktan_secmeli','2 tane 10 TL ve 1 tane 5 TL toplam kaç TL?','["25 TL","20 TL","15 TL","30 TL"]',0,'10+10+5=25 TL.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-12','coktan_secmeli','4 tane 5 TL toplam kaç TL?','["15 TL","25 TL","20 TL","10 TL"]',2,'5+5+5+5=20 TL.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-13','coktan_secmeli','Bir oyuncak 45 TL. 50 TL yeter mi?','["Evet, 5 TL artar","Hayır","Evet, 10 TL artar","Tam para olur"]',0,'50-45=5 TL.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-14','coktan_secmeli','Bir kitap 60 TL. 50 TL paran varsa kaç TL eksiğin vardır?','["5 TL","20 TL","10 TL","30 TL"]',2,'60-50=10 TL.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-15','coktan_secmeli','75 TL''lik alışverişe 100 TL verirsen para üstü kaç TL?','["25 TL","15 TL","20 TL","35 TL"]',0,'100-75=25 TL.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-16','coktan_secmeli','10 kuruşluk 5 madeni para toplam kaç kuruş eder?','["40 kuruş","60 kuruş","50 kuruş","100 kuruş"]',2,'5x10 kuruş=50 kuruş.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-17','coktan_secmeli','20 kuruş + 30 kuruş toplam kaç kuruş eder?','["50 kuruş","40 kuruş","60 kuruş","70 kuruş"]',0,'20+30=50 kuruş.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-18','coktan_secmeli','1 TL ile 75 kuruşluk ürün alınırsa kaç kuruş kalır?','["15 kuruş","35 kuruş","25 kuruş","75 kuruş"]',2,'100-75=25 kuruş.',2,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-19','coktan_secmeli','İki ürün 12 TL ve 8 TL. Toplam kaç TL?','["20 TL","18 TL","22 TL","4 TL"]',0,'12+8=20 TL.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-para-20','coktan_secmeli','40 TL ile 15 TL''lik ürün alınırsa kaç TL kalır?','["20 TL","30 TL","25 TL","35 TL"]',2,'40-15=25 TL.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-zaman-1','coktan_secmeli','Saat 07.00 nasıl okunur?','["Saat yedi","Yedi buçuk","Sekiz","Altı buçuk"]',0,'Tam saatte dakika 00''dır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-zaman-2','coktan_secmeli','Saat 08.30 nasıl okunur?','["Sekiz","Dokuz buçuk","Sekiz buçuk","Yedi"]',2,'30 dakika yarım saati gösterir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-zaman-3','coktan_secmeli','Saat 12.00 nasıl okunur?','["Saat on iki","On iki buçuk","Bir","On bir buçuk"]',0,'12.00 tam on ikidir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-zaman-4','coktan_secmeli','Saat 15.30 nasıl okunur?','["Üç","Dört buçuk","Üç buçuk","İki buçuk"]',2,'15.30 öğleden sonra üç buçuktur.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-zaman-5','coktan_secmeli','Bir gün kaç saattir?','["24","12","10","60"]',0,'Bir gün 24 saattir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-zaman-6','coktan_secmeli','Bir hafta kaç gündür?','["5","6","7","8"]',2,'Bir hafta 7 gündür.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-zaman-7','coktan_secmeli','Pazartesiden sonra hangi gün gelir?','["Salı","Pazar","Çarşamba","Cuma"]',0,'Pazartesiden sonra Salı gelir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-zaman-8','coktan_secmeli','Cumadan sonra hangi gün gelir?','["Perşembe","Pazar","Cumartesi","Pazartesi"]',2,'Cumadan sonra Cumartesi gelir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-zaman-9','coktan_secmeli','Pazar gününden önce hangi gün vardır?','["Cumartesi","Cuma","Pazartesi","Salı"]',0,'Pazarın önceki günü Cumartesidir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-zaman-10','coktan_secmeli','Sabah 8''de başlayan ders, 9''dan önce mi başlar?','["Hayır","Aynı anda","Evet","Bilinemez"]',2,'8, 9''dan öncedir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-zaman-11','coktan_secmeli','Saat 10.00''dan bir saat sonra kaç olur?','["11.00","10.30","12.00","09.00"]',0,'Bir saat sonra 11.00 olur.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-zaman-12','coktan_secmeli','Saat 14.00''dan bir saat önce kaç olur?','["15.00","12.00","13.00","14.30"]',2,'Bir saat önce 13.00''tür.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-zaman-13','coktan_secmeli','08.00 ile 09.00 arasında kaç saat vardır?','["1 saat","2 saat","30 dakika","3 saat"]',0,'İki tam saat arasında 1 saat vardır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-zaman-14','coktan_secmeli','Yarım saat kaç dakikadır?','["15 dakika","60 dakika","30 dakika","20 dakika"]',2,'Yarım saat 30 dakikadır.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-zaman-15','coktan_secmeli','Bir saat kaç dakikadır?','["60 dakika","30 dakika","100 dakika","24 dakika"]',0,'Bir saat 60 dakikadır.',2,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-zaman-16','coktan_secmeli','Saat 16.30''dan 17.00''ye kaç dakika vardır?','["60 dakika","15 dakika","30 dakika","45 dakika"]',2,'16.30''dan 17.00''ye yarım saat vardır.',2,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-zaman-17','coktan_secmeli','Okula 08.30''da gelip ders 09.00''da başlıyorsa kaç dakika önce gelmiş olursun?','["30 dakika","15 dakika","60 dakika","45 dakika"]',0,'08.30 ile 09.00 arası 30 dakikadır.',2,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-zaman-18','coktan_secmeli','Gece 21.00 mi, sabah 09.00 mu daha geç bir zamandır?','["09.00","Aynı","21.00","Bilinemez"]',2,'Aynı gün içinde 21.00 daha ileridir.',2,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-uzunluk-1','coktan_secmeli','Bir kalemin boyunu ölçmek için hangi birim uygundur?','["Metre","Kilogram","Santimetre","Litre"]',2,'Kalem gibi küçük nesneler santimetre ile ölçülebilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-uzunluk-2','coktan_secmeli','Bir sınıfın uzunluğunu ölçmek için hangi birim uygundur?','["Metre","Santimetre","Gram","Saat"]',0,'Sınıf gibi daha uzun mesafeler metre ile ölçülür.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-uzunluk-3','coktan_secmeli','Hangisi uzunluk ölçme aracıdır?','["Terazi","Saat","Cetvel","Bardak"]',2,'Cetvel uzunluk ölçer.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-uzunluk-4','coktan_secmeli','1 metre 100 santimetre midir?','["Evet","Hayır","50 cm''dir","10 cm''dir"]',0,'1 m = 100 cm''dir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-uzunluk-5','coktan_secmeli','80 cm ile 1 m karşılaştırıldığında hangisi daha uzundur?','["80 cm","Eşit","1 m","Bilinemez"]',2,'1 m = 100 cm olduğu için daha uzundur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-uzunluk-6','coktan_secmeli','Bir kalem 15 cm, diğeri 12 cm. Hangisi daha uzundur?','["15 cm olan","12 cm olan","Eşit","Bilinemez"]',0,'15, 12''den büyüktür.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-uzunluk-7','coktan_secmeli','Bir masa 120 cm olabilir mi?','["Hayır, mutlaka 12 cm''dir","Sadece kg ile ölçülür","Evet","Uzunluk ölçülemez"]',2,'Masa yaklaşık 120 cm olabilir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-uzunluk-8','coktan_secmeli','Bir kapının yüksekliği için hangisi daha gerçekçidir?','["Yaklaşık 2 metre","2 santimetre","200 kilogram","2 dakika"]',0,'Kapılar metre ile ifade edilir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-uzunluk-9','coktan_secmeli','Bir silginin boyu için hangisi gerçekçidir?','["5 m","50 m","5 cm","5 kg"]',2,'Silgi birkaç santimetre olabilir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-uzunluk-10','coktan_secmeli','Ölçerken cetvelin hangi noktasından başlamak gerekir?','["0 çizgisinden","Ortadan","Sonundan","Rastgele"]',0,'Doğru ölçüm için 0 çizgisinden başlanır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-uzunluk-11','coktan_secmeli','20 cm + 30 cm toplam kaç cm eder?','["40 cm","60 cm","50 cm","10 cm"]',2,'20+30=50 cm.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-uzunluk-12','coktan_secmeli','70 cm''den 20 cm çıkarılırsa kaç cm kalır?','["50 cm","40 cm","60 cm","90 cm"]',0,'70-20=50 cm.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-uzunluk-13','coktan_secmeli','2 metre ile 1 metre arasındaki fark kaç metredir?','["2 metre","3 metre","1 metre","0 metre"]',2,'2-1=1 metredir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-uzunluk-14','coktan_secmeli','Hangisini metre ile ölçmek daha uygundur?','["Koridor","Ataş","Düğme","Silgi"]',0,'Koridor metre ile ölçülebilir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-uzunluk-15','coktan_secmeli','Hangisini santimetre ile ölçmek daha uygundur?','["Okul bahçesi","Sokak","Defter","Bina yüksekliği"]',2,'Defter santimetre ile ölçülebilir.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kutle-1','coktan_secmeli','Bir karpuzun kütlesini hangi birimle ölçmek uygundur?','["Santimetre","Kilogram","Saat","Litre"]',1,'Karpuz kilogramla ölçülebilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kutle-2','coktan_secmeli','Bir kalemin kütlesi için hangi birim daha uygundur?','["Kilogram","Metre","Saat","Gram"]',3,'Kalem gibi hafif nesneler gramla ölçülebilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kutle-3','coktan_secmeli','Hangisi kütle ölçme aracıdır?','["Cetvel","Terazi","Saat","Termometre"]',1,'Terazi kütleyi karşılaştırmak/ölçmek için kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kutle-4','coktan_secmeli','1 kilogram 1000 gram mıdır?','["Hayır","100 gramdır","10 gramdır","Evet"]',3,'1 kg = 1000 g''dır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kutle-5','coktan_secmeli','2 kg elma ile 1 kg elma karşılaştırıldığında hangisi daha ağırdır?','["1 kg","2 kg","Eşit","Bilinemez"]',1,'2 kg, 1 kg''dan fazladır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kutle-6','coktan_secmeli','500 g ile 1 kg arasında hangisi daha ağırdır?','["500 g","Eşit","Bilinemez","1 kg"]',3,'1 kg = 1000 g''dır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kutle-7','coktan_secmeli','Bir paket pirinç için hangisi gerçekçi olabilir?','["1 cm","1 kg","1 saat","1 litre her durumda"]',1,'Pirinç paketleri kg ile ölçülebilir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kutle-8','coktan_secmeli','Bir silgi için hangisi daha gerçekçi bir kütledir?','["20 kg","20 m","20 saat","20 g"]',3,'Silgi gramla ifade edilir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kutle-9','coktan_secmeli','3 kg + 2 kg kaç kg eder?','["4 kg","5 kg","6 kg","1 kg"]',1,'3+2=5 kg.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kutle-10','coktan_secmeli','5 kg''dan 2 kg çıkarılırsa kaç kg kalır?','["2 kg","4 kg","7 kg","3 kg"]',3,'5-2=3 kg.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kutle-11','coktan_secmeli','Hangisi genellikle daha ağırdır?','["Kalem","Masa","Tüy","Ataş"]',1,'Masa genellikle diğerlerinden ağırdır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-kutle-12','coktan_secmeli','Hangisi gramla ölçülmeye daha uygundur?','["Otomobil","Büyük masa","İnsan","Çikolata"]',3,'Küçük ve hafif ürünler gramla ölçülebilir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-1','coktan_secmeli','10 + 1 işleminin sonucu kaçtır?','["11","12","10","21"]',0,'10+1=11.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-2','coktan_secmeli','10 + 5 işleminin sonucu kaçtır?','["16","15","14","25"]',1,'10+5=15.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-3','coktan_secmeli','10 + 9 işleminin sonucu kaçtır?','["20","18","19","29"]',2,'10+9=19.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-4','coktan_secmeli','10 + 13 işleminin sonucu kaçtır?','["24","22","33","23"]',3,'10+13=23.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-5','coktan_secmeli','10 + 17 işleminin sonucu kaçtır?','["27","28","26","37"]',0,'10+17=27.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-6','coktan_secmeli','10 + 21 işleminin sonucu kaçtır?','["32","31","30","41"]',1,'10+21=31.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-7','coktan_secmeli','10 + 25 işleminin sonucu kaçtır?','["36","34","35","45"]',2,'10+25=35.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-8','coktan_secmeli','10 + 29 işleminin sonucu kaçtır?','["40","38","49","39"]',3,'10+29=39.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-9','coktan_secmeli','10 + 33 işleminin sonucu kaçtır?','["43","44","42","53"]',0,'10+33=43.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-10','coktan_secmeli','13 + 1 işleminin sonucu kaçtır?','["14","15","13","24"]',0,'13+1=14.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-11','coktan_secmeli','13 + 5 işleminin sonucu kaçtır?','["19","18","17","28"]',1,'13+5=18.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-12','coktan_secmeli','13 + 9 işleminin sonucu kaçtır?','["23","21","22","32"]',2,'13+9=22.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-13','coktan_secmeli','13 + 13 işleminin sonucu kaçtır?','["27","25","36","26"]',3,'13+13=26.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-14','coktan_secmeli','13 + 17 işleminin sonucu kaçtır?','["30","31","29","40"]',0,'13+17=30.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-15','coktan_secmeli','13 + 21 işleminin sonucu kaçtır?','["35","34","33","44"]',1,'13+21=34.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-16','coktan_secmeli','13 + 25 işleminin sonucu kaçtır?','["39","37","38","48"]',2,'13+25=38.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-17','coktan_secmeli','13 + 29 işleminin sonucu kaçtır?','["43","41","52","42"]',3,'13+29=42.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-18','coktan_secmeli','13 + 33 işleminin sonucu kaçtır?','["46","47","45","56"]',0,'13+33=46.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-19','coktan_secmeli','16 + 1 işleminin sonucu kaçtır?','["17","18","16","27"]',0,'16+1=17.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-20','coktan_secmeli','16 + 5 işleminin sonucu kaçtır?','["22","21","20","31"]',1,'16+5=21.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-21','coktan_secmeli','16 + 9 işleminin sonucu kaçtır?','["26","24","25","35"]',2,'16+9=25.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-22','coktan_secmeli','16 + 13 işleminin sonucu kaçtır?','["30","28","39","29"]',3,'16+13=29.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-23','coktan_secmeli','16 + 17 işleminin sonucu kaçtır?','["33","34","32","43"]',0,'16+17=33.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-24','coktan_secmeli','16 + 21 işleminin sonucu kaçtır?','["38","37","36","47"]',1,'16+21=37.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-25','coktan_secmeli','16 + 25 işleminin sonucu kaçtır?','["42","40","41","51"]',2,'16+25=41.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-26','coktan_secmeli','16 + 29 işleminin sonucu kaçtır?','["46","44","55","45"]',3,'16+29=45.',1,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-27','coktan_secmeli','16 + 33 işleminin sonucu kaçtır?','["49","50","48","59"]',0,'16+33=49.',1,27,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-28','coktan_secmeli','19 + 1 işleminin sonucu kaçtır?','["20","21","19","30"]',0,'19+1=20.',1,28,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-29','coktan_secmeli','19 + 5 işleminin sonucu kaçtır?','["25","24","23","34"]',1,'19+5=24.',1,29,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-30','coktan_secmeli','19 + 9 işleminin sonucu kaçtır?','["29","27","28","38"]',2,'19+9=28.',1,30,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-31','coktan_secmeli','19 + 13 işleminin sonucu kaçtır?','["33","31","42","32"]',3,'19+13=32.',1,31,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-32','coktan_secmeli','19 + 17 işleminin sonucu kaçtır?','["36","37","35","46"]',0,'19+17=36.',1,32,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-33','coktan_secmeli','19 + 21 işleminin sonucu kaçtır?','["41","40","39","50"]',1,'19+21=40.',1,33,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-34','coktan_secmeli','19 + 25 işleminin sonucu kaçtır?','["45","43","44","54"]',2,'19+25=44.',1,34,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-35','coktan_secmeli','19 + 29 işleminin sonucu kaçtır?','["49","47","58","48"]',3,'19+29=48.',1,35,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-36','coktan_secmeli','19 + 33 işleminin sonucu kaçtır?','["52","53","51","62"]',0,'19+33=52.',1,36,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-37','coktan_secmeli','22 + 1 işleminin sonucu kaçtır?','["23","24","22","33"]',0,'22+1=23.',1,37,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-38','coktan_secmeli','22 + 5 işleminin sonucu kaçtır?','["28","27","26","37"]',1,'22+5=27.',1,38,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-39','coktan_secmeli','22 + 9 işleminin sonucu kaçtır?','["32","30","31","41"]',2,'22+9=31.',1,39,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-40','coktan_secmeli','22 + 13 işleminin sonucu kaçtır?','["36","34","45","35"]',3,'22+13=35.',1,40,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-41','coktan_secmeli','22 + 17 işleminin sonucu kaçtır?','["39","40","38","49"]',0,'22+17=39.',1,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-42','coktan_secmeli','22 + 21 işleminin sonucu kaçtır?','["44","43","42","53"]',1,'22+21=43.',1,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-43','coktan_secmeli','22 + 25 işleminin sonucu kaçtır?','["48","46","47","57"]',2,'22+25=47.',1,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-44','coktan_secmeli','22 + 29 işleminin sonucu kaçtır?','["52","50","61","51"]',3,'22+29=51.',1,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-45','coktan_secmeli','22 + 33 işleminin sonucu kaçtır?','["55","56","54","65"]',0,'22+33=55.',1,45,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-46','coktan_secmeli','25 + 1 işleminin sonucu kaçtır?','["26","27","25","36"]',0,'25+1=26.',1,46,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-47','coktan_secmeli','25 + 5 işleminin sonucu kaçtır?','["31","30","29","40"]',1,'25+5=30.',1,47,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-48','coktan_secmeli','25 + 9 işleminin sonucu kaçtır?','["35","33","34","44"]',2,'25+9=34.',1,48,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-49','coktan_secmeli','25 + 13 işleminin sonucu kaçtır?','["39","37","48","38"]',3,'25+13=38.',1,49,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-50','coktan_secmeli','25 + 17 işleminin sonucu kaçtır?','["42","43","41","52"]',0,'25+17=42.',1,50,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-51','coktan_secmeli','25 + 21 işleminin sonucu kaçtır?','["47","46","45","56"]',1,'25+21=46.',1,51,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-52','coktan_secmeli','25 + 25 işleminin sonucu kaçtır?','["51","49","50","60"]',2,'25+25=50.',1,52,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-53','coktan_secmeli','25 + 29 işleminin sonucu kaçtır?','["55","53","64","54"]',3,'25+29=54.',1,53,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-54','coktan_secmeli','25 + 33 işleminin sonucu kaçtır?','["58","59","57","68"]',0,'25+33=58.',1,54,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-55','coktan_secmeli','28 + 1 işleminin sonucu kaçtır?','["29","30","28","39"]',0,'28+1=29.',1,55,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-56','coktan_secmeli','28 + 5 işleminin sonucu kaçtır?','["34","33","32","43"]',1,'28+5=33.',1,56,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-57','coktan_secmeli','28 + 9 işleminin sonucu kaçtır?','["38","36","37","47"]',2,'28+9=37.',1,57,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-58','coktan_secmeli','28 + 13 işleminin sonucu kaçtır?','["42","40","51","41"]',3,'28+13=41.',1,58,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-59','coktan_secmeli','28 + 17 işleminin sonucu kaçtır?','["45","46","44","55"]',0,'28+17=45.',1,59,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-60','coktan_secmeli','28 + 21 işleminin sonucu kaçtır?','["50","49","48","59"]',1,'28+21=49.',1,60,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-61','coktan_secmeli','28 + 25 işleminin sonucu kaçtır?','["54","52","53","63"]',2,'28+25=53.',1,61,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-62','coktan_secmeli','28 + 29 işleminin sonucu kaçtır?','["58","56","67","57"]',3,'28+29=57.',1,62,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-63','coktan_secmeli','28 + 33 işleminin sonucu kaçtır?','["61","62","60","71"]',0,'28+33=61.',2,63,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-64','coktan_secmeli','31 + 1 işleminin sonucu kaçtır?','["32","33","31","42"]',0,'31+1=32.',1,64,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-65','coktan_secmeli','31 + 5 işleminin sonucu kaçtır?','["37","36","35","46"]',1,'31+5=36.',1,65,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-66','coktan_secmeli','31 + 9 işleminin sonucu kaçtır?','["41","39","40","50"]',2,'31+9=40.',1,66,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-67','coktan_secmeli','31 + 13 işleminin sonucu kaçtır?','["45","43","54","44"]',3,'31+13=44.',1,67,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-68','coktan_secmeli','31 + 17 işleminin sonucu kaçtır?','["48","49","47","58"]',0,'31+17=48.',1,68,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-69','coktan_secmeli','31 + 21 işleminin sonucu kaçtır?','["53","52","51","62"]',1,'31+21=52.',1,69,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-70','coktan_secmeli','31 + 25 işleminin sonucu kaçtır?','["57","55","56","66"]',2,'31+25=56.',1,70,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-71','coktan_secmeli','31 + 29 işleminin sonucu kaçtır?','["61","59","70","60"]',3,'31+29=60.',1,71,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-72','coktan_secmeli','31 + 33 işleminin sonucu kaçtır?','["64","65","63","74"]',0,'31+33=64.',2,72,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-73','coktan_secmeli','34 + 1 işleminin sonucu kaçtır?','["35","36","34","45"]',0,'34+1=35.',1,73,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-74','coktan_secmeli','34 + 5 işleminin sonucu kaçtır?','["40","39","38","49"]',1,'34+5=39.',1,74,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-75','coktan_secmeli','34 + 9 işleminin sonucu kaçtır?','["44","42","43","53"]',2,'34+9=43.',1,75,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-76','coktan_secmeli','34 + 13 işleminin sonucu kaçtır?','["48","46","57","47"]',3,'34+13=47.',1,76,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-77','coktan_secmeli','34 + 17 işleminin sonucu kaçtır?','["51","52","50","61"]',0,'34+17=51.',1,77,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-78','coktan_secmeli','34 + 21 işleminin sonucu kaçtır?','["56","55","54","65"]',1,'34+21=55.',1,78,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-79','coktan_secmeli','34 + 25 işleminin sonucu kaçtır?','["60","58","59","69"]',2,'34+25=59.',1,79,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-80','coktan_secmeli','34 + 29 işleminin sonucu kaçtır?','["64","62","73","63"]',3,'34+29=63.',2,80,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-81','coktan_secmeli','34 + 33 işleminin sonucu kaçtır?','["67","68","66","77"]',0,'34+33=67.',2,81,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-82','coktan_secmeli','37 + 1 işleminin sonucu kaçtır?','["38","39","37","48"]',0,'37+1=38.',1,82,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-83','coktan_secmeli','37 + 5 işleminin sonucu kaçtır?','["43","42","41","52"]',1,'37+5=42.',1,83,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-84','coktan_secmeli','37 + 9 işleminin sonucu kaçtır?','["47","45","46","56"]',2,'37+9=46.',1,84,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-85','coktan_secmeli','37 + 13 işleminin sonucu kaçtır?','["51","49","60","50"]',3,'37+13=50.',1,85,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-86','coktan_secmeli','37 + 17 işleminin sonucu kaçtır?','["54","55","53","64"]',0,'37+17=54.',1,86,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-87','coktan_secmeli','37 + 21 işleminin sonucu kaçtır?','["59","58","57","68"]',1,'37+21=58.',1,87,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-88','coktan_secmeli','37 + 25 işleminin sonucu kaçtır?','["63","61","62","72"]',2,'37+25=62.',2,88,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-89','coktan_secmeli','37 + 29 işleminin sonucu kaçtır?','["67","65","76","66"]',3,'37+29=66.',2,89,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-top-90','coktan_secmeli','37 + 33 işleminin sonucu kaçtır?','["70","71","69","80"]',0,'37+33=70.',2,90,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-1','coktan_secmeli','25 - 2 işleminin sonucu kaçtır?','["23","24","22","33"]',0,'25-2=23.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-2','coktan_secmeli','25 - 7 işleminin sonucu kaçtır?','["19","17","18","28"]',2,'25-7=18.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-3','coktan_secmeli','25 - 12 işleminin sonucu kaçtır?','["13","14","12","23"]',0,'25-12=13.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-4','coktan_secmeli','25 - 17 işleminin sonucu kaçtır?','["9","7","8","18"]',2,'25-17=8.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-5','coktan_secmeli','25 - 22 işleminin sonucu kaçtır?','["3","4","2","13"]',0,'25-22=3.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-6','coktan_secmeli','28 - 2 işleminin sonucu kaçtır?','["26","27","25","36"]',0,'28-2=26.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-7','coktan_secmeli','28 - 7 işleminin sonucu kaçtır?','["22","20","21","31"]',2,'28-7=21.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-8','coktan_secmeli','28 - 12 işleminin sonucu kaçtır?','["16","17","15","26"]',0,'28-12=16.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-9','coktan_secmeli','28 - 17 işleminin sonucu kaçtır?','["12","10","11","21"]',2,'28-17=11.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-10','coktan_secmeli','28 - 22 işleminin sonucu kaçtır?','["6","7","5","16"]',0,'28-22=6.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-11','coktan_secmeli','28 - 27 işleminin sonucu kaçtır?','["2","0","1","11"]',2,'28-27=1.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-12','coktan_secmeli','31 - 2 işleminin sonucu kaçtır?','["30","29","28","39"]',1,'31-2=29.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-13','coktan_secmeli','31 - 7 işleminin sonucu kaçtır?','["25","23","34","24"]',3,'31-7=24.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-14','coktan_secmeli','31 - 12 işleminin sonucu kaçtır?','["20","19","18","29"]',1,'31-12=19.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-15','coktan_secmeli','31 - 17 işleminin sonucu kaçtır?','["15","13","24","14"]',3,'31-17=14.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-16','coktan_secmeli','31 - 22 işleminin sonucu kaçtır?','["10","9","8","19"]',1,'31-22=9.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-17','coktan_secmeli','31 - 27 işleminin sonucu kaçtır?','["5","3","14","4"]',3,'31-27=4.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-18','coktan_secmeli','34 - 2 işleminin sonucu kaçtır?','["33","31","32","42"]',2,'34-2=32.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-19','coktan_secmeli','34 - 7 işleminin sonucu kaçtır?','["27","28","26","37"]',0,'34-7=27.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-20','coktan_secmeli','34 - 12 işleminin sonucu kaçtır?','["23","21","22","32"]',2,'34-12=22.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-21','coktan_secmeli','34 - 17 işleminin sonucu kaçtır?','["17","18","16","27"]',0,'34-17=17.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-22','coktan_secmeli','34 - 22 işleminin sonucu kaçtır?','["13","11","12","22"]',2,'34-22=12.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-23','coktan_secmeli','34 - 27 işleminin sonucu kaçtır?','["7","8","6","17"]',0,'34-27=7.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-24','coktan_secmeli','34 - 32 işleminin sonucu kaçtır?','["3","1","2","12"]',2,'34-32=2.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-25','coktan_secmeli','37 - 2 işleminin sonucu kaçtır?','["35","36","34","45"]',0,'37-2=35.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-26','coktan_secmeli','37 - 7 işleminin sonucu kaçtır?','["31","29","30","40"]',2,'37-7=30.',1,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-27','coktan_secmeli','37 - 12 işleminin sonucu kaçtır?','["25","26","24","35"]',0,'37-12=25.',1,27,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-28','coktan_secmeli','37 - 17 işleminin sonucu kaçtır?','["21","19","20","30"]',2,'37-17=20.',1,28,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-29','coktan_secmeli','37 - 22 işleminin sonucu kaçtır?','["15","16","14","25"]',0,'37-22=15.',1,29,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-30','coktan_secmeli','37 - 27 işleminin sonucu kaçtır?','["11","9","10","20"]',2,'37-27=10.',1,30,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-31','coktan_secmeli','37 - 32 işleminin sonucu kaçtır?','["5","6","4","15"]',0,'37-32=5.',1,31,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-32','coktan_secmeli','40 - 2 işleminin sonucu kaçtır?','["39","37","38","48"]',2,'40-2=38.',1,32,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-33','coktan_secmeli','40 - 7 işleminin sonucu kaçtır?','["33","34","32","43"]',0,'40-7=33.',1,33,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-34','coktan_secmeli','40 - 12 işleminin sonucu kaçtır?','["29","27","28","38"]',2,'40-12=28.',1,34,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-35','coktan_secmeli','40 - 17 işleminin sonucu kaçtır?','["23","24","22","33"]',0,'40-17=23.',1,35,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-36','coktan_secmeli','40 - 22 işleminin sonucu kaçtır?','["19","17","18","28"]',2,'40-22=18.',1,36,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-37','coktan_secmeli','40 - 27 işleminin sonucu kaçtır?','["13","14","12","23"]',0,'40-27=13.',1,37,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-38','coktan_secmeli','40 - 32 işleminin sonucu kaçtır?','["9","7","8","18"]',2,'40-32=8.',1,38,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-39','coktan_secmeli','40 - 37 işleminin sonucu kaçtır?','["3","4","2","13"]',0,'40-37=3.',1,39,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-40','coktan_secmeli','43 - 2 işleminin sonucu kaçtır?','["42","41","40","51"]',1,'43-2=41.',1,40,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-41','coktan_secmeli','43 - 7 işleminin sonucu kaçtır?','["37","35","46","36"]',3,'43-7=36.',1,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-42','coktan_secmeli','43 - 12 işleminin sonucu kaçtır?','["32","31","30","41"]',1,'43-12=31.',1,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-43','coktan_secmeli','43 - 17 işleminin sonucu kaçtır?','["27","25","36","26"]',3,'43-17=26.',1,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-44','coktan_secmeli','43 - 22 işleminin sonucu kaçtır?','["22","21","20","31"]',1,'43-22=21.',1,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-45','coktan_secmeli','43 - 27 işleminin sonucu kaçtır?','["17","15","26","16"]',3,'43-27=16.',1,45,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-46','coktan_secmeli','43 - 32 işleminin sonucu kaçtır?','["12","11","10","21"]',1,'43-32=11.',1,46,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-47','coktan_secmeli','43 - 37 işleminin sonucu kaçtır?','["7","5","16","6"]',3,'43-37=6.',1,47,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-48','coktan_secmeli','46 - 2 işleminin sonucu kaçtır?','["44","45","43","54"]',0,'46-2=44.',1,48,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-49','coktan_secmeli','46 - 7 işleminin sonucu kaçtır?','["40","38","39","49"]',2,'46-7=39.',1,49,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-50','coktan_secmeli','46 - 12 işleminin sonucu kaçtır?','["34","35","33","44"]',0,'46-12=34.',1,50,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-51','coktan_secmeli','46 - 17 işleminin sonucu kaçtır?','["30","28","29","39"]',2,'46-17=29.',1,51,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-52','coktan_secmeli','46 - 22 işleminin sonucu kaçtır?','["24","25","23","34"]',0,'46-22=24.',1,52,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-53','coktan_secmeli','46 - 27 işleminin sonucu kaçtır?','["20","18","19","29"]',2,'46-27=19.',1,53,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-54','coktan_secmeli','46 - 32 işleminin sonucu kaçtır?','["14","15","13","24"]',0,'46-32=14.',1,54,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-55','coktan_secmeli','46 - 37 işleminin sonucu kaçtır?','["10","8","9","19"]',2,'46-37=9.',1,55,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-56','coktan_secmeli','49 - 2 işleminin sonucu kaçtır?','["48","46","57","47"]',3,'49-2=47.',1,56,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-57','coktan_secmeli','49 - 7 işleminin sonucu kaçtır?','["43","42","41","52"]',1,'49-7=42.',1,57,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-58','coktan_secmeli','49 - 12 işleminin sonucu kaçtır?','["38","36","47","37"]',3,'49-12=37.',1,58,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-59','coktan_secmeli','49 - 17 işleminin sonucu kaçtır?','["33","32","31","42"]',1,'49-17=32.',1,59,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-60','coktan_secmeli','49 - 22 işleminin sonucu kaçtır?','["28","26","37","27"]',3,'49-22=27.',1,60,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-61','coktan_secmeli','49 - 27 işleminin sonucu kaçtır?','["23","22","21","32"]',1,'49-27=22.',1,61,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-62','coktan_secmeli','49 - 32 işleminin sonucu kaçtır?','["18","16","27","17"]',3,'49-32=17.',1,62,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-63','coktan_secmeli','49 - 37 işleminin sonucu kaçtır?','["13","12","11","22"]',1,'49-37=12.',1,63,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-64','coktan_secmeli','52 - 2 işleminin sonucu kaçtır?','["51","49","50","60"]',2,'52-2=50.',1,64,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-65','coktan_secmeli','52 - 7 işleminin sonucu kaçtır?','["45","46","44","55"]',0,'52-7=45.',1,65,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-66','coktan_secmeli','52 - 12 işleminin sonucu kaçtır?','["41","39","40","50"]',2,'52-12=40.',1,66,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-67','coktan_secmeli','52 - 17 işleminin sonucu kaçtır?','["35","36","34","45"]',0,'52-17=35.',1,67,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-68','coktan_secmeli','52 - 22 işleminin sonucu kaçtır?','["31","29","30","40"]',2,'52-22=30.',1,68,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-69','coktan_secmeli','52 - 27 işleminin sonucu kaçtır?','["25","26","24","35"]',0,'52-27=25.',1,69,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-70','coktan_secmeli','52 - 32 işleminin sonucu kaçtır?','["21","19","20","30"]',2,'52-32=20.',1,70,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-71','coktan_secmeli','52 - 37 işleminin sonucu kaçtır?','["15","16","14","25"]',0,'52-37=15.',1,71,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-72','coktan_secmeli','55 - 2 işleminin sonucu kaçtır?','["54","53","52","63"]',1,'55-2=53.',1,72,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-73','coktan_secmeli','55 - 7 işleminin sonucu kaçtır?','["49","47","58","48"]',3,'55-7=48.',1,73,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-74','coktan_secmeli','55 - 12 işleminin sonucu kaçtır?','["44","43","42","53"]',1,'55-12=43.',1,74,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-75','coktan_secmeli','55 - 17 işleminin sonucu kaçtır?','["39","37","48","38"]',3,'55-17=38.',1,75,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-76','coktan_secmeli','55 - 22 işleminin sonucu kaçtır?','["34","33","32","43"]',1,'55-22=33.',1,76,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-77','coktan_secmeli','55 - 27 işleminin sonucu kaçtır?','["29","27","38","28"]',3,'55-27=28.',1,77,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-78','coktan_secmeli','55 - 32 işleminin sonucu kaçtır?','["24","23","22","33"]',1,'55-32=23.',1,78,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-79','coktan_secmeli','55 - 37 işleminin sonucu kaçtır?','["19","17","28","18"]',3,'55-37=18.',1,79,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-80','coktan_secmeli','58 - 2 işleminin sonucu kaçtır?','["56","57","55","66"]',0,'58-2=56.',1,80,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-81','coktan_secmeli','58 - 7 işleminin sonucu kaçtır?','["52","50","51","61"]',2,'58-7=51.',1,81,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-82','coktan_secmeli','58 - 12 işleminin sonucu kaçtır?','["46","47","45","56"]',0,'58-12=46.',1,82,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-83','coktan_secmeli','58 - 17 işleminin sonucu kaçtır?','["42","40","41","51"]',2,'58-17=41.',1,83,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-84','coktan_secmeli','58 - 22 işleminin sonucu kaçtır?','["36","37","35","46"]',0,'58-22=36.',1,84,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-85','coktan_secmeli','58 - 27 işleminin sonucu kaçtır?','["32","30","31","41"]',2,'58-27=31.',1,85,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-86','coktan_secmeli','58 - 32 işleminin sonucu kaçtır?','["26","27","25","36"]',0,'58-32=26.',1,86,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-87','coktan_secmeli','58 - 37 işleminin sonucu kaçtır?','["22","20","21","31"]',2,'58-37=21.',1,87,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-88','coktan_secmeli','61 - 2 işleminin sonucu kaçtır?','["60","58","69","59"]',3,'61-2=59.',2,88,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-89','coktan_secmeli','61 - 7 işleminin sonucu kaçtır?','["55","54","53","64"]',1,'61-7=54.',2,89,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cik-90','coktan_secmeli','61 - 12 işleminin sonucu kaçtır?','["50","48","59","49"]',3,'61-12=49.',2,90,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-top-20','coktan_secmeli','12 + __ = 20 işleminde eksik sayı kaçtır?','["9","8","7","12"]',1,'12+8=20.',2,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-top-24','coktan_secmeli','16 + __ = 24 işleminde eksik sayı kaçtır?','["9","7","8","16"]',2,'16+8=24.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-top-28','coktan_secmeli','7 + __ = 28 işleminde eksik sayı kaçtır?','["22","20","7","21"]',3,'7+21=28.',2,28,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-top-32','coktan_secmeli','11 + __ = 32 işleminde eksik sayı kaçtır?','["21","22","20","11"]',0,'11+21=32.',2,32,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-top-36','coktan_secmeli','15 + __ = 36 işleminde eksik sayı kaçtır?','["22","21","20","15"]',1,'15+21=36.',2,36,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-top-40','coktan_secmeli','6 + __ = 40 işleminde eksik sayı kaçtır?','["35","33","34","6"]',2,'6+34=40.',2,40,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-top-44','coktan_secmeli','10 + __ = 44 işleminde eksik sayı kaçtır?','["35","33","10","34"]',3,'10+34=44.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-top-48','coktan_secmeli','14 + __ = 48 işleminde eksik sayı kaçtır?','["34","35","33","14"]',0,'14+34=48.',2,48,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-top-52','coktan_secmeli','5 + __ = 52 işleminde eksik sayı kaçtır?','["48","47","46","5"]',1,'5+47=52.',2,52,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-top-56','coktan_secmeli','9 + __ = 56 işleminde eksik sayı kaçtır?','["48","46","47","9"]',2,'9+47=56.',2,56,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-top-60','coktan_secmeli','13 + __ = 60 işleminde eksik sayı kaçtır?','["48","46","13","47"]',3,'13+47=60.',2,60,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-top-64','coktan_secmeli','17 + __ = 64 işleminde eksik sayı kaçtır?','["47","48","46","17"]',0,'17+47=64.',2,64,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-top-68','coktan_secmeli','8 + __ = 68 işleminde eksik sayı kaçtır?','["61","60","59","8"]',1,'8+60=68.',2,68,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-top-72','coktan_secmeli','12 + __ = 72 işleminde eksik sayı kaçtır?','["61","59","60","12"]',2,'12+60=72.',2,72,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-top-76','coktan_secmeli','16 + __ = 76 işleminde eksik sayı kaçtır?','["61","59","16","60"]',3,'16+60=76.',2,76,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-top-80','coktan_secmeli','7 + __ = 80 işleminde eksik sayı kaçtır?','["73","74","72","7"]',0,'7+73=80.',2,80,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-cik-30','coktan_secmeli','30 - __ = 23 işleminde eksik sayı kaçtır?','["8","6","23","7"]',3,'30-7=23.',2,130,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-cik-35','coktan_secmeli','35 - __ = 11 işleminde eksik sayı kaçtır?','["25","24","23","11"]',1,'35-24=11.',2,135,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-cik-40','coktan_secmeli','40 - __ = 16 işleminde eksik sayı kaçtır?','["25","23","16","24"]',3,'40-24=16.',2,140,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-cik-45','coktan_secmeli','45 - __ = 21 işleminde eksik sayı kaçtır?','["25","24","23","21"]',1,'45-24=21.',2,145,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-cik-50','coktan_secmeli','50 - __ = 26 işleminde eksik sayı kaçtır?','["25","23","26","24"]',3,'50-24=26.',2,150,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-cik-55','coktan_secmeli','55 - __ = 14 işleminde eksik sayı kaçtır?','["42","41","40","14"]',1,'55-41=14.',2,155,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-cik-60','coktan_secmeli','60 - __ = 19 işleminde eksik sayı kaçtır?','["42","40","19","41"]',3,'60-41=19.',2,160,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-cik-65','coktan_secmeli','65 - __ = 24 işleminde eksik sayı kaçtır?','["42","41","40","24"]',1,'65-41=24.',2,165,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-cik-70','coktan_secmeli','70 - __ = 12 işleminde eksik sayı kaçtır?','["59","57","12","58"]',3,'70-58=12.',2,170,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-cik-75','coktan_secmeli','75 - __ = 17 işleminde eksik sayı kaçtır?','["59","58","57","17"]',1,'75-58=17.',2,175,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-cik-80','coktan_secmeli','80 - __ = 22 işleminde eksik sayı kaçtır?','["59","57","22","58"]',3,'80-58=22.',2,180,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-cik-85','coktan_secmeli','85 - __ = 10 işleminde eksik sayı kaçtır?','["76","75","74","10"]',1,'85-75=10.',2,185,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-eksik-cik-90','coktan_secmeli','90 - __ = 15 işleminde eksik sayı kaçtır?','["76","74","15","75"]',3,'90-75=15.',2,190,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-1','coktan_secmeli','2 eş grupta her grupta 2 nesne var. Toplam kaç nesne vardır?','["4","6","2","5"]',0,'2 sayısını 2 kez toplarız: toplam 4.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-2','coktan_secmeli','2 grup 2 nesne hangi tekrarlı toplama ile gösterilebilir?','["4 + 0","Yanlış 1","Yanlış 2","2 + 2"]',3,'2 grup için 2 sayısını 2 kez toplarız.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-3','coktan_secmeli','2 eş grupta her grupta 3 nesne var. Toplam kaç nesne vardır?','["8","6","3","7"]',1,'3 sayısını 2 kez toplarız: toplam 6.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-4','coktan_secmeli','2 grup 3 nesne hangi tekrarlı toplama ile gösterilebilir?','["2 + 2 + 2","3 + 3","2 + 3","6 + 0"]',1,'2 grup için 3 sayısını 2 kez toplarız.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-5','coktan_secmeli','2 eş grupta her grupta 4 nesne var. Toplam kaç nesne vardır?','["10","4","8","9"]',2,'4 sayısını 2 kez toplarız: toplam 8.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-6','coktan_secmeli','2 grup 4 nesne hangi tekrarlı toplama ile gösterilebilir?','["2 + 2 + 2 + 2","2 + 4","8 + 0","4 + 4"]',3,'2 grup için 4 sayısını 2 kez toplarız.',2,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-7','coktan_secmeli','2 eş grupta her grupta 5 nesne var. Toplam kaç nesne vardır?','["12","5","11","10"]',3,'5 sayısını 2 kez toplarız: toplam 10.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-8','coktan_secmeli','2 grup 5 nesne hangi tekrarlı toplama ile gösterilebilir?','["2 + 2 + 2 + 2 + 2","5 + 5","2 + 5","10 + 0"]',1,'2 grup için 5 sayısını 2 kez toplarız.',2,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-9','coktan_secmeli','2 eş grupta her grupta 6 nesne var. Toplam kaç nesne vardır?','["12","14","6","13"]',0,'6 sayısını 2 kez toplarız: toplam 12.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-10','coktan_secmeli','2 grup 6 nesne hangi tekrarlı toplama ile gösterilebilir?','["2 + 2 + 2 + 2 + 2 + 2","2 + 6","12 + 0","6 + 6"]',3,'2 grup için 6 sayısını 2 kez toplarız.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-11','coktan_secmeli','3 eş grupta her grupta 2 nesne var. Toplam kaç nesne vardır?','["9","6","4","7"]',1,'2 sayısını 3 kez toplarız: toplam 6.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-12','coktan_secmeli','3 grup 2 nesne hangi tekrarlı toplama ile gösterilebilir?','["3 + 3","2 + 2 + 2","3 + 2","6 + 0"]',1,'3 grup için 2 sayısını 3 kez toplarız.',2,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-13','coktan_secmeli','3 eş grupta her grupta 3 nesne var. Toplam kaç nesne vardır?','["12","6","9","10"]',2,'3 sayısını 3 kez toplarız: toplam 9.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-14','coktan_secmeli','3 grup 3 nesne hangi tekrarlı toplama ile gösterilebilir?','["3 + 3","9 + 0","Yanlış 1","3 + 3 + 3"]',3,'3 grup için 3 sayısını 3 kez toplarız.',2,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-15','coktan_secmeli','3 eş grupta her grupta 4 nesne var. Toplam kaç nesne vardır?','["15","8","13","12"]',3,'4 sayısını 3 kez toplarız: toplam 12.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-16','coktan_secmeli','3 grup 4 nesne hangi tekrarlı toplama ile gösterilebilir?','["3 + 3 + 3 + 3","4 + 4 + 4","3 + 4","12 + 0"]',1,'3 grup için 4 sayısını 3 kez toplarız.',2,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-17','coktan_secmeli','3 eş grupta her grupta 5 nesne var. Toplam kaç nesne vardır?','["15","18","10","16"]',0,'5 sayısını 3 kez toplarız: toplam 15.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-18','coktan_secmeli','3 grup 5 nesne hangi tekrarlı toplama ile gösterilebilir?','["3 + 3 + 3 + 3 + 3","3 + 5","15 + 0","5 + 5 + 5"]',3,'3 grup için 5 sayısını 3 kez toplarız.',2,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-19','coktan_secmeli','3 eş grupta her grupta 6 nesne var. Toplam kaç nesne vardır?','["21","18","12","19"]',1,'6 sayısını 3 kez toplarız: toplam 18.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-20','coktan_secmeli','3 grup 6 nesne hangi tekrarlı toplama ile gösterilebilir?','["3 + 3 + 3 + 3 + 3 + 3","6 + 6 + 6","3 + 6","18 + 0"]',1,'3 grup için 6 sayısını 3 kez toplarız.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-21','coktan_secmeli','4 eş grupta her grupta 2 nesne var. Toplam kaç nesne vardır?','["12","6","8","9"]',2,'2 sayısını 4 kez toplarız: toplam 8.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-22','coktan_secmeli','4 grup 2 nesne hangi tekrarlı toplama ile gösterilebilir?','["4 + 4","4 + 2","8 + 0","2 + 2 + 2 + 2"]',3,'4 grup için 2 sayısını 4 kez toplarız.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-23','coktan_secmeli','4 eş grupta her grupta 3 nesne var. Toplam kaç nesne vardır?','["16","9","13","12"]',3,'3 sayısını 4 kez toplarız: toplam 12.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-24','coktan_secmeli','4 grup 3 nesne hangi tekrarlı toplama ile gösterilebilir?','["4 + 4 + 4","3 + 3 + 3 + 3","4 + 3","12 + 0"]',1,'4 grup için 3 sayısını 4 kez toplarız.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-25','coktan_secmeli','4 eş grupta her grupta 4 nesne var. Toplam kaç nesne vardır?','["16","20","12","17"]',0,'4 sayısını 4 kez toplarız: toplam 16.',1,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-26','coktan_secmeli','4 grup 4 nesne hangi tekrarlı toplama ile gösterilebilir?','["4 + 4","16 + 0","Yanlış 1","4 + 4 + 4 + 4"]',3,'4 grup için 4 sayısını 4 kez toplarız.',2,27,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-27','coktan_secmeli','4 eş grupta her grupta 5 nesne var. Toplam kaç nesne vardır?','["24","20","15","21"]',1,'5 sayısını 4 kez toplarız: toplam 20.',1,28,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-28','coktan_secmeli','4 grup 5 nesne hangi tekrarlı toplama ile gösterilebilir?','["4 + 4 + 4 + 4 + 4","5 + 5 + 5 + 5","4 + 5","20 + 0"]',1,'4 grup için 5 sayısını 4 kez toplarız.',2,29,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-29','coktan_secmeli','4 eş grupta her grupta 6 nesne var. Toplam kaç nesne vardır?','["28","18","24","25"]',2,'6 sayısını 4 kez toplarız: toplam 24.',1,30,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-30','coktan_secmeli','4 grup 6 nesne hangi tekrarlı toplama ile gösterilebilir?','["4 + 4 + 4 + 4 + 4 + 4","4 + 6","24 + 0","6 + 6 + 6 + 6"]',3,'4 grup için 6 sayısını 4 kez toplarız.',2,31,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-31','coktan_secmeli','5 eş grupta her grupta 2 nesne var. Toplam kaç nesne vardır?','["15","8","11","10"]',3,'2 sayısını 5 kez toplarız: toplam 10.',1,32,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-32','coktan_secmeli','5 grup 2 nesne hangi tekrarlı toplama ile gösterilebilir?','["5 + 5","2 + 2 + 2 + 2 + 2","5 + 2","10 + 0"]',1,'5 grup için 2 sayısını 5 kez toplarız.',2,33,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-33','coktan_secmeli','5 eş grupta her grupta 3 nesne var. Toplam kaç nesne vardır?','["15","20","12","16"]',0,'3 sayısını 5 kez toplarız: toplam 15.',1,34,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-34','coktan_secmeli','5 grup 3 nesne hangi tekrarlı toplama ile gösterilebilir?','["5 + 5 + 5","5 + 3","15 + 0","3 + 3 + 3 + 3 + 3"]',3,'5 grup için 3 sayısını 5 kez toplarız.',2,35,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-35','coktan_secmeli','5 eş grupta her grupta 4 nesne var. Toplam kaç nesne vardır?','["25","20","16","21"]',1,'4 sayısını 5 kez toplarız: toplam 20.',1,36,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-36','coktan_secmeli','5 grup 4 nesne hangi tekrarlı toplama ile gösterilebilir?','["5 + 5 + 5 + 5","4 + 4 + 4 + 4 + 4","5 + 4","20 + 0"]',1,'5 grup için 4 sayısını 5 kez toplarız.',2,37,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-37','coktan_secmeli','5 eş grupta her grupta 5 nesne var. Toplam kaç nesne vardır?','["30","20","25","26"]',2,'5 sayısını 5 kez toplarız: toplam 25.',1,38,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-38','coktan_secmeli','5 grup 5 nesne hangi tekrarlı toplama ile gösterilebilir?','["5 + 5","25 + 0","Yanlış 1","5 + 5 + 5 + 5 + 5"]',3,'5 grup için 5 sayısını 5 kez toplarız.',2,39,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-carp-39','coktan_secmeli','5 eş grupta her grupta 6 nesne var. Toplam kaç nesne vardır?','["35","24","31","30"]',3,'6 sayısını 5 kez toplarız: toplam 30.',1,40,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-tekrar-40','coktan_secmeli','5 grup 6 nesne hangi tekrarlı toplama ile gösterilebilir?','["5 + 5 + 5 + 5 + 5 + 5","6 + 6 + 6 + 6 + 6","5 + 6","30 + 0"]',1,'5 grup için 6 sayısını 5 kez toplarız.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-1','coktan_secmeli','8 nesne 2 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["5","3","4","2"]',2,'8 nesne 2 eş gruba ayrılınca her grupta 4 olur.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-2','coktan_secmeli','8 nesne 4 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["2","3","1","4"]',0,'8 nesne 4 eş gruba ayrılınca her grupta 2 olur.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-3','coktan_secmeli','10 nesne 2 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["5","6","4","2"]',0,'10 nesne 2 eş gruba ayrılınca her grupta 5 olur.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-4','coktan_secmeli','12 nesne 2 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["7","5","6","2"]',2,'12 nesne 2 eş gruba ayrılınca her grupta 6 olur.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-5','coktan_secmeli','12 nesne 3 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["5","3","12","4"]',3,'12 nesne 3 eş gruba ayrılınca her grupta 4 olur.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-6','coktan_secmeli','12 nesne 4 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["3","4","2","12"]',0,'12 nesne 4 eş gruba ayrılınca her grupta 3 olur.',2,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-7','coktan_secmeli','15 nesne 3 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["6","4","5","3"]',2,'15 nesne 3 eş gruba ayrılınca her grupta 5 olur.',2,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-8','coktan_secmeli','16 nesne 2 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["9","7","8","2"]',2,'16 nesne 2 eş gruba ayrılınca her grupta 8 olur.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-9','coktan_secmeli','16 nesne 4 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["4","5","3","16"]',0,'16 nesne 4 eş gruba ayrılınca her grupta 4 olur.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-10','coktan_secmeli','18 nesne 2 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["9","10","8","2"]',0,'18 nesne 2 eş gruba ayrılınca her grupta 9 olur.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-11','coktan_secmeli','18 nesne 3 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["7","6","5","3"]',1,'18 nesne 3 eş gruba ayrılınca her grupta 6 olur.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-12','coktan_secmeli','20 nesne 2 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["11","9","10","2"]',2,'20 nesne 2 eş gruba ayrılınca her grupta 10 olur.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-13','coktan_secmeli','20 nesne 4 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["5","6","4","20"]',0,'20 nesne 4 eş gruba ayrılınca her grupta 5 olur.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-14','coktan_secmeli','24 nesne 2 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["13","11","12","2"]',2,'24 nesne 2 eş gruba ayrılınca her grupta 12 olur.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-15','coktan_secmeli','24 nesne 3 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["9","7","3","8"]',3,'24 nesne 3 eş gruba ayrılınca her grupta 8 olur.',2,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-16','coktan_secmeli','24 nesne 4 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["6","7","5","4"]',0,'24 nesne 4 eş gruba ayrılınca her grupta 6 olur.',2,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-17','coktan_secmeli','30 nesne 2 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["15","16","14","2"]',0,'30 nesne 2 eş gruba ayrılınca her grupta 15 olur.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-18','coktan_secmeli','30 nesne 3 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["11","10","9","3"]',1,'30 nesne 3 eş gruba ayrılınca her grupta 10 olur.',2,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-19','coktan_secmeli','36 nesne 2 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["19","17","18","2"]',2,'36 nesne 2 eş gruba ayrılınca her grupta 18 olur.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-20','coktan_secmeli','36 nesne 3 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["13","11","3","12"]',3,'36 nesne 3 eş gruba ayrılınca her grupta 12 olur.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-bol-21','coktan_secmeli','36 nesne 4 eş gruba paylaştırılırsa her grupta kaç nesne olur?','["9","10","8","4"]',0,'36 nesne 4 eş gruba ayrılınca her grupta 9 olur.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-1','coktan_secmeli','Bir sınıfta 28 öğrenci vardı. 7 öğrenci daha geldi. Kaç öğrenci oldu?','["36","34","45","35"]',3,'Uygun işlemle sonuç 35 bulunur.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-2','coktan_secmeli','Kütüphanede 46 kitap vardı. 12 kitap ödünç verildi. Kaç kitap kaldı?','["35","34","33","44"]',1,'Uygun işlemle sonuç 34 bulunur.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-3','coktan_secmeli','Ece 24 sayfa, Mert 18 sayfa okudu. Toplam kaç sayfa okudular?','["43","41","52","42"]',3,'Uygun işlemle sonuç 42 bulunur.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-4','coktan_secmeli','Bir sepette 55 elma vardı. 20 elma kullanıldı. Kaç elma kaldı?','["36","35","34","45"]',1,'Uygun işlemle sonuç 35 bulunur.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-5','coktan_secmeli','Otobüste 32 yolcu vardı. 16 yolcu daha bindi. Kaç yolcu oldu?','["49","47","58","48"]',3,'Uygun işlemle sonuç 48 bulunur.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-6','coktan_secmeli','Kutuda 73 boncuk vardı. 25 boncuk çıkarıldı. Kaç boncuk kaldı?','["49","48","47","58"]',1,'Uygun işlemle sonuç 48 bulunur.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-7','coktan_secmeli','Bir bahçede 37 kırmızı, 22 sarı çiçek var. Toplam kaç çiçek?','["60","58","69","59"]',3,'Uygun işlemle sonuç 59 bulunur.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-8','coktan_secmeli','Duru''nun 80 TL''si vardı. 35 TL harcadı. Kaç TL kaldı?','["46","45","44","55"]',1,'Uygun işlemle sonuç 45 bulunur.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-9','coktan_secmeli','Ali 26 çıkartmaya 14 çıkartma ekledi. Toplam kaç çıkartması oldu?','["41","39","50","40"]',3,'Uygun işlemle sonuç 40 bulunur.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-10','coktan_secmeli','Bir rafta 64 kitap vardı. 18 kitap alındı. Kaç kitap kaldı?','["47","46","45","56"]',1,'Uygun işlemle sonuç 46 bulunur.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-11','coktan_secmeli','Her birinde 4 elma olan 3 tabakta toplam kaç elma vardır?','["13","11","22","12"]',3,'Uygun işlemle sonuç 12 bulunur.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-12','coktan_secmeli','Her birinde 5 kalem olan 4 kutuda toplam kaç kalem vardır?','["21","20","19","30"]',1,'Uygun işlemle sonuç 20 bulunur.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-13','coktan_secmeli','2 sepette her birinde 6 portakal var. Toplam kaç portakal?','["13","11","22","12"]',3,'Uygun işlemle sonuç 12 bulunur.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-14','coktan_secmeli','3 takımın her birinde 5 oyuncu var. Toplam kaç oyuncu?','["16","15","14","25"]',1,'Uygun işlemle sonuç 15 bulunur.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-15','coktan_secmeli','4 masanın her birinde 4 öğrenci oturuyor. Toplam kaç öğrenci?','["17","15","26","16"]',3,'Uygun işlemle sonuç 16 bulunur.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-16','coktan_secmeli','12 kurabiye 3 çocuğa eşit paylaştırılırsa kişi başına kaç kurabiye düşer?','["5","4","3","14"]',1,'Uygun işlemle sonuç 4 bulunur.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-17','coktan_secmeli','20 kalem 4 kutuya eşit konursa her kutuda kaç kalem olur?','["6","4","15","5"]',3,'Uygun işlemle sonuç 5 bulunur.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-18','coktan_secmeli','18 bilye 3 eş gruba ayrılırsa her grupta kaç bilye olur?','["7","6","5","16"]',1,'Uygun işlemle sonuç 6 bulunur.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-19','coktan_secmeli','16 kitap 2 rafa eşit paylaştırılırsa her rafta kaç kitap olur?','["9","7","18","8"]',3,'Uygun işlemle sonuç 8 bulunur.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-20','coktan_secmeli','24 top 4 sepete eşit paylaştırılırsa her sepette kaç top olur?','["7","6","5","16"]',1,'Uygun işlemle sonuç 6 bulunur.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-21','coktan_secmeli','Okulda 45 kız, 42 erkek öğrenci var. Toplam kaç öğrenci?','["88","86","97","87"]',3,'Uygun işlemle sonuç 87 bulunur.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-22','coktan_secmeli','Bir çiftçi 90 yumurtanın 30''unu sattı. Kaç yumurta kaldı?','["61","60","59","70"]',1,'Uygun işlemle sonuç 60 bulunur.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-23','coktan_secmeli','Mert 38 TL, Ece 27 TL biriktirdi. Toplam kaç TL?','["66","64","75","65"]',3,'Uygun işlemle sonuç 65 bulunur.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-24','coktan_secmeli','100 sayfalık kitabın 63 sayfası okundu. Kaç sayfa kaldı?','["38","37","36","47"]',1,'Uygun işlemle sonuç 37 bulunur.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-25','coktan_secmeli','Bir oyun 25 dakika, diğeri 35 dakika sürdü. Toplam kaç dakika?','["61","59","70","60"]',3,'Uygun işlemle sonuç 60 bulunur.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-26','coktan_secmeli','Markette 72 şişenin 19''u satıldı. Kaç şişe kaldı?','["54","53","52","63"]',1,'Uygun işlemle sonuç 53 bulunur.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-27','coktan_secmeli','Bir otobüs 40 km, sonra 25 km gitti. Toplam kaç km?','["66","64","75","65"]',3,'Uygun işlemle sonuç 65 bulunur.',2,27,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-28','coktan_secmeli','Bir ip 85 cm idi, 30 cm kesildi. Kaç cm kaldı?','["56","55","54","65"]',1,'Uygun işlemle sonuç 55 bulunur.',2,28,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-29','coktan_secmeli','5 kutunun her birinde 3 silgi var. Toplam kaç silgi?','["16","14","25","15"]',3,'Uygun işlemle sonuç 15 bulunur.',2,29,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-30','coktan_secmeli','4 paketin her birinde 6 kart var. Toplam kaç kart?','["25","24","23","34"]',1,'Uygun işlemle sonuç 24 bulunur.',2,30,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-31','coktan_secmeli','30 çilek 5 tabağa eşit paylaştırılırsa her tabakta kaç çilek?','["7","5","16","6"]',3,'Uygun işlemle sonuç 6 bulunur.',2,31,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-32','coktan_secmeli','10 oyuncak 2 çocuğa eşit paylaştırılırsa kişi başına kaç oyuncak?','["6","5","4","15"]',1,'Uygun işlemle sonuç 5 bulunur.',2,32,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-33','coktan_secmeli','36 boncuk 4 gruba eşit ayrılırsa her grupta kaç boncuk?','["10","8","19","9"]',3,'Uygun işlemle sonuç 9 bulunur.',2,33,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-34','coktan_secmeli','50 TL ile 32 TL''lik kitap alınırsa kaç TL kalır?','["19","18","17","28"]',1,'Uygun işlemle sonuç 18 bulunur.',2,34,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-35','coktan_secmeli','Bir saat 60 dakika ise yarım saat kaç dakika?','["31","29","40","30"]',3,'Uygun işlemle sonuç 30 bulunur.',2,35,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-36','coktan_secmeli','Bir metre 100 cm ise 70 cm''den sonra 1 metreye kaç cm kalır?','["31","30","29","40"]',1,'Uygun işlemle sonuç 30 bulunur.',2,36,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-37','coktan_secmeli','Bir kutu 2 kg, diğeri 3 kg. Toplam kaç kg?','["6","4","15","5"]',3,'Uygun işlemle sonuç 5 bulunur.',2,37,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-38','coktan_secmeli','Saat 9''da başlayan etkinlik 1 saat sürerse kaçta biter?','["11","10","9","20"]',1,'Uygun işlemle sonuç 10 bulunur.',2,38,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-39','coktan_secmeli','Bir bütün dört eş parçaya ayrılırsa bir parça ne olur?','["2","0","11","1"]',3,'Uygun işlemle sonuç 1 bulunur.',2,39,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-problem-40','coktan_secmeli','2 yarım bir araya gelirse kaç bütün eder?','["2","1","0","11"]',1,'Uygun işlemle sonuç 1 bulunur.',2,40,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cisim-1','coktan_secmeli','Futbol topu hangi geometrik cisme benzer?','["Küp","Silindir","Üçgen prizma","Küre"]',3,'Futbol topu küre biçimindedir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cisimler' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cisim-2','coktan_secmeli','Konserve kutusu hangi geometrik cisme benzer?','["Küre","Silindir","Küp","Üçgen"]',1,'Konserve kutusu silindire benzer.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cisimler' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cisim-3','coktan_secmeli','Zar hangi geometrik cisme benzer?','["Küre","Silindir","Çember","Küp"]',3,'Zarın yüzleri kare olan küp biçimindedir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cisimler' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cisim-4','coktan_secmeli','Ayakkabı kutusu en çok hangi cisme benzer?','["Küre","Dikdörtgenler prizması","Silindir","Küp her zaman"]',1,'Ayakkabı kutusu dikdörtgenler prizmasına benzer.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cisimler' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cisim-5','coktan_secmeli','Üçgen çatılı uzun bir kutu hangi cisme benzeyebilir?','["Küre","Silindir","Küp","Üçgen prizma"]',3,'Uç yüzleri üçgen olan cisim üçgen prizmaya benzer.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cisimler' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cisim-6','coktan_secmeli','Hangisi yuvarlanmaya daha uygundur?','["Küp","Küre","Kare prizma","Dikdörtgenler prizması"]',1,'Kürenin yuvarlak yüzeyi vardır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cisimler' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cisim-7','coktan_secmeli','Hangisinin düz yüzleri vardır?','["Küre yalnız","Hiçbiri","Sadece çember","Küp"]',3,'Küpün düz yüzleri vardır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cisimler' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cisim-8','coktan_secmeli','Silindirin günlük yaşam örneği hangisi olabilir?','["Futbol topu","İçecek kutusu","Kitap sayfası","Üçgen tabela"]',1,'İçecek kutusu silindire benzer.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cisimler' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cisim-9','coktan_secmeli','Küpün tüm yüzleri hangi şekle benzer?','["Üçgen","Çember","Beşgen","Kare"]',3,'Küpün yüzleri karedir.',2,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cisimler' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cisim-10','coktan_secmeli','Dikdörtgenler prizmasının yüzlerinde en çok hangi şekil görülür?','["Çember","Dikdörtgen","Üçgen","Yalnız kare"]',1,'Yüzleri dikdörtgen olabilir.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cisimler' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cisim-11','coktan_secmeli','Hangisi geometrik cisimdir?','["Üçgen","Kare","Çember","Küre"]',3,'Küre üç boyutlu geometrik cisimdir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cisimler' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-cisim-12','coktan_secmeli','Hangisi geometrik şekildir?','["Küp","Üçgen","Küre","Silindir"]',1,'Üçgen düzlemsel bir şekildir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-cisimler' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sekil-1','coktan_secmeli','Bir kare kaç kenarlıdır?','["3","5","0","4"]',3,'Karenin 4 kenarı vardır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sekil-2','coktan_secmeli','Bir üçgen kaç köşelidir?','["4","3","2","0"]',1,'Üçgenin 3 köşesi vardır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sekil-3','coktan_secmeli','Dikdörtgen kaç köşelidir?','["3","5","0","4"]',3,'Dikdörtgenin 4 köşesi vardır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sekil-4','coktan_secmeli','Çemberin köşesi var mıdır?','["Evet, 1","Hayır","Evet, 3","Evet, 4"]',1,'Çemberin köşesi yoktur.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sekil-5','coktan_secmeli','İki üçgen bir araya getirilerek yeni bir şekil oluşturulabilir mi?','["Hayır","Sadece renk değişir","Şekiller birleşmez","Evet"]',3,'Şekillerden yeni modeller oluşturulabilir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sekil-6','coktan_secmeli','Şeklin döndürülmesi onun kare olma özelliğini değiştirir mi?','["Evet","Hayır","Her zaman üçgen olur","Renge bağlı"]',1,'Döndürmek temel geometrik özelliği değiştirmez.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sekil-7','coktan_secmeli','Büyük bir kare ile küçük bir kare aynı şekil türü müdür?','["Hayır","Biri üçgendir","Biri çemberdir","Evet"]',3,'Boyut değişse de ikisi de karedir.',2,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sekil-8','coktan_secmeli','Hangisi 4 kenarlı değildir?','["Kare","Üçgen","Dikdörtgen","Kare biçimli kart"]',1,'Üçgen 3 kenarlıdır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sekil-9','coktan_secmeli','Bir çember büyütülürse köşe sayısı değişir mi?','["Evet, 4 olur","Evet, 3 olur","Evet, 1 olur","Hayır"]',3,'Boyut değişimi çemberin köşesiz olmasını değiştirmez.',2,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sekil-10','coktan_secmeli','Bir modelde 2 kare ve 1 üçgen kullanılabilir mi?','["Hayır","Evet","Sadece aynı şekiller kullanılır","Üçgen kullanılamaz"]',1,'Farklı şekiller birlikte kullanılabilir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sivi-1','coktan_secmeli','Bir sürahi 6 aynı bardak, diğeri 4 aynı bardak su alıyor. Hangisi daha çok alır?','["4 bardak alan","6 bardak alan","Eşit","Bilinemez"]',1,'Aynı ölçü birimiyle 6, 4''ten büyüktür.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sivi-2','coktan_secmeli','Sıvı miktarlarını karşılaştırırken neden aynı bardak kullanılmalıdır?','["Renk için","Sesi için","Bardağı ağırlaştırmak için","Adil karşılaştırma için"]',3,'Aynı birim ölçümü karşılaştırılabilir yapar.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sivi-3','coktan_secmeli','Bir kap 5 fincan, diğeri 8 fincan su alıyor. Hangisi daha az alır?','["8 fincan alan","5 fincan alan","Eşit","Bilinemez"]',1,'5, 8''den küçüktür.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sivi-4','coktan_secmeli','Bir şişenin kaç bardak su alacağını önce yaklaşık söylemeye ne denir?','["Kesin ölçüm","Çarpma","Sıralama","Tahmin"]',3,'Ölçmeden önce yaklaşık değer söylemek tahmindir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sivi-5','coktan_secmeli','Tahmini kontrol etmek için ne yaparız?','["Rengine bakarız","Aynı kapla ölçeriz","Kabı saklarız","Tahmini sileriz"]',1,'Ölçüm tahmini kontrol eder.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sivi-6','coktan_secmeli','3 bardak suya 2 bardak daha eklenirse kaç bardak olur?','["4","6","1","5"]',3,'3+2=5 bardak.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sivi-7','coktan_secmeli','7 bardaklık kaptan 2 bardak su alınırsa kaç bardaklık miktar kalır?','["4","5","6","9"]',1,'7-2=5.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-sivi-8','coktan_secmeli','Hangisi daha çok sıvı alabilir?','["Çay kaşığı","Şişe kapağı","Küçük fincan","Büyük sürahi"]',3,'Büyük sürahi genellikle daha çok sıvı alır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yon-1','coktan_secmeli','Başlangıçtan 2 adım ileri, 1 adım sağa gidildi. İkinci hareket hangisidir?','["2 adım ileri","1 adım sağa","1 adım sola","1 adım geri"]',1,'Yönergede ikinci hareket sağadır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yon' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yon-2','coktan_secmeli','Kroki üzerinde okul parkın sağındaysa park okulun neresindedir?','["Sağında","Üstünde","İçinde","Solunda"]',3,'Sağ-sol ilişkileri ters yönden düşünülür.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yon' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yon-3','coktan_secmeli','Ev marketin önündeyse market evin neresindedir?','["Önünde","Arkasında","Sağında","İçinde"]',1,'Ön-arka ilişkisi tersidir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yon' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yon-4','coktan_secmeli','Bir rotada önce kuzeye değil, sadece ''ileri'' deniyorsa ne gerekir?','["Renk seçmek","Ağırlık ölçmek","Sayı yazmak","Başlangıç yönünü bilmek"]',3,'İleri yönü başlangıç bakış yönüne bağlıdır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yon' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yon-5','coktan_secmeli','2 adım sola, 2 adım sağa giden kişi başlangıca yatay olarak döner mi?','["Hayır","Evet","Her zaman yukarı çıkar","Bilinemez"]',1,'Eşit miktarda zıt yön hareketi başlangıca döndürür.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yon' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yon-6','coktan_secmeli','Sağındaki kapıya ulaşmak için hangi yöne ilerlersin?','["Sola","Geri","Aşağı","Sağa"]',3,'Kapı sağdaysa sağa gidilir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yon' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yon-7','coktan_secmeli','Kroki ne için kullanılabilir?','["Kütle ölçmek","Yer ve yön bulmak","Saat okumak","Ses ölçmek"]',1,'Kroki konum ve yön bilgisi verir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yon' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yon-8','coktan_secmeli','Hedef başlangıcın 3 adım ilerisindeyse ne yapmalısın?','["3 adım geri","1 adım sağ","Yerinde kal","3 adım ileri"]',3,'Hedef ileri yöndedir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yon' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yon-9','coktan_secmeli','Bir nesne diğerinin sol üstündeyse hangi iki yön birlikte kullanılmıştır?','["Sağ ve alt","Sol ve üst","İleri ve geri","İç ve dış"]',1,'Sol üst iki yön bilgisini birleştirir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yon' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-yon-10','coktan_secmeli','Geriye 2 adım gidip ileri 1 adım gelirsen başlangıca göre kaç adım geridesin?','["2 adım","3 adım","Başlangıçtasın","1 adım"]',3,'2 geri - 1 ileri = 1 adım geride.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-yon' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-simetri-1','coktan_secmeli','Kelebeğin iki kanadı neyi çağrıştırır?','["Kütle","Zaman","Para","Simetri"]',3,'İki kanat benzer biçimde aynalanabilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-simetri-2','coktan_secmeli','Bir şekil katlandığında iki yarısı üst üste geliyorsa ne söylenebilir?','["Kesinlikle dairedir","Simetrik olabilir","Kütlesi artar","Rengi değişir"]',1,'Üst üste gelen yarılar simetri göstergesi olabilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-simetri-3','coktan_secmeli','Simetri çizgisi ne yapar?','["Şekli ağırlaştırır","Rengini değiştirir","Saat gösterir","Şekli birbirine karşılık gelen iki parçaya ayırabilir"]',3,'Simetri doğrusu aynalanan bölümleri ayırır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-simetri-4','coktan_secmeli','Kare dikey ortasından simetrik midir?','["Hayır","Evet","Sadece üçgense","Renge bağlı"]',1,'Karenin dikey simetri doğrusu vardır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-simetri-5','coktan_secmeli','Dikdörtgen dikey ortasından simetrik olabilir mi?','["Hayır","Yalnız çember simetriktir","Boyuta bağlı değil","Evet"]',3,'Dikdörtgenin simetri doğruları olabilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-simetri-6','coktan_secmeli','Rastgele çizilmiş yamuk bir şeklin iki yanı aynı değilse simetrik olmak zorunda mıdır?','["Evet","Hayır","Her şekil simetriktir","Renge bağlı"]',1,'İki tarafın karşılık gelmesi gerekir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-simetri-7','coktan_secmeli','Bir yüz resmi ortadan ikiye ayrıldığında iki taraf yaklaşık benzer olabilir. Bu hangi kavramdır?','["Toplama","Kütle","Para","Simetri"]',3,'Benzer iki taraf simetriyi düşündürür.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-simetri-8','coktan_secmeli','Simetrik desende sol taraftaki bir yıldızın karşısında ne beklenir?','["Rastgele bir nesne","Benzer konumda bir yıldız","Boşluk her zaman","Sayı"]',1,'Aynalanan tarafta karşılık gelen şekil bulunur.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-simetri-9','coktan_secmeli','Simetriyi kontrol etmenin bir yolu nedir?','["Tartmak","Saat tutmak","Sayıları toplamak","Katlayıp iki tarafı karşılaştırmak"]',3,'Katlama simetriyi görmeye yardım eder.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-simetri-10','coktan_secmeli','Bir şeklin yönü değişse de simetrik özelliği korunabilir mi?','["Hayır","Evet","Her zaman kaybolur","Sadece renkliyse"]',1,'Döndürme simetri özelliğini zorunlu olarak yok etmez.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-veri-1','coktan_secmeli','Kırmızı kalem 6, mavi kalem 4 ise hangisi daha fazladır?','["Mavi","Kırmızı","Eşit","Bilinemez"]',1,'6, 4''ten büyüktür.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-veri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-veri-2','coktan_secmeli','Kedi seven 8, köpek seven 5 öğrenci var. Fark kaçtır?','["2","5","13","3"]',3,'8-5=3.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-veri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-veri-3','coktan_secmeli','Çetelede ||||| kaç sayıyı gösterir?','["4","5","6","10"]',1,'Beş çizgi 5''i gösterir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-veri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-veri-4','coktan_secmeli','Sıklık tablosunda elma 7, armut 7 ise nasıl karşılaştırılır?','["Elma fazla","Armut fazla","Bilinemez","Eşit"]',3,'İki grup da 7''dir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-veri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-veri-5','coktan_secmeli','Şekil grafiğinde her ⭐ 1 oyu gösteriyor. ⭐⭐⭐⭐ kaç oy eder?','["3","4","5","8"]',1,'Dört yıldız 4 oy gösterir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-veri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-veri-6','coktan_secmeli','Bir grafikte kitap 9, dergi 3 ise toplam kaç seçim vardır?','["6","9","3","12"]',3,'9+3=12.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-veri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-veri-7','coktan_secmeli','İki veri grubunu karşılaştırırken neye bakabiliriz?','["Sadece renklerine","Sıklıklarına","Kâğıdın boyuna","Saatine"]',1,'Sıklık kaç kez görüldüğünü gösterir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-veri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-veri-8','coktan_secmeli','Çetele neden kullanılır?','["Resim boyamak için","Kütle ölçmek için","Saat okumak için","Verileri saymayı ve kaydetmeyi kolaylaştırmak için"]',3,'Çetele hızlı veri kaydı sağlar.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-veri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-veri-9','coktan_secmeli','Şekil grafiğinde sembollerin anlamı nereden anlaşılır?','["Rastgele","Grafiğin açıklama/anahtarından","Sadece renkten","Kâğıt kalınlığından"]',1,'Anahtar sembolün kaç birimi temsil ettiğini açıklar.',2,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-veri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-veri-10','coktan_secmeli','Bir veri araştırmasında ilk adımlardan biri nedir?','["Sonucu uydurmak","Veriyi silmek","Grafiği rastgele çizmek","Soru belirlemek"]',3,'Araştırma sorusu neyi öğrenmek istediğimizi belirler.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-veri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-veri-11','coktan_secmeli','Sınıfta en sevilen iki meyveyi öğrenmek için ne yapılabilir?','["Tahmin edip bırakmak","Öğrencilere sorup veri toplamak","Sadece bir kişiye bakmak","Hiç sormamak"]',1,'Veri toplamak araştırmayı destekler.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-veri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-veri-12','coktan_secmeli','Toplanan veriler neden düzenlenir?','["Kaybetmek için","Rengi değiştirmek için","Saymayı zorlaştırmak için","Kolay okumak ve karşılaştırmak için"]',3,'Tablo ve grafikler veriyi anlaşılır yapar.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-veri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-veri-13','coktan_secmeli','Grafikte A grubu 10, B grubu 6 ise A grubu kaç fazla?','["16","4","6","10"]',1,'10-6=4.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-veri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-veri-14','coktan_secmeli','Grafikte pazartesi 5, salı 8 kitap okunmuş. Hangi gün daha çok?','["Pazartesi","Eşit","Bilinemez","Salı"]',3,'8, 5''ten büyüktür.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-veri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-veri-15','coktan_secmeli','İki grubun toplamı için hangi işlem sık kullanılır?','["Çıkarma her zaman","Toplama","Bölme her zaman","Hiçbiri"]',1,'İki grup birleştirilirken toplama kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-veri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-veri-16','coktan_secmeli','İki grup arasındaki fark için hangi işlem kullanılabilir?','["Toplama her zaman","Saat okuma","Ölçme","Çıkarma"]',3,'Farkı bulmak için çıkarma yapılabilir.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-veri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-veri-17','coktan_secmeli','Bir grafikte 2 grup olması neyi sağlar?','["Her zaman sonucu eşit yapar","Karşılaştırmayı kolaylaştırır","Veriyi yok eder","Ölçmeyi engeller"]',1,'İki grup karşılaştırılabilir.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-veri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat2-veri-18','coktan_secmeli','Veri toplarken herkesin cevabı nasıl kaydedilmelidir?','["İstenildiği gibi değiştirilerek","Bazıları silinerek","Tahminle","Doğru ve düzenli"]',3,'Doğru kayıt güvenilir sonuç sağlar.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='mat2-veri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;
