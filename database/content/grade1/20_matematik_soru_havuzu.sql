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
SELECT k.id,'mat-sayi-0','coktan_secmeli','Hangi seçenek 0 sayısını gösterir?','["0","1","2","3"]',0,'Doğru sayı 0''dir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-1','coktan_secmeli','Hangi seçenek 1 sayısını gösterir?','["2","1","0","3"]',1,'Doğru sayı 1''dir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-2','coktan_secmeli','Hangi seçenek 2 sayısını gösterir?','["3","1","2","4"]',2,'Doğru sayı 2''dir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-3','coktan_secmeli','Hangi seçenek 3 sayısını gösterir?','["4","2","5","3"]',3,'Doğru sayı 3''dir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-4','coktan_secmeli','Hangi seçenek 4 sayısını gösterir?','["4","5","3","6"]',0,'Doğru sayı 4''dir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-5','coktan_secmeli','Hangi seçenek 5 sayısını gösterir?','["6","5","4","7"]',1,'Doğru sayı 5''dir.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-6','coktan_secmeli','Hangi seçenek 6 sayısını gösterir?','["7","5","6","8"]',2,'Doğru sayı 6''dir.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-7','coktan_secmeli','Hangi seçenek 7 sayısını gösterir?','["8","6","9","7"]',3,'Doğru sayı 7''dir.',1,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-8','coktan_secmeli','Hangi seçenek 8 sayısını gösterir?','["8","9","7","10"]',0,'Doğru sayı 8''dir.',1,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-9','coktan_secmeli','Hangi seçenek 9 sayısını gösterir?','["10","9","8","11"]',1,'Doğru sayı 9''dir.',1,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-10','coktan_secmeli','Hangi seçenek 10 sayısını gösterir?','["11","9","10","12"]',2,'Doğru sayı 10''dir.',1,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-11','coktan_secmeli','Hangi seçenek 11 sayısını gösterir?','["12","10","13","11"]',3,'Doğru sayı 11''dir.',1,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-12','coktan_secmeli','Hangi seçenek 12 sayısını gösterir?','["12","13","11","14"]',0,'Doğru sayı 12''dir.',1,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-13','coktan_secmeli','Hangi seçenek 13 sayısını gösterir?','["14","13","12","15"]',1,'Doğru sayı 13''dir.',1,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-14','coktan_secmeli','Hangi seçenek 14 sayısını gösterir?','["15","13","14","16"]',2,'Doğru sayı 14''dir.',1,15,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-15','coktan_secmeli','Hangi seçenek 15 sayısını gösterir?','["16","14","17","15"]',3,'Doğru sayı 15''dir.',1,16,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-16','coktan_secmeli','Hangi seçenek 16 sayısını gösterir?','["16","17","15","18"]',0,'Doğru sayı 16''dir.',1,17,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-17','coktan_secmeli','Hangi seçenek 17 sayısını gösterir?','["18","17","16","19"]',1,'Doğru sayı 17''dir.',1,18,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-18','coktan_secmeli','Hangi seçenek 18 sayısını gösterir?','["19","17","18","20"]',2,'Doğru sayı 18''dir.',1,19,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-19','coktan_secmeli','Hangi seçenek 19 sayısını gösterir?','["20","18","17","19"]',3,'Doğru sayı 19''dir.',1,20,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sayi-20','coktan_secmeli','Hangi seçenek 20 sayısını gösterir?','["20","19","18","17"]',0,'Doğru sayı 20''dir.',1,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sayilar-0-20' AND (d.kod='matematik' OR d.ad='Matematik')
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
SELECT k.id,'mat-once-1','coktan_secmeli','1 sayısından hemen önce hangi sayı gelir?','["2","0","3","4"]',1,'1''den bir geri sayınca 0 gelir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-1','coktan_secmeli','1 sayısından hemen sonra hangi sayı gelir?','["0","3","4","2"]',3,'1''den bir ileri sayınca 2 gelir.',1,31,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-2','coktan_secmeli','2 sayısından hemen önce hangi sayı gelir?','["3","0","1","4"]',2,'2''den bir geri sayınca 1 gelir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-2','coktan_secmeli','2 sayısından hemen sonra hangi sayı gelir?','["3","1","4","0"]',0,'2''den bir ileri sayınca 3 gelir.',1,32,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-3','coktan_secmeli','3 sayısından hemen önce hangi sayı gelir?','["4","1","5","2"]',3,'3''den bir geri sayınca 2 gelir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-3','coktan_secmeli','3 sayısından hemen sonra hangi sayı gelir?','["2","4","5","1"]',1,'3''den bir ileri sayınca 4 gelir.',1,33,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-4','coktan_secmeli','4 sayısından hemen önce hangi sayı gelir?','["3","5","2","6"]',0,'4''den bir geri sayınca 3 gelir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-4','coktan_secmeli','4 sayısından hemen sonra hangi sayı gelir?','["3","6","5","2"]',2,'4''den bir ileri sayınca 5 gelir.',1,34,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-5','coktan_secmeli','5 sayısından hemen önce hangi sayı gelir?','["6","4","3","7"]',1,'5''den bir geri sayınca 4 gelir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-5','coktan_secmeli','5 sayısından hemen sonra hangi sayı gelir?','["4","7","3","6"]',3,'5''den bir ileri sayınca 6 gelir.',1,35,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-6','coktan_secmeli','6 sayısından hemen önce hangi sayı gelir?','["7","4","5","8"]',2,'6''den bir geri sayınca 5 gelir.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-6','coktan_secmeli','6 sayısından hemen sonra hangi sayı gelir?','["7","5","8","4"]',0,'6''den bir ileri sayınca 7 gelir.',1,36,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-7','coktan_secmeli','7 sayısından hemen önce hangi sayı gelir?','["8","5","9","6"]',3,'7''den bir geri sayınca 6 gelir.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-7','coktan_secmeli','7 sayısından hemen sonra hangi sayı gelir?','["6","8","9","5"]',1,'7''den bir ileri sayınca 8 gelir.',1,37,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-8','coktan_secmeli','8 sayısından hemen önce hangi sayı gelir?','["7","9","6","10"]',0,'8''den bir geri sayınca 7 gelir.',1,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-8','coktan_secmeli','8 sayısından hemen sonra hangi sayı gelir?','["7","10","9","6"]',2,'8''den bir ileri sayınca 9 gelir.',1,38,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-9','coktan_secmeli','9 sayısından hemen önce hangi sayı gelir?','["10","8","7","11"]',1,'9''den bir geri sayınca 8 gelir.',1,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-9','coktan_secmeli','9 sayısından hemen sonra hangi sayı gelir?','["8","11","7","10"]',3,'9''den bir ileri sayınca 10 gelir.',1,39,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-10','coktan_secmeli','10 sayısından hemen önce hangi sayı gelir?','["11","8","9","12"]',2,'10''den bir geri sayınca 9 gelir.',1,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-10','coktan_secmeli','10 sayısından hemen sonra hangi sayı gelir?','["11","9","12","8"]',0,'10''den bir ileri sayınca 11 gelir.',1,40,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-11','coktan_secmeli','11 sayısından hemen önce hangi sayı gelir?','["12","9","13","10"]',3,'11''den bir geri sayınca 10 gelir.',1,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-11','coktan_secmeli','11 sayısından hemen sonra hangi sayı gelir?','["10","12","13","9"]',1,'11''den bir ileri sayınca 12 gelir.',1,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-12','coktan_secmeli','12 sayısından hemen önce hangi sayı gelir?','["11","13","10","14"]',0,'12''den bir geri sayınca 11 gelir.',1,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-12','coktan_secmeli','12 sayısından hemen sonra hangi sayı gelir?','["11","14","13","10"]',2,'12''den bir ileri sayınca 13 gelir.',1,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-13','coktan_secmeli','13 sayısından hemen önce hangi sayı gelir?','["14","12","11","15"]',1,'13''den bir geri sayınca 12 gelir.',1,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-13','coktan_secmeli','13 sayısından hemen sonra hangi sayı gelir?','["12","15","11","14"]',3,'13''den bir ileri sayınca 14 gelir.',1,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-14','coktan_secmeli','14 sayısından hemen önce hangi sayı gelir?','["15","12","13","16"]',2,'14''den bir geri sayınca 13 gelir.',1,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-14','coktan_secmeli','14 sayısından hemen sonra hangi sayı gelir?','["15","13","16","12"]',0,'14''den bir ileri sayınca 15 gelir.',1,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-15','coktan_secmeli','15 sayısından hemen önce hangi sayı gelir?','["16","13","17","14"]',3,'15''den bir geri sayınca 14 gelir.',1,15,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-15','coktan_secmeli','15 sayısından hemen sonra hangi sayı gelir?','["14","16","17","13"]',1,'15''den bir ileri sayınca 16 gelir.',1,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-16','coktan_secmeli','16 sayısından hemen önce hangi sayı gelir?','["15","17","14","18"]',0,'16''den bir geri sayınca 15 gelir.',1,16,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-16','coktan_secmeli','16 sayısından hemen sonra hangi sayı gelir?','["15","18","17","14"]',2,'16''den bir ileri sayınca 17 gelir.',1,46,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-17','coktan_secmeli','17 sayısından hemen önce hangi sayı gelir?','["18","16","15","19"]',1,'17''den bir geri sayınca 16 gelir.',1,17,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-17','coktan_secmeli','17 sayısından hemen sonra hangi sayı gelir?','["16","19","15","18"]',3,'17''den bir ileri sayınca 18 gelir.',1,47,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-18','coktan_secmeli','18 sayısından hemen önce hangi sayı gelir?','["19","16","17","20"]',2,'18''den bir geri sayınca 17 gelir.',1,18,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-18','coktan_secmeli','18 sayısından hemen sonra hangi sayı gelir?','["19","17","20","16"]',0,'18''den bir ileri sayınca 19 gelir.',1,48,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-once-19','coktan_secmeli','19 sayısından hemen önce hangi sayı gelir?','["20","17","19","18"]',3,'19''den bir geri sayınca 18 gelir.',1,19,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sonra-19','coktan_secmeli','19 sayısından hemen sonra hangi sayı gelir?','["18","20","17","19"]',1,'19''den bir ileri sayınca 20 gelir.',1,49,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-once-sonra' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-1','coktan_secmeli','1 ile 2 sayılarından hangisi daha büyüktür?','["1","İkisi eşit","Bilinemez","2"]',3,'2, 1''den büyüktür.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-1','coktan_secmeli','1 ile 2 sayılarından hangisi daha küçüktür?','["2","1","İkisi eşit","Bilinemez"]',1,'1, 2''den küçüktür.',1,51,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-2','coktan_secmeli','1 ile 4 sayılarından hangisi daha büyüktür?','["1","4","İkisi eşit","Bilinemez"]',1,'4, 1''den büyüktür.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-2','coktan_secmeli','1 ile 4 sayılarından hangisi daha küçüktür?','["4","İkisi eşit","Bilinemez","1"]',3,'1, 4''den küçüktür.',1,52,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-3','coktan_secmeli','1 ile 6 sayılarından hangisi daha büyüktür?','["1","İkisi eşit","Bilinemez","6"]',3,'6, 1''den büyüktür.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-3','coktan_secmeli','1 ile 6 sayılarından hangisi daha küçüktür?','["6","1","İkisi eşit","Bilinemez"]',1,'1, 6''den küçüktür.',1,53,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-4','coktan_secmeli','3 ile 4 sayılarından hangisi daha büyüktür?','["3","İkisi eşit","Bilinemez","4"]',3,'4, 3''den büyüktür.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-4','coktan_secmeli','3 ile 4 sayılarından hangisi daha küçüktür?','["4","3","İkisi eşit","Bilinemez"]',1,'3, 4''den küçüktür.',1,54,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-5','coktan_secmeli','3 ile 6 sayılarından hangisi daha büyüktür?','["3","6","İkisi eşit","Bilinemez"]',1,'6, 3''den büyüktür.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-5','coktan_secmeli','3 ile 6 sayılarından hangisi daha küçüktür?','["6","İkisi eşit","Bilinemez","3"]',3,'3, 6''den küçüktür.',1,55,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-6','coktan_secmeli','3 ile 8 sayılarından hangisi daha büyüktür?','["3","İkisi eşit","Bilinemez","8"]',3,'8, 3''den büyüktür.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-6','coktan_secmeli','3 ile 8 sayılarından hangisi daha küçüktür?','["8","3","İkisi eşit","Bilinemez"]',1,'3, 8''den küçüktür.',1,56,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-7','coktan_secmeli','5 ile 6 sayılarından hangisi daha büyüktür?','["5","İkisi eşit","Bilinemez","6"]',3,'6, 5''den büyüktür.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-7','coktan_secmeli','5 ile 6 sayılarından hangisi daha küçüktür?','["6","5","İkisi eşit","Bilinemez"]',1,'5, 6''den küçüktür.',1,57,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-8','coktan_secmeli','5 ile 8 sayılarından hangisi daha büyüktür?','["5","8","İkisi eşit","Bilinemez"]',1,'8, 5''den büyüktür.',1,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-8','coktan_secmeli','5 ile 8 sayılarından hangisi daha küçüktür?','["8","İkisi eşit","Bilinemez","5"]',3,'5, 8''den küçüktür.',1,58,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-9','coktan_secmeli','5 ile 10 sayılarından hangisi daha büyüktür?','["5","İkisi eşit","Bilinemez","10"]',3,'10, 5''den büyüktür.',1,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-9','coktan_secmeli','5 ile 10 sayılarından hangisi daha küçüktür?','["10","5","İkisi eşit","Bilinemez"]',1,'5, 10''den küçüktür.',1,59,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-10','coktan_secmeli','7 ile 8 sayılarından hangisi daha büyüktür?','["7","İkisi eşit","Bilinemez","8"]',3,'8, 7''den büyüktür.',1,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-10','coktan_secmeli','7 ile 8 sayılarından hangisi daha küçüktür?','["8","7","İkisi eşit","Bilinemez"]',1,'7, 8''den küçüktür.',1,60,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-11','coktan_secmeli','7 ile 10 sayılarından hangisi daha büyüktür?','["7","10","İkisi eşit","Bilinemez"]',1,'10, 7''den büyüktür.',1,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-11','coktan_secmeli','7 ile 10 sayılarından hangisi daha küçüktür?','["10","İkisi eşit","Bilinemez","7"]',3,'7, 10''den küçüktür.',1,61,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-12','coktan_secmeli','7 ile 12 sayılarından hangisi daha büyüktür?','["7","İkisi eşit","Bilinemez","12"]',3,'12, 7''den büyüktür.',1,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-12','coktan_secmeli','7 ile 12 sayılarından hangisi daha küçüktür?','["12","7","İkisi eşit","Bilinemez"]',1,'7, 12''den küçüktür.',1,62,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-13','coktan_secmeli','9 ile 10 sayılarından hangisi daha büyüktür?','["9","İkisi eşit","Bilinemez","10"]',3,'10, 9''den büyüktür.',1,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-13','coktan_secmeli','9 ile 10 sayılarından hangisi daha küçüktür?','["10","9","İkisi eşit","Bilinemez"]',1,'9, 10''den küçüktür.',1,63,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-14','coktan_secmeli','9 ile 12 sayılarından hangisi daha büyüktür?','["9","12","İkisi eşit","Bilinemez"]',1,'12, 9''den büyüktür.',1,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-14','coktan_secmeli','9 ile 12 sayılarından hangisi daha küçüktür?','["12","İkisi eşit","Bilinemez","9"]',3,'9, 12''den küçüktür.',1,64,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-15','coktan_secmeli','9 ile 14 sayılarından hangisi daha büyüktür?','["9","İkisi eşit","Bilinemez","14"]',3,'14, 9''den büyüktür.',1,15,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-15','coktan_secmeli','9 ile 14 sayılarından hangisi daha küçüktür?','["14","9","İkisi eşit","Bilinemez"]',1,'9, 14''den küçüktür.',1,65,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-16','coktan_secmeli','11 ile 12 sayılarından hangisi daha büyüktür?','["11","İkisi eşit","Bilinemez","12"]',3,'12, 11''den büyüktür.',1,16,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-16','coktan_secmeli','11 ile 12 sayılarından hangisi daha küçüktür?','["12","11","İkisi eşit","Bilinemez"]',1,'11, 12''den küçüktür.',1,66,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-17','coktan_secmeli','11 ile 14 sayılarından hangisi daha büyüktür?','["11","14","İkisi eşit","Bilinemez"]',1,'14, 11''den büyüktür.',1,17,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-17','coktan_secmeli','11 ile 14 sayılarından hangisi daha küçüktür?','["14","İkisi eşit","Bilinemez","11"]',3,'11, 14''den küçüktür.',1,67,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-18','coktan_secmeli','11 ile 16 sayılarından hangisi daha büyüktür?','["11","İkisi eşit","Bilinemez","16"]',3,'16, 11''den büyüktür.',1,18,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-18','coktan_secmeli','11 ile 16 sayılarından hangisi daha küçüktür?','["16","11","İkisi eşit","Bilinemez"]',1,'11, 16''den küçüktür.',1,68,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-19','coktan_secmeli','13 ile 14 sayılarından hangisi daha büyüktür?','["13","İkisi eşit","Bilinemez","14"]',3,'14, 13''den büyüktür.',1,19,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-19','coktan_secmeli','13 ile 14 sayılarından hangisi daha küçüktür?','["14","13","İkisi eşit","Bilinemez"]',1,'13, 14''den küçüktür.',1,69,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-20','coktan_secmeli','13 ile 16 sayılarından hangisi daha büyüktür?','["13","16","İkisi eşit","Bilinemez"]',1,'16, 13''den büyüktür.',1,20,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-20','coktan_secmeli','13 ile 16 sayılarından hangisi daha küçüktür?','["16","İkisi eşit","Bilinemez","13"]',3,'13, 16''den küçüktür.',1,70,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-21','coktan_secmeli','13 ile 18 sayılarından hangisi daha büyüktür?','["13","İkisi eşit","Bilinemez","18"]',3,'18, 13''den büyüktür.',1,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-21','coktan_secmeli','13 ile 18 sayılarından hangisi daha küçüktür?','["18","13","İkisi eşit","Bilinemez"]',1,'13, 18''den küçüktür.',1,71,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-22','coktan_secmeli','15 ile 16 sayılarından hangisi daha büyüktür?','["15","İkisi eşit","Bilinemez","16"]',3,'16, 15''den büyüktür.',1,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-22','coktan_secmeli','15 ile 16 sayılarından hangisi daha küçüktür?','["16","15","İkisi eşit","Bilinemez"]',1,'15, 16''den küçüktür.',1,72,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-23','coktan_secmeli','15 ile 18 sayılarından hangisi daha büyüktür?','["15","18","İkisi eşit","Bilinemez"]',1,'18, 15''den büyüktür.',1,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-23','coktan_secmeli','15 ile 18 sayılarından hangisi daha küçüktür?','["18","İkisi eşit","Bilinemez","15"]',3,'15, 18''den küçüktür.',1,73,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-buyuk-24','coktan_secmeli','15 ile 20 sayılarından hangisi daha büyüktür?','["15","İkisi eşit","Bilinemez","20"]',3,'20, 15''den büyüktür.',1,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kucuk-24','coktan_secmeli','15 ile 20 sayılarından hangisi daha küçüktür?','["20","15","İkisi eşit","Bilinemez"]',1,'15, 20''den küçüktür.',1,74,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-karsilastirma' AND (d.kod='matematik' OR d.ad='Matematik')
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
SELECT k.id,'mat-tahmin-1','coktan_secmeli','Bir eldeki parmak sayısı kaçtır?','["5","15","20","1"]',0,'Bir elde 5 parmak vardır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-tahmin-2','coktan_secmeli','İki eldeki parmakların toplamı kaçtır?','["3","10","18","1"]',1,'İki elde toplam 10 parmak vardır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-tahmin-3','coktan_secmeli','Bir haftadaki gün sayısı kaçtır?','["17","2","7","20"]',2,'Bir hafta 7 gündür.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-tahmin-4','coktan_secmeli','Bir çift ayakkabıda kaç ayakkabı vardır?','["4","6","8","2"]',3,'Bir çift iki parçadan oluşur.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-tahmin-5','coktan_secmeli','Üç tekerlekli bisikletin tekerlek sayısı kaçtır?','["3","2","4","5"]',0,'Üç tekerlekli bisiklette 3 tekerlek vardır.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-tahmin-6','coktan_secmeli','Dört sandalyeli masada sandalye sayısı kaçtır?','["14","4","2","8"]',1,'Masada 4 sandalye vardır.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-tahmin-7','coktan_secmeli','Bir eldiven çifti kaç eldivenden oluşur?','["1","4","2","6"]',2,'Bir çift iki eldivendir.',2,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-tahmin-8','coktan_secmeli','İki çift çorapta toplam kaç çorap vardır?','["2","6","8","4"]',3,'İki çift toplam 4 çoraptır.',2,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-tahmin' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-uzunluk-1','coktan_secmeli','Hangisi genellikle daha uzundur?','["Cetvel","Silgi","Ataş","Düğme"]',0,'Cetvel genellikle daha uzundur.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-uzunluk-2','coktan_secmeli','Kalem silgiden daha uzunsa hangisi doğrudur?','["Silgi daha uzundur.","Kalem daha uzundur.","Boyları eşittir.","Bilinemez."]',1,'Kalem daha uzundur.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-uzunluk-3','coktan_secmeli','Masayı karışla ölçmek hangi tür ölçmedir?','["Para ölçme","Kütle ölçme","Standart olmayan ölçme","Zaman ölçme"]',2,'Karış standart olmayan ölçmedir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-uzunluk-4','coktan_secmeli','Kitabın boyunu nasıl karşılaştırabiliriz?','["Su doldurarak","Tartarak","Saat tutarak","Ataşları yan yana dizerek"]',3,'Ataşlarla uzunluk karşılaştırılabilir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
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
SELECT k.id,'mat-kutle-1','coktan_secmeli','Hangisi genellikle daha ağırdır?','["Kitap","Kâğıt yaprak","Tüy","Ataş"]',0,'Kitap genellikle daha ağırdır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kutle-2','coktan_secmeli','Karpuz ile elmayı karşılaştırırsak hangisi genellikle daha ağırdır?','["Elma","Karpuz","Eşittir","Bilinemez"]',1,'Karpuz genellikle daha ağırdır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kutle-3','coktan_secmeli','Ağır-hafif karşılaştırması hangi özellikle ilgilidir?','["Renk","Şekil","Kütle","Ad"]',2,'Ağır-hafif kütleyle ilgilidir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-kutle-4','coktan_secmeli','Çanta ne zaman daha ağır olur?','["Boşken","Rengine göre","Her zaman aynı","Kitaplarla doluyken"]',3,'Kitap eklenince ağırlaşır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
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
SELECT k.id,'mat-top-1','coktan_secmeli','1 + 1 işleminin sonucu kaçtır?','["3","1","4","2"]',3,'1+1=2.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-2','coktan_secmeli','1 + 2 işleminin sonucu kaçtır?','["3","4","2","5"]',0,'1+2=3.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-3','coktan_secmeli','1 + 3 işleminin sonucu kaçtır?','["5","4","3","6"]',1,'1+3=4.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-4','coktan_secmeli','1 + 4 işleminin sonucu kaçtır?','["6","4","5","7"]',2,'1+4=5.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-5','coktan_secmeli','1 + 5 işleminin sonucu kaçtır?','["7","5","8","6"]',3,'1+5=6.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-6','coktan_secmeli','1 + 6 işleminin sonucu kaçtır?','["7","8","6","9"]',0,'1+6=7.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-7','coktan_secmeli','1 + 7 işleminin sonucu kaçtır?','["9","8","7","10"]',1,'1+7=8.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-8','coktan_secmeli','1 + 8 işleminin sonucu kaçtır?','["10","8","9","11"]',2,'1+8=9.',1,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-9','coktan_secmeli','1 + 9 işleminin sonucu kaçtır?','["11","9","12","10"]',3,'1+9=10.',1,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-10','coktan_secmeli','1 + 10 işleminin sonucu kaçtır?','["11","12","10","13"]',0,'1+10=11.',2,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-11','coktan_secmeli','2 + 1 işleminin sonucu kaçtır?','["4","3","2","5"]',1,'2+1=3.',1,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-12','coktan_secmeli','2 + 2 işleminin sonucu kaçtır?','["5","3","4","6"]',2,'2+2=4.',1,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-13','coktan_secmeli','2 + 3 işleminin sonucu kaçtır?','["6","4","7","5"]',3,'2+3=5.',1,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-14','coktan_secmeli','2 + 4 işleminin sonucu kaçtır?','["6","7","5","8"]',0,'2+4=6.',1,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-15','coktan_secmeli','2 + 5 işleminin sonucu kaçtır?','["8","7","6","9"]',1,'2+5=7.',1,15,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-16','coktan_secmeli','2 + 6 işleminin sonucu kaçtır?','["9","7","8","10"]',2,'2+6=8.',1,16,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-17','coktan_secmeli','2 + 7 işleminin sonucu kaçtır?','["10","8","11","9"]',3,'2+7=9.',1,17,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-18','coktan_secmeli','2 + 8 işleminin sonucu kaçtır?','["10","11","9","12"]',0,'2+8=10.',1,18,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-19','coktan_secmeli','2 + 9 işleminin sonucu kaçtır?','["12","11","10","13"]',1,'2+9=11.',2,19,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-20','coktan_secmeli','2 + 10 işleminin sonucu kaçtır?','["13","11","12","14"]',2,'2+10=12.',2,20,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-21','coktan_secmeli','3 + 1 işleminin sonucu kaçtır?','["5","3","6","4"]',3,'3+1=4.',1,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-22','coktan_secmeli','3 + 2 işleminin sonucu kaçtır?','["5","6","4","7"]',0,'3+2=5.',1,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-23','coktan_secmeli','3 + 3 işleminin sonucu kaçtır?','["7","6","5","8"]',1,'3+3=6.',1,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-24','coktan_secmeli','3 + 4 işleminin sonucu kaçtır?','["8","6","7","9"]',2,'3+4=7.',1,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-25','coktan_secmeli','3 + 5 işleminin sonucu kaçtır?','["9","7","10","8"]',3,'3+5=8.',1,25,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-26','coktan_secmeli','3 + 6 işleminin sonucu kaçtır?','["9","10","8","11"]',0,'3+6=9.',1,26,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-27','coktan_secmeli','3 + 7 işleminin sonucu kaçtır?','["11","10","9","12"]',1,'3+7=10.',1,27,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-28','coktan_secmeli','3 + 8 işleminin sonucu kaçtır?','["12","10","11","13"]',2,'3+8=11.',2,28,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-29','coktan_secmeli','3 + 9 işleminin sonucu kaçtır?','["13","11","14","12"]',3,'3+9=12.',2,29,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-30','coktan_secmeli','3 + 10 işleminin sonucu kaçtır?','["13","14","12","15"]',0,'3+10=13.',2,30,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-31','coktan_secmeli','4 + 1 işleminin sonucu kaçtır?','["6","5","4","7"]',1,'4+1=5.',1,31,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-32','coktan_secmeli','4 + 2 işleminin sonucu kaçtır?','["7","5","6","8"]',2,'4+2=6.',1,32,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-33','coktan_secmeli','4 + 3 işleminin sonucu kaçtır?','["8","6","9","7"]',3,'4+3=7.',1,33,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-34','coktan_secmeli','4 + 4 işleminin sonucu kaçtır?','["8","9","7","10"]',0,'4+4=8.',1,34,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-35','coktan_secmeli','4 + 5 işleminin sonucu kaçtır?','["10","9","8","11"]',1,'4+5=9.',1,35,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-36','coktan_secmeli','4 + 6 işleminin sonucu kaçtır?','["11","9","10","12"]',2,'4+6=10.',1,36,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-37','coktan_secmeli','4 + 7 işleminin sonucu kaçtır?','["12","10","13","11"]',3,'4+7=11.',2,37,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-38','coktan_secmeli','4 + 8 işleminin sonucu kaçtır?','["12","13","11","14"]',0,'4+8=12.',2,38,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-39','coktan_secmeli','4 + 9 işleminin sonucu kaçtır?','["14","13","12","15"]',1,'4+9=13.',2,39,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-40','coktan_secmeli','4 + 10 işleminin sonucu kaçtır?','["15","13","14","16"]',2,'4+10=14.',2,40,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-41','coktan_secmeli','5 + 1 işleminin sonucu kaçtır?','["7","5","8","6"]',3,'5+1=6.',1,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-42','coktan_secmeli','5 + 2 işleminin sonucu kaçtır?','["7","8","6","9"]',0,'5+2=7.',1,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-43','coktan_secmeli','5 + 3 işleminin sonucu kaçtır?','["9","8","7","10"]',1,'5+3=8.',1,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-44','coktan_secmeli','5 + 4 işleminin sonucu kaçtır?','["10","8","9","11"]',2,'5+4=9.',1,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-45','coktan_secmeli','5 + 5 işleminin sonucu kaçtır?','["11","9","12","10"]',3,'5+5=10.',1,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-46','coktan_secmeli','5 + 6 işleminin sonucu kaçtır?','["11","12","10","13"]',0,'5+6=11.',2,46,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-47','coktan_secmeli','5 + 7 işleminin sonucu kaçtır?','["13","12","11","14"]',1,'5+7=12.',2,47,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-48','coktan_secmeli','5 + 8 işleminin sonucu kaçtır?','["14","12","13","15"]',2,'5+8=13.',2,48,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-49','coktan_secmeli','5 + 9 işleminin sonucu kaçtır?','["15","13","16","14"]',3,'5+9=14.',2,49,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-50','coktan_secmeli','5 + 10 işleminin sonucu kaçtır?','["15","16","14","17"]',0,'5+10=15.',2,50,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-51','coktan_secmeli','6 + 1 işleminin sonucu kaçtır?','["8","7","6","9"]',1,'6+1=7.',1,51,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-52','coktan_secmeli','6 + 2 işleminin sonucu kaçtır?','["9","7","8","10"]',2,'6+2=8.',1,52,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-53','coktan_secmeli','6 + 3 işleminin sonucu kaçtır?','["10","8","11","9"]',3,'6+3=9.',1,53,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-54','coktan_secmeli','6 + 4 işleminin sonucu kaçtır?','["10","11","9","12"]',0,'6+4=10.',1,54,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-55','coktan_secmeli','6 + 5 işleminin sonucu kaçtır?','["12","11","10","13"]',1,'6+5=11.',2,55,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-56','coktan_secmeli','6 + 6 işleminin sonucu kaçtır?','["13","11","12","14"]',2,'6+6=12.',2,56,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-57','coktan_secmeli','6 + 7 işleminin sonucu kaçtır?','["14","12","15","13"]',3,'6+7=13.',2,57,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-58','coktan_secmeli','6 + 8 işleminin sonucu kaçtır?','["14","15","13","16"]',0,'6+8=14.',2,58,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-59','coktan_secmeli','6 + 9 işleminin sonucu kaçtır?','["16","15","14","17"]',1,'6+9=15.',2,59,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-60','coktan_secmeli','6 + 10 işleminin sonucu kaçtır?','["17","15","16","18"]',2,'6+10=16.',2,60,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-61','coktan_secmeli','7 + 1 işleminin sonucu kaçtır?','["9","7","10","8"]',3,'7+1=8.',1,61,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-62','coktan_secmeli','7 + 2 işleminin sonucu kaçtır?','["9","10","8","11"]',0,'7+2=9.',1,62,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-63','coktan_secmeli','7 + 3 işleminin sonucu kaçtır?','["11","10","9","12"]',1,'7+3=10.',1,63,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-64','coktan_secmeli','7 + 4 işleminin sonucu kaçtır?','["12","10","11","13"]',2,'7+4=11.',2,64,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-65','coktan_secmeli','7 + 5 işleminin sonucu kaçtır?','["13","11","14","12"]',3,'7+5=12.',2,65,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-66','coktan_secmeli','7 + 6 işleminin sonucu kaçtır?','["13","14","12","15"]',0,'7+6=13.',2,66,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-67','coktan_secmeli','7 + 7 işleminin sonucu kaçtır?','["15","14","13","16"]',1,'7+7=14.',2,67,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-68','coktan_secmeli','7 + 8 işleminin sonucu kaçtır?','["16","14","15","17"]',2,'7+8=15.',2,68,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-69','coktan_secmeli','7 + 9 işleminin sonucu kaçtır?','["17","15","18","16"]',3,'7+9=16.',2,69,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-top-70','coktan_secmeli','7 + 10 işleminin sonucu kaçtır?','["17","18","16","19"]',0,'7+10=17.',2,70,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-1','coktan_secmeli','2 - 1 işleminin sonucu kaçtır?','["2","3","4","1"]',3,'2-1=1.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-2','coktan_secmeli','3 - 1 işleminin sonucu kaçtır?','["2","3","4","5"]',0,'3-1=2.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-3','coktan_secmeli','3 - 2 işleminin sonucu kaçtır?','["2","1","3","4"]',1,'3-2=1.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-4','coktan_secmeli','4 - 1 işleminin sonucu kaçtır?','["4","3","5","6"]',1,'4-1=3.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-5','coktan_secmeli','4 - 2 işleminin sonucu kaçtır?','["3","4","2","5"]',2,'4-2=2.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-6','coktan_secmeli','4 - 3 işleminin sonucu kaçtır?','["2","3","4","1"]',3,'4-3=1.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-7','coktan_secmeli','5 - 1 işleminin sonucu kaçtır?','["5","6","4","7"]',2,'5-1=4.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-8','coktan_secmeli','5 - 2 işleminin sonucu kaçtır?','["4","5","6","3"]',3,'5-2=3.',1,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-9','coktan_secmeli','5 - 3 işleminin sonucu kaçtır?','["2","3","4","5"]',0,'5-3=2.',1,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-10','coktan_secmeli','6 - 1 işleminin sonucu kaçtır?','["6","7","8","5"]',3,'6-1=5.',1,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-11','coktan_secmeli','6 - 2 işleminin sonucu kaçtır?','["4","5","6","7"]',0,'6-2=4.',1,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-12','coktan_secmeli','6 - 3 işleminin sonucu kaçtır?','["4","3","5","6"]',1,'6-3=3.',1,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-13','coktan_secmeli','6 - 4 işleminin sonucu kaçtır?','["3","4","2","5"]',2,'6-4=2.',1,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-14','coktan_secmeli','7 - 1 işleminin sonucu kaçtır?','["6","7","8","9"]',0,'7-1=6.',1,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-15','coktan_secmeli','7 - 2 işleminin sonucu kaçtır?','["6","5","7","8"]',1,'7-2=5.',1,15,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-16','coktan_secmeli','7 - 3 işleminin sonucu kaçtır?','["5","6","4","7"]',2,'7-3=4.',1,16,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-17','coktan_secmeli','7 - 5 işleminin sonucu kaçtır?','["2","3","4","5"]',0,'7-5=2.',1,17,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-18','coktan_secmeli','8 - 1 işleminin sonucu kaçtır?','["8","7","9","10"]',1,'8-1=7.',1,18,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-19','coktan_secmeli','8 - 2 işleminin sonucu kaçtır?','["7","8","6","9"]',2,'8-2=6.',1,19,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-20','coktan_secmeli','8 - 3 işleminin sonucu kaçtır?','["6","7","8","5"]',3,'8-3=5.',1,20,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-21','coktan_secmeli','8 - 4 işleminin sonucu kaçtır?','["4","5","6","7"]',0,'8-4=4.',1,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-22','coktan_secmeli','8 - 6 işleminin sonucu kaçtır?','["3","4","2","5"]',2,'8-6=2.',1,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-23','coktan_secmeli','9 - 1 işleminin sonucu kaçtır?','["9","10","8","11"]',2,'9-1=8.',1,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-24','coktan_secmeli','9 - 2 işleminin sonucu kaçtır?','["8","9","10","7"]',3,'9-2=7.',1,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-25','coktan_secmeli','9 - 3 işleminin sonucu kaçtır?','["6","7","8","9"]',0,'9-3=6.',1,25,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-26','coktan_secmeli','9 - 5 işleminin sonucu kaçtır?','["5","6","4","7"]',2,'9-5=4.',1,26,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-27','coktan_secmeli','9 - 7 işleminin sonucu kaçtır?','["2","3","4","5"]',0,'9-7=2.',1,27,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-28','coktan_secmeli','10 - 1 işleminin sonucu kaçtır?','["10","11","12","9"]',3,'10-1=9.',1,28,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-29','coktan_secmeli','10 - 2 işleminin sonucu kaçtır?','["8","9","10","11"]',0,'10-2=8.',1,29,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-30','coktan_secmeli','10 - 3 işleminin sonucu kaçtır?','["8","7","9","10"]',1,'10-3=7.',1,30,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-31','coktan_secmeli','10 - 4 işleminin sonucu kaçtır?','["7","8","6","9"]',2,'10-4=6.',1,31,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-32','coktan_secmeli','10 - 6 işleminin sonucu kaçtır?','["4","5","6","7"]',0,'10-6=4.',1,32,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-33','coktan_secmeli','10 - 8 işleminin sonucu kaçtır?','["3","4","2","5"]',2,'10-8=2.',1,33,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-34','coktan_secmeli','11 - 1 işleminin sonucu kaçtır?','["10","11","12","13"]',0,'11-1=10.',2,34,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-35','coktan_secmeli','11 - 2 işleminin sonucu kaçtır?','["10","9","11","12"]',1,'11-2=9.',2,35,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-36','coktan_secmeli','11 - 3 işleminin sonucu kaçtır?','["9","10","8","11"]',2,'11-3=8.',2,36,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-37','coktan_secmeli','11 - 5 işleminin sonucu kaçtır?','["6","7","8","9"]',0,'11-5=6.',2,37,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-38','coktan_secmeli','11 - 7 işleminin sonucu kaçtır?','["5","6","4","7"]',2,'11-7=4.',2,38,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-39','coktan_secmeli','11 - 9 işleminin sonucu kaçtır?','["2","3","4","5"]',0,'11-9=2.',2,39,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-40','coktan_secmeli','12 - 1 işleminin sonucu kaçtır?','["12","11","13","14"]',1,'12-1=11.',2,40,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-41','coktan_secmeli','12 - 2 işleminin sonucu kaçtır?','["11","12","10","13"]',2,'12-2=10.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-42','coktan_secmeli','12 - 3 işleminin sonucu kaçtır?','["10","11","12","9"]',3,'12-3=9.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-43','coktan_secmeli','12 - 4 işleminin sonucu kaçtır?','["8","9","10","11"]',0,'12-4=8.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-44','coktan_secmeli','12 - 6 işleminin sonucu kaçtır?','["7","8","6","9"]',2,'12-6=6.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-45','coktan_secmeli','12 - 8 işleminin sonucu kaçtır?','["4","5","6","7"]',0,'12-8=4.',2,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-46','coktan_secmeli','12 - 10 işleminin sonucu kaçtır?','["3","4","2","5"]',2,'12-10=2.',2,46,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-47','coktan_secmeli','13 - 1 işleminin sonucu kaçtır?','["13","14","12","15"]',2,'13-1=12.',2,47,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-48','coktan_secmeli','13 - 2 işleminin sonucu kaçtır?','["12","13","14","11"]',3,'13-2=11.',2,48,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-49','coktan_secmeli','13 - 3 işleminin sonucu kaçtır?','["10","11","12","13"]',0,'13-3=10.',2,49,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-50','coktan_secmeli','13 - 5 işleminin sonucu kaçtır?','["9","10","8","11"]',2,'13-5=8.',2,50,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-51','coktan_secmeli','13 - 7 işleminin sonucu kaçtır?','["6","7","8","9"]',0,'13-7=6.',2,51,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-52','coktan_secmeli','13 - 9 işleminin sonucu kaçtır?','["5","6","4","7"]',2,'13-9=4.',2,52,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-53','coktan_secmeli','13 - 11 işleminin sonucu kaçtır?','["2","3","4","5"]',0,'13-11=2.',2,53,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-54','coktan_secmeli','14 - 1 işleminin sonucu kaçtır?','["14","15","16","13"]',3,'14-1=13.',2,54,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-55','coktan_secmeli','14 - 2 işleminin sonucu kaçtır?','["12","13","14","15"]',0,'14-2=12.',2,55,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-56','coktan_secmeli','14 - 3 işleminin sonucu kaçtır?','["12","11","13","14"]',1,'14-3=11.',2,56,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-57','coktan_secmeli','14 - 4 işleminin sonucu kaçtır?','["11","12","10","13"]',2,'14-4=10.',2,57,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-58','coktan_secmeli','14 - 6 işleminin sonucu kaçtır?','["8","9","10","11"]',0,'14-6=8.',2,58,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-59','coktan_secmeli','14 - 8 işleminin sonucu kaçtır?','["7","8","6","9"]',2,'14-8=6.',2,59,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-60','coktan_secmeli','14 - 10 işleminin sonucu kaçtır?','["4","5","6","7"]',0,'14-10=4.',2,60,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-61','coktan_secmeli','14 - 12 işleminin sonucu kaçtır?','["3","4","2","5"]',2,'14-12=2.',2,61,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-62','coktan_secmeli','15 - 1 işleminin sonucu kaçtır?','["14","15","16","17"]',0,'15-1=14.',2,62,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-63','coktan_secmeli','15 - 2 işleminin sonucu kaçtır?','["14","13","15","16"]',1,'15-2=13.',2,63,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-64','coktan_secmeli','15 - 3 işleminin sonucu kaçtır?','["13","14","12","15"]',2,'15-3=12.',2,64,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-65','coktan_secmeli','15 - 5 işleminin sonucu kaçtır?','["10","11","12","13"]',0,'15-5=10.',2,65,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-66','coktan_secmeli','15 - 7 işleminin sonucu kaçtır?','["9","10","8","11"]',2,'15-7=8.',2,66,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-67','coktan_secmeli','15 - 9 işleminin sonucu kaçtır?','["6","7","8","9"]',0,'15-9=6.',2,67,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-68','coktan_secmeli','15 - 11 işleminin sonucu kaçtır?','["5","6","4","7"]',2,'15-11=4.',2,68,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-69','coktan_secmeli','15 - 13 işleminin sonucu kaçtır?','["2","3","4","5"]',0,'15-13=2.',2,69,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-cik-70','coktan_secmeli','16 - 1 işleminin sonucu kaçtır?','["16","15","17","18"]',1,'16-1=15.',2,70,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-2','coktan_secmeli','1 + 1 = __  Boşluğa hangi sayı gelmelidir?','["3","1","2","4"]',2,'1+1=2.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-3','coktan_secmeli','1 + 2 = __  Boşluğa hangi sayı gelmelidir?','["4","2","5","3"]',3,'1+2=3.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-4','coktan_secmeli','2 + 2 = __  Boşluğa hangi sayı gelmelidir?','["4","5","3","6"]',0,'2+2=4.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-5','coktan_secmeli','2 + 3 = __  Boşluğa hangi sayı gelmelidir?','["6","5","4","7"]',1,'2+3=5.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-6','coktan_secmeli','3 + 3 = __  Boşluğa hangi sayı gelmelidir?','["7","5","6","8"]',2,'3+3=6.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-7','coktan_secmeli','3 + 4 = __  Boşluğa hangi sayı gelmelidir?','["8","6","9","7"]',3,'3+4=7.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-8','coktan_secmeli','4 + 4 = __  Boşluğa hangi sayı gelmelidir?','["8","9","7","10"]',0,'4+4=8.',1,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-9','coktan_secmeli','4 + 5 = __  Boşluğa hangi sayı gelmelidir?','["10","9","8","11"]',1,'4+5=9.',1,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-10','coktan_secmeli','5 + 5 = __  Boşluğa hangi sayı gelmelidir?','["11","9","10","12"]',2,'5+5=10.',1,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-11','coktan_secmeli','5 + 6 = __  Boşluğa hangi sayı gelmelidir?','["12","10","13","11"]',3,'5+6=11.',1,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-esit-12','coktan_secmeli','6 + 6 = __  Boşluğa hangi sayı gelmelidir?','["12","13","11","14"]',0,'6+6=12.',1,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-5','coktan_secmeli','__ + 4 = 5 eşitliğinde eksik sayı kaçtır?','["2","0","1","3"]',2,'1+4=5.',2,35,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-6','coktan_secmeli','__ + 2 = 6 eşitliğinde eksik sayı kaçtır?','["5","3","6","4"]',3,'4+2=6.',2,36,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-7','coktan_secmeli','__ + 3 = 7 eşitliğinde eksik sayı kaçtır?','["4","5","3","6"]',0,'4+3=7.',2,37,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-8','coktan_secmeli','__ + 4 = 8 eşitliğinde eksik sayı kaçtır?','["5","4","3","6"]',1,'4+4=8.',2,38,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-9','coktan_secmeli','__ + 2 = 9 eşitliğinde eksik sayı kaçtır?','["8","6","7","9"]',2,'7+2=9.',2,39,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-10','coktan_secmeli','__ + 3 = 10 eşitliğinde eksik sayı kaçtır?','["8","6","9","7"]',3,'7+3=10.',2,40,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-11','coktan_secmeli','__ + 4 = 11 eşitliğinde eksik sayı kaçtır?','["7","8","6","9"]',0,'7+4=11.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-12','coktan_secmeli','__ + 2 = 12 eşitliğinde eksik sayı kaçtır?','["11","10","9","12"]',1,'10+2=12.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-13','coktan_secmeli','__ + 3 = 13 eşitliğinde eksik sayı kaçtır?','["11","9","10","12"]',2,'10+3=13.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-14','coktan_secmeli','__ + 4 = 14 eşitliğinde eksik sayı kaçtır?','["11","9","12","10"]',3,'10+4=14.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-bilinmeyen-15','coktan_secmeli','__ + 2 = 15 eşitliğinde eksik sayı kaçtır?','["13","14","12","15"]',0,'13+2=15.',2,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-esitlik' AND (d.kod='matematik' OR d.ad='Matematik')
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
SELECT k.id,'mat-yon-1','coktan_secmeli','Kitap masanın üstündeyse masa kitaba göre nerededir?','["Altında","Üstünde","Sağında","Önünde"]',0,'Masa kitabın altındadır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-yon-konum' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-yon-2','coktan_secmeli','Sağ elini kaldırman istenirse hangi yönü kullanırsın?','["Sol","Sağ","Arka","Alt"]',1,'Yönerge sağ yönü söylüyor.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-yon-konum' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-yon-3','coktan_secmeli','Top sandalyenin altında ise top nerededir?','["Sandalyenin üstünde","Kapının önünde","Sandalyenin altında","Masanın sağında"]',2,'Top sandalyenin altındadır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-yon-konum' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-yon-4','coktan_secmeli','Önünde duran arkadaşına doğru yürümek hangi yöndür?','["Geri","Aşağı","Sol","İleri"]',3,'Öndeki hedefe gitmek ileri yöndür.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-yon-konum' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-yon-5','coktan_secmeli','Geriye doğru bir adım atmak hangi yöndür?','["Geri","İleri","Yukarı","Sağ"]',0,'Geriye adım geri yöndür.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-yon-konum' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-yon-6','coktan_secmeli','Bir nesne sol tarafındaysa hangi yöne dönersin?','["Sağa","Sola","Yukarı","Aşağı"]',1,'Nesne sol taraftadır.',1,6,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-yon-konum' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-yon-7','coktan_secmeli','Kedi kutunun içinde ise konumu hangisidir?','["Dışında","Üstünde","İçinde","Arkasında"]',2,'Kedi kutunun içindedir.',2,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-yon-konum' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-yon-8','coktan_secmeli','Bir nesne başımızın üzerindeyse hangi konumdadır?','["Aşağıda","Solda","Geride","Yukarıda"]',3,'Başın üzeri yukarıdır.',2,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-yon-konum' AND (d.kod='matematik' OR d.ad='Matematik')
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
SELECT k.id,'mat-sekil-9','coktan_secmeli','Pencereye benzeyen şekil çoğunlukla hangisidir?','["Dikdörtgen","Üçgen","Çember","Nokta"]',0,'Birçok pencere dikdörtgendir.',2,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sekil-10','coktan_secmeli','Yuvarlak saat yüzü hangi şekle benzer?','["Kare","Çember","Üçgen","Dikdörtgen"]',1,'Çembere benzer.',2,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-sekil-11','coktan_secmeli','Karenin köşe ve kenar sayısı nasıldır?','["3 ve 4''tür.","Köşesi yoktur.","İkisi de 4''tür.","İkisi de 2''dir."]',2,'Karenin 4 köşesi ve 4 kenarı vardır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-sekiller' AND (d.kod='matematik' OR d.ad='Matematik')
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
SELECT k.id,'mat-veri-7','coktan_secmeli','Bir grafikte 6 kırmızı, 3 yeşil nesne varsa fark kaçtır?','["9","2","3","6"]',2,'6-3=3''tür.',1,7,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-veri-okuma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-veri-8','coktan_secmeli','Çetelede |||| kaç tane gösterir?','["3","5","2","4"]',3,'Dört çizgi dört nesneyi gösterir.',2,8,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-veri-okuma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-veri-9','coktan_secmeli','Bir tabloda kitap 7, kalem 4 ise hangisi daha azdır?','["Kalem","Kitap","Eşit","Bilinemez"]',0,'4, 7''den azdır.',2,9,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-veri-okuma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'mat-veri-10','coktan_secmeli','Nesne grafiğinde ⭐⭐⭐⭐⭐ kaç yıldız gösterilir?','["4","5","6","3"]',1,'Beş yıldız vardır.',2,10,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='mat-veri-okuma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;
