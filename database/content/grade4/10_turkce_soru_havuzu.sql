SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-ana-fikir','Konu, Ana Fikir ve Başlık','Konu, Ana Fikir ve Başlık','Konu, Ana Fikir ve Başlık becerilerini uygular.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-okuma'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ana-fikir-1-1','coktan_secmeli','“Düzenli kitap okuyan çocukların kelime dağarcığı gelişir, hayal gücü zenginleşir.” Ana fikir nedir?','["Kitap okumanın birçok yararı vardır.","Sadece uzun kitap okunmalıdır.","Kitaplar ağırdır.","Hayal kurmak gereksizdir."]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ana-fikir-1-2','coktan_secmeli','“Suyu gereksiz akıtmamak gelecekte de temiz suya ulaşmamıza yardım eder.” Ana fikir nedir?','["Musluklar pahalıdır.","Sadece yağmur suyu içilir.","Suyu tasarruflu kullanmalıyız.","Su bitmez."]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ana-fikir-1-3','coktan_secmeli','“Takım üyeleri birbirini dinlediğinde işler daha düzenli yürür.” Ana fikir?','["İş birliği başarıyı kolaylaştırır.","Tek kişi her şeyi yapmalıdır.","Dinlemek gereksizdir.","Takımda konuşulmaz."]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ana-fikir-1-4','coktan_secmeli','Arıların çiçekten çiçeğe polen taşımasını anlatan metne en uygun başlık?','["Kışlık Mont","Yeni Defter","Arıların Doğadaki Görevi","Okul Servisi"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ana-fikir-1-5','coktan_secmeli','Bir metnin konusu neyi gösterir?','["Metinde ne anlatıldığını","Yazarın adresini","Kitabın fiyatını","Sayfa sayısını"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ana-fikir-1-6','coktan_secmeli','“Geri dönüşüm atıkları yeniden değerlendirmeye yardım eder.” En uygun başlık?','["Uzun Yol","Karlı Gün","Atıkları Değerlendiriyoruz","Yeni Oyuncak"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ana-fikir-2-1','coktan_secmeli','“Düzenli kitap okuyan çocukların kelime dağarcığı gelişir, hayal gücü zenginleşir.” Ana fikir nedir? Benzer durumu düşün.','["Sadece uzun kitap okunmalıdır.","Kitaplar ağırdır.","Hayal kurmak gereksizdir.","Kitap okumanın birçok yararı vardır."]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ana-fikir-2-2','coktan_secmeli','“Suyu gereksiz akıtmamak gelecekte de temiz suya ulaşmamıza yardım eder.” Ana fikir nedir? Benzer durumu düşün.','["Musluklar pahalıdır.","Suyu tasarruflu kullanmalıyız.","Sadece yağmur suyu içilir.","Su bitmez."]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ana-fikir-2-3','coktan_secmeli','“Takım üyeleri birbirini dinlediğinde işler daha düzenli yürür.” Ana fikir? Benzer durumu düşün.','["Tek kişi her şeyi yapmalıdır.","Dinlemek gereksizdir.","Takımda konuşulmaz.","İş birliği başarıyı kolaylaştırır."]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ana-fikir-2-4','coktan_secmeli','Arıların çiçekten çiçeğe polen taşımasını anlatan metne en uygun başlık? Benzer durumu düşün.','["Kışlık Mont","Arıların Doğadaki Görevi","Yeni Defter","Okul Servisi"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ana-fikir-2-5','coktan_secmeli','Bir metnin konusu neyi gösterir? Benzer durumu düşün.','["Yazarın adresini","Kitabın fiyatını","Sayfa sayısını","Metinde ne anlatıldığını"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ana-fikir-2-6','coktan_secmeli','“Geri dönüşüm atıkları yeniden değerlendirmeye yardım eder.” En uygun başlık? Benzer durumu düşün.','["Uzun Yol","Atıkları Değerlendiriyoruz","Karlı Gün","Yeni Oyuncak"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-cikarim','Çıkarım ve Tahmin','Çıkarım ve Tahmin','Çıkarım ve Tahmin becerilerini uygular.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-okuma'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cikarim-1-1','coktan_secmeli','Mert mont, atkı ve eldiven giydi. Ne çıkarılabilir?','["Hava soğuk olabilir.","Kesin yazdır.","Hava çok sıcaktır.","Okul tatildir."]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cikarim-1-2','coktan_secmeli','Gökyüzü koyu bulutlu, gök gürlüyor. Ne beklenebilir?','["Kesin karne günü","Yeni kitap","Yağmur veya fırtına","Sınıf gezisi"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cikarim-1-3','coktan_secmeli','Ece bitkiyi düzenli suluyor ve güneş alan yere koyuyor. Amacı?','["Bitkinin gelişmesini desteklemek","Bitkiyi kurutmak","Toprağı atmak","Saksıyı kırmak"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cikarim-1-4','coktan_secmeli','Metinde kahraman sürekli başkalarına yardım ediyor. Hangi özellik çıkarılır?','["Bencil","Dikkatsiz","Yardımsever","Kaba"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cikarim-1-5','coktan_secmeli','Bir öğrenci iki kaynaktaki bilgiyi karşılaştırıyor. Ne yapıyor?','["Bilgiyi doğruluyor.","Bilgiyi siliyor.","Ezberliyor.","Uyduruyor."]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cikarim-1-6','coktan_secmeli','Parkta yeni dikilen fidanların çevresine koruyucu çit yapılmış. Neden?','["Parkı kapatmak için","Çimleri boyamak için","Fidanları korumak için","Yağmuru engellemek için"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cikarim-2-1','coktan_secmeli','Mert mont, atkı ve eldiven giydi. Ne çıkarılabilir? Benzer durumu düşün.','["Kesin yazdır.","Hava çok sıcaktır.","Okul tatildir.","Hava soğuk olabilir."]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cikarim-2-2','coktan_secmeli','Gökyüzü koyu bulutlu, gök gürlüyor. Ne beklenebilir? Benzer durumu düşün.','["Kesin karne günü","Yağmur veya fırtına","Yeni kitap","Sınıf gezisi"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cikarim-2-3','coktan_secmeli','Ece bitkiyi düzenli suluyor ve güneş alan yere koyuyor. Amacı? Benzer durumu düşün.','["Bitkiyi kurutmak","Toprağı atmak","Saksıyı kırmak","Bitkinin gelişmesini desteklemek"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cikarim-2-4','coktan_secmeli','Metinde kahraman sürekli başkalarına yardım ediyor. Hangi özellik çıkarılır? Benzer durumu düşün.','["Bencil","Yardımsever","Dikkatsiz","Kaba"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cikarim-2-5','coktan_secmeli','Bir öğrenci iki kaynaktaki bilgiyi karşılaştırıyor. Ne yapıyor? Benzer durumu düşün.','["Bilgiyi siliyor.","Ezberliyor.","Uyduruyor.","Bilgiyi doğruluyor."]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cikarim-2-6','coktan_secmeli','Parkta yeni dikilen fidanların çevresine koruyucu çit yapılmış. Neden? Benzer durumu düşün.','["Parkı kapatmak için","Fidanları korumak için","Çimleri boyamak için","Yağmuru engellemek için"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-ozet','Özetleme ve Olay Sırası','Özetleme ve Olay Sırası','Özetleme ve Olay Sırası becerilerini uygular.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-okuma'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ozet-1-1','coktan_secmeli','Özet nasıl olmalıdır?','["Metnin önemli bilgilerini kısa biçimde vermelidir.","Tüm cümleleri aynen içermelidir.","Metinden uzun olmalıdır.","Sadece son cümleyi içermelidir."]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ozet-1-2','coktan_secmeli','“Tohumu ekti, suladı, filiz çıktı.” İkinci olay?','["Tohumu ekti","Filiz çıktı","Suladı","Meyve topladı"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ozet-1-3','coktan_secmeli','“Kitabı seçti, ödünç aldı, okudu, geri verdi.” Okumadan sonra?','["Geri verdi","Seçti","Ödünç aldı","Kaybetti"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ozet-1-4','coktan_secmeli','Özet yazarken hangi ayrıntı çıkarılabilir?','["Ana olay","Temel kişi","Ana fikri değiştirmeyen gereksiz ayrıntı","Ana fikir"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ozet-1-5','coktan_secmeli','Olay sırasını belirlerken hangi sözcükler yardımcı olabilir?','["önce, sonra, en son","mavi, sarı, yeşil","uzun, kısa, ağır","masa, kitap, kalem"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ozet-1-6','coktan_secmeli','“Uyandı, kahvaltı yaptı, okula gitti.” İlk olay nedir?','["Kahvaltı yaptı","Okula gitti","Uyandı","Eve döndü"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ozet-2-1','coktan_secmeli','Özet nasıl olmalıdır? Benzer durumu düşün.','["Tüm cümleleri aynen içermelidir.","Metinden uzun olmalıdır.","Sadece son cümleyi içermelidir.","Metnin önemli bilgilerini kısa biçimde vermelidir."]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ozet-2-2','coktan_secmeli','“Tohumu ekti, suladı, filiz çıktı.” İkinci olay? Benzer durumu düşün.','["Tohumu ekti","Suladı","Filiz çıktı","Meyve topladı"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ozet-2-3','coktan_secmeli','“Kitabı seçti, ödünç aldı, okudu, geri verdi.” Okumadan sonra? Benzer durumu düşün.','["Seçti","Ödünç aldı","Kaybetti","Geri verdi"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ozet-2-4','coktan_secmeli','Özet yazarken hangi ayrıntı çıkarılabilir? Benzer durumu düşün.','["Ana olay","Ana fikri değiştirmeyen gereksiz ayrıntı","Temel kişi","Ana fikir"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ozet-2-5','coktan_secmeli','Olay sırasını belirlerken hangi sözcükler yardımcı olabilir? Benzer durumu düşün.','["mavi, sarı, yeşil","uzun, kısa, ağır","masa, kitap, kalem","önce, sonra, en son"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ozet-2-6','coktan_secmeli','“Uyandı, kahvaltı yaptı, okula gitti.” İlk olay nedir? Benzer durumu düşün.','["Kahvaltı yaptı","Uyandı","Okula gitti","Eve döndü"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-baglam','Bağlamdan Sözcük Anlamı','Bağlamdan Sözcük Anlamı','Bağlamdan Sözcük Anlamı becerilerini uygular.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-soz'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-baglam-1-1','coktan_secmeli','“Çocuklar ortak çözüm için iş birliği yaptı.” iş birliği ne demektir?','["Birlikte çalışmak","Tek başına kalmak","Kavga etmek","Görevi bırakmak"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-baglam-1-2','coktan_secmeli','“Ece sonuçları dikkatle inceledi.” inceledi ne demektir?','["Sildi","Boyadı","Ayrıntılı baktı","Sakladı"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-baglam-1-3','coktan_secmeli','“Bu yöntem işi kolaylaştırdı.” yöntem ne demektir?','["İzlenen yol","Sonuç","Renk","Yer"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-baglam-1-4','coktan_secmeli','“Mahalle sakinleri dayanışma gösterdi.” dayanışma ne demektir?','["Dışlama","Yarışma","Birbirine destek olma","Sessizlik"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-baglam-1-5','coktan_secmeli','“Tarihî eser özenle korundu.” özenle ne demektir?','["Dikkat ederek","Rastgele","Hızla","İsteksizce"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-baglam-1-6','coktan_secmeli','“Öğrenci fikrini açıkça ifade etti.” ifade etmek ne demektir?','["Gizlemek","Silmek","Anlatmak","Unutmak"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-baglam-2-1','coktan_secmeli','“Çocuklar ortak çözüm için iş birliği yaptı.” iş birliği ne demektir? Benzer durumu düşün.','["Tek başına kalmak","Kavga etmek","Görevi bırakmak","Birlikte çalışmak"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-baglam-2-2','coktan_secmeli','“Ece sonuçları dikkatle inceledi.” inceledi ne demektir? Benzer durumu düşün.','["Sildi","Ayrıntılı baktı","Boyadı","Sakladı"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-baglam-2-3','coktan_secmeli','“Bu yöntem işi kolaylaştırdı.” yöntem ne demektir? Benzer durumu düşün.','["Sonuç","Renk","Yer","İzlenen yol"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-baglam-2-4','coktan_secmeli','“Mahalle sakinleri dayanışma gösterdi.” dayanışma ne demektir? Benzer durumu düşün.','["Dışlama","Birbirine destek olma","Yarışma","Sessizlik"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-baglam-2-5','coktan_secmeli','“Tarihî eser özenle korundu.” özenle ne demektir? Benzer durumu düşün.','["Rastgele","Hızla","İsteksizce","Dikkat ederek"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-baglam-2-6','coktan_secmeli','“Öğrenci fikrini açıkça ifade etti.” ifade etmek ne demektir? Benzer durumu düşün.','["Gizlemek","Anlatmak","Silmek","Unutmak"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-anlam-iliski','Eş, Zıt ve Eş Sesli Sözcükler','Eş, Zıt ve Eş Sesli Sözcükler','Eş, Zıt ve Eş Sesli Sözcükler becerilerini uygular.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-soz'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-anlam-iliski-1-1','coktan_secmeli','“cevap” sözcüğünün eş anlamlısı?','["yanıt","soru","işaret","metin"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-anlam-iliski-1-2','coktan_secmeli','“uzak” sözcüğünün zıt anlamlısı?','["ileri","geniş","yakın","yüksek"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-anlam-iliski-1-3','coktan_secmeli','“misafir” sözcüğünün eş anlamlısı?','["konuk","ev sahibi","komşu","öğrenci"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-anlam-iliski-1-4','coktan_secmeli','“yaş” sözcüğü hangi cümlede farklı anlamdadır?','["Ben on yaşındayım.","Yaşını sordu.","Çamaşırlar hâlâ yaş.","Onun yaşı dokuz."]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-anlam-iliski-1-5','coktan_secmeli','“yüz” sözcüğü hangi iki anlamda kullanılabilir?','["Sayı ve insan yüzü","Sadece renk","Sadece sayı","Sadece zaman"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-anlam-iliski-1-6','coktan_secmeli','“hızlı” sözcüğünün zıttı?','["çabuk","seri","yavaş","erken"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-anlam-iliski-2-1','coktan_secmeli','“cevap” sözcüğünün eş anlamlısı? Benzer durumu düşün.','["soru","işaret","metin","yanıt"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-anlam-iliski-2-2','coktan_secmeli','“uzak” sözcüğünün zıt anlamlısı? Benzer durumu düşün.','["ileri","yakın","geniş","yüksek"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-anlam-iliski-2-3','coktan_secmeli','“misafir” sözcüğünün eş anlamlısı? Benzer durumu düşün.','["ev sahibi","komşu","öğrenci","konuk"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-anlam-iliski-2-4','coktan_secmeli','“yaş” sözcüğü hangi cümlede farklı anlamdadır? Benzer durumu düşün.','["Ben on yaşındayım.","Çamaşırlar hâlâ yaş.","Yaşını sordu.","Onun yaşı dokuz."]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-anlam-iliski-2-5','coktan_secmeli','“yüz” sözcüğü hangi iki anlamda kullanılabilir? Benzer durumu düşün.','["Sadece renk","Sadece sayı","Sadece zaman","Sayı ve insan yüzü"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-anlam-iliski-2-6','coktan_secmeli','“hızlı” sözcüğünün zıttı? Benzer durumu düşün.','["çabuk","yavaş","seri","erken"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-deyim','Deyimler ve Söz Grupları','Deyimler ve Söz Grupları','Deyimler ve Söz Grupları becerilerini uygular.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-soz'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-deyim-1-1','coktan_secmeli','“Kulak vermek” ne demektir?','["Dikkatle dinlemek","Kulağı kapatmak","Bağırmak","Uyumak"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-deyim-1-2','coktan_secmeli','“Etekleri zil çalmak” neyi anlatır?','["Çok üzülmek","Çok yorulmak","Çok sevinmek","Korkmak"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-deyim-1-3','coktan_secmeli','“Gözden geçirmek” ne demektir?','["Yeniden incelemek","Silmek","Uyumak","Ezberlemek"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-deyim-1-4','coktan_secmeli','“El ele vermek” ne demektir?','["Ayrılmak","Kavga etmek","Birlikte çalışmak","İşi bırakmak"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-deyim-1-5','coktan_secmeli','Deyimler genellikle nasıl anlam taşır?','["Kalıplaşmış ve çoğu zaman mecazlı","Her zaman gerçek anlamlı","Sadece sayı bildirir","Sadece isimdir"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-deyim-1-6','coktan_secmeli','“İçi içine sığmamak” ne anlatabilir?','["Uyumak","Kızmak zorunlu","Çok heyecanlanmak","Susamak"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-deyim-2-1','coktan_secmeli','“Kulak vermek” ne demektir? Benzer durumu düşün.','["Kulağı kapatmak","Bağırmak","Uyumak","Dikkatle dinlemek"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-deyim-2-2','coktan_secmeli','“Etekleri zil çalmak” neyi anlatır? Benzer durumu düşün.','["Çok üzülmek","Çok sevinmek","Çok yorulmak","Korkmak"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-deyim-2-3','coktan_secmeli','“Gözden geçirmek” ne demektir? Benzer durumu düşün.','["Silmek","Uyumak","Ezberlemek","Yeniden incelemek"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-deyim-2-4','coktan_secmeli','“El ele vermek” ne demektir? Benzer durumu düşün.','["Ayrılmak","Birlikte çalışmak","Kavga etmek","İşi bırakmak"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-deyim-2-5','coktan_secmeli','Deyimler genellikle nasıl anlam taşır? Benzer durumu düşün.','["Her zaman gerçek anlamlı","Sadece sayı bildirir","Sadece isimdir","Kalıplaşmış ve çoğu zaman mecazlı"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-deyim-2-6','coktan_secmeli','“İçi içine sığmamak” ne anlatabilir? Benzer durumu düşün.','["Uyumak","Çok heyecanlanmak","Kızmak zorunlu","Susamak"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-buyuk-harf','Büyük Harflerin Kullanımı','Büyük Harflerin Kullanımı','Büyük Harflerin Kullanımı becerilerini uygular.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-yazim'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-buyuk-harf-1-1','coktan_secmeli','Hangisi doğru yazılmıştır?','["Ankara Türkiye''nin başkentidir.","ankara Türkiye''nin başkentidir.","Ankara türkiye''nin başkentidir.","ankara türkiye''nin başkentidir."]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-buyuk-harf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-buyuk-harf-1-2','coktan_secmeli','Cümle nasıl başlar?','["Virgülle","Küçük harfle zorunlu","Büyük harfle","Rakamla zorunlu"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-buyuk-harf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-buyuk-harf-1-3','coktan_secmeli','Kişi adları nasıl başlar?','["Büyük harfle","Her zaman küçük harfle","Noktayla","Sayıyla"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-buyuk-harf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-buyuk-harf-1-4','coktan_secmeli','“Atatürk İlkokulu” yazımı neden büyük harfle başlar?','["Uzun olduğu için","Okul olduğu için her kelime zorunlu","Özel ad olduğu için","Sadece başlık olduğu için"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-buyuk-harf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-buyuk-harf-1-5','coktan_secmeli','Bayram adlarında önemli sözcükler nasıl yazılır?','["Büyük harfle","Küçük harfle","Rakamla","Kesmeyle"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-buyuk-harf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-buyuk-harf-1-6','coktan_secmeli','Şehir adları nasıl yazılır?','["Küçük harfle","Sadece kısaltmayla","Büyük harfle başlar.","Rakamla"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-buyuk-harf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-buyuk-harf-2-1','coktan_secmeli','Hangisi doğru yazılmıştır? Benzer durumu düşün.','["ankara Türkiye''nin başkentidir.","Ankara türkiye''nin başkentidir.","ankara türkiye''nin başkentidir.","Ankara Türkiye''nin başkentidir."]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-buyuk-harf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-buyuk-harf-2-2','coktan_secmeli','Cümle nasıl başlar? Benzer durumu düşün.','["Virgülle","Büyük harfle","Küçük harfle zorunlu","Rakamla zorunlu"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-buyuk-harf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-buyuk-harf-2-3','coktan_secmeli','Kişi adları nasıl başlar? Benzer durumu düşün.','["Her zaman küçük harfle","Noktayla","Sayıyla","Büyük harfle"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-buyuk-harf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-buyuk-harf-2-4','coktan_secmeli','“Atatürk İlkokulu” yazımı neden büyük harfle başlar? Benzer durumu düşün.','["Uzun olduğu için","Özel ad olduğu için","Okul olduğu için her kelime zorunlu","Sadece başlık olduğu için"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-buyuk-harf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-buyuk-harf-2-5','coktan_secmeli','Bayram adlarında önemli sözcükler nasıl yazılır? Benzer durumu düşün.','["Küçük harfle","Rakamla","Kesmeyle","Büyük harfle"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-buyuk-harf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-buyuk-harf-2-6','coktan_secmeli','Şehir adları nasıl yazılır? Benzer durumu düşün.','["Küçük harfle","Büyük harfle başlar.","Sadece kısaltmayla","Rakamla"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-buyuk-harf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-noktalama','Noktalama İşaretleri','Noktalama İşaretleri','Noktalama İşaretleri becerilerini uygular.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-yazim'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-noktalama-1-1','coktan_secmeli','“Bugün hangi kitabı okuyacaksın__” boşluğa?','["?",".",",","!"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-noktalama-1-2','coktan_secmeli','“Eyvah__ kalemim kırıldı.” boşluğa?','["?",".","!",":"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-noktalama-1-3','coktan_secmeli','“Çantamda defter__ kalem ve silgi var.” boşluğa?','[",",".","?","!"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-noktalama-1-4','coktan_secmeli','Açıklama yapılacak cümlenin sonunda hangisi kullanılabilir?','[".","?",":","!"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-noktalama-1-5','coktan_secmeli','Konuşma cümlesini göstermek için hangi işaret kullanılabilir?','["Tırnak işareti","Sadece virgül","Sadece nokta","Sadece kesme"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-noktalama-1-6','coktan_secmeli','Tamamlanmış haber cümlesinin sonunda genellikle?','["Soru işareti","Virgül","Nokta","Kesme"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-noktalama-2-1','coktan_secmeli','“Bugün hangi kitabı okuyacaksın__” boşluğa? Benzer durumu düşün.','[".",",","!","?"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-noktalama-2-2','coktan_secmeli','“Eyvah__ kalemim kırıldı.” boşluğa? Benzer durumu düşün.','["?","!",".",":"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-noktalama-2-3','coktan_secmeli','“Çantamda defter__ kalem ve silgi var.” boşluğa? Benzer durumu düşün.','[".","?","!",","]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-noktalama-2-4','coktan_secmeli','Açıklama yapılacak cümlenin sonunda hangisi kullanılabilir? Benzer durumu düşün.','[".",":","?","!"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-noktalama-2-5','coktan_secmeli','Konuşma cümlesini göstermek için hangi işaret kullanılabilir? Benzer durumu düşün.','["Sadece virgül","Sadece nokta","Sadece kesme","Tırnak işareti"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-noktalama-2-6','coktan_secmeli','Tamamlanmış haber cümlesinin sonunda genellikle? Benzer durumu düşün.','["Soru işareti","Nokta","Virgül","Kesme"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-yazim-kural','Yazım Kuralları','Yazım Kuralları','Yazım Kuralları becerilerini uygular.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-yazim'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yazim-kural-1-1','coktan_secmeli','Hangisi doğru yazılmıştır?','["Türkiye''nin","Türkiyenin","Türkiye nin","türkiye''nin"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yazim-kural' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yazim-kural-1-2','coktan_secmeli','Sayıya gelen ek nasıl ayrılabilir?','["Virgülle","Noktayla","Kesme işaretiyle: 23''te","Hiç ayrılmaz"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yazim-kural' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yazim-kural-1-3','coktan_secmeli','“birçok” nasıl yazılır?','["Bitişik","Ayrı","Kesmeyle","Tireyle"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yazim-kural' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yazim-kural-1-4','coktan_secmeli','“her şey” nasıl yazılır?','["Bitişik","Kesmeyle","Ayrı","Rakamla"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yazim-kural' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yazim-kural-1-5','coktan_secmeli','Kısaltmaya gelen ek neye göre okunur?','["Kısaltmanın okunuşuna göre","Rengine göre","Uzunluğuna göre","Yazı tipine göre"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yazim-kural' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yazim-kural-1-6','coktan_secmeli','Özel ada gelen ek çoğu durumda nasıl ayrılır?','["Virgülle","Noktayla","Kesme işaretiyle","Tireyle her zaman"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yazim-kural' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yazim-kural-2-1','coktan_secmeli','Hangisi doğru yazılmıştır? Benzer durumu düşün.','["Türkiyenin","Türkiye nin","türkiye''nin","Türkiye''nin"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yazim-kural' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yazim-kural-2-2','coktan_secmeli','Sayıya gelen ek nasıl ayrılabilir? Benzer durumu düşün.','["Virgülle","Kesme işaretiyle: 23''te","Noktayla","Hiç ayrılmaz"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yazim-kural' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yazim-kural-2-3','coktan_secmeli','“birçok” nasıl yazılır? Benzer durumu düşün.','["Ayrı","Kesmeyle","Tireyle","Bitişik"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yazim-kural' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yazim-kural-2-4','coktan_secmeli','“her şey” nasıl yazılır? Benzer durumu düşün.','["Bitişik","Ayrı","Kesmeyle","Rakamla"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yazim-kural' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yazim-kural-2-5','coktan_secmeli','Kısaltmaya gelen ek neye göre okunur? Benzer durumu düşün.','["Rengine göre","Uzunluğuna göre","Yazı tipine göre","Kısaltmanın okunuşuna göre"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yazim-kural' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yazim-kural-2-6','coktan_secmeli','Özel ada gelen ek çoğu durumda nasıl ayrılır? Benzer durumu düşün.','["Virgülle","Kesme işaretiyle","Noktayla","Tireyle her zaman"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yazim-kural' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-isim-fiil','İsim ve Fiil','İsim ve Fiil','İsim ve Fiil becerilerini uygular.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-dil'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-isim-fiil-1-1','coktan_secmeli','“Koşmak” hangi tür sözcüğe örnektir?','["Fiil","İsim","Sıfat","Bağlaç"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-isim-fiil' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-isim-fiil-1-2','coktan_secmeli','“Masa” hangi tür sözcüktür?','["Fiil","Sıfat","İsim","Eylem cümlesi"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-isim-fiil' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-isim-fiil-1-3','coktan_secmeli','“Çocuklar güldü.” cümlesinde fiil?','["güldü","çocuklar","cümle","-lar"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-isim-fiil' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-isim-fiil-1-4','coktan_secmeli','Varlıkların adını bildiren sözcüklere ne denir?','["Fiil","Noktalama","İsim","Hece"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-isim-fiil' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-isim-fiil-1-5','coktan_secmeli','İş, oluş veya hareket bildiren sözcüklere ne denir?','["Fiil","İsim","Sıfat","Başlık"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-isim-fiil' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-isim-fiil-1-6','coktan_secmeli','“çiçek açtı” sözünde eylem bildiren sözcük?','["çiçek","söz","açtı","bildiren"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-isim-fiil' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-isim-fiil-2-1','coktan_secmeli','“Koşmak” hangi tür sözcüğe örnektir? Benzer durumu düşün.','["İsim","Sıfat","Bağlaç","Fiil"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-isim-fiil' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-isim-fiil-2-2','coktan_secmeli','“Masa” hangi tür sözcüktür? Benzer durumu düşün.','["Fiil","İsim","Sıfat","Eylem cümlesi"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-isim-fiil' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-isim-fiil-2-3','coktan_secmeli','“Çocuklar güldü.” cümlesinde fiil? Benzer durumu düşün.','["çocuklar","cümle","-lar","güldü"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-isim-fiil' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-isim-fiil-2-4','coktan_secmeli','Varlıkların adını bildiren sözcüklere ne denir? Benzer durumu düşün.','["Fiil","İsim","Noktalama","Hece"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-isim-fiil' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-isim-fiil-2-5','coktan_secmeli','İş, oluş veya hareket bildiren sözcüklere ne denir? Benzer durumu düşün.','["İsim","Sıfat","Başlık","Fiil"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-isim-fiil' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-isim-fiil-2-6','coktan_secmeli','“çiçek açtı” sözünde eylem bildiren sözcük? Benzer durumu düşün.','["çiçek","açtı","söz","bildiren"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-isim-fiil' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-sifat','Varlıkları Niteleyen Sözcükler','Varlıkları Niteleyen Sözcükler','Varlıkları Niteleyen Sözcükler becerilerini uygular.','',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-dil'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-sifat-1-1','coktan_secmeli','“kırmızı kalem” sözünde kalemi niteleyen sözcük?','["kırmızı","kalem","söz","ile"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-sifat' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-sifat-1-2','coktan_secmeli','“uzun yol” sözünde niteleyici sözcük?','["yol","uz","uzun","-un"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-sifat' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-sifat-1-3','coktan_secmeli','Sıfatlar neyi belirtebilir?','["Varlığın özelliğini","Sadece işi","Sadece zamanı","Sadece sayfayı"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-sifat' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-sifat-1-4','coktan_secmeli','“üç kitap” sözünde sayıyı belirten sözcük?','["kitap","söz","üç","belirten"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-sifat' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-sifat-1-5','coktan_secmeli','“bu ev” sözünde varlığı işaret eden sözcük?','["bu","ev","söz","varlık"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-sifat' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-sifat-1-6','coktan_secmeli','“tatlı elma” sözünde niteleyen sözcük?','["elma","söz","tatlı","-lı"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-sifat' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-sifat-2-1','coktan_secmeli','“kırmızı kalem” sözünde kalemi niteleyen sözcük? Benzer durumu düşün.','["kalem","söz","ile","kırmızı"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-sifat' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-sifat-2-2','coktan_secmeli','“uzun yol” sözünde niteleyici sözcük? Benzer durumu düşün.','["yol","uzun","uz","-un"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-sifat' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-sifat-2-3','coktan_secmeli','Sıfatlar neyi belirtebilir? Benzer durumu düşün.','["Sadece işi","Sadece zamanı","Sadece sayfayı","Varlığın özelliğini"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-sifat' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-sifat-2-4','coktan_secmeli','“üç kitap” sözünde sayıyı belirten sözcük? Benzer durumu düşün.','["kitap","üç","söz","belirten"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-sifat' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-sifat-2-5','coktan_secmeli','“bu ev” sözünde varlığı işaret eden sözcük? Benzer durumu düşün.','["ev","söz","varlık","bu"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-sifat' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-sifat-2-6','coktan_secmeli','“tatlı elma” sözünde niteleyen sözcük? Benzer durumu düşün.','["elma","tatlı","söz","-lı"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-sifat' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-cumle-anlam','Cümlede Anlam İlişkileri','Cümlede Anlam İlişkileri','Cümlede Anlam İlişkileri becerilerini uygular.','',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-dil'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cumle-anlam-1-1','coktan_secmeli','“Yağmur yağdığı için maç ertelendi.” neden?','["Yağmur yağması","Maçın ertelenmesi","Sahanın rengi","Takımın adı"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cumle-anlam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cumle-anlam-1-2','coktan_secmeli','“Çok çalıştı, bu yüzden başarılı oldu.” sonuç?','["Çok çalışması","Kitap alması","Başarılı olması","Okula gitmesi"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cumle-anlam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cumle-anlam-1-3','coktan_secmeli','“Bu kitap diğerinden daha uzundur.” hangi ilişki?','["Karşılaştırma","Neden-sonuç","Koşul","Soru"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cumle-anlam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cumle-anlam-1-4','coktan_secmeli','“Erken çıkarsak otobüse yetişiriz.” hangi ilişki?','["Karşılaştırma","Sadece neden","Koşul","Tanım"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cumle-anlam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cumle-anlam-1-5','coktan_secmeli','“Hem yüzdü hem koştu.” ne anlatır?','["İki eylemin gerçekleştiğini","Hiç eylem yok","Sadece bir eylem","Neden-sonuç"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cumle-anlam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cumle-anlam-1-6','coktan_secmeli','“Hava soğuk olmasına rağmen dışarı çıktı.” ne anlatır?','["Sadece neden","Soru","Beklenmeyen karşıt durum","Tanım"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cumle-anlam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cumle-anlam-2-1','coktan_secmeli','“Yağmur yağdığı için maç ertelendi.” neden? Benzer durumu düşün.','["Maçın ertelenmesi","Sahanın rengi","Takımın adı","Yağmur yağması"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cumle-anlam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cumle-anlam-2-2','coktan_secmeli','“Çok çalıştı, bu yüzden başarılı oldu.” sonuç? Benzer durumu düşün.','["Çok çalışması","Başarılı olması","Kitap alması","Okula gitmesi"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cumle-anlam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cumle-anlam-2-3','coktan_secmeli','“Bu kitap diğerinden daha uzundur.” hangi ilişki? Benzer durumu düşün.','["Neden-sonuç","Koşul","Soru","Karşılaştırma"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cumle-anlam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cumle-anlam-2-4','coktan_secmeli','“Erken çıkarsak otobüse yetişiriz.” hangi ilişki? Benzer durumu düşün.','["Karşılaştırma","Koşul","Sadece neden","Tanım"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cumle-anlam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cumle-anlam-2-5','coktan_secmeli','“Hem yüzdü hem koştu.” ne anlatır? Benzer durumu düşün.','["Hiç eylem yok","Sadece bir eylem","Neden-sonuç","İki eylemin gerçekleştiğini"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cumle-anlam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cumle-anlam-2-6','coktan_secmeli','“Hava soğuk olmasına rağmen dışarı çıktı.” ne anlatır? Benzer durumu düşün.','["Sadece neden","Beklenmeyen karşıt durum","Soru","Tanım"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cumle-anlam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-hikaye','Hikâye Edici Metin','Hikâye Edici Metin','Hikâye Edici Metin becerilerini uygular.','',130,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-metin'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-hikaye-1-1','coktan_secmeli','Hikâye edici metinde genellikle ne bulunur?','["Olay, kişi, yer ve zaman","Sadece tablo","Sadece tarif","Sadece liste"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-hikaye-1-2','coktan_secmeli','Metindeki olayları yaşayan kişiye ne denebilir?','["Başlık","Yazarın adresi","Kahraman/karakter","Dipnot"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-hikaye-1-3','coktan_secmeli','Olayın gerçekleştiği yer neyi gösterir?','["Mekânı","Zamanı","Ana fikri","Noktalamayı"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-hikaye-1-4','coktan_secmeli','Hikâyede sorun ve çözüm bulunabilir mi?','["Hayır","Sadece şiirde","Evet","Sadece grafikte"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-hikaye-1-5','coktan_secmeli','Hikâyede olay sırası neden önemlidir?','["Olayların gelişimini anlamaya yardım eder.","Sayfa sayısını artırır.","Yazarı değiştirir.","Başlığı siler."]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-hikaye-1-6','coktan_secmeli','Hikâyenin zamanı neyi gösterir?','["Nerede geçtiğini","Kimin anlattığını","Olayın ne zaman geçtiğini","Kaç sayfa olduğunu"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-hikaye-2-1','coktan_secmeli','Hikâye edici metinde genellikle ne bulunur? Benzer durumu düşün.','["Sadece tablo","Sadece tarif","Sadece liste","Olay, kişi, yer ve zaman"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-hikaye-2-2','coktan_secmeli','Metindeki olayları yaşayan kişiye ne denebilir? Benzer durumu düşün.','["Başlık","Kahraman/karakter","Yazarın adresi","Dipnot"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-hikaye-2-3','coktan_secmeli','Olayın gerçekleştiği yer neyi gösterir? Benzer durumu düşün.','["Zamanı","Ana fikri","Noktalamayı","Mekânı"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-hikaye-2-4','coktan_secmeli','Hikâyede sorun ve çözüm bulunabilir mi? Benzer durumu düşün.','["Hayır","Evet","Sadece şiirde","Sadece grafikte"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-hikaye-2-5','coktan_secmeli','Hikâyede olay sırası neden önemlidir? Benzer durumu düşün.','["Sayfa sayısını artırır.","Yazarı değiştirir.","Başlığı siler.","Olayların gelişimini anlamaya yardım eder."]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-hikaye-2-6','coktan_secmeli','Hikâyenin zamanı neyi gösterir? Benzer durumu düşün.','["Nerede geçtiğini","Olayın ne zaman geçtiğini","Kimin anlattığını","Kaç sayfa olduğunu"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-bilgi','Bilgilendirici Metin','Bilgilendirici Metin','Bilgilendirici Metin becerilerini uygular.','',140,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-metin'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-bilgi-1-1','coktan_secmeli','Bilgilendirici metnin amacı genellikle nedir?','["Bilgi vermek ve açıklamak","Sadece hayal ürünü olay anlatmak","Sadece şarkı söylemek","Sadece soru sormak"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-bilgi-1-2','coktan_secmeli','Bilgilendirici metinde başlık ne işe yarar?','["Yazarı gizlemeye","Sayfayı büyütmeye","Konuyu tanıtmaya","Rengi değiştirmeye"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-bilgi-1-3','coktan_secmeli','Kaynak kullanmak neden önemlidir?','["Bilginin dayanağını göstermeye","Metni uzatmaya","Resmi küçültmeye","Soruyu silmeye"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-bilgi-1-4','coktan_secmeli','Bilgilendirici metinde grafik bulunabilir mi?','["Hayır","Sadece şiirde","Evet","Sadece masalda"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-bilgi-1-5','coktan_secmeli','Gerçek bilgi ile kişisel görüş aynı mıdır?','["Hayır","Evet","Sadece kısa cümlede","Sadece internette"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-bilgi-1-6','coktan_secmeli','Bilgi metninde tanım ve örnek kullanılabilir mi?','["Hayır","Sadece hikâyede","Evet","Sadece şiirde"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-bilgi-2-1','coktan_secmeli','Bilgilendirici metnin amacı genellikle nedir? Benzer durumu düşün.','["Sadece hayal ürünü olay anlatmak","Sadece şarkı söylemek","Sadece soru sormak","Bilgi vermek ve açıklamak"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-bilgi-2-2','coktan_secmeli','Bilgilendirici metinde başlık ne işe yarar? Benzer durumu düşün.','["Yazarı gizlemeye","Konuyu tanıtmaya","Sayfayı büyütmeye","Rengi değiştirmeye"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-bilgi-2-3','coktan_secmeli','Kaynak kullanmak neden önemlidir? Benzer durumu düşün.','["Metni uzatmaya","Resmi küçültmeye","Soruyu silmeye","Bilginin dayanağını göstermeye"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-bilgi-2-4','coktan_secmeli','Bilgilendirici metinde grafik bulunabilir mi? Benzer durumu düşün.','["Hayır","Evet","Sadece şiirde","Sadece masalda"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-bilgi-2-5','coktan_secmeli','Gerçek bilgi ile kişisel görüş aynı mıdır? Benzer durumu düşün.','["Evet","Sadece kısa cümlede","Sadece internette","Hayır"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-bilgi-2-6','coktan_secmeli','Bilgi metninde tanım ve örnek kullanılabilir mi? Benzer durumu düşün.','["Hayır","Evet","Sadece hikâyede","Sadece şiirde"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-siir','Şiir ve Söz Sanatlarıyla Tanışma','Şiir ve Söz Sanatlarıyla Tanışma','Şiir ve Söz Sanatlarıyla Tanışma becerilerini uygular.','',150,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-metin'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-siir-1-1','coktan_secmeli','Şiirde satır kümelerine ne denebilir?','["Dize ve kıta yapısı","Tablo","Grafik","Denklem"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-siir-1-2','coktan_secmeli','Şiirde ses benzerlikleri bulunabilir mi?','["Hayır","Sadece düz yazıda","Evet","Şiirde ses yoktur"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-siir-1-3','coktan_secmeli','“Güneş gülümsedi.” ifadesinde güneşe insan özelliği verilmiştir. Bu neye örnektir?','["Kişileştirme","Gerçek anlam","Tablo","Ölçüm"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-siir-1-4','coktan_secmeli','Şiir duygu ve düşünce aktarabilir mi?','["Hayır","Sadece bilgi verir","Evet","Sadece sayı içerir"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-siir-1-5','coktan_secmeli','Şiir okurken vurgu ve tonlama önemli midir?','["Evet","Hayır","Sadece hızlı okumak gerekir","Ses kullanılmaz"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-siir-1-6','coktan_secmeli','Şiirin başlığı şiirin konusuyla ilişkili olabilir mi?','["Hayır","Başlık rastgele","Evet","Şiirde başlık olmaz"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-siir-2-1','coktan_secmeli','Şiirde satır kümelerine ne denebilir? Benzer durumu düşün.','["Tablo","Grafik","Denklem","Dize ve kıta yapısı"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-siir-2-2','coktan_secmeli','Şiirde ses benzerlikleri bulunabilir mi? Benzer durumu düşün.','["Hayır","Evet","Sadece düz yazıda","Şiirde ses yoktur"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-siir-2-3','coktan_secmeli','“Güneş gülümsedi.” ifadesinde güneşe insan özelliği verilmiştir. Bu neye örnektir? Benzer durumu düşün.','["Gerçek anlam","Tablo","Ölçüm","Kişileştirme"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-siir-2-4','coktan_secmeli','Şiir duygu ve düşünce aktarabilir mi? Benzer durumu düşün.','["Hayır","Evet","Sadece bilgi verir","Sadece sayı içerir"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-siir-2-5','coktan_secmeli','Şiir okurken vurgu ve tonlama önemli midir? Benzer durumu düşün.','["Hayır","Sadece hızlı okumak gerekir","Ses kullanılmaz","Evet"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-siir-2-6','coktan_secmeli','Şiirin başlığı şiirin konusuyla ilişkili olabilir mi? Benzer durumu düşün.','["Hayır","Evet","Başlık rastgele","Şiirde başlık olmaz"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-gorsel','Görsel, Grafik ve Tablo Okuma','Görsel, Grafik ve Tablo Okuma','Görsel, Grafik ve Tablo Okuma becerilerini uygular.','',160,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-metin'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-gorsel-1-1','coktan_secmeli','Bir sütun grafiğinde en yüksek sütun neyi gösterebilir?','["En yüksek değeri","En düşük değeri","Başlığı","Kaynağı"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-gorsel-1-2','coktan_secmeli','Tablonun başlığı neyi anlatır?','["Rengini","Kâğıt boyunu","Tablonun konusunu","Yazarı"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-gorsel-1-3','coktan_secmeli','Bir görseli yorumlarken neye dikkat edilir?','["Görseldeki ayrıntı ve bağlama","Sadece renge","Sadece büyüklüğe","Hiçbir şeye"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-gorsel-1-4','coktan_secmeli','Haritadaki semboller neyle açıklanabilir?','["Başlıkla yalnız","Sayfa numarasıyla","Lejant/açıklama ile","Kenar boşluğuyla"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-gorsel-1-5','coktan_secmeli','Grafikte değerleri karşılaştırmak ne sağlar?','["Veriler arasındaki farkı görmeyi","Metni silmeyi","Rengi değiştirmeyi","Zamanı durdurmayı"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-gorsel-1-6','coktan_secmeli','Görsel ve metin birlikte kullanılabilir mi?','["Hayır","Sadece resim","Evet","Sadece yazı"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-gorsel-2-1','coktan_secmeli','Bir sütun grafiğinde en yüksek sütun neyi gösterebilir? Benzer durumu düşün.','["En düşük değeri","Başlığı","Kaynağı","En yüksek değeri"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-gorsel-2-2','coktan_secmeli','Tablonun başlığı neyi anlatır? Benzer durumu düşün.','["Rengini","Tablonun konusunu","Kâğıt boyunu","Yazarı"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-gorsel-2-3','coktan_secmeli','Bir görseli yorumlarken neye dikkat edilir? Benzer durumu düşün.','["Sadece renge","Sadece büyüklüğe","Hiçbir şeye","Görseldeki ayrıntı ve bağlama"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-gorsel-2-4','coktan_secmeli','Haritadaki semboller neyle açıklanabilir? Benzer durumu düşün.','["Başlıkla yalnız","Lejant/açıklama ile","Sayfa numarasıyla","Kenar boşluğuyla"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-gorsel-2-5','coktan_secmeli','Grafikte değerleri karşılaştırmak ne sağlar? Benzer durumu düşün.','["Metni silmeyi","Rengi değiştirmeyi","Zamanı durdurmayı","Veriler arasındaki farkı görmeyi"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-gorsel-2-6','coktan_secmeli','Görsel ve metin birlikte kullanılabilir mi? Benzer durumu düşün.','["Hayır","Evet","Sadece resim","Sadece yazı"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-paragraf','Paragraf Oluşturma ve Planlı Yazma','Paragraf Oluşturma ve Planlı Yazma','Paragraf Oluşturma ve Planlı Yazma becerilerini uygular.','',170,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-anlatim'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-paragraf-1-1','coktan_secmeli','Paragraf cümleleri nasıl olmalıdır?','["Aynı konu çevresinde bağlantılı","Tamamen ilgisiz","Rastgele","Sadece sorulardan oluşan"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-paragraf-1-2','coktan_secmeli','Yazıya başlamadan önce ne yapılabilir?','["Sonuç yazılıp bırakılır.","Kâğıt yırtılır.","Plan hazırlanabilir.","Başlık gizlenir."]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-paragraf-1-3','coktan_secmeli','Giriş bölümü ne işe yarar?','["Konuyu tanıtmaya","Yazıyı bitirmeye","Kaynağı silmeye","Sadece örnek vermeye"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-paragraf-1-4','coktan_secmeli','Sonuç bölümü ne yapabilir?','["Yeni ilgisiz konu açar.","Başlığı siler.","Düşünceyi tamamlar.","Yazıyı başlatır."]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-paragraf-1-5','coktan_secmeli','Yazı bitince ne yapılmalıdır?','["Gözden geçirilmelidir.","Hemen atılmalıdır.","Hiç okunmamalıdır.","Başlığı silinmelidir."]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-paragraf-1-6','coktan_secmeli','Uygun başlık seçmek yazıyı destekler mi?','["Hayır","Başlık gereksiz","Evet","Sadece şiirde"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-paragraf-2-1','coktan_secmeli','Paragraf cümleleri nasıl olmalıdır? Benzer durumu düşün.','["Tamamen ilgisiz","Rastgele","Sadece sorulardan oluşan","Aynı konu çevresinde bağlantılı"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-paragraf-2-2','coktan_secmeli','Yazıya başlamadan önce ne yapılabilir? Benzer durumu düşün.','["Sonuç yazılıp bırakılır.","Plan hazırlanabilir.","Kâğıt yırtılır.","Başlık gizlenir."]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-paragraf-2-3','coktan_secmeli','Giriş bölümü ne işe yarar? Benzer durumu düşün.','["Yazıyı bitirmeye","Kaynağı silmeye","Sadece örnek vermeye","Konuyu tanıtmaya"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-paragraf-2-4','coktan_secmeli','Sonuç bölümü ne yapabilir? Benzer durumu düşün.','["Yeni ilgisiz konu açar.","Düşünceyi tamamlar.","Başlığı siler.","Yazıyı başlatır."]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-paragraf-2-5','coktan_secmeli','Yazı bitince ne yapılmalıdır? Benzer durumu düşün.','["Hemen atılmalıdır.","Hiç okunmamalıdır.","Başlığı silinmelidir.","Gözden geçirilmelidir."]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-paragraf-2-6','coktan_secmeli','Uygun başlık seçmek yazıyı destekler mi? Benzer durumu düşün.','["Hayır","Evet","Başlık gereksiz","Sadece şiirde"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-yonerge','Yönerge, Dinleme ve Sunum','Yönerge, Dinleme ve Sunum','Yönerge, Dinleme ve Sunum becerilerini uygular.','',180,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-anlatim'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yonerge-1-1','coktan_secmeli','“Önce metni oku, sonra soruları cevapla.” ilk adım?','["Metni okumak","Soruları cevaplamak","Defteri kapatmak","Başlığı silmek"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yonerge-1-2','coktan_secmeli','Dinlerken ne yapılmalıdır?','["Söz sürekli kesilmelidir.","Başka işle ilgilenilmelidir.","Konuşana dikkat verilmelidir.","Yüksek sesle konuşulmalıdır."]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yonerge-1-3','coktan_secmeli','Sunumda ses nasıl olmalıdır?','["Anlaşılır ve uygun yükseklikte","Duyulmayacak kadar kısık","Sürekli bağırarak","Rastgele"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yonerge-1-4','coktan_secmeli','Yönergede sıralama sözcükleri neden önemlidir?','["Rengi seçer.","Sayfayı büyütür.","İşlemleri doğru sırada yapmaya yardım eder.","Başlığı değiştirir."]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yonerge-1-5','coktan_secmeli','Sunumda göz teması ve beden dili yardımcı olabilir mi?','["Evet","Hayır","Sadece yazı önemlidir","Sadece slayt önemlidir"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yonerge-1-6','coktan_secmeli','Dinlenen metin sonunda not almak yararlı olabilir mi?','["Hayır","Not almak yasaktır","Evet","Sadece matematikte"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yonerge-2-1','coktan_secmeli','“Önce metni oku, sonra soruları cevapla.” ilk adım? Benzer durumu düşün.','["Soruları cevaplamak","Defteri kapatmak","Başlığı silmek","Metni okumak"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yonerge-2-2','coktan_secmeli','Dinlerken ne yapılmalıdır? Benzer durumu düşün.','["Söz sürekli kesilmelidir.","Konuşana dikkat verilmelidir.","Başka işle ilgilenilmelidir.","Yüksek sesle konuşulmalıdır."]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yonerge-2-3','coktan_secmeli','Sunumda ses nasıl olmalıdır? Benzer durumu düşün.','["Duyulmayacak kadar kısık","Sürekli bağırarak","Rastgele","Anlaşılır ve uygun yükseklikte"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yonerge-2-4','coktan_secmeli','Yönergede sıralama sözcükleri neden önemlidir? Benzer durumu düşün.','["Rengi seçer.","İşlemleri doğru sırada yapmaya yardım eder.","Sayfayı büyütür.","Başlığı değiştirir."]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yonerge-2-5','coktan_secmeli','Sunumda göz teması ve beden dili yardımcı olabilir mi? Benzer durumu düşün.','["Hayır","Sadece yazı önemlidir","Sadece slayt önemlidir","Evet"]',3,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yonerge-2-6','coktan_secmeli','Dinlenen metin sonunda not almak yararlı olabilir mi? Benzer durumu düşün.','["Hayır","Evet","Not almak yasaktır","Sadece matematikte"]',1,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

