SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'mat-sayilar-0-20','0''dan 20''ye Sayılar','0''dan 20''ye Sayılar','0''dan 20''ye kadar sayıları tanır, okur ve sıralar.','0, 1, 2, 3, ...',100,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='mat-sayilar-1' WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'mat-once-sonra','Önceki ve Sonraki Sayı','Önceki ve Sonraki Sayı','Bir sayının hemen önceki ve sonraki sayısını bulur.','7, 8, 9',110,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='mat-sayilar-1' WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'mat-karsilastirma','Sayıları Karşılaştırıyorum','Sayıları Karşılaştırıyorum','İki sayıyı büyüklüklerine göre karşılaştırır.','9, 6''dan büyüktür.',120,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='mat-sayilar-1' WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'mat-ritmik','Ritmik Sayıyorum','Ritmik Sayıyorum','İkişer, beşer ve onar ritmik sayar.','2, 4, 6, 8',130,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='mat-sayilar-1' WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'mat-oruntu','Örüntüyü Tamamlıyorum','Örüntüyü Tamamlıyorum','Sayı ve şekil örüntüsündeki kuralı fark eder.','2, 4, 6, 8',140,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='mat-sayilar-1' WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'mat-tahmin','Nesne Sayısını Tahmin Ediyorum','Nesne Sayısını Tahmin Ediyorum','Az sayıdaki nesnelerin miktarını tahmin eder ve sayarak kontrol eder.','Önce tahmin et, sonra say.',150,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='mat-sayilar-1' WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'mat-uzunluk','Uzunlukları Karşılaştırıyorum','Uzunlukları Karşılaştırıyorum','Nesneleri uzun-kısa olarak karşılaştırır ve standart olmayan araçlarla ölçer.','Kalem, silgiden daha uzundur.',200,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='mat-sayilar-2' WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'mat-kutle','Ağır ve Hafifi Karşılaştırıyorum','Ağır ve Hafifi Karşılaştırıyorum','Nesneleri ağır-hafif olarak karşılaştırır.','Kitap, kâğıttan daha ağırdır.',210,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='mat-sayilar-2' WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'mat-para','Paralarımızı Tanıyorum','Paralarımızı Tanıyorum','Türk lirasını tanır ve basit değer ilişkileri kurar.','5 TL + 5 TL = 10 TL',300,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='mat-sayilar-3' WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'mat-toplama','20''ye Kadar Toplama','20''ye Kadar Toplama','20''yi geçmeyen toplama işlemleri yapar.','7 + 5 = 12',400,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='mat-islemler' WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'mat-cikarma','20''ye Kadar Çıkarma','20''ye Kadar Çıkarma','20''den küçük sayılarla çıkarma işlemleri yapar.','13 - 4 = 9',410,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='mat-islemler' WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'mat-esitlik','Eşitlik ve Bilinmeyen','Eşitlik ve Bilinmeyen','Eşittir işaretini ve eksik sayıyı anlamlandırır.','5 + 3 = 8',420,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='mat-islemler' WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'mat-problem','Günlük Yaşam Problemleri','Günlük Yaşam Problemleri','Toplama ve çıkarma gerektiren kısa problemleri çözer.','3 elmaya 2 elma eklenirse 5 elma olur.',430,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='mat-islemler' WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'mat-yon-konum','Yön ve Konum','Yön ve Konum','Sağ-sol, ön-arka, üst-alt gibi konum ilişkilerini kullanır.','Kitap masanın üstündedir.',500,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='mat-geometri-1' WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'mat-sekiller','Geometrik Şekilleri Tanıyorum','Geometrik Şekilleri Tanıyorum','Üçgen, kare, dikdörtgen ve çemberi ayırt eder.','Karenin dört kenarı vardır.',600,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='mat-geometri-2' WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'mat-veri-okuma','Basit Verileri Okuyorum','Basit Verileri Okuyorum','Çetele, sıklık ve nesne grafiğindeki basit verileri yorumlar.','🍎🍎🍎 = 3 elma',700,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='mat-veri' WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-0','coktan_secmeli','Sepette hiç elma yok. Sepetteki elma sayısını hangi sayı gösterir?','["0","1","2","3"]',0,'Hiç nesne olmadığında miktarı 0 sayısı gösterir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-1','coktan_secmeli','🍎 Burada kaç tane var?','["2","1","0","3"]',1,'Nesneleri birer birer sayınca 1 tane olduğunu buluruz.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-2','coktan_secmeli','⭐⭐ Burada kaç tane var?','["3","1","2","4"]',2,'Nesneleri birer birer sayınca 2 tane olduğunu buluruz.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-3','coktan_secmeli','⚽⚽⚽ Burada kaç tane var?','["4","2","5","3"]',3,'Nesneleri birer birer sayınca 3 tane olduğunu buluruz.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-4','coktan_secmeli','🐟🐟🐟🐟 Burada kaç tane var?','["4","5","3","6"]',0,'Nesneleri birer birer sayınca 4 tane olduğunu buluruz.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-5','coktan_secmeli','🌼🌼🌼🌼🌼 Burada kaç tane var?','["6","5","4","7"]',1,'Nesneleri birer birer sayınca 5 tane olduğunu buluruz.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-6','coktan_secmeli','🍎🍎🍎🍎🍎🍎 Burada kaç tane var?','["7","5","6","8"]',2,'Nesneleri birer birer sayınca 6 tane olduğunu buluruz.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-7','coktan_secmeli','⭐⭐⭐⭐⭐⭐⭐ Burada kaç tane var?','["8","6","9","7"]',3,'Nesneleri birer birer sayınca 7 tane olduğunu buluruz.',1,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-8','coktan_secmeli','⚽⚽⚽⚽⚽⚽⚽⚽ Burada kaç tane var?','["8","9","7","10"]',0,'Nesneleri birer birer sayınca 8 tane olduğunu buluruz.',1,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-9','coktan_secmeli','🐟🐟🐟🐟🐟🐟🐟🐟🐟 Burada kaç tane var?','["10","9","8","11"]',1,'Nesneleri birer birer sayınca 9 tane olduğunu buluruz.',1,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-10','coktan_secmeli','Bir onluk kaç birlik eder?','["11","9","10","12"]',2,'Bir onluk, 10 birlikten oluşur.',1,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-11','coktan_secmeli','1 onluk ve 1 birlik birlikte hangi sayıyı oluşturur?','["12","10","13","11"]',3,'1 onluk 10''dur. 10 ile 1 birliği birleştirince 11 olur.',1,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-12','coktan_secmeli','1 onluk ve 2 birlik birlikte hangi sayıyı oluşturur?','["12","13","11","14"]',0,'1 onluk 10''dur. 10 ile 2 birliği birleştirince 12 olur.',1,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-13','coktan_secmeli','1 onluk ve 3 birlik birlikte hangi sayıyı oluşturur?','["14","13","12","15"]',1,'1 onluk 10''dur. 10 ile 3 birliği birleştirince 13 olur.',1,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-14','coktan_secmeli','1 onluk ve 4 birlik birlikte hangi sayıyı oluşturur?','["15","13","14","16"]',2,'1 onluk 10''dur. 10 ile 4 birliği birleştirince 14 olur.',1,15,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-15','coktan_secmeli','1 onluk ve 5 birlik birlikte hangi sayıyı oluşturur?','["16","14","17","15"]',3,'1 onluk 10''dur. 10 ile 5 birliği birleştirince 15 olur.',1,16,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-16','coktan_secmeli','1 onluk ve 6 birlik birlikte hangi sayıyı oluşturur?','["16","17","15","18"]',0,'1 onluk 10''dur. 10 ile 6 birliği birleştirince 16 olur.',1,17,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-17','coktan_secmeli','1 onluk ve 7 birlik birlikte hangi sayıyı oluşturur?','["18","17","16","19"]',1,'1 onluk 10''dur. 10 ile 7 birliği birleştirince 17 olur.',1,18,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-18','coktan_secmeli','1 onluk ve 8 birlik birlikte hangi sayıyı oluşturur?','["19","17","18","20"]',2,'1 onluk 10''dur. 10 ile 8 birliği birleştirince 18 olur.',1,19,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-19','coktan_secmeli','1 onluk ve 9 birlik birlikte hangi sayıyı oluşturur?','["20","18","17","19"]',3,'1 onluk 10''dur. 10 ile 9 birliği birleştirince 19 olur.',1,20,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-20','coktan_secmeli','1 onluk ve 10 birlik birlikte hangi sayıyı oluşturur?','["20","19","18","17"]',0,'1 onluk 10''dur. 10 ile 10 birliği birleştirince 20 olur.',1,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-say-1','coktan_secmeli','⭐ kaç tane vardır?','["0","2","1","3"]',2,'Nesneleri tek tek sayınca 1 tane olduğunu buluruz.',1,31,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-say-2','coktan_secmeli','⚽⚽ kaç tane vardır?','["1","3","4","2"]',3,'Nesneleri tek tek sayınca 2 tane olduğunu buluruz.',1,32,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-say-3','coktan_secmeli','🐟🐟🐟 kaç tane vardır?','["3","2","4","5"]',0,'Nesneleri tek tek sayınca 3 tane olduğunu buluruz.',1,33,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-say-4','coktan_secmeli','🌼🌼🌼🌼 kaç tane vardır?','["3","4","5","6"]',1,'Nesneleri tek tek sayınca 4 tane olduğunu buluruz.',1,34,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-say-5','coktan_secmeli','🍎🍎🍎🍎🍎 kaç tane vardır?','["4","6","5","7"]',2,'Nesneleri tek tek sayınca 5 tane olduğunu buluruz.',1,35,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-say-6','coktan_secmeli','⭐⭐⭐⭐⭐⭐ kaç tane vardır?','["5","7","8","6"]',3,'Nesneleri tek tek sayınca 6 tane olduğunu buluruz.',1,36,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-say-7','coktan_secmeli','⚽⚽⚽⚽⚽⚽⚽ kaç tane vardır?','["7","6","8","9"]',0,'Nesneleri tek tek sayınca 7 tane olduğunu buluruz.',1,37,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-say-8','coktan_secmeli','🐟🐟🐟🐟🐟🐟🐟🐟 kaç tane vardır?','["7","8","9","10"]',1,'Nesneleri tek tek sayınca 8 tane olduğunu buluruz.',1,38,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-say-9','coktan_secmeli','🌼🌼🌼🌼🌼🌼🌼🌼🌼 kaç tane vardır?','["8","10","9","11"]',2,'Nesneleri tek tek sayınca 9 tane olduğunu buluruz.',1,39,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-say-10','coktan_secmeli','🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎 kaç tane vardır?','["9","11","12","10"]',3,'Nesneleri tek tek sayınca 10 tane olduğunu buluruz.',1,40,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-say-11','coktan_secmeli','⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐ kaç tane vardır?','["11","10","12","13"]',0,'Nesneleri tek tek sayınca 11 tane olduğunu buluruz.',1,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-say-12','coktan_secmeli','⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽ kaç tane vardır?','["11","12","13","14"]',1,'Nesneleri tek tek sayınca 12 tane olduğunu buluruz.',1,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-say-13','coktan_secmeli','🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟 kaç tane vardır?','["12","14","13","15"]',2,'Nesneleri tek tek sayınca 13 tane olduğunu buluruz.',1,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-say-14','coktan_secmeli','🌼🌼🌼🌼🌼🌼🌼🌼🌼🌼🌼🌼🌼🌼 kaç tane vardır?','["13","15","16","14"]',3,'Nesneleri tek tek sayınca 14 tane olduğunu buluruz.',1,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-say-15','coktan_secmeli','🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎 kaç tane vardır?','["15","14","16","17"]',0,'Nesneleri tek tek sayınca 15 tane olduğunu buluruz.',1,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-1','coktan_secmeli','Sayı treninde 0, 1, 2 vagonları yan yana. 1''in hemen önündeki sayı hangisidir?','["2","0","3","4"]',1,'1''den bir adım geri gidince 0 sayısına geliriz.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-1','coktan_secmeli','Sayı yolunda 1''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["0","3","4","2"]',3,'1''den bir adım ileri gidince 2 sayısına ulaşırız.',1,31,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-2','coktan_secmeli','Sayı treninde 1, 2, 3 vagonları yan yana. 2''in hemen önündeki sayı hangisidir?','["3","0","1","4"]',2,'2''den bir adım geri gidince 1 sayısına geliriz.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-2','coktan_secmeli','Sayı yolunda 2''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["3","1","4","0"]',0,'2''den bir adım ileri gidince 3 sayısına ulaşırız.',1,32,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-3','coktan_secmeli','Sayı treninde 2, 3, 4 vagonları yan yana. 3''in hemen önündeki sayı hangisidir?','["4","1","5","2"]',3,'3''den bir adım geri gidince 2 sayısına geliriz.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-3','coktan_secmeli','Sayı yolunda 3''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["2","4","5","1"]',1,'3''den bir adım ileri gidince 4 sayısına ulaşırız.',1,33,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-4','coktan_secmeli','Sayı treninde 3, 4, 5 vagonları yan yana. 4''in hemen önündeki sayı hangisidir?','["3","5","2","6"]',0,'4''den bir adım geri gidince 3 sayısına geliriz.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-4','coktan_secmeli','Sayı yolunda 4''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["3","6","5","2"]',2,'4''den bir adım ileri gidince 5 sayısına ulaşırız.',1,34,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-5','coktan_secmeli','Sayı treninde 4, 5, 6 vagonları yan yana. 5''in hemen önündeki sayı hangisidir?','["6","4","3","7"]',1,'5''den bir adım geri gidince 4 sayısına geliriz.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-5','coktan_secmeli','Sayı yolunda 5''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["4","7","3","6"]',3,'5''den bir adım ileri gidince 6 sayısına ulaşırız.',1,35,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-6','coktan_secmeli','Sayı treninde 5, 6, 7 vagonları yan yana. 6''in hemen önündeki sayı hangisidir?','["7","4","5","8"]',2,'6''den bir adım geri gidince 5 sayısına geliriz.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-6','coktan_secmeli','Sayı yolunda 6''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["7","5","8","4"]',0,'6''den bir adım ileri gidince 7 sayısına ulaşırız.',1,36,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-7','coktan_secmeli','Sayı treninde 6, 7, 8 vagonları yan yana. 7''in hemen önündeki sayı hangisidir?','["8","5","9","6"]',3,'7''den bir adım geri gidince 6 sayısına geliriz.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-7','coktan_secmeli','Sayı yolunda 7''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["6","8","9","5"]',1,'7''den bir adım ileri gidince 8 sayısına ulaşırız.',1,37,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-8','coktan_secmeli','Sayı treninde 7, 8, 9 vagonları yan yana. 8''in hemen önündeki sayı hangisidir?','["7","9","6","10"]',0,'8''den bir adım geri gidince 7 sayısına geliriz.',1,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-8','coktan_secmeli','Sayı yolunda 8''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["7","10","9","6"]',2,'8''den bir adım ileri gidince 9 sayısına ulaşırız.',1,38,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-9','coktan_secmeli','Sayı treninde 8, 9, 10 vagonları yan yana. 9''in hemen önündeki sayı hangisidir?','["10","8","7","11"]',1,'9''den bir adım geri gidince 8 sayısına geliriz.',1,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-9','coktan_secmeli','Sayı yolunda 9''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["8","11","7","10"]',3,'9''den bir adım ileri gidince 10 sayısına ulaşırız.',1,39,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-10','coktan_secmeli','Sayı treninde 9, 10, 11 vagonları yan yana. 10''in hemen önündeki sayı hangisidir?','["11","8","9","12"]',2,'10''den bir adım geri gidince 9 sayısına geliriz.',1,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-10','coktan_secmeli','Sayı yolunda 10''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["11","9","12","8"]',0,'10''den bir adım ileri gidince 11 sayısına ulaşırız.',1,40,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-11','coktan_secmeli','Sayı treninde 10, 11, 12 vagonları yan yana. 11''in hemen önündeki sayı hangisidir?','["12","9","13","10"]',3,'11''den bir adım geri gidince 10 sayısına geliriz.',1,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-11','coktan_secmeli','Sayı yolunda 11''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["10","12","13","9"]',1,'11''den bir adım ileri gidince 12 sayısına ulaşırız.',1,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-12','coktan_secmeli','Sayı treninde 11, 12, 13 vagonları yan yana. 12''in hemen önündeki sayı hangisidir?','["11","13","10","14"]',0,'12''den bir adım geri gidince 11 sayısına geliriz.',1,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-12','coktan_secmeli','Sayı yolunda 12''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["11","14","13","10"]',2,'12''den bir adım ileri gidince 13 sayısına ulaşırız.',1,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-13','coktan_secmeli','Sayı treninde 12, 13, 14 vagonları yan yana. 13''in hemen önündeki sayı hangisidir?','["14","12","11","15"]',1,'13''den bir adım geri gidince 12 sayısına geliriz.',1,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-13','coktan_secmeli','Sayı yolunda 13''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["12","15","11","14"]',3,'13''den bir adım ileri gidince 14 sayısına ulaşırız.',1,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-14','coktan_secmeli','Sayı treninde 13, 14, 15 vagonları yan yana. 14''in hemen önündeki sayı hangisidir?','["15","12","13","16"]',2,'14''den bir adım geri gidince 13 sayısına geliriz.',1,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-14','coktan_secmeli','Sayı yolunda 14''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["15","13","16","12"]',0,'14''den bir adım ileri gidince 15 sayısına ulaşırız.',1,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-15','coktan_secmeli','Sayı treninde 14, 15, 16 vagonları yan yana. 15''in hemen önündeki sayı hangisidir?','["16","13","17","14"]',3,'15''den bir adım geri gidince 14 sayısına geliriz.',1,15,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-15','coktan_secmeli','Sayı yolunda 15''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["14","16","17","13"]',1,'15''den bir adım ileri gidince 16 sayısına ulaşırız.',1,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-16','coktan_secmeli','Sayı treninde 15, 16, 17 vagonları yan yana. 16''in hemen önündeki sayı hangisidir?','["15","17","14","18"]',0,'16''den bir adım geri gidince 15 sayısına geliriz.',1,16,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-16','coktan_secmeli','Sayı yolunda 16''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["15","18","17","14"]',2,'16''den bir adım ileri gidince 17 sayısına ulaşırız.',1,46,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-17','coktan_secmeli','Sayı treninde 16, 17, 18 vagonları yan yana. 17''in hemen önündeki sayı hangisidir?','["18","16","15","19"]',1,'17''den bir adım geri gidince 16 sayısına geliriz.',1,17,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-17','coktan_secmeli','Sayı yolunda 17''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["16","19","15","18"]',3,'17''den bir adım ileri gidince 18 sayısına ulaşırız.',1,47,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-18','coktan_secmeli','Sayı treninde 17, 18, 19 vagonları yan yana. 18''in hemen önündeki sayı hangisidir?','["19","16","17","20"]',2,'18''den bir adım geri gidince 17 sayısına geliriz.',1,18,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-18','coktan_secmeli','Sayı yolunda 18''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["19","17","20","16"]',0,'18''den bir adım ileri gidince 19 sayısına ulaşırız.',1,48,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-19','coktan_secmeli','Sayı treninde 18, 19, 20 vagonları yan yana. 19''in hemen önündeki sayı hangisidir?','["20","17","19","18"]',3,'19''den bir adım geri gidince 18 sayısına geliriz.',1,19,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-19','coktan_secmeli','Sayı yolunda 19''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?','["18","20","17","19"]',1,'19''den bir adım ileri gidince 20 sayısına ulaşırız.',1,49,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-1','coktan_secmeli','Bir kutuda 1 boncuk, diğer kutuda 2 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["1","İkisi eşit","Bilinemez","2"]',3,'2, 1''den büyüktür; daha çok boncuğu gösterir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-1','coktan_secmeli','Bir tabakta 1 kurabiye, diğerinde 2 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["2","1","İkisi eşit","Bilinemez"]',1,'1, 2''den küçüktür; daha az kurabiyeyi gösterir.',1,51,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-2','coktan_secmeli','Bir kutuda 1 boncuk, diğer kutuda 4 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["1","4","İkisi eşit","Bilinemez"]',1,'4, 1''den büyüktür; daha çok boncuğu gösterir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-2','coktan_secmeli','Bir tabakta 1 kurabiye, diğerinde 4 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["4","İkisi eşit","Bilinemez","1"]',3,'1, 4''den küçüktür; daha az kurabiyeyi gösterir.',1,52,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-3','coktan_secmeli','Bir kutuda 1 boncuk, diğer kutuda 6 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["1","İkisi eşit","Bilinemez","6"]',3,'6, 1''den büyüktür; daha çok boncuğu gösterir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-3','coktan_secmeli','Bir tabakta 1 kurabiye, diğerinde 6 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["6","1","İkisi eşit","Bilinemez"]',1,'1, 6''den küçüktür; daha az kurabiyeyi gösterir.',1,53,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-4','coktan_secmeli','Bir kutuda 3 boncuk, diğer kutuda 4 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["3","İkisi eşit","Bilinemez","4"]',3,'4, 3''den büyüktür; daha çok boncuğu gösterir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-4','coktan_secmeli','Bir tabakta 3 kurabiye, diğerinde 4 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["4","3","İkisi eşit","Bilinemez"]',1,'3, 4''den küçüktür; daha az kurabiyeyi gösterir.',1,54,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-5','coktan_secmeli','Bir kutuda 3 boncuk, diğer kutuda 6 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["3","6","İkisi eşit","Bilinemez"]',1,'6, 3''den büyüktür; daha çok boncuğu gösterir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-5','coktan_secmeli','Bir tabakta 3 kurabiye, diğerinde 6 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["6","İkisi eşit","Bilinemez","3"]',3,'3, 6''den küçüktür; daha az kurabiyeyi gösterir.',1,55,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-6','coktan_secmeli','Bir kutuda 3 boncuk, diğer kutuda 8 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["3","İkisi eşit","Bilinemez","8"]',3,'8, 3''den büyüktür; daha çok boncuğu gösterir.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-6','coktan_secmeli','Bir tabakta 3 kurabiye, diğerinde 8 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["8","3","İkisi eşit","Bilinemez"]',1,'3, 8''den küçüktür; daha az kurabiyeyi gösterir.',1,56,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-7','coktan_secmeli','Bir kutuda 5 boncuk, diğer kutuda 6 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["5","İkisi eşit","Bilinemez","6"]',3,'6, 5''den büyüktür; daha çok boncuğu gösterir.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-7','coktan_secmeli','Bir tabakta 5 kurabiye, diğerinde 6 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["6","5","İkisi eşit","Bilinemez"]',1,'5, 6''den küçüktür; daha az kurabiyeyi gösterir.',1,57,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-8','coktan_secmeli','Bir kutuda 5 boncuk, diğer kutuda 8 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["5","8","İkisi eşit","Bilinemez"]',1,'8, 5''den büyüktür; daha çok boncuğu gösterir.',1,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-8','coktan_secmeli','Bir tabakta 5 kurabiye, diğerinde 8 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["8","İkisi eşit","Bilinemez","5"]',3,'5, 8''den küçüktür; daha az kurabiyeyi gösterir.',1,58,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-9','coktan_secmeli','Bir kutuda 5 boncuk, diğer kutuda 10 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["5","İkisi eşit","Bilinemez","10"]',3,'10, 5''den büyüktür; daha çok boncuğu gösterir.',1,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-9','coktan_secmeli','Bir tabakta 5 kurabiye, diğerinde 10 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["10","5","İkisi eşit","Bilinemez"]',1,'5, 10''den küçüktür; daha az kurabiyeyi gösterir.',1,59,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-10','coktan_secmeli','Bir kutuda 7 boncuk, diğer kutuda 8 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["7","İkisi eşit","Bilinemez","8"]',3,'8, 7''den büyüktür; daha çok boncuğu gösterir.',1,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-10','coktan_secmeli','Bir tabakta 7 kurabiye, diğerinde 8 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["8","7","İkisi eşit","Bilinemez"]',1,'7, 8''den küçüktür; daha az kurabiyeyi gösterir.',1,60,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-11','coktan_secmeli','Bir kutuda 7 boncuk, diğer kutuda 10 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["7","10","İkisi eşit","Bilinemez"]',1,'10, 7''den büyüktür; daha çok boncuğu gösterir.',1,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-11','coktan_secmeli','Bir tabakta 7 kurabiye, diğerinde 10 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["10","İkisi eşit","Bilinemez","7"]',3,'7, 10''den küçüktür; daha az kurabiyeyi gösterir.',1,61,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-12','coktan_secmeli','Bir kutuda 7 boncuk, diğer kutuda 12 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["7","İkisi eşit","Bilinemez","12"]',3,'12, 7''den büyüktür; daha çok boncuğu gösterir.',1,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-12','coktan_secmeli','Bir tabakta 7 kurabiye, diğerinde 12 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["12","7","İkisi eşit","Bilinemez"]',1,'7, 12''den küçüktür; daha az kurabiyeyi gösterir.',1,62,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-13','coktan_secmeli','Bir kutuda 9 boncuk, diğer kutuda 10 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["9","İkisi eşit","Bilinemez","10"]',3,'10, 9''den büyüktür; daha çok boncuğu gösterir.',1,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-13','coktan_secmeli','Bir tabakta 9 kurabiye, diğerinde 10 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["10","9","İkisi eşit","Bilinemez"]',1,'9, 10''den küçüktür; daha az kurabiyeyi gösterir.',1,63,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-14','coktan_secmeli','Bir kutuda 9 boncuk, diğer kutuda 12 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["9","12","İkisi eşit","Bilinemez"]',1,'12, 9''den büyüktür; daha çok boncuğu gösterir.',1,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-14','coktan_secmeli','Bir tabakta 9 kurabiye, diğerinde 12 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["12","İkisi eşit","Bilinemez","9"]',3,'9, 12''den küçüktür; daha az kurabiyeyi gösterir.',1,64,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-15','coktan_secmeli','Bir kutuda 9 boncuk, diğer kutuda 14 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["9","İkisi eşit","Bilinemez","14"]',3,'14, 9''den büyüktür; daha çok boncuğu gösterir.',1,15,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-15','coktan_secmeli','Bir tabakta 9 kurabiye, diğerinde 14 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["14","9","İkisi eşit","Bilinemez"]',1,'9, 14''den küçüktür; daha az kurabiyeyi gösterir.',1,65,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-16','coktan_secmeli','Bir kutuda 11 boncuk, diğer kutuda 12 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["11","İkisi eşit","Bilinemez","12"]',3,'12, 11''den büyüktür; daha çok boncuğu gösterir.',1,16,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-16','coktan_secmeli','Bir tabakta 11 kurabiye, diğerinde 12 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["12","11","İkisi eşit","Bilinemez"]',1,'11, 12''den küçüktür; daha az kurabiyeyi gösterir.',1,66,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-17','coktan_secmeli','Bir kutuda 11 boncuk, diğer kutuda 14 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["11","14","İkisi eşit","Bilinemez"]',1,'14, 11''den büyüktür; daha çok boncuğu gösterir.',1,17,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-17','coktan_secmeli','Bir tabakta 11 kurabiye, diğerinde 14 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["14","İkisi eşit","Bilinemez","11"]',3,'11, 14''den küçüktür; daha az kurabiyeyi gösterir.',1,67,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-18','coktan_secmeli','Bir kutuda 11 boncuk, diğer kutuda 16 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["11","İkisi eşit","Bilinemez","16"]',3,'16, 11''den büyüktür; daha çok boncuğu gösterir.',1,18,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-18','coktan_secmeli','Bir tabakta 11 kurabiye, diğerinde 16 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["16","11","İkisi eşit","Bilinemez"]',1,'11, 16''den küçüktür; daha az kurabiyeyi gösterir.',1,68,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-19','coktan_secmeli','Bir kutuda 13 boncuk, diğer kutuda 14 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["13","İkisi eşit","Bilinemez","14"]',3,'14, 13''den büyüktür; daha çok boncuğu gösterir.',1,19,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-19','coktan_secmeli','Bir tabakta 13 kurabiye, diğerinde 14 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["14","13","İkisi eşit","Bilinemez"]',1,'13, 14''den küçüktür; daha az kurabiyeyi gösterir.',1,69,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-20','coktan_secmeli','Bir kutuda 13 boncuk, diğer kutuda 16 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["13","16","İkisi eşit","Bilinemez"]',1,'16, 13''den büyüktür; daha çok boncuğu gösterir.',1,20,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-20','coktan_secmeli','Bir tabakta 13 kurabiye, diğerinde 16 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["16","İkisi eşit","Bilinemez","13"]',3,'13, 16''den küçüktür; daha az kurabiyeyi gösterir.',1,70,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-21','coktan_secmeli','Bir kutuda 13 boncuk, diğer kutuda 18 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["13","İkisi eşit","Bilinemez","18"]',3,'18, 13''den büyüktür; daha çok boncuğu gösterir.',1,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-21','coktan_secmeli','Bir tabakta 13 kurabiye, diğerinde 18 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["18","13","İkisi eşit","Bilinemez"]',1,'13, 18''den küçüktür; daha az kurabiyeyi gösterir.',1,71,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-22','coktan_secmeli','Bir kutuda 15 boncuk, diğer kutuda 16 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["15","İkisi eşit","Bilinemez","16"]',3,'16, 15''den büyüktür; daha çok boncuğu gösterir.',1,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-22','coktan_secmeli','Bir tabakta 15 kurabiye, diğerinde 16 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["16","15","İkisi eşit","Bilinemez"]',1,'15, 16''den küçüktür; daha az kurabiyeyi gösterir.',1,72,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-23','coktan_secmeli','Bir kutuda 15 boncuk, diğer kutuda 18 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["15","18","İkisi eşit","Bilinemez"]',1,'18, 15''den büyüktür; daha çok boncuğu gösterir.',1,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-23','coktan_secmeli','Bir tabakta 15 kurabiye, diğerinde 18 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["18","İkisi eşit","Bilinemez","15"]',3,'15, 18''den küçüktür; daha az kurabiyeyi gösterir.',1,73,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-24','coktan_secmeli','Bir kutuda 15 boncuk, diğer kutuda 20 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?','["15","İkisi eşit","Bilinemez","20"]',3,'20, 15''den büyüktür; daha çok boncuğu gösterir.',1,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-24','coktan_secmeli','Bir tabakta 15 kurabiye, diğerinde 20 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?','["20","15","İkisi eşit","Bilinemez"]',1,'15, 20''den küçüktür; daha az kurabiyeyi gösterir.',1,74,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-ritmik-1','coktan_secmeli','Ritmik saymayı tamamla: 2, 4, 6, __','["8","9","6","13"]',0,'Kuralı sürdürünce 8 gelir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-ritmik-2','coktan_secmeli','Ritmik saymayı tamamla: 4, 6, 8, __','["11","10","8","15"]',1,'Kuralı sürdürünce 10 gelir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-ritmik-3','coktan_secmeli','Ritmik saymayı tamamla: 6, 8, 10, __','["13","10","12","17"]',2,'Kuralı sürdürünce 12 gelir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-ritmik-4','coktan_secmeli','Ritmik saymayı tamamla: 10, 12, 14, __','["17","14","21","16"]',3,'Kuralı sürdürünce 16 gelir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-ritmik-5','coktan_secmeli','Ritmik saymayı tamamla: 12, 14, 16, __','["18","19","16","23"]',0,'Kuralı sürdürünce 18 gelir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-ritmik-6','coktan_secmeli','Ritmik saymayı tamamla: 5, 10, __, 20','["16","15","13","20"]',1,'Kuralı sürdürünce 15 gelir.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-ritmik-7','coktan_secmeli','Ritmik saymayı tamamla: 10, 15, __','["21","18","20","25"]',2,'Kuralı sürdürünce 20 gelir.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-ritmik-8','coktan_secmeli','Ritmik saymayı tamamla: 0, 5, 10, __','["16","13","20","15"]',3,'Kuralı sürdürünce 15 gelir.',1,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-ritmik-9','coktan_secmeli','Ritmik saymayı tamamla: 20, 15, 10, __','["5","6","3","10"]',0,'Kuralı sürdürünce 5 gelir.',1,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-ritmik-10','coktan_secmeli','Ritmik saymayı tamamla: 10, 20, 30, __','["41","40","38","45"]',1,'Kuralı sürdürünce 40 gelir.',2,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-ritmik-11','coktan_secmeli','Ritmik saymayı tamamla: 20, 30, 40, __','["51","48","50","55"]',2,'Kuralı sürdürünce 50 gelir.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-ritmik-12','coktan_secmeli','Ritmik saymayı tamamla: 50, 60, 70, __','["81","78","85","80"]',3,'Kuralı sürdürünce 80 gelir.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-ritmik-13','coktan_secmeli','Ritmik saymayı tamamla: 70, 80, 90, __','["100","98","95","99"]',0,'Kuralı sürdürünce 100 gelir.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-ritmik-14','coktan_secmeli','Ritmik saymayı tamamla: 100, 90, 80, __','["71","70","68","75"]',1,'Kuralı sürdürünce 70 gelir.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-ritmik-15','coktan_secmeli','Ritmik saymayı tamamla: 40, 30, 20, __','["11","8","10","15"]',2,'Kuralı sürdürünce 10 gelir.',2,15,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-ritmik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-oruntu-1','coktan_secmeli','Örüntüyü tamamla: 1, 3, 5, __','["8","7","6","9"]',1,'Örüntünün kuralına göre 7 gelir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-oruntu-2','coktan_secmeli','Örüntüyü tamamla: 2, 4, 6, __','["9","7","8","10"]',2,'Örüntünün kuralına göre 8 gelir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-oruntu-3','coktan_secmeli','Örüntüyü tamamla: 5, 7, 9, __','["12","10","13","11"]',3,'Örüntünün kuralına göre 11 gelir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-oruntu-4','coktan_secmeli','Örüntüyü tamamla: 10, 8, 6, __','["4","5","3","6"]',0,'Örüntünün kuralına göre 4 gelir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-oruntu-5','coktan_secmeli','Örüntüyü tamamla: 3, 6, 9, __','["13","12","11","14"]',1,'Örüntünün kuralına göre 12 gelir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-oruntu-6','coktan_secmeli','Örüntüyü tamamla: 4, 8, 12, __','["17","15","16","18"]',2,'Örüntünün kuralına göre 16 gelir.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-oruntu-7','coktan_secmeli','Örüntüyü tamamla: 20, 18, 16, __','["15","13","16","14"]',3,'Örüntünün kuralına göre 14 gelir.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-oruntu-8','coktan_secmeli','Örüntüyü tamamla: 1, 2, 1, 2, __','["1","2","0","3"]',0,'Örüntünün kuralına göre 1 gelir.',1,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-oruntu-9','coktan_secmeli','Örüntüyü tamamla: 2, 5, 2, 5, __','["3","2","1","4"]',1,'Örüntünün kuralına göre 2 gelir.',2,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-oruntu-10','coktan_secmeli','Örüntüyü tamamla: 5, 10, 15, __','["19","18","20","17"]',2,'Örüntünün kuralına göre 20 gelir.',2,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-oruntu-11','coktan_secmeli','Örüntüyü tamamla: 0, 2, 4, 6, __','["9","7","10","8"]',3,'Örüntünün kuralına göre 8 gelir.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-oruntu-12','coktan_secmeli','Örüntüyü tamamla: 18, 16, 14, __','["12","13","11","14"]',0,'Örüntünün kuralına göre 12 gelir.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-tahmin-1','coktan_secmeli','⭐⭐⭐⭐⭐ Bu gruba hızlıca baktığında yaklaşık kaç tane görüyorsun?','["5","15","20","1"]',0,'Önce tahmin ederiz, sonra sayarak kontrol ederiz. Burada 5 tane vardır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-tahmin-2','coktan_secmeli','🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 Bu gruba hızlıca baktığında yaklaşık kaç tane görüyorsun?','["3","10","18","1"]',1,'Önce tahmin ederiz, sonra sayarak kontrol ederiz. Burada 10 tane vardır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-tahmin-3','coktan_secmeli','🍎🍎🍎🍎🍎🍎🍎 Bu gruba hızlıca baktığında yaklaşık kaç tane görüyorsun?','["17","2","7","20"]',2,'Önce tahmin ederiz, sonra sayarak kontrol ederiz. Burada 7 tane vardır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-tahmin-4','coktan_secmeli','🌼🌼 Bu gruba hızlıca baktığında yaklaşık kaç tane görüyorsun?','["4","6","8","2"]',3,'Önce tahmin ederiz, sonra sayarak kontrol ederiz. Burada 2 tane vardır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-tahmin-5','coktan_secmeli','⭐⭐⭐ Bu gruba hızlıca baktığında yaklaşık kaç tane görüyorsun?','["3","2","4","5"]',0,'Önce tahmin ederiz, sonra sayarak kontrol ederiz. Burada 3 tane vardır.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-tahmin-6','coktan_secmeli','🔵🔵🔵🔵 Bu gruba hızlıca baktığında yaklaşık kaç tane görüyorsun?','["14","4","2","8"]',1,'Önce tahmin ederiz, sonra sayarak kontrol ederiz. Burada 4 tane vardır.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-tahmin-7','coktan_secmeli','🍎🍎 Bu gruba hızlıca baktığında yaklaşık kaç tane görüyorsun?','["1","4","2","6"]',2,'Önce tahmin ederiz, sonra sayarak kontrol ederiz. Burada 2 tane vardır.',2,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-tahmin-8','coktan_secmeli','🌼🌼🌼🌼 Bu gruba hızlıca baktığında yaklaşık kaç tane görüyorsun?','["2","6","8","4"]',3,'Önce tahmin ederiz, sonra sayarak kontrol ederiz. Burada 4 tane vardır.',2,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-uzunluk-1','coktan_secmeli','30 cm''lik bir cetvel ile küçük bir silgiyi karşılaştırıyoruz. Hangisi daha uzundur?','["Cetvel","Silgi","Ataş","Düğme"]',0,'Cetvel, küçük bir silgiden daha uzundur.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-uzunluk-2','coktan_secmeli','Kalem ve silginin uçlarını aynı hizaya getirdik. Kalem daha ileri uzanıyor. Hangisi daha uzundur?','["Silgi daha uzundur.","Kalem daha uzundur.","Boyları eşittir.","Bilinemez."]',1,'Uçları aynı hizadayken daha ileri uzanan kalem daha uzundur.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-uzunluk-3','coktan_secmeli','Masayı kaç karış olduğunu sayarak ölçmek hangi tür ölçmedir?','["Para ölçme","Kütle ölçme","Standart olmayan ölçme","Zaman ölçme"]',2,'Karış kişiden kişiye değişebildiği için standart olmayan bir ölçme aracıdır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-uzunluk-4','coktan_secmeli','Kitabın uzunluğunu standart olmayan bir araçla ölçmek için ne yapabiliriz?','["Su doldurarak","Tartarak","Saat tutarak","Ataşları yan yana dizerek"]',3,'Aynı boydaki ataşları boşluk bırakmadan yan yana dizerek uzunluğu karşılaştırabiliriz.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-uzunluk-5','coktan_secmeli','İki ipin boyunu karşılaştırırken ne yapabiliriz?','["Uçlarını aynı hizaya getiririz.","Rengine bakarız.","Birini saklarız.","Ağırlığını ölçeriz."]',0,'Uçları aynı hizaya getirmek uygundur.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-uzunluk-6','coktan_secmeli','Ayak adımıyla sınıfın uzunluğunu ölçmek neye örnektir?','["Para saymaya","Standart olmayan ölçmeye","Kütle ölçmeye","Zaman ölçmeye"]',1,'Adım standart olmayan ölçümdür.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-uzunluk-7','coktan_secmeli','Bir nesne 5 ataş, diğeri 8 ataş uzunluğundaysa hangisi daha uzundur?','["5 ataş olan","İkisi eşit","8 ataş olan","Bilinemez"]',2,'8 ataş daha uzundur.',2,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-uzunluk-8','coktan_secmeli','Hangisi genellikle daha kısadır?','["Sınıf kapısı","Tahta","Masa","Silgi"]',3,'Silgi genellikle daha kısadır.',2,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kutle-1','coktan_secmeli','Bir ders kitabı ile tek bir kâğıt yaprağını elinde karşılaştırırsan hangisi daha ağır hissedilir?','["Kitap","Kâğıt yaprak","Tüy","Ataş"]',0,'Ders kitabı tek bir kâğıt yaprağından daha ağırdır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kutle-2','coktan_secmeli','Karpuz ile elmayı karşılaştırırsak hangisi genellikle daha ağırdır?','["Elma","Karpuz","Eşittir","Bilinemez"]',1,'Karpuz genellikle daha ağırdır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kutle-3','coktan_secmeli','Bir nesnenin ağır ya da hafif olması hangi özelliğiyle ilgilidir?','["Renk","Şekil","Kütle","Ad"]',2,'Ağır ve hafif karşılaştırması kütle ile ilgilidir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kutle-4','coktan_secmeli','Aynı çanta ne zaman daha ağır olur?','["Boşken","Rengine göre","Her zaman aynı","Kitaplarla doluyken"]',3,'Çantaya kitaplar koyulduğunda kütlesi artar ve daha ağır olur.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kutle-5','coktan_secmeli','Hangisi genellikle daha hafiftir?','["Balon","Karpuz","Masa","Sandalye"]',0,'Balon genellikle daha hafiftir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kutle-6','coktan_secmeli','Bir elde kitap, diğerinde tek kalem varsa hangi el daha ağır hissedilir?','["Kalem olan el","Kitap olan el","İkisi kesin eşit","Hiçbiri"]',1,'Kitap genellikle ağırdır.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kutle-7','coktan_secmeli','Aynı boy iki kutudan biri dolu biri boşsa hangisi genellikle daha ağırdır?','["Boş kutu","Kesin eşit","Dolu kutu","Boyu büyük olan"]',2,'Dolu kutu ağırdır.',2,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kutle-8','coktan_secmeli','Ağır bir nesneyi taşırken en güvenli davranış hangisidir?','["Koşarak taşımak","Fırlatmak","Tek parmakla kaldırmak","Bir büyükten yardım istemek"]',3,'Yardım istemek daha güvenlidir.',2,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-para-1','coktan_secmeli','Hangi paranın değeri daha büyüktür?','["20 TL","5 TL","10 TL","1 TL"]',0,'20 TL en büyüktür.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-para-2','coktan_secmeli','İki tane 5 TL toplam kaç TL eder?','["5 TL","10 TL","15 TL","20 TL"]',1,'5+5=10 TL.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-para-3','coktan_secmeli','Bir tane 10 TL ile iki tane 5 TL''nin değeri nasıldır?','["10 TL daha fazladır","İki 5 TL daha fazladır","Eşittir","Bilinemez"]',2,'İki 5 TL de 10 TL eder.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-para-4','coktan_secmeli','5 TL''lik kalem için 10 TL yeter mi?','["Hayır","1 TL eksik","Bilinemez","Evet"]',3,'10 TL yeterlidir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-para-5','coktan_secmeli','1 TL + 1 TL + 1 TL kaç TL eder?','["3 TL","1 TL","2 TL","4 TL"]',0,'Toplam 3 TL eder.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-para-6','coktan_secmeli','Hangisi 10 TL eder?','["5 TL + 1 TL","5 TL + 5 TL","1 TL + 1 TL","20 TL"]',1,'5+5=10 TL.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-para-7','coktan_secmeli','20 TL, 10 TL''den kaç TL fazladır?','["5 TL","20 TL","10 TL","1 TL"]',2,'20-10=10 TL.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-para-8','coktan_secmeli','8 TL''lik oyuncak için 10 TL yeter mi?','["Hayır","Tam 8 TL olmalı","Bilinemez","Evet"]',3,'10 TL yeterlidir.',2,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-para-9','coktan_secmeli','Hangisinin değeri en küçüktür?','["1 TL","5 TL","10 TL","20 TL"]',0,'1 TL en küçüktür.',2,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-para-10','coktan_secmeli','10 TL iki eşit parçaya ayrılırsa her parça kaç TL olur?','["2 TL","5 TL","10 TL","1 TL"]',1,'5+5=10 TL.',2,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-1','coktan_secmeli','Ece''nin 1 çıkartması vardı. 1 tane daha aldı. Şimdi kaç çıkartması var?','["3","1","4","2"]',3,'1 ile 1''yi bir araya getirince 2 olur.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-2','coktan_secmeli','Sayı yolunda 1''den başla, 2 adım ileri git. Hangi sayıya ulaşırsın?','["3","4","2","5"]',0,'1 ile 2''yi bir araya getirince 3 olur.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-3','coktan_secmeli','Kutuda 1 kırmızı ve 3 mavi boncuk var. Toplam kaç boncuk var?','["5","4","3","6"]',1,'1 ile 3''yi bir araya getirince 4 olur.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-4','coktan_secmeli','Masada 1 kalem vardı. Yanına 4 kalem daha koyduk. Masada kaç kalem oldu?','["6","4","5","7"]',2,'1 ile 4''yi bir araya getirince 5 olur.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-5','coktan_secmeli','Bir sepette 1, diğer sepette 5 elma var. İki sepette toplam kaç elma var?','["7","5","8","6"]',3,'1 ile 5''yi bir araya getirince 6 olur.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-6','coktan_secmeli','Ece''nin 1 çıkartması vardı. 6 tane daha aldı. Şimdi kaç çıkartması var?','["7","8","6","9"]',0,'1 ile 6''yi bir araya getirince 7 olur.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-7','coktan_secmeli','Sayı yolunda 1''den başla, 7 adım ileri git. Hangi sayıya ulaşırsın?','["9","8","7","10"]',1,'1 ile 7''yi bir araya getirince 8 olur.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-8','coktan_secmeli','Kutuda 1 kırmızı ve 8 mavi boncuk var. Toplam kaç boncuk var?','["10","8","9","11"]',2,'1 ile 8''yi bir araya getirince 9 olur.',1,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-9','coktan_secmeli','Masada 1 kalem vardı. Yanına 9 kalem daha koyduk. Masada kaç kalem oldu?','["11","9","12","10"]',3,'1 ile 9''yi bir araya getirince 10 olur.',1,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-10','coktan_secmeli','Bir sepette 1, diğer sepette 10 elma var. İki sepette toplam kaç elma var?','["11","12","10","13"]',0,'1 ile 10''yi bir araya getirince 11 olur.',2,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-11','coktan_secmeli','Ece''nin 2 çıkartması vardı. 1 tane daha aldı. Şimdi kaç çıkartması var?','["4","3","2","5"]',1,'2 ile 1''yi bir araya getirince 3 olur.',1,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-12','coktan_secmeli','Sayı yolunda 2''den başla, 2 adım ileri git. Hangi sayıya ulaşırsın?','["5","3","4","6"]',2,'2 ile 2''yi bir araya getirince 4 olur.',1,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-13','coktan_secmeli','Kutuda 2 kırmızı ve 3 mavi boncuk var. Toplam kaç boncuk var?','["6","4","7","5"]',3,'2 ile 3''yi bir araya getirince 5 olur.',1,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-14','coktan_secmeli','Masada 2 kalem vardı. Yanına 4 kalem daha koyduk. Masada kaç kalem oldu?','["6","7","5","8"]',0,'2 ile 4''yi bir araya getirince 6 olur.',1,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-15','coktan_secmeli','Bir sepette 2, diğer sepette 5 elma var. İki sepette toplam kaç elma var?','["8","7","6","9"]',1,'2 ile 5''yi bir araya getirince 7 olur.',1,15,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-16','coktan_secmeli','Ece''nin 2 çıkartması vardı. 6 tane daha aldı. Şimdi kaç çıkartması var?','["9","7","8","10"]',2,'2 ile 6''yi bir araya getirince 8 olur.',1,16,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-17','coktan_secmeli','Sayı yolunda 2''den başla, 7 adım ileri git. Hangi sayıya ulaşırsın?','["10","8","11","9"]',3,'2 ile 7''yi bir araya getirince 9 olur.',1,17,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-18','coktan_secmeli','Kutuda 2 kırmızı ve 8 mavi boncuk var. Toplam kaç boncuk var?','["10","11","9","12"]',0,'2 ile 8''yi bir araya getirince 10 olur.',1,18,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-19','coktan_secmeli','Masada 2 kalem vardı. Yanına 9 kalem daha koyduk. Masada kaç kalem oldu?','["12","11","10","13"]',1,'2 ile 9''yi bir araya getirince 11 olur.',2,19,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-20','coktan_secmeli','Bir sepette 2, diğer sepette 10 elma var. İki sepette toplam kaç elma var?','["13","11","12","14"]',2,'2 ile 10''yi bir araya getirince 12 olur.',2,20,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-21','coktan_secmeli','Ece''nin 3 çıkartması vardı. 1 tane daha aldı. Şimdi kaç çıkartması var?','["5","3","6","4"]',3,'3 ile 1''yi bir araya getirince 4 olur.',1,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-22','coktan_secmeli','Sayı yolunda 3''den başla, 2 adım ileri git. Hangi sayıya ulaşırsın?','["5","6","4","7"]',0,'3 ile 2''yi bir araya getirince 5 olur.',1,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-23','coktan_secmeli','Kutuda 3 kırmızı ve 3 mavi boncuk var. Toplam kaç boncuk var?','["7","6","5","8"]',1,'3 ile 3''yi bir araya getirince 6 olur.',1,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-24','coktan_secmeli','Masada 3 kalem vardı. Yanına 4 kalem daha koyduk. Masada kaç kalem oldu?','["8","6","7","9"]',2,'3 ile 4''yi bir araya getirince 7 olur.',1,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-25','coktan_secmeli','Bir sepette 3, diğer sepette 5 elma var. İki sepette toplam kaç elma var?','["9","7","10","8"]',3,'3 ile 5''yi bir araya getirince 8 olur.',1,25,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-26','coktan_secmeli','Ece''nin 3 çıkartması vardı. 6 tane daha aldı. Şimdi kaç çıkartması var?','["9","10","8","11"]',0,'3 ile 6''yi bir araya getirince 9 olur.',1,26,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-27','coktan_secmeli','Sayı yolunda 3''den başla, 7 adım ileri git. Hangi sayıya ulaşırsın?','["11","10","9","12"]',1,'3 ile 7''yi bir araya getirince 10 olur.',1,27,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-28','coktan_secmeli','Kutuda 3 kırmızı ve 8 mavi boncuk var. Toplam kaç boncuk var?','["12","10","11","13"]',2,'3 ile 8''yi bir araya getirince 11 olur.',2,28,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-29','coktan_secmeli','Masada 3 kalem vardı. Yanına 9 kalem daha koyduk. Masada kaç kalem oldu?','["13","11","14","12"]',3,'3 ile 9''yi bir araya getirince 12 olur.',2,29,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-30','coktan_secmeli','Bir sepette 3, diğer sepette 10 elma var. İki sepette toplam kaç elma var?','["13","14","12","15"]',0,'3 ile 10''yi bir araya getirince 13 olur.',2,30,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-31','coktan_secmeli','Ece''nin 4 çıkartması vardı. 1 tane daha aldı. Şimdi kaç çıkartması var?','["6","5","4","7"]',1,'4 ile 1''yi bir araya getirince 5 olur.',1,31,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-32','coktan_secmeli','Sayı yolunda 4''den başla, 2 adım ileri git. Hangi sayıya ulaşırsın?','["7","5","6","8"]',2,'4 ile 2''yi bir araya getirince 6 olur.',1,32,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-33','coktan_secmeli','Kutuda 4 kırmızı ve 3 mavi boncuk var. Toplam kaç boncuk var?','["8","6","9","7"]',3,'4 ile 3''yi bir araya getirince 7 olur.',1,33,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-34','coktan_secmeli','Masada 4 kalem vardı. Yanına 4 kalem daha koyduk. Masada kaç kalem oldu?','["8","9","7","10"]',0,'4 ile 4''yi bir araya getirince 8 olur.',1,34,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-35','coktan_secmeli','Bir sepette 4, diğer sepette 5 elma var. İki sepette toplam kaç elma var?','["10","9","8","11"]',1,'4 ile 5''yi bir araya getirince 9 olur.',1,35,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-36','coktan_secmeli','Ece''nin 4 çıkartması vardı. 6 tane daha aldı. Şimdi kaç çıkartması var?','["11","9","10","12"]',2,'4 ile 6''yi bir araya getirince 10 olur.',1,36,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-37','coktan_secmeli','Sayı yolunda 4''den başla, 7 adım ileri git. Hangi sayıya ulaşırsın?','["12","10","13","11"]',3,'4 ile 7''yi bir araya getirince 11 olur.',2,37,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-38','coktan_secmeli','Kutuda 4 kırmızı ve 8 mavi boncuk var. Toplam kaç boncuk var?','["12","13","11","14"]',0,'4 ile 8''yi bir araya getirince 12 olur.',2,38,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-39','coktan_secmeli','Masada 4 kalem vardı. Yanına 9 kalem daha koyduk. Masada kaç kalem oldu?','["14","13","12","15"]',1,'4 ile 9''yi bir araya getirince 13 olur.',2,39,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-40','coktan_secmeli','Bir sepette 4, diğer sepette 10 elma var. İki sepette toplam kaç elma var?','["15","13","14","16"]',2,'4 ile 10''yi bir araya getirince 14 olur.',2,40,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-41','coktan_secmeli','Ece''nin 5 çıkartması vardı. 1 tane daha aldı. Şimdi kaç çıkartması var?','["7","5","8","6"]',3,'5 ile 1''yi bir araya getirince 6 olur.',1,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-42','coktan_secmeli','Sayı yolunda 5''den başla, 2 adım ileri git. Hangi sayıya ulaşırsın?','["7","8","6","9"]',0,'5 ile 2''yi bir araya getirince 7 olur.',1,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-43','coktan_secmeli','Kutuda 5 kırmızı ve 3 mavi boncuk var. Toplam kaç boncuk var?','["9","8","7","10"]',1,'5 ile 3''yi bir araya getirince 8 olur.',1,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-44','coktan_secmeli','Masada 5 kalem vardı. Yanına 4 kalem daha koyduk. Masada kaç kalem oldu?','["10","8","9","11"]',2,'5 ile 4''yi bir araya getirince 9 olur.',1,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-45','coktan_secmeli','Bir sepette 5, diğer sepette 5 elma var. İki sepette toplam kaç elma var?','["11","9","12","10"]',3,'5 ile 5''yi bir araya getirince 10 olur.',1,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-46','coktan_secmeli','Ece''nin 5 çıkartması vardı. 6 tane daha aldı. Şimdi kaç çıkartması var?','["11","12","10","13"]',0,'5 ile 6''yi bir araya getirince 11 olur.',2,46,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-47','coktan_secmeli','Sayı yolunda 5''den başla, 7 adım ileri git. Hangi sayıya ulaşırsın?','["13","12","11","14"]',1,'5 ile 7''yi bir araya getirince 12 olur.',2,47,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-48','coktan_secmeli','Kutuda 5 kırmızı ve 8 mavi boncuk var. Toplam kaç boncuk var?','["14","12","13","15"]',2,'5 ile 8''yi bir araya getirince 13 olur.',2,48,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-49','coktan_secmeli','Masada 5 kalem vardı. Yanına 9 kalem daha koyduk. Masada kaç kalem oldu?','["15","13","16","14"]',3,'5 ile 9''yi bir araya getirince 14 olur.',2,49,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-50','coktan_secmeli','Bir sepette 5, diğer sepette 10 elma var. İki sepette toplam kaç elma var?','["15","16","14","17"]',0,'5 ile 10''yi bir araya getirince 15 olur.',2,50,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-51','coktan_secmeli','Ece''nin 6 çıkartması vardı. 1 tane daha aldı. Şimdi kaç çıkartması var?','["8","7","6","9"]',1,'6 ile 1''yi bir araya getirince 7 olur.',1,51,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-52','coktan_secmeli','Sayı yolunda 6''den başla, 2 adım ileri git. Hangi sayıya ulaşırsın?','["9","7","8","10"]',2,'6 ile 2''yi bir araya getirince 8 olur.',1,52,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-53','coktan_secmeli','Kutuda 6 kırmızı ve 3 mavi boncuk var. Toplam kaç boncuk var?','["10","8","11","9"]',3,'6 ile 3''yi bir araya getirince 9 olur.',1,53,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-54','coktan_secmeli','Masada 6 kalem vardı. Yanına 4 kalem daha koyduk. Masada kaç kalem oldu?','["10","11","9","12"]',0,'6 ile 4''yi bir araya getirince 10 olur.',1,54,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-55','coktan_secmeli','Bir sepette 6, diğer sepette 5 elma var. İki sepette toplam kaç elma var?','["12","11","10","13"]',1,'6 ile 5''yi bir araya getirince 11 olur.',2,55,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-56','coktan_secmeli','Ece''nin 6 çıkartması vardı. 6 tane daha aldı. Şimdi kaç çıkartması var?','["13","11","12","14"]',2,'6 ile 6''yi bir araya getirince 12 olur.',2,56,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-57','coktan_secmeli','Sayı yolunda 6''den başla, 7 adım ileri git. Hangi sayıya ulaşırsın?','["14","12","15","13"]',3,'6 ile 7''yi bir araya getirince 13 olur.',2,57,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-58','coktan_secmeli','Kutuda 6 kırmızı ve 8 mavi boncuk var. Toplam kaç boncuk var?','["14","15","13","16"]',0,'6 ile 8''yi bir araya getirince 14 olur.',2,58,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-59','coktan_secmeli','Masada 6 kalem vardı. Yanına 9 kalem daha koyduk. Masada kaç kalem oldu?','["16","15","14","17"]',1,'6 ile 9''yi bir araya getirince 15 olur.',2,59,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-60','coktan_secmeli','Bir sepette 6, diğer sepette 10 elma var. İki sepette toplam kaç elma var?','["17","15","16","18"]',2,'6 ile 10''yi bir araya getirince 16 olur.',2,60,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-61','coktan_secmeli','Ece''nin 7 çıkartması vardı. 1 tane daha aldı. Şimdi kaç çıkartması var?','["9","7","10","8"]',3,'7 ile 1''yi bir araya getirince 8 olur.',1,61,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-62','coktan_secmeli','Sayı yolunda 7''den başla, 2 adım ileri git. Hangi sayıya ulaşırsın?','["9","10","8","11"]',0,'7 ile 2''yi bir araya getirince 9 olur.',1,62,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-63','coktan_secmeli','Kutuda 7 kırmızı ve 3 mavi boncuk var. Toplam kaç boncuk var?','["11","10","9","12"]',1,'7 ile 3''yi bir araya getirince 10 olur.',1,63,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-64','coktan_secmeli','Masada 7 kalem vardı. Yanına 4 kalem daha koyduk. Masada kaç kalem oldu?','["12","10","11","13"]',2,'7 ile 4''yi bir araya getirince 11 olur.',2,64,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-65','coktan_secmeli','Bir sepette 7, diğer sepette 5 elma var. İki sepette toplam kaç elma var?','["13","11","14","12"]',3,'7 ile 5''yi bir araya getirince 12 olur.',2,65,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-66','coktan_secmeli','Ece''nin 7 çıkartması vardı. 6 tane daha aldı. Şimdi kaç çıkartması var?','["13","14","12","15"]',0,'7 ile 6''yi bir araya getirince 13 olur.',2,66,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-67','coktan_secmeli','Sayı yolunda 7''den başla, 7 adım ileri git. Hangi sayıya ulaşırsın?','["15","14","13","16"]',1,'7 ile 7''yi bir araya getirince 14 olur.',2,67,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-68','coktan_secmeli','Kutuda 7 kırmızı ve 8 mavi boncuk var. Toplam kaç boncuk var?','["16","14","15","17"]',2,'7 ile 8''yi bir araya getirince 15 olur.',2,68,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-69','coktan_secmeli','Masada 7 kalem vardı. Yanına 9 kalem daha koyduk. Masada kaç kalem oldu?','["17","15","18","16"]',3,'7 ile 9''yi bir araya getirince 16 olur.',2,69,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-70','coktan_secmeli','Bir sepette 7, diğer sepette 10 elma var. İki sepette toplam kaç elma var?','["17","18","16","19"]',0,'7 ile 10''yi bir araya getirince 17 olur.',2,70,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-1','coktan_secmeli','2 balondan 1 tanesi patladı. Kaç balon kaldı?','["2","3","4","1"]',3,'2''dan 1 çıkarınca 1 kalır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-2','coktan_secmeli','Sayı yolunda 3''den 1 adım geri git. Hangi sayıya ulaşırsın?','["2","3","4","5"]',0,'3''dan 1 çıkarınca 2 kalır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-3','coktan_secmeli','Kutuda 3 kalem vardı. 2 kalemi aldık. Kutuda kaç kalem kaldı?','["2","1","3","4"]',1,'3''dan 2 çıkarınca 1 kalır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-4','coktan_secmeli','Bahçede 4 kuş vardı. 1 kuş uçtu. Kaç kuş kaldı?','["4","3","5","6"]',1,'4''dan 1 çıkarınca 3 kalır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-5','coktan_secmeli','Tabakta 4 kurabiye vardı. 2 tanesi yenildi. Kaç kurabiye kaldı?','["3","4","2","5"]',2,'4''dan 2 çıkarınca 2 kalır.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-6','coktan_secmeli','4 balondan 3 tanesi patladı. Kaç balon kaldı?','["2","3","4","1"]',3,'4''dan 3 çıkarınca 1 kalır.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-7','coktan_secmeli','Sayı yolunda 5''den 1 adım geri git. Hangi sayıya ulaşırsın?','["5","6","4","7"]',2,'5''dan 1 çıkarınca 4 kalır.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-8','coktan_secmeli','Kutuda 5 kalem vardı. 2 kalemi aldık. Kutuda kaç kalem kaldı?','["4","5","6","3"]',3,'5''dan 2 çıkarınca 3 kalır.',1,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-9','coktan_secmeli','Bahçede 5 kuş vardı. 3 kuş uçtu. Kaç kuş kaldı?','["2","3","4","5"]',0,'5''dan 3 çıkarınca 2 kalır.',1,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-10','coktan_secmeli','Tabakta 6 kurabiye vardı. 1 tanesi yenildi. Kaç kurabiye kaldı?','["6","7","8","5"]',3,'6''dan 1 çıkarınca 5 kalır.',1,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-11','coktan_secmeli','6 balondan 2 tanesi patladı. Kaç balon kaldı?','["4","5","6","7"]',0,'6''dan 2 çıkarınca 4 kalır.',1,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-12','coktan_secmeli','Sayı yolunda 6''den 3 adım geri git. Hangi sayıya ulaşırsın?','["4","3","5","6"]',1,'6''dan 3 çıkarınca 3 kalır.',1,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-13','coktan_secmeli','Kutuda 6 kalem vardı. 4 kalemi aldık. Kutuda kaç kalem kaldı?','["3","4","2","5"]',2,'6''dan 4 çıkarınca 2 kalır.',1,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-14','coktan_secmeli','Bahçede 7 kuş vardı. 1 kuş uçtu. Kaç kuş kaldı?','["6","7","8","9"]',0,'7''dan 1 çıkarınca 6 kalır.',1,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-15','coktan_secmeli','Tabakta 7 kurabiye vardı. 2 tanesi yenildi. Kaç kurabiye kaldı?','["6","5","7","8"]',1,'7''dan 2 çıkarınca 5 kalır.',1,15,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-16','coktan_secmeli','7 balondan 3 tanesi patladı. Kaç balon kaldı?','["5","6","4","7"]',2,'7''dan 3 çıkarınca 4 kalır.',1,16,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-17','coktan_secmeli','Sayı yolunda 7''den 5 adım geri git. Hangi sayıya ulaşırsın?','["2","3","4","5"]',0,'7''dan 5 çıkarınca 2 kalır.',1,17,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-18','coktan_secmeli','Kutuda 8 kalem vardı. 1 kalemi aldık. Kutuda kaç kalem kaldı?','["8","7","9","10"]',1,'8''dan 1 çıkarınca 7 kalır.',1,18,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-19','coktan_secmeli','Bahçede 8 kuş vardı. 2 kuş uçtu. Kaç kuş kaldı?','["7","8","6","9"]',2,'8''dan 2 çıkarınca 6 kalır.',1,19,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-20','coktan_secmeli','Tabakta 8 kurabiye vardı. 3 tanesi yenildi. Kaç kurabiye kaldı?','["6","7","8","5"]',3,'8''dan 3 çıkarınca 5 kalır.',1,20,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-21','coktan_secmeli','8 balondan 4 tanesi patladı. Kaç balon kaldı?','["4","5","6","7"]',0,'8''dan 4 çıkarınca 4 kalır.',1,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-22','coktan_secmeli','Sayı yolunda 8''den 6 adım geri git. Hangi sayıya ulaşırsın?','["3","4","2","5"]',2,'8''dan 6 çıkarınca 2 kalır.',1,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-23','coktan_secmeli','Kutuda 9 kalem vardı. 1 kalemi aldık. Kutuda kaç kalem kaldı?','["9","10","8","11"]',2,'9''dan 1 çıkarınca 8 kalır.',1,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-24','coktan_secmeli','Bahçede 9 kuş vardı. 2 kuş uçtu. Kaç kuş kaldı?','["8","9","10","7"]',3,'9''dan 2 çıkarınca 7 kalır.',1,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-25','coktan_secmeli','Tabakta 9 kurabiye vardı. 3 tanesi yenildi. Kaç kurabiye kaldı?','["6","7","8","9"]',0,'9''dan 3 çıkarınca 6 kalır.',1,25,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-26','coktan_secmeli','9 balondan 5 tanesi patladı. Kaç balon kaldı?','["5","6","4","7"]',2,'9''dan 5 çıkarınca 4 kalır.',1,26,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-27','coktan_secmeli','Sayı yolunda 9''den 7 adım geri git. Hangi sayıya ulaşırsın?','["2","3","4","5"]',0,'9''dan 7 çıkarınca 2 kalır.',1,27,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-28','coktan_secmeli','Kutuda 10 kalem vardı. 1 kalemi aldık. Kutuda kaç kalem kaldı?','["10","11","12","9"]',3,'10''dan 1 çıkarınca 9 kalır.',1,28,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-29','coktan_secmeli','Bahçede 10 kuş vardı. 2 kuş uçtu. Kaç kuş kaldı?','["8","9","10","11"]',0,'10''dan 2 çıkarınca 8 kalır.',1,29,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-30','coktan_secmeli','Tabakta 10 kurabiye vardı. 3 tanesi yenildi. Kaç kurabiye kaldı?','["8","7","9","10"]',1,'10''dan 3 çıkarınca 7 kalır.',1,30,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-31','coktan_secmeli','10 balondan 4 tanesi patladı. Kaç balon kaldı?','["7","8","6","9"]',2,'10''dan 4 çıkarınca 6 kalır.',1,31,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-32','coktan_secmeli','Sayı yolunda 10''den 6 adım geri git. Hangi sayıya ulaşırsın?','["4","5","6","7"]',0,'10''dan 6 çıkarınca 4 kalır.',1,32,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-33','coktan_secmeli','Kutuda 10 kalem vardı. 8 kalemi aldık. Kutuda kaç kalem kaldı?','["3","4","2","5"]',2,'10''dan 8 çıkarınca 2 kalır.',1,33,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-34','coktan_secmeli','Bahçede 11 kuş vardı. 1 kuş uçtu. Kaç kuş kaldı?','["10","11","12","13"]',0,'11''dan 1 çıkarınca 10 kalır.',2,34,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-35','coktan_secmeli','Tabakta 11 kurabiye vardı. 2 tanesi yenildi. Kaç kurabiye kaldı?','["10","9","11","12"]',1,'11''dan 2 çıkarınca 9 kalır.',2,35,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-36','coktan_secmeli','11 balondan 3 tanesi patladı. Kaç balon kaldı?','["9","10","8","11"]',2,'11''dan 3 çıkarınca 8 kalır.',2,36,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-37','coktan_secmeli','Sayı yolunda 11''den 5 adım geri git. Hangi sayıya ulaşırsın?','["6","7","8","9"]',0,'11''dan 5 çıkarınca 6 kalır.',2,37,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-38','coktan_secmeli','Kutuda 11 kalem vardı. 7 kalemi aldık. Kutuda kaç kalem kaldı?','["5","6","4","7"]',2,'11''dan 7 çıkarınca 4 kalır.',2,38,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-39','coktan_secmeli','Bahçede 11 kuş vardı. 9 kuş uçtu. Kaç kuş kaldı?','["2","3","4","5"]',0,'11''dan 9 çıkarınca 2 kalır.',2,39,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-40','coktan_secmeli','Tabakta 12 kurabiye vardı. 1 tanesi yenildi. Kaç kurabiye kaldı?','["12","11","13","14"]',1,'12''dan 1 çıkarınca 11 kalır.',2,40,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-41','coktan_secmeli','12 balondan 2 tanesi patladı. Kaç balon kaldı?','["11","12","10","13"]',2,'12''dan 2 çıkarınca 10 kalır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-42','coktan_secmeli','Sayı yolunda 12''den 3 adım geri git. Hangi sayıya ulaşırsın?','["10","11","12","9"]',3,'12''dan 3 çıkarınca 9 kalır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-43','coktan_secmeli','Kutuda 12 kalem vardı. 4 kalemi aldık. Kutuda kaç kalem kaldı?','["8","9","10","11"]',0,'12''dan 4 çıkarınca 8 kalır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-44','coktan_secmeli','Bahçede 12 kuş vardı. 6 kuş uçtu. Kaç kuş kaldı?','["7","8","6","9"]',2,'12''dan 6 çıkarınca 6 kalır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-45','coktan_secmeli','Tabakta 12 kurabiye vardı. 8 tanesi yenildi. Kaç kurabiye kaldı?','["4","5","6","7"]',0,'12''dan 8 çıkarınca 4 kalır.',2,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-46','coktan_secmeli','12 balondan 10 tanesi patladı. Kaç balon kaldı?','["3","4","2","5"]',2,'12''dan 10 çıkarınca 2 kalır.',2,46,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-47','coktan_secmeli','Sayı yolunda 13''den 1 adım geri git. Hangi sayıya ulaşırsın?','["13","14","12","15"]',2,'13''dan 1 çıkarınca 12 kalır.',2,47,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-48','coktan_secmeli','Kutuda 13 kalem vardı. 2 kalemi aldık. Kutuda kaç kalem kaldı?','["12","13","14","11"]',3,'13''dan 2 çıkarınca 11 kalır.',2,48,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-49','coktan_secmeli','Bahçede 13 kuş vardı. 3 kuş uçtu. Kaç kuş kaldı?','["10","11","12","13"]',0,'13''dan 3 çıkarınca 10 kalır.',2,49,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-50','coktan_secmeli','Tabakta 13 kurabiye vardı. 5 tanesi yenildi. Kaç kurabiye kaldı?','["9","10","8","11"]',2,'13''dan 5 çıkarınca 8 kalır.',2,50,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-51','coktan_secmeli','13 balondan 7 tanesi patladı. Kaç balon kaldı?','["6","7","8","9"]',0,'13''dan 7 çıkarınca 6 kalır.',2,51,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-52','coktan_secmeli','Sayı yolunda 13''den 9 adım geri git. Hangi sayıya ulaşırsın?','["5","6","4","7"]',2,'13''dan 9 çıkarınca 4 kalır.',2,52,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-53','coktan_secmeli','Kutuda 13 kalem vardı. 11 kalemi aldık. Kutuda kaç kalem kaldı?','["2","3","4","5"]',0,'13''dan 11 çıkarınca 2 kalır.',2,53,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-54','coktan_secmeli','Bahçede 14 kuş vardı. 1 kuş uçtu. Kaç kuş kaldı?','["14","15","16","13"]',3,'14''dan 1 çıkarınca 13 kalır.',2,54,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-55','coktan_secmeli','Tabakta 14 kurabiye vardı. 2 tanesi yenildi. Kaç kurabiye kaldı?','["12","13","14","15"]',0,'14''dan 2 çıkarınca 12 kalır.',2,55,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-56','coktan_secmeli','14 balondan 3 tanesi patladı. Kaç balon kaldı?','["12","11","13","14"]',1,'14''dan 3 çıkarınca 11 kalır.',2,56,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-57','coktan_secmeli','Sayı yolunda 14''den 4 adım geri git. Hangi sayıya ulaşırsın?','["11","12","10","13"]',2,'14''dan 4 çıkarınca 10 kalır.',2,57,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-58','coktan_secmeli','Kutuda 14 kalem vardı. 6 kalemi aldık. Kutuda kaç kalem kaldı?','["8","9","10","11"]',0,'14''dan 6 çıkarınca 8 kalır.',2,58,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-59','coktan_secmeli','Bahçede 14 kuş vardı. 8 kuş uçtu. Kaç kuş kaldı?','["7","8","6","9"]',2,'14''dan 8 çıkarınca 6 kalır.',2,59,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-60','coktan_secmeli','Tabakta 14 kurabiye vardı. 10 tanesi yenildi. Kaç kurabiye kaldı?','["4","5","6","7"]',0,'14''dan 10 çıkarınca 4 kalır.',2,60,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-61','coktan_secmeli','14 balondan 12 tanesi patladı. Kaç balon kaldı?','["3","4","2","5"]',2,'14''dan 12 çıkarınca 2 kalır.',2,61,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-62','coktan_secmeli','Sayı yolunda 15''den 1 adım geri git. Hangi sayıya ulaşırsın?','["14","15","16","17"]',0,'15''dan 1 çıkarınca 14 kalır.',2,62,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-63','coktan_secmeli','Kutuda 15 kalem vardı. 2 kalemi aldık. Kutuda kaç kalem kaldı?','["14","13","15","16"]',1,'15''dan 2 çıkarınca 13 kalır.',2,63,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-64','coktan_secmeli','Bahçede 15 kuş vardı. 3 kuş uçtu. Kaç kuş kaldı?','["13","14","12","15"]',2,'15''dan 3 çıkarınca 12 kalır.',2,64,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-65','coktan_secmeli','Tabakta 15 kurabiye vardı. 5 tanesi yenildi. Kaç kurabiye kaldı?','["10","11","12","13"]',0,'15''dan 5 çıkarınca 10 kalır.',2,65,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-66','coktan_secmeli','15 balondan 7 tanesi patladı. Kaç balon kaldı?','["9","10","8","11"]',2,'15''dan 7 çıkarınca 8 kalır.',2,66,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-67','coktan_secmeli','Sayı yolunda 15''den 9 adım geri git. Hangi sayıya ulaşırsın?','["6","7","8","9"]',0,'15''dan 9 çıkarınca 6 kalır.',2,67,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-68','coktan_secmeli','Kutuda 15 kalem vardı. 11 kalemi aldık. Kutuda kaç kalem kaldı?','["5","6","4","7"]',2,'15''dan 11 çıkarınca 4 kalır.',2,68,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-69','coktan_secmeli','Bahçede 15 kuş vardı. 13 kuş uçtu. Kaç kuş kaldı?','["2","3","4","5"]',0,'15''dan 13 çıkarınca 2 kalır.',2,69,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-70','coktan_secmeli','Tabakta 16 kurabiye vardı. 1 tanesi yenildi. Kaç kurabiye kaldı?','["16","15","17","18"]',1,'16''dan 1 çıkarınca 15 kalır.',2,70,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-2','coktan_secmeli','1 kırmızı boncuk ile 1 mavi boncuğu birleştiriyoruz. 1 + 1 = __ boşluğuna hangi sayı gelir?','["3","1","2","4"]',2,'İki grubu birleştirince 2 boncuk olur.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-3','coktan_secmeli','1 kırmızı boncuk ile 2 mavi boncuğu birleştiriyoruz. 1 + 2 = __ boşluğuna hangi sayı gelir?','["4","2","5","3"]',3,'İki grubu birleştirince 3 boncuk olur.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-4','coktan_secmeli','2 kırmızı boncuk ile 2 mavi boncuğu birleştiriyoruz. 2 + 2 = __ boşluğuna hangi sayı gelir?','["4","5","3","6"]',0,'İki grubu birleştirince 4 boncuk olur.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-5','coktan_secmeli','2 kırmızı boncuk ile 3 mavi boncuğu birleştiriyoruz. 2 + 3 = __ boşluğuna hangi sayı gelir?','["6","5","4","7"]',1,'İki grubu birleştirince 5 boncuk olur.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-6','coktan_secmeli','3 kırmızı boncuk ile 3 mavi boncuğu birleştiriyoruz. 3 + 3 = __ boşluğuna hangi sayı gelir?','["7","5","6","8"]',2,'İki grubu birleştirince 6 boncuk olur.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-7','coktan_secmeli','3 kırmızı boncuk ile 4 mavi boncuğu birleştiriyoruz. 3 + 4 = __ boşluğuna hangi sayı gelir?','["8","6","9","7"]',3,'İki grubu birleştirince 7 boncuk olur.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-8','coktan_secmeli','4 kırmızı boncuk ile 4 mavi boncuğu birleştiriyoruz. 4 + 4 = __ boşluğuna hangi sayı gelir?','["8","9","7","10"]',0,'İki grubu birleştirince 8 boncuk olur.',1,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-9','coktan_secmeli','4 kırmızı boncuk ile 5 mavi boncuğu birleştiriyoruz. 4 + 5 = __ boşluğuna hangi sayı gelir?','["10","9","8","11"]',1,'İki grubu birleştirince 9 boncuk olur.',1,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-10','coktan_secmeli','5 kırmızı boncuk ile 5 mavi boncuğu birleştiriyoruz. 5 + 5 = __ boşluğuna hangi sayı gelir?','["11","9","10","12"]',2,'İki grubu birleştirince 10 boncuk olur.',1,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-11','coktan_secmeli','5 kırmızı boncuk ile 6 mavi boncuğu birleştiriyoruz. 5 + 6 = __ boşluğuna hangi sayı gelir?','["12","10","13","11"]',3,'İki grubu birleştirince 11 boncuk olur.',1,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-12','coktan_secmeli','6 kırmızı boncuk ile 6 mavi boncuğu birleştiriyoruz. 6 + 6 = __ boşluğuna hangi sayı gelir?','["12","13","11","14"]',0,'İki grubu birleştirince 12 boncuk olur.',1,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-5','coktan_secmeli','Kutuda toplam 5 top olmalı. İçinde 4 top var. Kaç top daha eklemeliyiz? __ + 4 = 5','["2","0","1","3"]',2,'4''a 1 eklersek 5 olur. Eksik sayı 1''dir.',2,35,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-6','coktan_secmeli','Kutuda toplam 6 top olmalı. İçinde 2 top var. Kaç top daha eklemeliyiz? __ + 2 = 6','["5","3","6","4"]',3,'2''a 4 eklersek 6 olur. Eksik sayı 4''dir.',2,36,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-7','coktan_secmeli','Kutuda toplam 7 top olmalı. İçinde 3 top var. Kaç top daha eklemeliyiz? __ + 3 = 7','["4","5","3","6"]',0,'3''a 4 eklersek 7 olur. Eksik sayı 4''dir.',2,37,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-8','coktan_secmeli','Kutuda toplam 8 top olmalı. İçinde 4 top var. Kaç top daha eklemeliyiz? __ + 4 = 8','["5","4","3","6"]',1,'4''a 4 eklersek 8 olur. Eksik sayı 4''dir.',2,38,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-9','coktan_secmeli','Kutuda toplam 9 top olmalı. İçinde 2 top var. Kaç top daha eklemeliyiz? __ + 2 = 9','["8","6","7","9"]',2,'2''a 7 eklersek 9 olur. Eksik sayı 7''dir.',2,39,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-10','coktan_secmeli','Kutuda toplam 10 top olmalı. İçinde 3 top var. Kaç top daha eklemeliyiz? __ + 3 = 10','["8","6","9","7"]',3,'3''a 7 eklersek 10 olur. Eksik sayı 7''dir.',2,40,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-11','coktan_secmeli','Kutuda toplam 11 top olmalı. İçinde 4 top var. Kaç top daha eklemeliyiz? __ + 4 = 11','["7","8","6","9"]',0,'4''a 7 eklersek 11 olur. Eksik sayı 7''dir.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-12','coktan_secmeli','Kutuda toplam 12 top olmalı. İçinde 2 top var. Kaç top daha eklemeliyiz? __ + 2 = 12','["11","10","9","12"]',1,'2''a 10 eklersek 12 olur. Eksik sayı 10''dir.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-13','coktan_secmeli','Kutuda toplam 13 top olmalı. İçinde 3 top var. Kaç top daha eklemeliyiz? __ + 3 = 13','["11","9","10","12"]',2,'3''a 10 eklersek 13 olur. Eksik sayı 10''dir.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-14','coktan_secmeli','Kutuda toplam 14 top olmalı. İçinde 4 top var. Kaç top daha eklemeliyiz? __ + 4 = 14','["11","9","12","10"]',3,'4''a 10 eklersek 14 olur. Eksik sayı 10''dir.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-15','coktan_secmeli','Kutuda toplam 15 top olmalı. İçinde 2 top var. Kaç top daha eklemeliyiz? __ + 2 = 15','["13","14","12","15"]',0,'2''a 13 eklersek 15 olur. Eksik sayı 13''dir.',2,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-1','coktan_secmeli','Ece''nin 3 elması vardı. 2 elma daha aldı. Kaç elması oldu?','["6","4","5","7"]',2,'Uygun işlem yapıldığında sonuç 5 olur.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-2','coktan_secmeli','Mert''in 7 kalemi vardı. 3 kalemini verdi. Kaç kalemi kaldı?','["5","3","6","4"]',3,'Uygun işlem yapıldığında sonuç 4 olur.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-3','coktan_secmeli','Sepette 6 portakal vardı. 4 portakal daha kondu. Kaç portakal oldu?','["10","11","9","12"]',0,'Uygun işlem yapıldığında sonuç 10 olur.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-4','coktan_secmeli','Bahçede 9 kuş vardı. 2 kuş uçtu. Kaç kuş kaldı?','["8","7","6","9"]',1,'Uygun işlem yapıldığında sonuç 7 olur.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-5','coktan_secmeli','Kutuda 5 kırmızı ve 4 mavi top var. Toplam kaç top vardır?','["10","8","9","11"]',2,'Uygun işlem yapıldığında sonuç 9 olur.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-6','coktan_secmeli','Ali 8 sayfa okudu. 5 sayfa daha okudu. Toplam kaç sayfa okudu?','["14","12","15","13"]',3,'Uygun işlem yapıldığında sonuç 13 olur.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-7','coktan_secmeli','Otobüste 12 yolcu vardı. 3 yolcu indi. Kaç yolcu kaldı?','["9","10","8","11"]',0,'Uygun işlem yapıldığında sonuç 9 olur.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-8','coktan_secmeli','Sınıfta 10 öğrenci vardı. 4 öğrenci daha geldi. Kaç öğrenci oldu?','["15","14","13","16"]',1,'Uygun işlem yapıldığında sonuç 14 olur.',1,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-9','coktan_secmeli','Masada 15 kalem vardı. 5 kalem kaldırıldı. Kaç kalem kaldı?','["11","9","10","12"]',2,'Uygun işlem yapıldığında sonuç 10 olur.',2,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-10','coktan_secmeli','Dalda 7 elma vardı. 6 elma daha yetişti. Toplam kaç elma oldu?','["14","12","15","13"]',3,'Uygun işlem yapıldığında sonuç 13 olur.',2,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-11','coktan_secmeli','Duru''nun 11 çıkartması vardı. 2 tanesini kullandı. Kaç çıkartması kaldı?','["9","10","8","11"]',0,'Uygun işlem yapıldığında sonuç 9 olur.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-12','coktan_secmeli','Bir kutuda 4, diğer kutuda 7 oyuncak var. Toplam kaç oyuncak vardır?','["12","11","10","13"]',1,'Uygun işlem yapıldığında sonuç 11 olur.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-13','coktan_secmeli','Parkta 13 çocuk vardı. 4 çocuk eve gitti. Kaç çocuk kaldı?','["10","8","9","11"]',2,'Uygun işlem yapıldığında sonuç 9 olur.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-14','coktan_secmeli','Can 6 mavi, 6 kırmızı boncuk saydı. Toplam kaç boncuk saydı?','["13","11","14","12"]',3,'Uygun işlem yapıldığında sonuç 12 olur.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-15','coktan_secmeli','Rafta 18 kitap vardı. 3 kitap alındı. Kaç kitap kaldı?','["15","16","14","17"]',0,'Uygun işlem yapıldığında sonuç 15 olur.',2,15,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-16','coktan_secmeli','Kümeste 9 tavuk vardı. 5 tavuk daha geldi. Kaç tavuk oldu?','["15","14","13","16"]',1,'Uygun işlem yapıldığında sonuç 14 olur.',2,16,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-17','coktan_secmeli','Eylül''ün 14 lirası vardı. 4 lira harcadı. Kaç lirası kaldı?','["11","9","10","12"]',2,'Uygun işlem yapıldığında sonuç 10 olur.',2,17,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-18','coktan_secmeli','Vazoda 8 sarı, 3 beyaz çiçek var. Toplam kaç çiçek vardır?','["12","10","13","11"]',3,'Uygun işlem yapıldığında sonuç 11 olur.',2,18,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-19','coktan_secmeli','Oyunda 16 puanın vardı. 5 puan kullandın. Kaç puanın kaldı?','["11","12","10","13"]',0,'Uygun işlem yapıldığında sonuç 11 olur.',2,19,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-problem-20','coktan_secmeli','Kutuda 2 silgi vardı. 6 silgi eklendi. Kaç silgi oldu?','["9","8","7","10"]',1,'Uygun işlem yapıldığında sonuç 8 olur.',2,20,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-yon-1','coktan_secmeli','Kitap masanın üstünde. Masa, kitabın hangi tarafındadır?','["Altında","Üstünde","Sağında","Önünde"]',0,'Kitap masanın üstündeyse masa kitabın altındadır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-yon-konum' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-yon-2','coktan_secmeli','“Sağ elini kaldır.” denirse hangi tarafını kullanırsın?','["Sol","Sağ","Arka","Alt"]',1,'Sağ el, vücudumuzun sağ tarafındadır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-yon-konum' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-yon-3','coktan_secmeli','Top sandalyenin altında ise top nerededir?','["Sandalyenin üstünde","Kapının önünde","Sandalyenin altında","Masanın sağında"]',2,'Top sandalyenin altındadır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-yon-konum' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-yon-4','coktan_secmeli','Arkadaşın tam önünde duruyor. Ona yaklaşmak için hangi yöne yürürsün?','["Geri","Aşağı","Sol","İleri"]',3,'Önümüzdeki bir şeye yaklaşmak için ileri yürürüz.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-yon-konum' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-yon-5','coktan_secmeli','“Bir adım geri at.” denirse hangi yöne gidersin?','["Geri","İleri","Yukarı","Sağ"]',0,'Geri adım atmak geriye doğru hareket etmektir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-yon-konum' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-yon-6','coktan_secmeli','Oyuncak sol tarafında. Ona dönmek için hangi yöne dönersin?','["Sağa","Sola","Yukarı","Aşağı"]',1,'Sol taraftaki nesneye ulaşmak için sola döneriz.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-yon-konum' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-yon-7','coktan_secmeli','Kedi kutunun içinde ise konumu hangisidir?','["Dışında","Üstünde","İçinde","Arkasında"]',2,'Kedi kutunun içindedir.',2,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-yon-konum' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-yon-8','coktan_secmeli','Lamba başımızın üzerinde. Lamba hangi konumdadır?','["Aşağıda","Solda","Geride","Yukarıda"]',3,'Başımızın üzerindeki nesne yukarıdadır.',2,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-yon-konum' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sekil-1','coktan_secmeli','Üçgenin kaç kenarı vardır?','["3","4","2","0"]',0,'Üçgenin üç kenarı vardır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sekil-2','coktan_secmeli','Karenin kaç kenarı vardır?','["3","4","2","0"]',1,'Karenin dört kenarı vardır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sekil-3','coktan_secmeli','Dikdörtgenin kaç köşesi vardır?','["3","2","4","1"]',2,'Dikdörtgenin dört köşesi vardır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sekil-4','coktan_secmeli','Çember için hangisi doğrudur?','["Üç köşesi vardır.","Dört köşesi vardır.","İki kenarı vardır.","Köşesi yoktur."]',3,'Çemberin köşesi yoktur.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sekil-5','coktan_secmeli','Hangisi köşeli bir şekildir?','["Kare","Çember","Daire","Yuvarlak"]',0,'Karenin köşeleri vardır.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sekil-6','coktan_secmeli','Hangisi yuvarlak biçimlidir?','["Üçgen","Çember","Kare","Dikdörtgen"]',1,'Çember yuvarlaktır.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sekil-7','coktan_secmeli','Dört eşit kenarı olan şekil hangisidir?','["Üçgen","Çember","Kare","Dikdörtgen"]',2,'Karenin dört eşit kenarı vardır.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sekil-8','coktan_secmeli','Üç köşesi olan şekil hangisidir?','["Kare","Dikdörtgen","Çember","Üçgen"]',3,'Üçgenin üç köşesi vardır.',1,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sekil-9','coktan_secmeli','▭ Bu işaret hangi şekle benzer?','["Dikdörtgen","Üçgen","Çember","Nokta"]',0,'▭ işareti dikdörtgene benzer.',2,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sekil-10','coktan_secmeli','Yuvarlak saat yüzü hangi şekle benzer?','["Kare","Çember","Üçgen","Dikdörtgen"]',1,'Çembere benzer.',2,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sekil-11','coktan_secmeli','Karenin kaç kenarı ve kaç köşesi vardır?','["3 ve 4''tür.","Köşesi yoktur.","İkisi de 4''tür.","İkisi de 2''dir."]',2,'Karenin 4 kenarı ve 4 köşesi vardır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sekil-12','coktan_secmeli','Hangisinin dört kenarı vardır?','["Üçgen","Çember","Nokta","Dikdörtgen"]',3,'Dikdörtgenin dört kenarı vardır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-veri-1','coktan_secmeli','Elma: 🍎🍎🍎, Armut: 🍐🍐. Hangisi daha fazladır?','["Elma","Armut","Eşit","Bilinemez"]',0,'3 elma, 2 armuttan fazladır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-veri-okuma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-veri-2','coktan_secmeli','Kırmızı top: 4, Mavi top: 2. Toplam kaç top vardır?','["4","6","2","8"]',1,'4+2=6 top vardır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-veri-okuma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-veri-3','coktan_secmeli','Ayşe 3, Ece 5 kitap okudu. Kim daha çok kitap okudu?','["Ayşe","Eşit","Ece","Bilinemez"]',2,'5 kitap 3 kitaptan fazladır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-veri-okuma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-veri-4','coktan_secmeli','Pazartesi 2, Salı 4 yıldız kazanıldı. Hangi gün daha çok?','["Pazartesi","Eşit","Pazar","Salı"]',3,'Salı günü 4 yıldız kazanıldı.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-veri-okuma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-veri-5','coktan_secmeli','Kedi: |||, Köpek: ||. Çeteleye göre hangisi daha fazladır?','["Kedi","Köpek","Eşit","Hiçbiri"]',0,'Kedi için üç çizgi vardır.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-veri-okuma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-veri-6','coktan_secmeli','Muz: 5, Elma: 5. Sayılar nasıl karşılaştırılır?','["Muz daha çok","Eşittir","Elma daha çok","Bilinemez"]',1,'İkisinin sayısı da 5''tir.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-veri-okuma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-veri-7','coktan_secmeli','Kırmızı: 🔴🔴🔴🔴🔴🔴  Yeşil: 🟢🟢🟢. Kırmızı nesneler yeşillerden kaç tane fazladır?','["9","2","3","6"]',2,'6 kırmızıdan 3 yeşili eşleştirince 3 kırmızı fazla kalır.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-veri-okuma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-veri-8','coktan_secmeli','Kedi sayısı için dört çizgi çizildi: ||||. Bu çetele kaç kediyi gösterir?','["3","5","2","4"]',3,'Dört çizgi, 4 kediyi gösterir.',2,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-veri-okuma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-veri-9','coktan_secmeli','Kitap: 📚📚📚📚📚📚📚  Kalem: ✏️✏️✏️✏️. Hangisi daha azdır?','["Kalem","Kitap","Eşit","Bilinemez"]',0,'4 kalem, 7 kitaptan daha azdır.',2,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-veri-okuma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-veri-10','coktan_secmeli','Nesne grafiğinde ⭐⭐⭐⭐⭐ kaç yıldız gösterilir?','["4","5","6","3"]',1,'Beş yıldız vardır.',2,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-veri-okuma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;
