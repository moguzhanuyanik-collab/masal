SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-dogal','Doğal Sayılar ve Basamak Değeri','Doğal Sayılar ve Basamak Değeri','Doğal Sayılar ve Basamak Değeri becerilerini uygular.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-yuvarlama','Yuvarlama ve Sıralama','Yuvarlama ve Sıralama','Yuvarlama ve Sıralama becerilerini uygular.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-toplama','Doğal Sayılarla Toplama','Doğal Sayılarla Toplama','Doğal Sayılarla Toplama becerilerini uygular.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-cikarma','Doğal Sayılarla Çıkarma','Doğal Sayılarla Çıkarma','Doğal Sayılarla Çıkarma becerilerini uygular.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-carpma','Doğal Sayılarla Çarpma','Doğal Sayılarla Çarpma','Doğal Sayılarla Çarpma becerilerini uygular.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-bolme','Doğal Sayılarla Bölme','Doğal Sayılarla Bölme','Doğal Sayılarla Bölme becerilerini uygular.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-problem','Dört İşlem Problemleri','Dört İşlem Problemleri','Dört İşlem Problemleri becerilerini uygular.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-kesir','Kesirler','Kesirler','Kesirler becerilerini uygular.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-kesir-islem','Kesirlerle Basit İşlemler','Kesirlerle Basit İşlemler','Kesirlerle Basit İşlemler becerilerini uygular.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-oruntu','Sayı Örüntüleri','Sayı Örüntüleri','Sayı Örüntüleri becerilerini uygular.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-acilar','Açıları Tanıma ve Ölçme','Açıları Tanıma ve Ölçme','Açıları Tanıma ve Ölçme becerilerini uygular.','',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-geometri'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-sekil','Üçgen, Kare ve Dikdörtgen','Üçgen, Kare ve Dikdörtgen','Üçgen, Kare ve Dikdörtgen becerilerini uygular.','',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-geometri'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-simetri','Simetri','Simetri','Simetri becerilerini uygular.','',130,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-geometri'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-cisim','Geometrik Cisimler','Geometrik Cisimler','Geometrik Cisimler becerilerini uygular.','',140,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-geometri'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-uzunluk','Uzunluk Ölçme','Uzunluk Ölçme','Uzunluk Ölçme becerilerini uygular.','',150,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-olcme'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-cevre','Çevre Uzunluğu','Çevre Uzunluğu','Çevre Uzunluğu becerilerini uygular.','',160,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-olcme'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-alan','Alan Ölçmeye Giriş','Alan Ölçmeye Giriş','Alan Ölçmeye Giriş becerilerini uygular.','',170,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-olcme'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-zaman','Zaman Ölçme','Zaman Ölçme','Zaman Ölçme becerilerini uygular.','',180,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-olcme'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-kutle','Tartma','Tartma','Tartma becerilerini uygular.','',190,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-olcme'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-sivi','Sıvı Ölçme','Sıvı Ölçme','Sıvı Ölçme becerilerini uygular.','',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-olcme'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-para','Paralarımız ve ₺ Problemleri','Paralarımız ve ₺ Problemleri','Paralarımız ve ₺ Problemleri becerilerini uygular.','',210,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-olcme'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-tablo','Tablo ve Sütun Grafiği','Tablo ve Sütun Grafiği','Tablo ve Sütun Grafiği becerilerini uygular.','',220,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-veri'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-1','coktan_secmeli','1000 sayısında yüzler basamağının değeri kaçtır?','["1000","011","0","021"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-2','coktan_secmeli','1000 sayısında onlar basamağının değeri kaçtır?','["1000","011","021","0"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-3','coktan_secmeli','1211 sayısında yüzler basamağının değeri kaçtır?','["200","2","10","100"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-4','coktan_secmeli','1211 sayısında onlar basamağının değeri kaçtır?','["1","10","200","1211"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-5','coktan_secmeli','1422 sayısında yüzler basamağının değeri kaçtır?','["4","20","400","200"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-6','coktan_secmeli','1422 sayısında onlar basamağının değeri kaçtır?','["2","400","1422","20"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-7','coktan_secmeli','1633 sayısında yüzler basamağının değeri kaçtır?','["600","6","30","300"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-8','coktan_secmeli','1633 sayısında onlar basamağının değeri kaçtır?','["3","30","600","1633"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-9','coktan_secmeli','1844 sayısında yüzler basamağının değeri kaçtır?','["8","40","800","400"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-10','coktan_secmeli','1844 sayısında onlar basamağının değeri kaçtır?','["4","800","1844","40"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-11','coktan_secmeli','2055 sayısında yüzler basamağının değeri kaçtır?','["0","50","500","2055"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-12','coktan_secmeli','2055 sayısında onlar basamağının değeri kaçtır?','["5","50","0","2055"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-13','coktan_secmeli','2266 sayısında yüzler basamağının değeri kaçtır?','["2","60","200","600"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-14','coktan_secmeli','2266 sayısında onlar basamağının değeri kaçtır?','["6","200","2266","60"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-15','coktan_secmeli','2477 sayısında yüzler basamağının değeri kaçtır?','["400","4","70","700"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-16','coktan_secmeli','2477 sayısında onlar basamağının değeri kaçtır?','["7","70","400","2477"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-17','coktan_secmeli','2688 sayısında yüzler basamağının değeri kaçtır?','["6","80","600","800"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-18','coktan_secmeli','2688 sayısında onlar basamağının değeri kaçtır?','["8","600","2688","80"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-19','coktan_secmeli','2899 sayısında yüzler basamağının değeri kaçtır?','["800","8","90","900"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-20','coktan_secmeli','2899 sayısında onlar basamağının değeri kaçtır?','["9","90","800","2899"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-21','coktan_secmeli','3110 sayısında yüzler basamağının değeri kaçtır?','["1","10","100","0"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-22','coktan_secmeli','3110 sayısında onlar basamağının değeri kaçtır?','["1","100","0","10"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-23','coktan_secmeli','3321 sayısında yüzler basamağının değeri kaçtır?','["300","3","20","100"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-24','coktan_secmeli','3321 sayısında onlar basamağının değeri kaçtır?','["2","20","300","10"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-25','coktan_secmeli','3532 sayısında yüzler basamağının değeri kaçtır?','["5","30","500","200"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-26','coktan_secmeli','3532 sayısında onlar basamağının değeri kaçtır?','["3","500","20","30"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-27','coktan_secmeli','3743 sayısında yüzler basamağının değeri kaçtır?','["700","7","40","300"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,27,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-28','coktan_secmeli','3743 sayısında onlar basamağının değeri kaçtır?','["4","40","700","30"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,28,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-29','coktan_secmeli','3954 sayısında yüzler basamağının değeri kaçtır?','["9","50","900","400"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,29,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-30','coktan_secmeli','3954 sayısında onlar basamağının değeri kaçtır?','["5","900","40","50"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,30,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-31','coktan_secmeli','4165 sayısında yüzler basamağının değeri kaçtır?','["100","1","60","500"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,31,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-32','coktan_secmeli','4165 sayısında onlar basamağının değeri kaçtır?','["6","60","100","50"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,32,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-33','coktan_secmeli','4376 sayısında yüzler basamağının değeri kaçtır?','["3","70","300","600"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,33,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-34','coktan_secmeli','4376 sayısında onlar basamağının değeri kaçtır?','["7","300","60","70"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,34,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-35','coktan_secmeli','4587 sayısında yüzler basamağının değeri kaçtır?','["500","5","80","700"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,35,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-36','coktan_secmeli','4587 sayısında onlar basamağının değeri kaçtır?','["8","80","500","70"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,36,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-37','coktan_secmeli','4798 sayısında yüzler basamağının değeri kaçtır?','["7","90","700","800"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,37,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-38','coktan_secmeli','4798 sayısında onlar basamağının değeri kaçtır?','["9","700","80","90"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,38,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-39','coktan_secmeli','5009 sayısında yüzler basamağının değeri kaçtır?','["0","900","5009","021"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,39,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-40','coktan_secmeli','5009 sayısında onlar basamağının değeri kaçtır?','["90","0","5009","021"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,40,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-41','coktan_secmeli','5220 sayısında yüzler basamağının değeri kaçtır?','["2","20","200","0"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-42','coktan_secmeli','5220 sayısında onlar basamağının değeri kaçtır?','["2","200","0","20"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-43','coktan_secmeli','5431 sayısında yüzler basamağının değeri kaçtır?','["400","4","30","100"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-44','coktan_secmeli','5431 sayısında onlar basamağının değeri kaçtır?','["3","30","400","10"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-45','coktan_secmeli','5642 sayısında yüzler basamağının değeri kaçtır?','["6","40","600","200"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,45,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-46','coktan_secmeli','5642 sayısında onlar basamağının değeri kaçtır?','["4","600","20","40"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,46,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-47','coktan_secmeli','5853 sayısında yüzler basamağının değeri kaçtır?','["800","8","50","300"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,47,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-48','coktan_secmeli','5853 sayısında onlar basamağının değeri kaçtır?','["5","50","800","30"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,48,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-49','coktan_secmeli','6064 sayısında yüzler basamağının değeri kaçtır?','["60","400","0","6064"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,49,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-50','coktan_secmeli','6064 sayısında onlar basamağının değeri kaçtır?','["6","0","40","60"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,50,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-51','coktan_secmeli','6275 sayısında yüzler basamağının değeri kaçtır?','["200","2","70","500"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,51,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-52','coktan_secmeli','6275 sayısında onlar basamağının değeri kaçtır?','["7","70","200","50"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,52,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-53','coktan_secmeli','6486 sayısında yüzler basamağının değeri kaçtır?','["4","80","400","600"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,53,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-54','coktan_secmeli','6486 sayısında onlar basamağının değeri kaçtır?','["8","400","60","80"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,54,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-55','coktan_secmeli','6697 sayısında yüzler basamağının değeri kaçtır?','["600","6","90","700"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,55,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-56','coktan_secmeli','6697 sayısında onlar basamağının değeri kaçtır?','["9","90","600","70"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,56,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-57','coktan_secmeli','6908 sayısında yüzler basamağının değeri kaçtır?','["9","0","900","800"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,57,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-58','coktan_secmeli','6908 sayısında onlar basamağının değeri kaçtır?','["900","80","6908","0"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,58,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-59','coktan_secmeli','7119 sayısında yüzler basamağının değeri kaçtır?','["100","1","10","900"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,59,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-60','coktan_secmeli','7119 sayısında onlar basamağının değeri kaçtır?','["1","10","100","90"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,60,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-61','coktan_secmeli','7330 sayısında yüzler basamağının değeri kaçtır?','["3","30","300","0"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,61,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-62','coktan_secmeli','7330 sayısında onlar basamağının değeri kaçtır?','["3","300","0","30"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,62,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-63','coktan_secmeli','7541 sayısında yüzler basamağının değeri kaçtır?','["500","5","40","100"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,63,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-64','coktan_secmeli','7541 sayısında onlar basamağının değeri kaçtır?','["4","40","500","10"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,64,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-65','coktan_secmeli','7752 sayısında yüzler basamağının değeri kaçtır?','["7","50","700","200"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,65,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-66','coktan_secmeli','7752 sayısında onlar basamağının değeri kaçtır?','["5","700","20","50"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,66,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-67','coktan_secmeli','1243 sayısının en yakın onluğu kaçtır?','["1240","1230","1250","1243"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,67,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-68','coktan_secmeli','1243 sayısının en yakın yüzlüğü kaçtır?','["1100","1300","1200","1243"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,68,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-69','coktan_secmeli','1567 sayısının en yakın onluğu kaçtır?','["1560","1580","1570","1567"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,69,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-70','coktan_secmeli','1567 sayısının en yakın yüzlüğü kaçtır?','["1600","1500","1700","1567"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,70,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-71','coktan_secmeli','2488 sayısının en yakın onluğu kaçtır?','["2490","2480","2500","2488"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,71,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-72','coktan_secmeli','2488 sayısının en yakın yüzlüğü kaçtır?','["2400","2600","2500","2488"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,72,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-73','coktan_secmeli','3512 sayısının en yakın onluğu kaçtır?','["3500","3520","3510","3512"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,73,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-74','coktan_secmeli','3512 sayısının en yakın yüzlüğü kaçtır?','["3500","3400","3600","3512"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,74,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-75','coktan_secmeli','4499 sayısının en yakın onluğu kaçtır?','["4500","4490","4510","4499"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,75,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-76','coktan_secmeli','4499 sayısının en yakın yüzlüğü kaçtır?','["4400","4600","4500","4499"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,76,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-77','coktan_secmeli','5501 sayısının en yakın onluğu kaçtır?','["5490","5510","5500","5501"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,77,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-78','coktan_secmeli','5501 sayısının en yakın yüzlüğü kaçtır?','["5500","5400","5600","5501"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,78,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-79','coktan_secmeli','6749 sayısının en yakın onluğu kaçtır?','["6750","6740","6760","6749"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,79,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-80','coktan_secmeli','6749 sayısının en yakın yüzlüğü kaçtır?','["6600","6800","6700","6749"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,80,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-81','coktan_secmeli','7251 sayısının en yakın onluğu kaçtır?','["7240","7260","7250","7251"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,81,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-82','coktan_secmeli','7251 sayısının en yakın yüzlüğü kaçtır?','["7300","7200","7400","7251"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,82,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-83','coktan_secmeli','8499 sayısının en yakın onluğu kaçtır?','["8500","8490","8510","8499"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,83,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-84','coktan_secmeli','8499 sayısının en yakın yüzlüğü kaçtır?','["8400","8600","8500","8499"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,84,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-85','coktan_secmeli','9502 sayısının en yakın onluğu kaçtır?','["9490","9510","9500","9502"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,85,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-86','coktan_secmeli','9502 sayısının en yakın yüzlüğü kaçtır?','["9500","9400","9600","9502"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,86,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-87','coktan_secmeli','9994 sayısının en yakın onluğu kaçtır?','["9990","9980","10000","9994"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,87,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-88','coktan_secmeli','9994 sayısının en yakın yüzlüğü kaçtır?','["9900","10100","10000","9994"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,88,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-89','coktan_secmeli','6055 sayısının en yakın onluğu kaçtır?','["6050","6070","6060","6055"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,89,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-90','coktan_secmeli','6055 sayısının en yakın yüzlüğü kaçtır?','["6100","6000","6200","6055"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,90,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-91','coktan_secmeli','7744 sayısının en yakın onluğu kaçtır?','["7740","7730","7750","7744"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,91,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-92','coktan_secmeli','7744 sayısının en yakın yüzlüğü kaçtır?','["7600","7800","7700","7744"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,92,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-93','coktan_secmeli','3388 sayısının en yakın onluğu kaçtır?','["3380","3400","3390","3388"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,93,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-94','coktan_secmeli','3388 sayısının en yakın yüzlüğü kaçtır?','["3400","3300","3500","3388"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,94,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-95','coktan_secmeli','2216 sayısının en yakın onluğu kaçtır?','["2220","2210","2230","2216"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,95,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-96','coktan_secmeli','2216 sayısının en yakın yüzlüğü kaçtır?','["2100","2300","2200","2216"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,96,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-97','coktan_secmeli','3154, 3514, 1354 sayılarını küçükten büyüğe sıralayan seçenek hangisidir?','["3154, 3514, 1354","3514, 3154, 1354","3154, 1354, 3514","1354, 3154, 3514"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,97,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-98','coktan_secmeli','9080, 8900, 8090 sayılarını küçükten büyüğe sıralayan seçenek hangisidir?','["8090, 8900, 9080","9080, 8900, 8090","9080, 8090, 8900","021"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,98,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-99','coktan_secmeli','4421, 4241, 2441 sayılarını küçükten büyüğe sıralayan seçenek hangisidir?','["4421, 4241, 2441","2441, 4241, 4421","4421, 2441, 4241","021"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,99,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-100','coktan_secmeli','7010, 1700, 7100 sayılarını küçükten büyüğe sıralayan seçenek hangisidir?','["7010, 1700, 7100","7100, 7010, 1700","1700, 7010, 7100","7010, 7100, 1700"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,100,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-101','coktan_secmeli','5602, 5062, 6502 sayılarını küçükten büyüğe sıralayan seçenek hangisidir?','["5602, 5062, 6502","6502, 5602, 5062","5602, 6502, 5062","5062, 5602, 6502"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,101,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-102','coktan_secmeli','9990, 9090, 9900 sayılarını küçükten büyüğe sıralayan seçenek hangisidir?','["9090, 9900, 9990","9990, 9090, 9900","9990, 9900, 9090","021"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,102,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-103','coktan_secmeli','1000 + 125 = ?','["1125","1126","1124","1135"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,103,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-104','coktan_secmeli','1000 + 298 = ?','["1299","1298","1297","1308"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,104,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-105','coktan_secmeli','1000 + 471 = ?','["1472","1470","1471","1481"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,105,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-106','coktan_secmeli','1000 + 644 = ?','["1645","1643","1654","1644"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,106,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-107','coktan_secmeli','1000 + 817 = ?','["1817","1818","1816","1827"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,107,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-108','coktan_secmeli','1000 + 990 = ?','["1991","1990","1989","2000"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,108,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-109','coktan_secmeli','1000 + 1163 = ?','["2164","2162","2163","2173"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,109,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-110','coktan_secmeli','1000 + 1336 = ?','["2337","2335","2346","2336"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,110,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-111','coktan_secmeli','1000 + 1509 = ?','["2509","2510","2508","2519"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,111,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-112','coktan_secmeli','1000 + 1682 = ?','["2683","2682","2681","2692"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,112,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-113','coktan_secmeli','1000 + 1855 = ?','["2856","2854","2855","2865"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,113,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-114','coktan_secmeli','1331 + 125 = ?','["1457","1455","1466","1456"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,114,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-115','coktan_secmeli','1331 + 298 = ?','["1629","1630","1628","1639"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,115,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-116','coktan_secmeli','1331 + 471 = ?','["1803","1802","1801","1812"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,116,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-117','coktan_secmeli','1331 + 644 = ?','["1976","1974","1975","1985"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,117,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-118','coktan_secmeli','1331 + 817 = ?','["2149","2147","2158","2148"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,118,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-119','coktan_secmeli','1331 + 990 = ?','["2321","2322","2320","2331"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,119,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-120','coktan_secmeli','1331 + 1163 = ?','["2495","2494","2493","2504"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,120,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-121','coktan_secmeli','1331 + 1336 = ?','["2668","2666","2667","2677"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,121,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-122','coktan_secmeli','1331 + 1509 = ?','["2841","2839","2850","2840"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,122,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-123','coktan_secmeli','1331 + 1682 = ?','["3013","3014","3012","3023"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,123,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-124','coktan_secmeli','1331 + 1855 = ?','["3187","3186","3185","3196"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,124,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-125','coktan_secmeli','1662 + 125 = ?','["1788","1786","1787","1797"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,125,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-126','coktan_secmeli','1662 + 298 = ?','["1961","1959","1970","1960"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,126,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-127','coktan_secmeli','1662 + 471 = ?','["2133","2134","2132","2143"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,127,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-128','coktan_secmeli','1662 + 644 = ?','["2307","2306","2305","2316"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,128,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-129','coktan_secmeli','1662 + 817 = ?','["2480","2478","2479","2489"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,129,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-130','coktan_secmeli','1662 + 990 = ?','["2653","2651","2662","2652"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,130,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-131','coktan_secmeli','1662 + 1163 = ?','["2825","2826","2824","2835"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,131,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-132','coktan_secmeli','1662 + 1336 = ?','["2999","2998","2997","3008"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,132,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-133','coktan_secmeli','1662 + 1509 = ?','["3172","3170","3171","3181"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,133,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-134','coktan_secmeli','1662 + 1682 = ?','["3345","3343","3354","3344"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,134,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-135','coktan_secmeli','1662 + 1855 = ?','["3517","3518","3516","3527"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,135,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-136','coktan_secmeli','1993 + 125 = ?','["2119","2118","2117","2128"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,136,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-137','coktan_secmeli','1993 + 298 = ?','["2292","2290","2291","2301"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,137,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-138','coktan_secmeli','1993 + 471 = ?','["2465","2463","2474","2464"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,138,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-139','coktan_secmeli','1993 + 644 = ?','["2637","2638","2636","2647"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,139,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-140','coktan_secmeli','1993 + 817 = ?','["2811","2810","2809","2820"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,140,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-141','coktan_secmeli','1993 + 990 = ?','["2984","2982","2983","2993"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,141,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-142','coktan_secmeli','1993 + 1163 = ?','["3157","3155","3166","3156"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,142,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-143','coktan_secmeli','1993 + 1336 = ?','["3329","3330","3328","3339"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,143,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-144','coktan_secmeli','1993 + 1509 = ?','["3503","3502","3501","3512"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,144,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-145','coktan_secmeli','1993 + 1682 = ?','["3676","3674","3675","3685"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,145,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-146','coktan_secmeli','1993 + 1855 = ?','["3849","3847","3858","3848"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,146,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-147','coktan_secmeli','2324 + 125 = ?','["2449","2450","2448","2459"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,147,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-148','coktan_secmeli','2324 + 298 = ?','["2623","2622","2621","2632"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,148,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-149','coktan_secmeli','2324 + 471 = ?','["2796","2794","2795","2805"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,149,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-150','coktan_secmeli','2324 + 644 = ?','["2969","2967","2978","2968"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,150,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-151','coktan_secmeli','2324 + 817 = ?','["3141","3142","3140","3151"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,151,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-152','coktan_secmeli','2324 + 990 = ?','["3315","3314","3313","3324"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,152,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-153','coktan_secmeli','2324 + 1163 = ?','["3488","3486","3487","3497"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,153,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-154','coktan_secmeli','2324 + 1336 = ?','["3661","3659","3670","3660"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,154,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-155','coktan_secmeli','2324 + 1509 = ?','["3833","3834","3832","3843"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,155,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-156','coktan_secmeli','2324 + 1682 = ?','["4007","4006","4005","4016"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,156,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-157','coktan_secmeli','2324 + 1855 = ?','["4180","4178","4179","4189"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,157,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-158','coktan_secmeli','2655 + 125 = ?','["2781","2779","2790","2780"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,158,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-159','coktan_secmeli','2655 + 298 = ?','["2953","2954","2952","2963"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,159,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-160','coktan_secmeli','2655 + 471 = ?','["3127","3126","3125","3136"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,160,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-161','coktan_secmeli','2655 + 644 = ?','["3300","3298","3299","3309"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,161,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-162','coktan_secmeli','2655 + 817 = ?','["3473","3471","3482","3472"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,162,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-163','coktan_secmeli','2655 + 990 = ?','["3645","3646","3644","3655"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,163,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-164','coktan_secmeli','2655 + 1163 = ?','["3819","3818","3817","3828"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,164,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-165','coktan_secmeli','2655 + 1336 = ?','["3992","3990","3991","4001"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,165,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-166','coktan_secmeli','2655 + 1509 = ?','["4165","4163","4174","4164"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,166,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-167','coktan_secmeli','2655 + 1682 = ?','["4337","4338","4336","4347"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,167,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-168','coktan_secmeli','2655 + 1855 = ?','["4511","4510","4509","4520"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,168,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-169','coktan_secmeli','2986 + 125 = ?','["3112","3110","3111","3121"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,169,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-170','coktan_secmeli','2986 + 298 = ?','["3285","3283","3294","3284"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,170,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-171','coktan_secmeli','2986 + 471 = ?','["3457","3458","3456","3467"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,171,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-172','coktan_secmeli','2986 + 644 = ?','["3631","3630","3629","3640"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,172,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-173','coktan_secmeli','2500 - 125 = ?','["2376","2374","2375","2385"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,173,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-174','coktan_secmeli','2500 - 306 = ?','["2195","2193","2204","2194"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,174,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-175','coktan_secmeli','2500 - 487 = ?','["2013","2014","2012","2023"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,175,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-176','coktan_secmeli','2500 - 668 = ?','["1833","1832","1831","1842"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,176,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-177','coktan_secmeli','2500 - 849 = ?','["1652","1650","1651","1661"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,177,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-178','coktan_secmeli','2500 - 1030 = ?','["1471","1469","1480","1470"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,178,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-179','coktan_secmeli','2500 - 1211 = ?','["1289","1290","1288","1299"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,179,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-180','coktan_secmeli','2500 - 1392 = ?','["1109","1108","1107","1118"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,180,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-181','coktan_secmeli','2500 - 1573 = ?','["928","926","927","937"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,181,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-182','coktan_secmeli','2500 - 1754 = ?','["747","745","756","746"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,182,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-183','coktan_secmeli','2500 - 1935 = ?','["565","566","564","575"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,183,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-184','coktan_secmeli','2837 - 125 = ?','["2713","2712","2711","2722"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,184,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-185','coktan_secmeli','2837 - 306 = ?','["2532","2530","2531","2541"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,185,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-186','coktan_secmeli','2837 - 487 = ?','["2351","2349","2360","2350"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,186,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-187','coktan_secmeli','2837 - 668 = ?','["2169","2170","2168","2179"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,187,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-188','coktan_secmeli','2837 - 849 = ?','["1989","1988","1987","1998"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,188,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-189','coktan_secmeli','2837 - 1030 = ?','["1808","1806","1807","1817"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,189,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-190','coktan_secmeli','2837 - 1211 = ?','["1627","1625","1636","1626"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,190,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-191','coktan_secmeli','2837 - 1392 = ?','["1445","1446","1444","1455"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,191,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-192','coktan_secmeli','2837 - 1573 = ?','["1265","1264","1263","1274"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,192,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-193','coktan_secmeli','2837 - 1754 = ?','["1084","1082","1083","1093"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,193,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-194','coktan_secmeli','2837 - 1935 = ?','["903","901","912","902"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,194,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-195','coktan_secmeli','3174 - 125 = ?','["3049","3050","3048","3059"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,195,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-196','coktan_secmeli','3174 - 306 = ?','["2869","2868","2867","2878"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,196,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-197','coktan_secmeli','3174 - 487 = ?','["2688","2686","2687","2697"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,197,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-198','coktan_secmeli','3174 - 668 = ?','["2507","2505","2516","2506"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,198,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-199','coktan_secmeli','3174 - 849 = ?','["2325","2326","2324","2335"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,199,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-200','coktan_secmeli','3174 - 1030 = ?','["2145","2144","2143","2154"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,200,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-201','coktan_secmeli','3174 - 1211 = ?','["1964","1962","1963","1973"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,201,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-202','coktan_secmeli','3174 - 1392 = ?','["1783","1781","1792","1782"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,202,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-203','coktan_secmeli','3174 - 1573 = ?','["1601","1602","1600","1611"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,203,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-204','coktan_secmeli','3174 - 1754 = ?','["1421","1420","1419","1430"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,204,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-205','coktan_secmeli','3174 - 1935 = ?','["1240","1238","1239","1249"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,205,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-206','coktan_secmeli','3511 - 125 = ?','["3387","3385","3396","3386"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,206,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-207','coktan_secmeli','3511 - 306 = ?','["3205","3206","3204","3215"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,207,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-208','coktan_secmeli','3511 - 487 = ?','["3025","3024","3023","3034"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,208,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-209','coktan_secmeli','3511 - 668 = ?','["2844","2842","2843","2853"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,209,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-210','coktan_secmeli','3511 - 849 = ?','["2663","2661","2672","2662"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,210,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-211','coktan_secmeli','3511 - 1030 = ?','["2481","2482","2480","2491"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,211,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-212','coktan_secmeli','3511 - 1211 = ?','["2301","2300","2299","2310"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,212,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-213','coktan_secmeli','3511 - 1392 = ?','["2120","2118","2119","2129"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,213,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-214','coktan_secmeli','3511 - 1573 = ?','["1939","1937","1948","1938"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,214,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-215','coktan_secmeli','3511 - 1754 = ?','["1757","1758","1756","1767"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,215,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-216','coktan_secmeli','3511 - 1935 = ?','["1577","1576","1575","1586"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,216,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-217','coktan_secmeli','3848 - 125 = ?','["3724","3722","3723","3733"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,217,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-218','coktan_secmeli','3848 - 306 = ?','["3543","3541","3552","3542"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,218,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-219','coktan_secmeli','3848 - 487 = ?','["3361","3362","3360","3371"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,219,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-220','coktan_secmeli','3848 - 668 = ?','["3181","3180","3179","3190"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,220,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-221','coktan_secmeli','3848 - 849 = ?','["3000","2998","2999","3009"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,221,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-222','coktan_secmeli','3848 - 1030 = ?','["2819","2817","2828","2818"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,222,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-223','coktan_secmeli','3848 - 1211 = ?','["2637","2638","2636","2647"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,223,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-224','coktan_secmeli','3848 - 1392 = ?','["2457","2456","2455","2466"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,224,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-225','coktan_secmeli','3848 - 1573 = ?','["2276","2274","2275","2285"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,225,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-226','coktan_secmeli','3848 - 1754 = ?','["2095","2093","2104","2094"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,226,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-227','coktan_secmeli','3848 - 1935 = ?','["1913","1914","1912","1923"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,227,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-228','coktan_secmeli','4185 - 125 = ?','["4061","4060","4059","4070"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,228,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-229','coktan_secmeli','4185 - 306 = ?','["3880","3878","3879","3889"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,229,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-230','coktan_secmeli','4185 - 487 = ?','["3699","3697","3708","3698"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,230,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-231','coktan_secmeli','4185 - 668 = ?','["3517","3518","3516","3527"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,231,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-232','coktan_secmeli','4185 - 849 = ?','["3337","3336","3335","3346"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,232,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-233','coktan_secmeli','4185 - 1030 = ?','["3156","3154","3155","3165"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,233,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-234','coktan_secmeli','4185 - 1211 = ?','["2975","2973","2984","2974"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,234,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-235','coktan_secmeli','4185 - 1392 = ?','["2793","2794","2792","2803"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,235,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-236','coktan_secmeli','4185 - 1573 = ?','["2613","2612","2611","2622"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,236,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-237','coktan_secmeli','4185 - 1754 = ?','["2432","2430","2431","2441"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,237,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-238','coktan_secmeli','4185 - 1935 = ?','["2251","2249","2260","2250"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,238,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-239','coktan_secmeli','4522 - 125 = ?','["4397","4398","4396","4407"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,239,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-240','coktan_secmeli','4522 - 306 = ?','["4217","4216","4215","4226"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,240,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-241','coktan_secmeli','4522 - 487 = ?','["4036","4034","4035","4045"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,241,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-242','coktan_secmeli','4522 - 668 = ?','["3855","3853","3864","3854"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,242,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-243','coktan_secmeli','12 × 2 = ?','["24","36","22","25"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,243,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-244','coktan_secmeli','12 × 3 = ?','["48","36","33","37"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,244,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-245','coktan_secmeli','12 × 4 = ?','["60","44","48","49"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,245,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-246','coktan_secmeli','12 × 5 = ?','["72","55","61","60"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,246,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-247','coktan_secmeli','12 × 6 = ?','["72","84","66","73"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,247,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-248','coktan_secmeli','12 × 7 = ?','["96","84","77","85"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,248,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-249','coktan_secmeli','12 × 8 = ?','["108","88","96","97"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,249,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-250','coktan_secmeli','12 × 9 = ?','["120","99","109","108"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,250,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-251','coktan_secmeli','17 × 2 = ?','["34","51","32","35"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,251,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-252','coktan_secmeli','17 × 3 = ?','["68","51","48","52"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,252,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-253','coktan_secmeli','17 × 4 = ?','["85","64","68","69"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,253,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-254','coktan_secmeli','17 × 5 = ?','["102","80","86","85"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,254,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-255','coktan_secmeli','17 × 6 = ?','["102","119","96","103"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,255,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-256','coktan_secmeli','17 × 7 = ?','["136","119","112","120"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,256,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-257','coktan_secmeli','17 × 8 = ?','["153","128","136","137"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,257,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-258','coktan_secmeli','17 × 9 = ?','["170","144","154","153"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,258,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-259','coktan_secmeli','22 × 2 = ?','["44","66","42","45"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,259,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-260','coktan_secmeli','22 × 3 = ?','["88","66","63","67"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,260,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-261','coktan_secmeli','22 × 4 = ?','["110","84","88","89"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,261,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-262','coktan_secmeli','22 × 5 = ?','["132","105","111","110"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,262,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-263','coktan_secmeli','22 × 6 = ?','["132","154","126","133"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,263,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-264','coktan_secmeli','22 × 7 = ?','["176","154","147","155"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,264,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-265','coktan_secmeli','22 × 8 = ?','["198","168","176","177"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,265,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-266','coktan_secmeli','22 × 9 = ?','["220","189","199","198"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,266,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-267','coktan_secmeli','27 × 2 = ?','["54","81","52","55"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,267,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-268','coktan_secmeli','27 × 3 = ?','["108","81","78","82"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,268,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-269','coktan_secmeli','27 × 4 = ?','["135","104","108","109"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,269,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-270','coktan_secmeli','27 × 5 = ?','["162","130","136","135"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,270,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-271','coktan_secmeli','27 × 6 = ?','["162","189","156","163"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,271,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-272','coktan_secmeli','27 × 7 = ?','["216","189","182","190"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,272,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-273','coktan_secmeli','27 × 8 = ?','["243","208","216","217"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,273,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-274','coktan_secmeli','27 × 9 = ?','["270","234","244","243"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,274,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-275','coktan_secmeli','32 × 2 = ?','["64","96","62","65"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,275,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-276','coktan_secmeli','32 × 3 = ?','["128","96","93","97"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,276,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-277','coktan_secmeli','32 × 4 = ?','["160","124","128","129"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,277,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-278','coktan_secmeli','32 × 5 = ?','["192","155","161","160"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,278,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-279','coktan_secmeli','32 × 6 = ?','["192","224","186","193"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,279,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-280','coktan_secmeli','32 × 7 = ?','["256","224","217","225"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,280,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-281','coktan_secmeli','32 × 8 = ?','["288","248","256","257"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,281,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-282','coktan_secmeli','32 × 9 = ?','["320","279","289","288"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,282,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-283','coktan_secmeli','37 × 2 = ?','["74","111","72","75"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,283,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-284','coktan_secmeli','37 × 3 = ?','["148","111","108","112"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,284,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-285','coktan_secmeli','37 × 4 = ?','["185","144","148","149"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,285,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-286','coktan_secmeli','37 × 5 = ?','["222","180","186","185"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,286,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-287','coktan_secmeli','37 × 6 = ?','["222","259","216","223"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,287,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-288','coktan_secmeli','37 × 7 = ?','["296","259","252","260"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,288,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-289','coktan_secmeli','37 × 8 = ?','["333","288","296","297"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,289,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-290','coktan_secmeli','37 × 9 = ?','["370","324","334","333"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,290,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-291','coktan_secmeli','42 × 2 = ?','["84","126","82","85"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,291,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-292','coktan_secmeli','42 × 3 = ?','["168","126","123","127"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,292,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-293','coktan_secmeli','42 × 4 = ?','["210","164","168","169"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,293,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-294','coktan_secmeli','42 × 5 = ?','["252","205","211","210"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,294,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-295','coktan_secmeli','42 × 6 = ?','["252","294","246","253"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,295,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-296','coktan_secmeli','42 × 7 = ?','["336","294","287","295"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,296,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-297','coktan_secmeli','42 × 8 = ?','["378","328","336","337"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,297,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-298','coktan_secmeli','42 × 9 = ?','["420","369","379","378"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,298,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-299','coktan_secmeli','47 × 2 = ?','["94","141","92","95"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,299,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-300','coktan_secmeli','47 × 3 = ?','["188","141","138","142"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,300,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-301','coktan_secmeli','47 × 4 = ?','["235","184","188","189"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,301,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-302','coktan_secmeli','47 × 5 = ?','["282","230","236","235"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,302,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-303','coktan_secmeli','47 × 6 = ?','["282","329","276","283"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,303,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-304','coktan_secmeli','47 × 7 = ?','["376","329","322","330"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,304,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-305','coktan_secmeli','47 × 8 = ?','["423","368","376","377"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,305,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-306','coktan_secmeli','47 × 9 = ?','["423","470","414","424"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,306,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-307','coktan_secmeli','52 × 2 = ?','["104","156","102","105"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,307,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-308','coktan_secmeli','52 × 3 = ?','["208","156","153","157"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,308,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-309','coktan_secmeli','52 × 4 = ?','["260","204","208","209"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,309,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-310','coktan_secmeli','52 × 5 = ?','["312","255","261","260"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,310,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-311','coktan_secmeli','52 × 6 = ?','["312","364","306","313"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,311,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-312','coktan_secmeli','52 × 7 = ?','["416","364","357","365"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,312,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-313','coktan_secmeli','10 ÷ 2 = ?','["6","4","5","2"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,313,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-314','coktan_secmeli','14 ÷ 2 = ?','["8","6","2","7"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,314,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-315','coktan_secmeli','18 ÷ 2 = ?','["9","10","8","2"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,315,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-316','coktan_secmeli','22 ÷ 2 = ?','["12","11","10","2"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,316,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-317','coktan_secmeli','26 ÷ 2 = ?','["14","12","13","2"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,317,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-318','coktan_secmeli','30 ÷ 2 = ?','["16","14","2","15"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,318,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-319','coktan_secmeli','34 ÷ 2 = ?','["18","17","16","2"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,319,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-320','coktan_secmeli','38 ÷ 2 = ?','["20","18","19","2"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,320,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-321','coktan_secmeli','42 ÷ 2 = ?','["22","20","2","21"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,321,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-322','coktan_secmeli','46 ÷ 2 = ?','["23","24","22","2"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,322,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-323','coktan_secmeli','50 ÷ 2 = ?','["26","25","24","2"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,323,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-324','coktan_secmeli','54 ÷ 2 = ?','["28","26","27","2"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,324,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-325','coktan_secmeli','58 ÷ 2 = ?','["30","28","2","29"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,325,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-326','coktan_secmeli','15 ÷ 3 = ?','["6","4","3","5"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,326,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-327','coktan_secmeli','21 ÷ 3 = ?','["7","8","6","3"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,327,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-328','coktan_secmeli','27 ÷ 3 = ?','["10","9","8","3"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,328,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-329','coktan_secmeli','33 ÷ 3 = ?','["12","10","11","3"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,329,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-330','coktan_secmeli','39 ÷ 3 = ?','["14","12","3","13"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,330,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-331','coktan_secmeli','45 ÷ 3 = ?','["15","16","14","3"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,331,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-332','coktan_secmeli','51 ÷ 3 = ?','["18","16","17","3"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,332,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-333','coktan_secmeli','57 ÷ 3 = ?','["20","18","3","19"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,333,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-334','coktan_secmeli','63 ÷ 3 = ?','["21","22","20","3"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,334,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-335','coktan_secmeli','69 ÷ 3 = ?','["24","23","22","3"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,335,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-336','coktan_secmeli','75 ÷ 3 = ?','["26","24","25","3"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,336,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-337','coktan_secmeli','81 ÷ 3 = ?','["28","26","3","27"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,337,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-338','coktan_secmeli','87 ÷ 3 = ?','["29","30","28","3"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,338,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-339','coktan_secmeli','20 ÷ 4 = ?','["5","6","4","20"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,339,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-340','coktan_secmeli','28 ÷ 4 = ?','["8","7","6","4"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,340,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-341','coktan_secmeli','36 ÷ 4 = ?','["10","8","9","4"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,341,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-342','coktan_secmeli','44 ÷ 4 = ?','["12","10","4","11"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,342,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-343','coktan_secmeli','52 ÷ 4 = ?','["13","14","12","4"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,343,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-344','coktan_secmeli','60 ÷ 4 = ?','["16","15","14","4"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,344,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-345','coktan_secmeli','68 ÷ 4 = ?','["18","16","4","17"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,345,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-346','coktan_secmeli','76 ÷ 4 = ?','["19","20","18","4"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,346,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-347','coktan_secmeli','84 ÷ 4 = ?','["22","21","20","4"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,347,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-348','coktan_secmeli','92 ÷ 4 = ?','["24","22","23","4"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,348,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-349','coktan_secmeli','100 ÷ 4 = ?','["26","24","4","25"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,349,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-350','coktan_secmeli','108 ÷ 4 = ?','["27","28","26","4"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,350,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-351','coktan_secmeli','116 ÷ 4 = ?','["30","29","28","4"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,351,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-352','coktan_secmeli','25 ÷ 5 = ?','["6","5","4","25"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,352,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-353','coktan_secmeli','35 ÷ 5 = ?','["8","6","7","5"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,353,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-354','coktan_secmeli','45 ÷ 5 = ?','["10","8","5","9"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,354,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-355','coktan_secmeli','55 ÷ 5 = ?','["11","12","10","5"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,355,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-356','coktan_secmeli','65 ÷ 5 = ?','["14","13","12","5"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,356,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-357','coktan_secmeli','75 ÷ 5 = ?','["16","14","15","5"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,357,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-358','coktan_secmeli','85 ÷ 5 = ?','["17","18","16","5"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,358,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-359','coktan_secmeli','95 ÷ 5 = ?','["20","19","18","5"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,359,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-360','coktan_secmeli','105 ÷ 5 = ?','["22","20","21","5"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,360,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-361','coktan_secmeli','115 ÷ 5 = ?','["24","22","5","23"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,361,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-362','coktan_secmeli','125 ÷ 5 = ?','["25","26","24","5"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,362,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-363','coktan_secmeli','135 ÷ 5 = ?','["28","27","26","5"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,363,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-364','coktan_secmeli','145 ÷ 5 = ?','["30","28","29","5"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,364,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-365','coktan_secmeli','30 ÷ 6 = ?','["6","4","5","30"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,365,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-366','coktan_secmeli','42 ÷ 6 = ?','["8","6","42","7"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,366,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-367','coktan_secmeli','54 ÷ 6 = ?','["9","10","8","6"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,367,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-368','coktan_secmeli','66 ÷ 6 = ?','["12","11","10","6"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,368,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-369','coktan_secmeli','78 ÷ 6 = ?','["14","12","13","6"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,369,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-370','coktan_secmeli','90 ÷ 6 = ?','["16","14","6","15"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,370,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-371','coktan_secmeli','102 ÷ 6 = ?','["18","17","16","6"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,371,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-372','coktan_secmeli','114 ÷ 6 = ?','["20","18","19","6"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,372,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-373','coktan_secmeli','126 ÷ 6 = ?','["22","20","6","21"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,373,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-374','coktan_secmeli','138 ÷ 6 = ?','["23","24","22","6"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,374,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-375','coktan_secmeli','150 ÷ 6 = ?','["26","25","24","6"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,375,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-376','coktan_secmeli','162 ÷ 6 = ?','["28","26","27","6"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,376,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-377','coktan_secmeli','174 ÷ 6 = ?','["30","28","6","29"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,377,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-378','coktan_secmeli','35 ÷ 7 = ?','["6","4","7","5"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,378,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-379','coktan_secmeli','49 ÷ 7 = ?','["7","8","6","49"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,379,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-380','coktan_secmeli','63 ÷ 7 = ?','["10","9","8","7"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,380,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-381','coktan_secmeli','77 ÷ 7 = ?','["12","10","11","7"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,381,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-382','coktan_secmeli','91 ÷ 7 = ?','["14","12","7","13"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,382,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-383','coktan_secmeli','Bir okulda 1245 öğrenciye 378 öğrenci daha katıldı. Toplam kaç öğrenci oldu?','["1633","1623","1613","1624"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,383,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-384','coktan_secmeli','2450 kitabın 875''i ödünç verildi. Kaç kitap kaldı?','["1585","1565","1575","1576"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,384,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-385','coktan_secmeli','Her kutuda 24 kalem, 7 kutuda toplam kaç kalem vardır?','["178","158","169","168"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,385,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-386','coktan_secmeli','360 şeker 9 gruba eşit paylaştırılırsa grup başına kaç şeker düşer?','["40","50","30","41"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,386,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-387','coktan_secmeli','Bir otobüs 325 km, sonra 248 km gitti. Toplam kaç km?','["583","573","563","574"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,387,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-388','coktan_secmeli','900 ₺ bütçenin 365 ₺''si harcandı. Kaç ₺ kaldı?','["545","525","535","536"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,388,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-389','coktan_secmeli','Bir çiftlikte 8 kümeste 36''şar tavuk vardır. Toplam?','["298","278","289","288"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,389,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-390','coktan_secmeli','840 fidan 7 sıraya eşit dikilirse bir sırada kaç fidan?','["120","130","110","121"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,390,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-391','coktan_secmeli','Bir depoda 1750 kutuya 625 kutu daha geldi. Toplam?','["2385","2375","2365","2376"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,391,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-392','coktan_secmeli','5000 sayfalık arşivin 2385 sayfası tarandı. Kaç sayfa kaldı?','["2625","2605","2615","2616"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,392,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-393','coktan_secmeli','Bir bütünün dört eş parçasından biri hangi kesirdir?','["1/2","4/1","1/4","2/4"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,393,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-394','coktan_secmeli','3/5 kesrinde pay kaçtır?','["5","2","8","3"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,394,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-395','coktan_secmeli','3/5 kesrinde payda kaçtır?','["5","3","2","8"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,395,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-396','coktan_secmeli','2/4 ile 1/2 aynı bütünde eşit olabilir mi?','["Hayır","Evet","Kesir değildir","Sadece sayı doğrusunda"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,396,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-397','coktan_secmeli','4/4 neyi gösterir?','["Yarımı","Çeyreği","Bir bütünü","İki bütünü"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,397,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-398','coktan_secmeli','1/8 birim kesir midir?','["Hayır","Payı 8 olduğu için","Kesir değildir","Evet"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,398,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-399','coktan_secmeli','Bir bütün 6 eş parçaya ayrılırsa bir parça?','["1/6","6/1","1/3","2/6"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,399,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-400','coktan_secmeli','2/3 kesrinde bütün kaç eş parçaya ayrılmıştır?','["2","3","1","5"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,400,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-401','coktan_secmeli','1/4 + 2/4 = ?','["4/4","3/5","1/4","3/4"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,401,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir-islem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-402','coktan_secmeli','2/5 + 1/5 = ?','["3/5","4/5","3/6","1/5"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,402,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir-islem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-403','coktan_secmeli','3/8 + 2/8 = ?','["6/8","5/8","5/9","1/8"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,403,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir-islem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-404','coktan_secmeli','4/10 + 3/10 = ?','["8/10","7/11","7/10","1/10"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,404,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir-islem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-405','coktan_secmeli','2/7 + 3/7 = ?','["6/7","5/8","1/7","5/7"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,405,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir-islem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-406','coktan_secmeli','1/9 + 4/9 = ?','["5/9","6/9","5/10","3/9"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,406,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir-islem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-407','coktan_secmeli','3/5 - 1/5 = ?','["4/5","2/5","3/5","2/6"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,407,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir-islem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-408','coktan_secmeli','5/8 - 2/8 = ?','["7/8","4/8","3/8","3/9"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,408,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir-islem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-409','coktan_secmeli','7/10 - 3/10 = ?','["10/10","5/10","4/11","4/10"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,409,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir-islem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-410','coktan_secmeli','Örüntüyü tamamla: 15, 25, 35, __','["46","44","55","45"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,410,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-411','coktan_secmeli','Örüntüyü tamamla: 120, 140, 160, __','["180","181","179","190"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,411,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-412','coktan_secmeli','Örüntüyü tamamla: 900, 850, 800, __','["751","750","749","760"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,412,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-413','coktan_secmeli','Örüntüyü tamamla: 7, 14, 21, __','["29","27","28","38"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,413,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-414','coktan_secmeli','Örüntüyü tamamla: 240, 250, 260, __','["271","269","280","270"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,414,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-415','coktan_secmeli','Örüntüyü tamamla: 55, 50, 45, __','["40","41","39","50"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,415,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-416','coktan_secmeli','Örüntüyü tamamla: 300, 325, 350, __','["376","375","374","385"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,416,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-417','coktan_secmeli','Örüntüyü tamamla: 12, 24, 36, __','["49","47","48","58"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,417,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-418','coktan_secmeli','Dik açı kaç derecedir?','["45°","180°","360°","90°"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,418,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-419','coktan_secmeli','90°''den küçük açıya ne denir?','["Dar açı","Geniş açı","Doğru açı","Tam açı"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,419,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-420','coktan_secmeli','90° ile 180° arasındaki açı?','["Dar açı","Geniş açı","Dik açı","Tam açı"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,420,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-421','coktan_secmeli','180° olan açı?','["Dik açı","Dar açı","Doğru açı","Tam açı"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,421,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-422','coktan_secmeli','Açı ölçmek için hangi araç kullanılabilir?','["Terazi","Termometre","Saat","İletki"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,422,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-423','coktan_secmeli','Dik açı kaç derecedir? Benzer örneği düşün.','["45°","90°","180°","360°"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,423,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-424','coktan_secmeli','90°''den küçük açıya ne denir? Benzer örneği düşün.','["Geniş açı","Doğru açı","Dar açı","Tam açı"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,424,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-425','coktan_secmeli','90° ile 180° arasındaki açı? Benzer örneği düşün.','["Dar açı","Dik açı","Tam açı","Geniş açı"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,425,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-426','coktan_secmeli','180° olan açı? Benzer örneği düşün.','["Doğru açı","Dik açı","Dar açı","Tam açı"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,426,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-427','coktan_secmeli','Açı ölçmek için hangi araç kullanılabilir? Benzer örneği düşün.','["Terazi","İletki","Termometre","Saat"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,427,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-428','coktan_secmeli','Dik açı kaç derecedir? Benzer örneği düşün.','["45°","180°","90°","360°"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,428,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-429','coktan_secmeli','90°''den küçük açıya ne denir? Benzer örneği düşün.','["Geniş açı","Doğru açı","Tam açı","Dar açı"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,429,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-430','coktan_secmeli','90° ile 180° arasındaki açı? Benzer örneği düşün.','["Geniş açı","Dar açı","Dik açı","Tam açı"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,430,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-431','coktan_secmeli','180° olan açı? Benzer örneği düşün.','["Dik açı","Doğru açı","Dar açı","Tam açı"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,431,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-432','coktan_secmeli','Açı ölçmek için hangi araç kullanılabilir? Benzer örneği düşün.','["Terazi","Termometre","İletki","Saat"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,432,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-433','coktan_secmeli','Karenin tüm kenarları nasıldır?','["Farklı","Yoktur","Eşit","Sadece ikisi eşit"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,433,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sekil' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-434','coktan_secmeli','Dikdörtgenin karşılıklı kenarları?','["Her zaman farklı","Yoktur","Üçgen oluşturur","Eşit ve paralel"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,434,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sekil' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-435','coktan_secmeli','Üçgenin kaç kenarı vardır?','["3","4","5","6"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,435,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sekil' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-436','coktan_secmeli','Karenin kaç dik açısı vardır?','["2","4","3","6"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,436,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sekil' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-437','coktan_secmeli','Karenin tüm kenarları nasıldır? Benzer örneği düşün.','["Farklı","Yoktur","Sadece ikisi eşit","Eşit"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,437,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sekil' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-438','coktan_secmeli','Dikdörtgenin karşılıklı kenarları? Benzer örneği düşün.','["Eşit ve paralel","Her zaman farklı","Yoktur","Üçgen oluşturur"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,438,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sekil' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-439','coktan_secmeli','Üçgenin kaç kenarı vardır? Benzer örneği düşün.','["4","3","5","6"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,439,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sekil' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-440','coktan_secmeli','Karenin kaç dik açısı vardır? Benzer örneği düşün.','["2","3","4","6"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,440,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sekil' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-441','coktan_secmeli','Karenin tüm kenarları nasıldır? Benzer örneği düşün.','["Farklı","Yoktur","Sadece ikisi eşit","Eşit"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,441,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sekil' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-442','coktan_secmeli','Dikdörtgenin karşılıklı kenarları? Benzer örneği düşün.','["Eşit ve paralel","Her zaman farklı","Yoktur","Üçgen oluşturur"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,442,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sekil' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-443','coktan_secmeli','Üçgenin kaç kenarı vardır? Benzer örneği düşün.','["4","3","5","6"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,443,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sekil' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-444','coktan_secmeli','Karenin kaç dik açısı vardır? Benzer örneği düşün.','["2","3","4","6"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,444,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sekil' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-445','coktan_secmeli','Bir şeklin katlandığında üst üste gelen iki eş parçasını ayıran çizgi?','["Çevre","Kenar","Simetri doğrusu","Köşe"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,445,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-446','coktan_secmeli','Karede birden fazla simetri doğrusu var mıdır?','["Hayır","Sadece dairede","Sadece üçgende","Evet"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,446,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-447','coktan_secmeli','Simetrik noktalar simetri doğrusuna göre nasıl konumlanır?','["Eşit uzaklıkta","Rastgele","Aynı tarafta","Farklı yükseklikte zorunlu"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,447,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-448','coktan_secmeli','Bir şeklin katlandığında üst üste gelen iki eş parçasını ayıran çizgi? Benzer örneği düşün.','["Çevre","Kenar","Simetri doğrusu","Köşe"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,448,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-449','coktan_secmeli','Karede birden fazla simetri doğrusu var mıdır? Benzer örneği düşün.','["Hayır","Sadece dairede","Sadece üçgende","Evet"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,449,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-450','coktan_secmeli','Simetrik noktalar simetri doğrusuna göre nasıl konumlanır? Benzer örneği düşün.','["Eşit uzaklıkta","Rastgele","Aynı tarafta","Farklı yükseklikte zorunlu"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,450,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-451','coktan_secmeli','Bir şeklin katlandığında üst üste gelen iki eş parçasını ayıran çizgi? Benzer örneği düşün.','["Çevre","Simetri doğrusu","Kenar","Köşe"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,451,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-452','coktan_secmeli','Karede birden fazla simetri doğrusu var mıdır? Benzer örneği düşün.','["Hayır","Sadece dairede","Evet","Sadece üçgende"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,452,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-453','coktan_secmeli','Simetrik noktalar simetri doğrusuna göre nasıl konumlanır? Benzer örneği düşün.','["Rastgele","Aynı tarafta","Farklı yükseklikte zorunlu","Eşit uzaklıkta"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,453,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-454','coktan_secmeli','Küpün kaç yüzü vardır?','["4","8","12","6"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,454,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cisim' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-455','coktan_secmeli','Küpün kaç köşesi vardır?','["8","6","4","12"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,455,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cisim' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-456','coktan_secmeli','Konserve kutusu hangi cisme benzer?','["Küp","Silindir","Küre","Üçgen"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,456,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cisim' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-457','coktan_secmeli','Futbol topu hangi cisme benzer?','["Küp","Silindir","Küre","Prizma"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,457,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cisim' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-458','coktan_secmeli','Küpün kaç yüzü vardır? Benzer örneği düşün.','["6","4","8","12"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,458,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cisim' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-459','coktan_secmeli','Küpün kaç köşesi vardır? Benzer örneği düşün.','["6","8","4","12"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,459,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cisim' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-460','coktan_secmeli','Konserve kutusu hangi cisme benzer? Benzer örneği düşün.','["Küp","Küre","Silindir","Üçgen"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,460,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cisim' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-461','coktan_secmeli','Futbol topu hangi cisme benzer? Benzer örneği düşün.','["Küp","Silindir","Prizma","Küre"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,461,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cisim' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-462','coktan_secmeli','Küpün kaç yüzü vardır? Benzer örneği düşün.','["6","4","8","12"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,462,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cisim' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-463','coktan_secmeli','Küpün kaç köşesi vardır? Benzer örneği düşün.','["6","8","4","12"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,463,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cisim' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-464','coktan_secmeli','Konserve kutusu hangi cisme benzer? Benzer örneği düşün.','["Küp","Küre","Silindir","Üçgen"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,464,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cisim' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-465','coktan_secmeli','Futbol topu hangi cisme benzer? Benzer örneği düşün.','["Küp","Silindir","Prizma","Küre"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,465,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cisim' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-466','coktan_secmeli','1 m kaç cm?','["10 cm","1000 cm","60 cm","100 cm"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,466,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-467','coktan_secmeli','1 km kaç m?','["1000 m","100 m","10 m","60 m"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,467,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-468','coktan_secmeli','350 cm kaç m kaç cm?','["35 m","3 m 50 cm","3 m 5 cm","350 m"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,468,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-469','coktan_secmeli','Bir kalemin boyu için uygun birim?','["km","ton","cm","saat"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,469,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-470','coktan_secmeli','1 m kaç cm? Benzer örneği düşün.','["100 cm","10 cm","1000 cm","60 cm"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,470,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-471','coktan_secmeli','1 km kaç m? Benzer örneği düşün.','["100 m","1000 m","10 m","60 m"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,471,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-472','coktan_secmeli','350 cm kaç m kaç cm? Benzer örneği düşün.','["35 m","3 m 5 cm","3 m 50 cm","350 m"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,472,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-473','coktan_secmeli','Bir kalemin boyu için uygun birim? Benzer örneği düşün.','["km","ton","saat","cm"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,473,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-474','coktan_secmeli','1 m kaç cm? Benzer örneği düşün.','["100 cm","10 cm","1000 cm","60 cm"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,474,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-475','coktan_secmeli','1 km kaç m? Benzer örneği düşün.','["100 m","1000 m","10 m","60 m"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,475,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-476','coktan_secmeli','350 cm kaç m kaç cm? Benzer örneği düşün.','["35 m","3 m 5 cm","3 m 50 cm","350 m"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,476,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-477','coktan_secmeli','Bir kalemin boyu için uygun birim? Benzer örneği düşün.','["km","ton","saat","cm"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,477,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-478','coktan_secmeli','Bir kenarı 6 cm karenin çevresi?','["12 cm","18 cm","36 cm","24 cm"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,478,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cevre' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-479','coktan_secmeli','Kenarları 5 ve 8 cm dikdörtgenin çevresi?','["26 cm","13 cm","40 cm","21 cm"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,479,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cevre' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-480','coktan_secmeli','Çevre nasıl bulunur?','["Kenarlar çarpılır her zaman","Kenar uzunlukları toplanır.","Sadece bir kenar ölçülür","Köşeler sayılır"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,480,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cevre' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-481','coktan_secmeli','Bir kenarı 6 cm karenin çevresi? Benzer örneği düşün.','["12 cm","18 cm","36 cm","24 cm"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,481,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cevre' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-482','coktan_secmeli','Kenarları 5 ve 8 cm dikdörtgenin çevresi? Benzer örneği düşün.','["26 cm","13 cm","40 cm","21 cm"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,482,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cevre' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-483','coktan_secmeli','Çevre nasıl bulunur? Benzer örneği düşün.','["Kenarlar çarpılır her zaman","Kenar uzunlukları toplanır.","Sadece bir kenar ölçülür","Köşeler sayılır"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,483,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cevre' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-484','coktan_secmeli','Bir kenarı 6 cm karenin çevresi? Benzer örneği düşün.','["12 cm","18 cm","24 cm","36 cm"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,484,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cevre' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-485','coktan_secmeli','Kenarları 5 ve 8 cm dikdörtgenin çevresi? Benzer örneği düşün.','["13 cm","40 cm","21 cm","26 cm"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,485,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cevre' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-486','coktan_secmeli','Çevre nasıl bulunur? Benzer örneği düşün.','["Kenar uzunlukları toplanır.","Kenarlar çarpılır her zaman","Sadece bir kenar ölçülür","Köşeler sayılır"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,486,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cevre' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-487','coktan_secmeli','Alan ölçerken birim kareler kullanılabilir mi?','["Evet","Hayır","Sadece cetvel adı yeter","Alan ölçülmez"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,487,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-alan' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-488','coktan_secmeli','3 satır ve 4 sütun birim kare kaç kare eder?','["7","12","14","24"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,488,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-alan' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-489','coktan_secmeli','Alan şeklin neresini ölçer?','["Sadece çevresini","Sadece köşesini","Kapladığı yüzeyi","Sadece rengini"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,489,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-alan' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-490','coktan_secmeli','Alan ölçerken birim kareler kullanılabilir mi? Benzer örneği düşün.','["Evet","Hayır","Sadece cetvel adı yeter","Alan ölçülmez"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,490,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-alan' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-491','coktan_secmeli','3 satır ve 4 sütun birim kare kaç kare eder? Benzer örneği düşün.','["7","12","14","24"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,491,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-alan' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-492','coktan_secmeli','Alan şeklin neresini ölçer? Benzer örneği düşün.','["Sadece çevresini","Sadece köşesini","Kapladığı yüzeyi","Sadece rengini"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,492,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-alan' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-493','coktan_secmeli','Alan ölçerken birim kareler kullanılabilir mi? Benzer örneği düşün.','["Hayır","Sadece cetvel adı yeter","Alan ölçülmez","Evet"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,493,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-alan' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-494','coktan_secmeli','3 satır ve 4 sütun birim kare kaç kare eder? Benzer örneği düşün.','["12","7","14","24"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,494,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-alan' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-495','coktan_secmeli','Alan şeklin neresini ölçer? Benzer örneği düşün.','["Sadece çevresini","Kapladığı yüzeyi","Sadece köşesini","Sadece rengini"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,495,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-alan' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-496','coktan_secmeli','1 saat kaç dakika?','["30","60","100","24"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,496,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-497','coktan_secmeli','2 saat kaç dakika?','["60","90","120","180"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,497,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-498','coktan_secmeli','09.30''dan 10.15''e kaç dakika?','["15","30","60","45"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,498,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-499','coktan_secmeli','1 dakika kaç saniye?','["60","100","30","24"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,499,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-500','coktan_secmeli','1 saat kaç dakika? Benzer örneği düşün.','["30","100","60","24"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,500,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-501','coktan_secmeli','2 saat kaç dakika? Benzer örneği düşün.','["60","90","180","120"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,501,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-502','coktan_secmeli','09.30''dan 10.15''e kaç dakika? Benzer örneği düşün.','["45","15","30","60"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,502,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-503','coktan_secmeli','1 dakika kaç saniye? Benzer örneği düşün.','["100","60","30","24"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,503,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-504','coktan_secmeli','1 saat kaç dakika? Benzer örneği düşün.','["30","100","60","24"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,504,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-505','coktan_secmeli','2 saat kaç dakika? Benzer örneği düşün.','["60","90","180","120"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,505,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-506','coktan_secmeli','09.30''dan 10.15''e kaç dakika? Benzer örneği düşün.','["45","15","30","60"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,506,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-507','coktan_secmeli','1 dakika kaç saniye? Benzer örneği düşün.','["100","60","30","24"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,507,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-508','coktan_secmeli','1 kg kaç g?','["100 g","1000 g","10 g","60 g"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,508,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-509','coktan_secmeli','2 kg 500 g kaç g?','["2050 g","2005 g","2500 g","500 g"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,509,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-510','coktan_secmeli','1 ton kaç kg?','["100 kg","10 kg","500 kg","1000 kg"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,510,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-511','coktan_secmeli','Elmanın kütlesi için uygun birim?','["gram","ton","km","saat"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,511,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-512','coktan_secmeli','1 kg kaç g? Benzer örneği düşün.','["100 g","10 g","1000 g","60 g"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,512,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-513','coktan_secmeli','2 kg 500 g kaç g? Benzer örneği düşün.','["2050 g","2005 g","500 g","2500 g"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,513,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-514','coktan_secmeli','1 ton kaç kg? Benzer örneği düşün.','["1000 kg","100 kg","10 kg","500 kg"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,514,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-515','coktan_secmeli','Elmanın kütlesi için uygun birim? Benzer örneği düşün.','["ton","gram","km","saat"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,515,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-516','coktan_secmeli','1 kg kaç g? Benzer örneği düşün.','["100 g","10 g","1000 g","60 g"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,516,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-517','coktan_secmeli','2 kg 500 g kaç g? Benzer örneği düşün.','["2050 g","2005 g","500 g","2500 g"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,517,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-518','coktan_secmeli','1 ton kaç kg? Benzer örneği düşün.','["1000 kg","100 kg","10 kg","500 kg"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,518,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-519','coktan_secmeli','Elmanın kütlesi için uygun birim? Benzer örneği düşün.','["ton","gram","km","saat"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,519,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-520','coktan_secmeli','1 litre hangi ölçmedir?','["Uzunluk","Sıvı miktarı","Kütle","Zaman"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,520,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-521','coktan_secmeli','3 L + 2 L = ?','["1 L","6 L","5 L","32 L"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,521,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-522','coktan_secmeli','Sürahi için uygun birim?','["Kilometre","Kilogram","Saat","Litre"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,522,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-523','coktan_secmeli','1 litre hangi ölçmedir? Benzer örneği düşün.','["Uzunluk","Sıvı miktarı","Kütle","Zaman"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,523,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-524','coktan_secmeli','3 L + 2 L = ? Benzer örneği düşün.','["1 L","6 L","5 L","32 L"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,524,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-525','coktan_secmeli','Sürahi için uygun birim? Benzer örneği düşün.','["Kilometre","Kilogram","Saat","Litre"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,525,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-526','coktan_secmeli','1 litre hangi ölçmedir? Benzer örneği düşün.','["Sıvı miktarı","Uzunluk","Kütle","Zaman"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,526,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-527','coktan_secmeli','3 L + 2 L = ? Benzer örneği düşün.','["1 L","5 L","6 L","32 L"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,527,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-528','coktan_secmeli','Sürahi için uygun birim? Benzer örneği düşün.','["Kilometre","Kilogram","Litre","Saat"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,528,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-529','coktan_secmeli','1 ₺ kaç kuruş?','["10 kuruş","50 kuruş","100 kuruş","1000 kuruş"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,529,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-530','coktan_secmeli','75 ₺ ürüne 100 ₺ verilirse para üstü?','["15 ₺","35 ₺","75 ₺","25 ₺"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,530,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-531','coktan_secmeli','2 ₺ 50 kuruş + 1 ₺ 25 kuruş?','["3 ₺ 75 kuruş","3 ₺ 25 kuruş","4 ₺","2 ₺ 75 kuruş"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,531,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-532','coktan_secmeli','4 tane 25 kuruş kaç ₺ eder?','["25 kuruş","1 ₺","4 ₺","100 ₺"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,532,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-533','coktan_secmeli','1 ₺ kaç kuruş? Benzer örneği düşün.','["10 kuruş","50 kuruş","1000 kuruş","100 kuruş"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,533,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-534','coktan_secmeli','75 ₺ ürüne 100 ₺ verilirse para üstü? Benzer örneği düşün.','["25 ₺","15 ₺","35 ₺","75 ₺"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,534,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-535','coktan_secmeli','2 ₺ 50 kuruş + 1 ₺ 25 kuruş? Benzer örneği düşün.','["3 ₺ 25 kuruş","3 ₺ 75 kuruş","4 ₺","2 ₺ 75 kuruş"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,535,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-536','coktan_secmeli','4 tane 25 kuruş kaç ₺ eder? Benzer örneği düşün.','["25 kuruş","4 ₺","1 ₺","100 ₺"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,536,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-537','coktan_secmeli','1 ₺ kaç kuruş? Benzer örneği düşün.','["10 kuruş","50 kuruş","1000 kuruş","100 kuruş"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,537,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-538','coktan_secmeli','75 ₺ ürüne 100 ₺ verilirse para üstü? Benzer örneği düşün.','["25 ₺","15 ₺","35 ₺","75 ₺"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,538,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-539','coktan_secmeli','2 ₺ 50 kuruş + 1 ₺ 25 kuruş? Benzer örneği düşün.','["3 ₺ 25 kuruş","3 ₺ 75 kuruş","4 ₺","2 ₺ 75 kuruş"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,539,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-540','coktan_secmeli','4 tane 25 kuruş kaç ₺ eder? Benzer örneği düşün.','["25 kuruş","4 ₺","1 ₺","100 ₺"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,540,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-541','coktan_secmeli','Sütun grafiğinde en yüksek sütun neyi gösterir?','["En küçük değeri","Başlığı","En büyük değeri","Kaynağı"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,541,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-tablo' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-542','coktan_secmeli','Tabloda pazartesi 12, salı 18 kitap okunmuş. Fark?','["30","12","18","6"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,542,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-tablo' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-543','coktan_secmeli','Veri toplamadan önce ne belirlenir?','["Araştırma sorusu","Sonuç","Renk","Başlık zorunlu"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,543,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-tablo' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-544','coktan_secmeli','Grafiğin başlığı neyi anlatır?','["Rengini","Grafiğin konusunu","Kağıt boyunu","Kalem markasını"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,544,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-tablo' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-545','coktan_secmeli','Sütun grafiğinde en yüksek sütun neyi gösterir? Benzer örneği düşün.','["En küçük değeri","Başlığı","Kaynağı","En büyük değeri"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,545,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-tablo' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-546','coktan_secmeli','Tabloda pazartesi 12, salı 18 kitap okunmuş. Fark? Benzer örneği düşün.','["6","30","12","18"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,546,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-tablo' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-547','coktan_secmeli','Veri toplamadan önce ne belirlenir? Benzer örneği düşün.','["Sonuç","Araştırma sorusu","Renk","Başlık zorunlu"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,547,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-tablo' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-548','coktan_secmeli','Grafiğin başlığı neyi anlatır? Benzer örneği düşün.','["Rengini","Kağıt boyunu","Grafiğin konusunu","Kalem markasını"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,548,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-tablo' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-549','coktan_secmeli','Sütun grafiğinde en yüksek sütun neyi gösterir? Benzer örneği düşün.','["En küçük değeri","Başlığı","Kaynağı","En büyük değeri"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,549,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-tablo' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-550','coktan_secmeli','Tabloda pazartesi 12, salı 18 kitap okunmuş. Fark? Benzer örneği düşün.','["6","30","12","18"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,550,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-tablo' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-551','coktan_secmeli','Veri toplamadan önce ne belirlenir? Benzer örneği düşün.','["Sonuç","Araştırma sorusu","Renk","Başlık zorunlu"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,551,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-tablo' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-552','coktan_secmeli','Grafiğin başlığı neyi anlatır? Benzer örneği düşün.','["Rengini","Kağıt boyunu","Grafiğin konusunu","Kalem markasını"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,552,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-tablo' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

