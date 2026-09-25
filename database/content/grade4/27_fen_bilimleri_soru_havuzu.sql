SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-kayac','Kayaçlar, Madenler ve Fosiller','Kayaçlar, Madenler ve Fosiller','Kayaçlar, Madenler ve Fosiller ile ilgili gözlem ve günlük yaşam bağlantıları.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-yer'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-1-1','coktan_secmeli','Fosiller bize ne hakkında bilgi verir?','["Geçmişte yaşamış canlılar","Yarınki hava","Elektrik tüketimi","Saat"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-1-2','coktan_secmeli','Kayaçlar hangi yapılardan oluşabilir?','["Sadece sudan","Sadece canlılardan","Minerallerden","Sadece gazdan"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-1-3','coktan_secmeli','Madenler sınırsız kaynak mıdır?','["Hayır","Evet","Sadece altın sınırsız","Sadece kömür sınırsız"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-1-4','coktan_secmeli','Fosilleri inceleyen bilim insanı?','["Müzisyen","Mimar","Paleontolog","Astronot"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-1-5','coktan_secmeli','Kayaçların parçalanması neye katkı sağlayabilir?','["Toprak oluşumuna","Elektrik üretimine doğrudan","Saat yapımına","Yağmurun durmasına"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-2-1','coktan_secmeli','Fosiller bize ne hakkında bilgi verir? Aynı bilgiyi başka bir örneğe uygula.','["Yarınki hava","Elektrik tüketimi","Geçmişte yaşamış canlılar","Saat"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-2-2','coktan_secmeli','Kayaçlar hangi yapılardan oluşabilir? Aynı bilgiyi başka bir örneğe uygula.','["Minerallerden","Sadece sudan","Sadece canlılardan","Sadece gazdan"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-2-3','coktan_secmeli','Madenler sınırsız kaynak mıdır? Aynı bilgiyi başka bir örneğe uygula.','["Evet","Sadece altın sınırsız","Hayır","Sadece kömür sınırsız"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-2-4','coktan_secmeli','Fosilleri inceleyen bilim insanı? Aynı bilgiyi başka bir örneğe uygula.','["Paleontolog","Müzisyen","Mimar","Astronot"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-2-5','coktan_secmeli','Kayaçların parçalanması neye katkı sağlayabilir? Aynı bilgiyi başka bir örneğe uygula.','["Elektrik üretimine doğrudan","Saat yapımına","Toprak oluşumuna","Yağmurun durmasına"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-3-1','coktan_secmeli','Fosiller bize ne hakkında bilgi verir? Günlük yaşam açısından düşün.','["Geçmişte yaşamış canlılar","Yarınki hava","Elektrik tüketimi","Saat"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-3-2','coktan_secmeli','Kayaçlar hangi yapılardan oluşabilir? Günlük yaşam açısından düşün.','["Sadece sudan","Sadece canlılardan","Minerallerden","Sadece gazdan"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-3-3','coktan_secmeli','Madenler sınırsız kaynak mıdır? Günlük yaşam açısından düşün.','["Hayır","Evet","Sadece altın sınırsız","Sadece kömür sınırsız"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-3-4','coktan_secmeli','Fosilleri inceleyen bilim insanı? Günlük yaşam açısından düşün.','["Müzisyen","Mimar","Paleontolog","Astronot"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-3-5','coktan_secmeli','Kayaçların parçalanması neye katkı sağlayabilir? Günlük yaşam açısından düşün.','["Toprak oluşumuna","Elektrik üretimine doğrudan","Saat yapımına","Yağmurun durmasına"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-dunya','Dünya''nın Dönme ve Dolanma Hareketleri','Dünya''nın Dönme ve Dolanma Hareketleri','Dünya''nın Dönme ve Dolanma Hareketleri ile ilgili gözlem ve günlük yaşam bağlantıları.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-yer'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-1-1','coktan_secmeli','Dünya''nın kendi ekseni etrafındaki hareketi?','["Dolanma","Sallanma","Yansıma","Dönme"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-1-2','coktan_secmeli','Dünya''nın Güneş çevresindeki hareketi?','["Dönme","Dolanma","Titreşim","Süzülme"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-1-3','coktan_secmeli','Gece-gündüz oluşumunda temel hareket?','["Ay''ın dönmesi","Bulutların hareketi","Mevsim değişimi","Dünya''nın dönmesi"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-1-4','coktan_secmeli','Bir yıl yaklaşık neyle ilişkilidir?','["Dünya''nın bir kez dönmesi","Dünya''nın Güneş çevresinde dolanması","Ay''ın bir gecesi","Saatin dönmesi"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-1-5','coktan_secmeli','Dünya bir tam dönüşünü yaklaşık ne kadar sürede tamamlar?','["12 saat","7 gün","365 gün","24 saat"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-2-1','coktan_secmeli','Dünya''nın kendi ekseni etrafındaki hareketi? Aynı bilgiyi başka bir örneğe uygula.','["Dolanma","Dönme","Sallanma","Yansıma"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-2-2','coktan_secmeli','Dünya''nın Güneş çevresindeki hareketi? Aynı bilgiyi başka bir örneğe uygula.','["Dönme","Titreşim","Süzülme","Dolanma"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-2-3','coktan_secmeli','Gece-gündüz oluşumunda temel hareket? Aynı bilgiyi başka bir örneğe uygula.','["Ay''ın dönmesi","Dünya''nın dönmesi","Bulutların hareketi","Mevsim değişimi"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-2-4','coktan_secmeli','Bir yıl yaklaşık neyle ilişkilidir? Aynı bilgiyi başka bir örneğe uygula.','["Dünya''nın bir kez dönmesi","Ay''ın bir gecesi","Saatin dönmesi","Dünya''nın Güneş çevresinde dolanması"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-2-5','coktan_secmeli','Dünya bir tam dönüşünü yaklaşık ne kadar sürede tamamlar? Aynı bilgiyi başka bir örneğe uygula.','["12 saat","24 saat","7 gün","365 gün"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-3-1','coktan_secmeli','Dünya''nın kendi ekseni etrafındaki hareketi? Günlük yaşam açısından düşün.','["Dolanma","Sallanma","Yansıma","Dönme"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-3-2','coktan_secmeli','Dünya''nın Güneş çevresindeki hareketi? Günlük yaşam açısından düşün.','["Dönme","Dolanma","Titreşim","Süzülme"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-3-3','coktan_secmeli','Gece-gündüz oluşumunda temel hareket? Günlük yaşam açısından düşün.','["Ay''ın dönmesi","Bulutların hareketi","Mevsim değişimi","Dünya''nın dönmesi"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-3-4','coktan_secmeli','Bir yıl yaklaşık neyle ilişkilidir? Günlük yaşam açısından düşün.','["Dünya''nın bir kez dönmesi","Dünya''nın Güneş çevresinde dolanması","Ay''ın bir gecesi","Saatin dönmesi"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-3-5','coktan_secmeli','Dünya bir tam dönüşünü yaklaşık ne kadar sürede tamamlar? Günlük yaşam açısından düşün.','["12 saat","7 gün","365 gün","24 saat"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-besin-icerik','Besin İçerikleri','Besin İçerikleri','Besin İçerikleri ile ilgili gözlem ve günlük yaşam bağlantıları.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-besin'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-1-1','coktan_secmeli','Proteinler vücutta özellikle neye katkı sağlar?','["Sadece renk görmeye","Elektrik üretmeye","Büyüme ve onarıma","Kemik ölçmeye"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-1-2','coktan_secmeli','Karbonhidratların temel görevlerinden biri?','["Enerji sağlamak","Ses üretmek","Hava ölçmek","Işık vermek"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-1-3','coktan_secmeli','Vitamin ve mineraller neden gereklidir?','["Sadece tat verir.","Sadece renk sağlar.","Düzenli vücut işleyişini destekler.","Elektrik üretir."]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-1-4','coktan_secmeli','Su vücut için gerekli midir?','["Evet","Hayır","Sadece yazın","Sadece sporcuda"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-1-5','coktan_secmeli','Yağlar enerji kaynağı olabilir mi?','["Hayır","Sadece su verir","Evet","Sadece vitamin üretir"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-2-1','coktan_secmeli','Proteinler vücutta özellikle neye katkı sağlar? Aynı bilgiyi başka bir örneğe uygula.','["Büyüme ve onarıma","Sadece renk görmeye","Elektrik üretmeye","Kemik ölçmeye"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-2-2','coktan_secmeli','Karbonhidratların temel görevlerinden biri? Aynı bilgiyi başka bir örneğe uygula.','["Ses üretmek","Hava ölçmek","Enerji sağlamak","Işık vermek"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-2-3','coktan_secmeli','Vitamin ve mineraller neden gereklidir? Aynı bilgiyi başka bir örneğe uygula.','["Düzenli vücut işleyişini destekler.","Sadece tat verir.","Sadece renk sağlar.","Elektrik üretir."]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-2-4','coktan_secmeli','Su vücut için gerekli midir? Aynı bilgiyi başka bir örneğe uygula.','["Hayır","Sadece yazın","Evet","Sadece sporcuda"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-2-5','coktan_secmeli','Yağlar enerji kaynağı olabilir mi? Aynı bilgiyi başka bir örneğe uygula.','["Evet","Hayır","Sadece su verir","Sadece vitamin üretir"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-3-1','coktan_secmeli','Proteinler vücutta özellikle neye katkı sağlar? Günlük yaşam açısından düşün.','["Sadece renk görmeye","Elektrik üretmeye","Büyüme ve onarıma","Kemik ölçmeye"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-3-2','coktan_secmeli','Karbonhidratların temel görevlerinden biri? Günlük yaşam açısından düşün.','["Enerji sağlamak","Ses üretmek","Hava ölçmek","Işık vermek"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-3-3','coktan_secmeli','Vitamin ve mineraller neden gereklidir? Günlük yaşam açısından düşün.','["Sadece tat verir.","Sadece renk sağlar.","Düzenli vücut işleyişini destekler.","Elektrik üretir."]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-3-4','coktan_secmeli','Su vücut için gerekli midir? Günlük yaşam açısından düşün.','["Evet","Hayır","Sadece yazın","Sadece sporcuda"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-3-5','coktan_secmeli','Yağlar enerji kaynağı olabilir mi? Günlük yaşam açısından düşün.','["Hayır","Sadece su verir","Evet","Sadece vitamin üretir"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-dengeli','Dengeli Beslenme ve Besin İsrafı','Dengeli Beslenme ve Besin İsrafı','Dengeli Beslenme ve Besin İsrafı ile ilgili gözlem ve günlük yaşam bağlantıları.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-besin'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-1-1','coktan_secmeli','Dengeli beslenme ne demektir?','["Sadece tatlı yemek","Farklı besinleri uygun miktarda tüketmek","Tek çeşit beslenmek","Hiç su içmemek"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-1-2','coktan_secmeli','Besin israfını azaltmak için ne yapılabilir?','["Fazla alıp atmak","Tarihe bakmamak","Yiyeceği açık bırakmak","İhtiyaç kadar almak"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-1-3','coktan_secmeli','Son kullanma/tavsiye edilen tüketim bilgisi neden önemlidir?','["Rengi seçmek için","Güvenli tüketim için","Fiyatı artırmak için","Ambalajı büyütmek için"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-1-4','coktan_secmeli','Kahvaltı dengeli beslenmenin parçası olabilir mi?','["Hayır","Sadece hafta sonu","Çocuklar için gereksiz","Evet"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-1-5','coktan_secmeli','Besinleri uygun koşullarda saklamak önemli midir?','["Hayır","Evet","Sadece görünüş için","Saklama gerekmez"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-2-1','coktan_secmeli','Dengeli beslenme ne demektir? Aynı bilgiyi başka bir örneğe uygula.','["Sadece tatlı yemek","Tek çeşit beslenmek","Hiç su içmemek","Farklı besinleri uygun miktarda tüketmek"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-2-2','coktan_secmeli','Besin israfını azaltmak için ne yapılabilir? Aynı bilgiyi başka bir örneğe uygula.','["Fazla alıp atmak","İhtiyaç kadar almak","Tarihe bakmamak","Yiyeceği açık bırakmak"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-2-3','coktan_secmeli','Son kullanma/tavsiye edilen tüketim bilgisi neden önemlidir? Aynı bilgiyi başka bir örneğe uygula.','["Rengi seçmek için","Fiyatı artırmak için","Ambalajı büyütmek için","Güvenli tüketim için"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-2-4','coktan_secmeli','Kahvaltı dengeli beslenmenin parçası olabilir mi? Aynı bilgiyi başka bir örneğe uygula.','["Hayır","Evet","Sadece hafta sonu","Çocuklar için gereksiz"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-2-5','coktan_secmeli','Besinleri uygun koşullarda saklamak önemli midir? Aynı bilgiyi başka bir örneğe uygula.','["Hayır","Sadece görünüş için","Saklama gerekmez","Evet"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-3-1','coktan_secmeli','Dengeli beslenme ne demektir? Günlük yaşam açısından düşün.','["Sadece tatlı yemek","Farklı besinleri uygun miktarda tüketmek","Tek çeşit beslenmek","Hiç su içmemek"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-3-2','coktan_secmeli','Besin israfını azaltmak için ne yapılabilir? Günlük yaşam açısından düşün.','["Fazla alıp atmak","Tarihe bakmamak","Yiyeceği açık bırakmak","İhtiyaç kadar almak"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-3-3','coktan_secmeli','Son kullanma/tavsiye edilen tüketim bilgisi neden önemlidir? Günlük yaşam açısından düşün.','["Rengi seçmek için","Güvenli tüketim için","Fiyatı artırmak için","Ambalajı büyütmek için"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-3-4','coktan_secmeli','Kahvaltı dengeli beslenmenin parçası olabilir mi? Günlük yaşam açısından düşün.','["Hayır","Sadece hafta sonu","Çocuklar için gereksiz","Evet"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-3-5','coktan_secmeli','Besinleri uygun koşullarda saklamak önemli midir? Günlük yaşam açısından düşün.','["Hayır","Evet","Sadece görünüş için","Saklama gerekmez"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-kuvvet-etki','Kuvvetin Hareket Üzerindeki Etkileri','Kuvvetin Hareket Üzerindeki Etkileri','Kuvvetin Hareket Üzerindeki Etkileri ile ilgili gözlem ve günlük yaşam bağlantıları.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-kuvvet'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-1-1','coktan_secmeli','Kuvvet duran cismi hareket ettirebilir mi?','["Evet","Hayır","Sadece canlıyı","Sadece gazı"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-1-2','coktan_secmeli','Fren kuvveti bisikleti nasıl etkiler?','["Hızlandırır","Eritir","Yavaşlatabilir veya durdurabilir.","Rengini değiştirir"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-1-3','coktan_secmeli','Kuvvet cismin yönünü değiştirebilir mi?','["Evet","Hayır","Sadece sıcaklığı","Sadece kütleyi"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-1-4','coktan_secmeli','İtme ve çekme nedir?','["Madde hâli","Besin türü","Kuvvet uygulama biçimleri","Işık kaynağı"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-1-5','coktan_secmeli','Kuvvet bir cismin şeklini değiştirebilir mi?','["Evet","Hayır","Sadece rengini","Sadece kütlesini"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-2-1','coktan_secmeli','Kuvvet duran cismi hareket ettirebilir mi? Aynı bilgiyi başka bir örneğe uygula.','["Hayır","Sadece canlıyı","Evet","Sadece gazı"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-2-2','coktan_secmeli','Fren kuvveti bisikleti nasıl etkiler? Aynı bilgiyi başka bir örneğe uygula.','["Yavaşlatabilir veya durdurabilir.","Hızlandırır","Eritir","Rengini değiştirir"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-2-3','coktan_secmeli','Kuvvet cismin yönünü değiştirebilir mi? Aynı bilgiyi başka bir örneğe uygula.','["Hayır","Sadece sıcaklığı","Evet","Sadece kütleyi"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-2-4','coktan_secmeli','İtme ve çekme nedir? Aynı bilgiyi başka bir örneğe uygula.','["Kuvvet uygulama biçimleri","Madde hâli","Besin türü","Işık kaynağı"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-2-5','coktan_secmeli','Kuvvet bir cismin şeklini değiştirebilir mi? Aynı bilgiyi başka bir örneğe uygula.','["Hayır","Sadece rengini","Evet","Sadece kütlesini"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-3-1','coktan_secmeli','Kuvvet duran cismi hareket ettirebilir mi? Günlük yaşam açısından düşün.','["Evet","Hayır","Sadece canlıyı","Sadece gazı"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-3-2','coktan_secmeli','Fren kuvveti bisikleti nasıl etkiler? Günlük yaşam açısından düşün.','["Hızlandırır","Eritir","Yavaşlatabilir veya durdurabilir.","Rengini değiştirir"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-3-3','coktan_secmeli','Kuvvet cismin yönünü değiştirebilir mi? Günlük yaşam açısından düşün.','["Evet","Hayır","Sadece sıcaklığı","Sadece kütleyi"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-3-4','coktan_secmeli','İtme ve çekme nedir? Günlük yaşam açısından düşün.','["Madde hâli","Besin türü","Kuvvet uygulama biçimleri","Işık kaynağı"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-3-5','coktan_secmeli','Kuvvet bir cismin şeklini değiştirebilir mi? Günlük yaşam açısından düşün.','["Evet","Hayır","Sadece rengini","Sadece kütlesini"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-miknatis','Mıknatıs ve Etkileşim','Mıknatıs ve Etkileşim','Mıknatıs ve Etkileşim ile ilgili gözlem ve günlük yaşam bağlantıları.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-kuvvet'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-1-1','coktan_secmeli','Mıknatıs demiri çekebilir mi?','["Hayır","Sadece plastiği","Sadece camı","Evet"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-1-2','coktan_secmeli','Mıknatısın iki ucu ne olarak adlandırılır?','["Kenar","Kutup","Yüz","Düğüm"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-1-3','coktan_secmeli','Aynı kutuplar birbirini nasıl etkiler?','["Çeker","Eritir","Isıtır","İter"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-1-4','coktan_secmeli','Zıt kutuplar birbirini nasıl etkiler?','["İter","Çeker","Dondurur","Boyar"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-1-5','coktan_secmeli','Mıknatıs pusulada kullanılabilir mi?','["Hayır","Sadece mutfakta","Sadece oyuncakta","Evet"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-2-1','coktan_secmeli','Mıknatıs demiri çekebilir mi? Aynı bilgiyi başka bir örneğe uygula.','["Hayır","Evet","Sadece plastiği","Sadece camı"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-2-2','coktan_secmeli','Mıknatısın iki ucu ne olarak adlandırılır? Aynı bilgiyi başka bir örneğe uygula.','["Kenar","Yüz","Düğüm","Kutup"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-2-3','coktan_secmeli','Aynı kutuplar birbirini nasıl etkiler? Aynı bilgiyi başka bir örneğe uygula.','["Çeker","İter","Eritir","Isıtır"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-2-4','coktan_secmeli','Zıt kutuplar birbirini nasıl etkiler? Aynı bilgiyi başka bir örneğe uygula.','["İter","Dondurur","Boyar","Çeker"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-2-5','coktan_secmeli','Mıknatıs pusulada kullanılabilir mi? Aynı bilgiyi başka bir örneğe uygula.','["Hayır","Evet","Sadece mutfakta","Sadece oyuncakta"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-3-1','coktan_secmeli','Mıknatıs demiri çekebilir mi? Günlük yaşam açısından düşün.','["Hayır","Sadece plastiği","Sadece camı","Evet"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-3-2','coktan_secmeli','Mıknatısın iki ucu ne olarak adlandırılır? Günlük yaşam açısından düşün.','["Kenar","Kutup","Yüz","Düğüm"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-3-3','coktan_secmeli','Aynı kutuplar birbirini nasıl etkiler? Günlük yaşam açısından düşün.','["Çeker","Eritir","Isıtır","İter"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-3-4','coktan_secmeli','Zıt kutuplar birbirini nasıl etkiler? Günlük yaşam açısından düşün.','["İter","Çeker","Dondurur","Boyar"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-3-5','coktan_secmeli','Mıknatıs pusulada kullanılabilir mi? Günlük yaşam açısından düşün.','["Hayır","Sadece mutfakta","Sadece oyuncakta","Evet"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-madde-oz','Maddenin Ölçülebilir ve Gözlenebilir Özellikleri','Maddenin Ölçülebilir ve Gözlenebilir Özellikleri','Maddenin Ölçülebilir ve Gözlenebilir Özellikleri ile ilgili gözlem ve günlük yaşam bağlantıları.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-madde'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-1-1','coktan_secmeli','Kütle hangi araçla ölçülebilir?','["Termometre","Cetvel","Terazi","Saat"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-1-2','coktan_secmeli','Hacim neyi ifade eder?','["Maddenin uzayda kapladığı yeri","Sadece ağırlığı","Sıcaklığı","Rengi"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-1-3','coktan_secmeli','Maddenin rengi gözlenebilir özellik midir?','["Hayır","Sadece ölçülebilir","Evet","Maddeyle ilgisiz"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-1-4','coktan_secmeli','Suda yüzme-batma maddeleri ayırt etmede kullanılabilir mi?','["Evet","Hayır","Sadece gazda","Sadece ışıkta"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-1-5','coktan_secmeli','Sıcaklık termometre ile ölçülebilir mi?','["Hayır","Terazi ile","Evet","Cetvelle"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-2-1','coktan_secmeli','Kütle hangi araçla ölçülebilir? Aynı bilgiyi başka bir örneğe uygula.','["Terazi","Termometre","Cetvel","Saat"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-2-2','coktan_secmeli','Hacim neyi ifade eder? Aynı bilgiyi başka bir örneğe uygula.','["Sadece ağırlığı","Sıcaklığı","Maddenin uzayda kapladığı yeri","Rengi"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-2-3','coktan_secmeli','Maddenin rengi gözlenebilir özellik midir? Aynı bilgiyi başka bir örneğe uygula.','["Evet","Hayır","Sadece ölçülebilir","Maddeyle ilgisiz"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-2-4','coktan_secmeli','Suda yüzme-batma maddeleri ayırt etmede kullanılabilir mi? Aynı bilgiyi başka bir örneğe uygula.','["Hayır","Sadece gazda","Evet","Sadece ışıkta"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-2-5','coktan_secmeli','Sıcaklık termometre ile ölçülebilir mi? Aynı bilgiyi başka bir örneğe uygula.','["Evet","Hayır","Terazi ile","Cetvelle"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-3-1','coktan_secmeli','Kütle hangi araçla ölçülebilir? Günlük yaşam açısından düşün.','["Termometre","Cetvel","Terazi","Saat"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-3-2','coktan_secmeli','Hacim neyi ifade eder? Günlük yaşam açısından düşün.','["Maddenin uzayda kapladığı yeri","Sadece ağırlığı","Sıcaklığı","Rengi"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-3-3','coktan_secmeli','Maddenin rengi gözlenebilir özellik midir? Günlük yaşam açısından düşün.','["Hayır","Sadece ölçülebilir","Evet","Maddeyle ilgisiz"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-3-4','coktan_secmeli','Suda yüzme-batma maddeleri ayırt etmede kullanılabilir mi? Günlük yaşam açısından düşün.','["Evet","Hayır","Sadece gazda","Sadece ışıkta"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-3-5','coktan_secmeli','Sıcaklık termometre ile ölçülebilir mi? Günlük yaşam açısından düşün.','["Hayır","Terazi ile","Evet","Cetvelle"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-hal','Maddenin Hâlleri ve Değişimleri','Maddenin Hâlleri ve Değişimleri','Maddenin Hâlleri ve Değişimleri ile ilgili gözlem ve günlük yaşam bağlantıları.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-madde'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-1-1','coktan_secmeli','Buzun erimesi hangi değişimdir?','["Sıvıdan katıya","Katıdan sıvıya","Gazdan katıya","Sıvıdan gaza"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-1-2','coktan_secmeli','Suyun donması?','["Katıdan sıvıya","Gazdan sıvıya","Katıdan gaza","Sıvıdan katıya"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-1-3','coktan_secmeli','Buharlaşma hangi yönde gerçekleşir?','["Gazdan sıvıya","Sıvıdan gaza","Katıdan sıvıya","Katıdan katıya"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-1-4','coktan_secmeli','Yoğuşma?','["Sıvıdan gaza","Katıdan sıvıya","Sıvıdan katıya","Gazdan sıvıya"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-1-5','coktan_secmeli','Isı alan buz eriyebilir mi?','["Hayır","Evet","Sadece donar","Taşa dönüşür"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-2-1','coktan_secmeli','Buzun erimesi hangi değişimdir? Aynı bilgiyi başka bir örneğe uygula.','["Sıvıdan katıya","Gazdan katıya","Sıvıdan gaza","Katıdan sıvıya"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-2-2','coktan_secmeli','Suyun donması? Aynı bilgiyi başka bir örneğe uygula.','["Katıdan sıvıya","Sıvıdan katıya","Gazdan sıvıya","Katıdan gaza"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-2-3','coktan_secmeli','Buharlaşma hangi yönde gerçekleşir? Aynı bilgiyi başka bir örneğe uygula.','["Gazdan sıvıya","Katıdan sıvıya","Katıdan katıya","Sıvıdan gaza"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-2-4','coktan_secmeli','Yoğuşma? Aynı bilgiyi başka bir örneğe uygula.','["Sıvıdan gaza","Gazdan sıvıya","Katıdan sıvıya","Sıvıdan katıya"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-2-5','coktan_secmeli','Isı alan buz eriyebilir mi? Aynı bilgiyi başka bir örneğe uygula.','["Hayır","Sadece donar","Taşa dönüşür","Evet"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-3-1','coktan_secmeli','Buzun erimesi hangi değişimdir? Günlük yaşam açısından düşün.','["Sıvıdan katıya","Katıdan sıvıya","Gazdan katıya","Sıvıdan gaza"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-3-2','coktan_secmeli','Suyun donması? Günlük yaşam açısından düşün.','["Katıdan sıvıya","Gazdan sıvıya","Katıdan gaza","Sıvıdan katıya"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-3-3','coktan_secmeli','Buharlaşma hangi yönde gerçekleşir? Günlük yaşam açısından düşün.','["Gazdan sıvıya","Sıvıdan gaza","Katıdan sıvıya","Katıdan katıya"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-3-4','coktan_secmeli','Yoğuşma? Günlük yaşam açısından düşün.','["Sıvıdan gaza","Katıdan sıvıya","Sıvıdan katıya","Gazdan sıvıya"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-3-5','coktan_secmeli','Isı alan buz eriyebilir mi? Günlük yaşam açısından düşün.','["Hayır","Evet","Sadece donar","Taşa dönüşür"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-aydinlatma','Doğru Aydınlatma ve Işık Kirliliği','Doğru Aydınlatma ve Işık Kirliliği','Doğru Aydınlatma ve Işık Kirliliği ile ilgili gözlem ve günlük yaşam bağlantıları.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-isik-ses'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-1-1','coktan_secmeli','Doğru aydınlatmada ışık nereye yöneltilmelidir?','["İhtiyaç olan bölgeye uygun biçimde","Göze doğrudan","Gökyüzüne gereksiz","Her yere en güçlü"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-1-2','coktan_secmeli','Işık kirliliği neye yol açabilir?','["Suyu çoğaltır","Toprağı ağırlaştırır","Enerji israfına ve çevresel etkilere","Sesi azaltır"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-1-3','coktan_secmeli','Gereksiz yanan lambayı kapatmak ne sağlar?','["Enerji tasarrufu","Daha çok tüketim","Daha çok ışık kirliliği","Suyu azaltma"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-1-4','coktan_secmeli','Çalışma masasında uygun ışık önemli midir?','["Hayır","Sadece gece","Evet","Sadece yetişkinlere"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-1-5','coktan_secmeli','Işığın göze doğrudan gelmesi uygun mudur?','["Hayır","Evet","Her zaman","Sadece gündüz"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-2-1','coktan_secmeli','Doğru aydınlatmada ışık nereye yöneltilmelidir? Aynı bilgiyi başka bir örneğe uygula.','["Göze doğrudan","Gökyüzüne gereksiz","İhtiyaç olan bölgeye uygun biçimde","Her yere en güçlü"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-2-2','coktan_secmeli','Işık kirliliği neye yol açabilir? Aynı bilgiyi başka bir örneğe uygula.','["Enerji israfına ve çevresel etkilere","Suyu çoğaltır","Toprağı ağırlaştırır","Sesi azaltır"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-2-3','coktan_secmeli','Gereksiz yanan lambayı kapatmak ne sağlar? Aynı bilgiyi başka bir örneğe uygula.','["Daha çok tüketim","Daha çok ışık kirliliği","Enerji tasarrufu","Suyu azaltma"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-2-4','coktan_secmeli','Çalışma masasında uygun ışık önemli midir? Aynı bilgiyi başka bir örneğe uygula.','["Evet","Hayır","Sadece gece","Sadece yetişkinlere"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-2-5','coktan_secmeli','Işığın göze doğrudan gelmesi uygun mudur? Aynı bilgiyi başka bir örneğe uygula.','["Evet","Her zaman","Hayır","Sadece gündüz"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-3-1','coktan_secmeli','Doğru aydınlatmada ışık nereye yöneltilmelidir? Günlük yaşam açısından düşün.','["İhtiyaç olan bölgeye uygun biçimde","Göze doğrudan","Gökyüzüne gereksiz","Her yere en güçlü"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-3-2','coktan_secmeli','Işık kirliliği neye yol açabilir? Günlük yaşam açısından düşün.','["Suyu çoğaltır","Toprağı ağırlaştırır","Enerji israfına ve çevresel etkilere","Sesi azaltır"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-3-3','coktan_secmeli','Gereksiz yanan lambayı kapatmak ne sağlar? Günlük yaşam açısından düşün.','["Enerji tasarrufu","Daha çok tüketim","Daha çok ışık kirliliği","Suyu azaltma"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-3-4','coktan_secmeli','Çalışma masasında uygun ışık önemli midir? Günlük yaşam açısından düşün.','["Hayır","Sadece gece","Evet","Sadece yetişkinlere"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-3-5','coktan_secmeli','Işığın göze doğrudan gelmesi uygun mudur? Günlük yaşam açısından düşün.','["Hayır","Evet","Her zaman","Sadece gündüz"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-ses','Ses Teknolojileri ve Ses Kirliliği','Ses Teknolojileri ve Ses Kirliliği','Ses Teknolojileri ve Ses Kirliliği ile ilgili gözlem ve günlük yaşam bağlantıları.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-isik-ses'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-1-1','coktan_secmeli','Ses kirliliği nedir?','["Işık fazlalığı","Su kirliliği","Toprak rengi","Rahatsız edici ve sağlığı olumsuz etkileyebilen aşırı ses"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-1-2','coktan_secmeli','Uzun süre yüksek sese maruz kalmak neyi etkileyebilir?','["Boyu","İşitmeyi","Saç rengini","Kütleyi"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-1-3','coktan_secmeli','Ses teknolojisine örnek?','["Cetvel","Terazi","Termometre","Mikrofon"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-1-4','coktan_secmeli','Gürültüyü azaltmak için ne yapılabilir?','["Kornayı gereksiz kullanmak","Ses düzeyini uygun tutmak","Müziği artırmak","Bağırmak"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-1-5','coktan_secmeli','Hoparlör sesi güçlendirmede kullanılabilir mi?','["Hayır","Sadece ışık verir","Sadece görüntü verir","Evet"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-2-1','coktan_secmeli','Ses kirliliği nedir? Aynı bilgiyi başka bir örneğe uygula.','["Işık fazlalığı","Rahatsız edici ve sağlığı olumsuz etkileyebilen aşırı ses","Su kirliliği","Toprak rengi"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-2-2','coktan_secmeli','Uzun süre yüksek sese maruz kalmak neyi etkileyebilir? Aynı bilgiyi başka bir örneğe uygula.','["Boyu","Saç rengini","Kütleyi","İşitmeyi"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-2-3','coktan_secmeli','Ses teknolojisine örnek? Aynı bilgiyi başka bir örneğe uygula.','["Cetvel","Mikrofon","Terazi","Termometre"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-2-4','coktan_secmeli','Gürültüyü azaltmak için ne yapılabilir? Aynı bilgiyi başka bir örneğe uygula.','["Kornayı gereksiz kullanmak","Müziği artırmak","Bağırmak","Ses düzeyini uygun tutmak"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-2-5','coktan_secmeli','Hoparlör sesi güçlendirmede kullanılabilir mi? Aynı bilgiyi başka bir örneğe uygula.','["Hayır","Evet","Sadece ışık verir","Sadece görüntü verir"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-3-1','coktan_secmeli','Ses kirliliği nedir? Günlük yaşam açısından düşün.','["Işık fazlalığı","Su kirliliği","Toprak rengi","Rahatsız edici ve sağlığı olumsuz etkileyebilen aşırı ses"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-3-2','coktan_secmeli','Uzun süre yüksek sese maruz kalmak neyi etkileyebilir? Günlük yaşam açısından düşün.','["Boyu","İşitmeyi","Saç rengini","Kütleyi"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-3-3','coktan_secmeli','Ses teknolojisine örnek? Günlük yaşam açısından düşün.','["Cetvel","Terazi","Termometre","Mikrofon"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-3-4','coktan_secmeli','Gürültüyü azaltmak için ne yapılabilir? Günlük yaşam açısından düşün.','["Kornayı gereksiz kullanmak","Ses düzeyini uygun tutmak","Müziği artırmak","Bağırmak"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-3-5','coktan_secmeli','Hoparlör sesi güçlendirmede kullanılabilir mi? Günlük yaşam açısından düşün.','["Hayır","Sadece ışık verir","Sadece görüntü verir","Evet"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-kaynak','Kaynakların Tasarruflu Kullanımı','Kaynakların Tasarruflu Kullanımı','Kaynakların Tasarruflu Kullanımı ile ilgili gözlem ve günlük yaşam bağlantıları.','',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-cevre'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-1-1','coktan_secmeli','Suyu tasarruflu kullanmak neden önemlidir?','["İsrafı artırır.","Su sınırsızdır.","Doğal kaynakları korur.","Sadece faturayı etkiler."]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-1-2','coktan_secmeli','Elektrik tasarrufu için?','["Kullanılmayan cihazı kapatmak","Tüm ışıkları açık bırakmak","Cihazları gereksiz çalıştırmak","Şarjı sürekli bağlı tutmak"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-1-3','coktan_secmeli','Kâğıdı iki yüzlü kullanmak ne sağlar?','["İsrafı","Kirliliği","Kaynak tasarrufu","Daha çok kesim"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-1-4','coktan_secmeli','Kaynakların bilinçli kullanımı geleceği etkiler mi?','["Evet","Hayır","Sadece bugünü","Sadece okulu"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-1-5','coktan_secmeli','Yeniden kullanılabilir ürünler atığı azaltabilir mi?','["Hayır","Sadece artırır","Evet","İlgisizdir"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-2-1','coktan_secmeli','Suyu tasarruflu kullanmak neden önemlidir? Aynı bilgiyi başka bir örneğe uygula.','["Doğal kaynakları korur.","İsrafı artırır.","Su sınırsızdır.","Sadece faturayı etkiler."]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-2-2','coktan_secmeli','Elektrik tasarrufu için? Aynı bilgiyi başka bir örneğe uygula.','["Tüm ışıkları açık bırakmak","Cihazları gereksiz çalıştırmak","Kullanılmayan cihazı kapatmak","Şarjı sürekli bağlı tutmak"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-2-3','coktan_secmeli','Kâğıdı iki yüzlü kullanmak ne sağlar? Aynı bilgiyi başka bir örneğe uygula.','["Kaynak tasarrufu","İsrafı","Kirliliği","Daha çok kesim"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-2-4','coktan_secmeli','Kaynakların bilinçli kullanımı geleceği etkiler mi? Aynı bilgiyi başka bir örneğe uygula.','["Hayır","Sadece bugünü","Evet","Sadece okulu"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-2-5','coktan_secmeli','Yeniden kullanılabilir ürünler atığı azaltabilir mi? Aynı bilgiyi başka bir örneğe uygula.','["Evet","Hayır","Sadece artırır","İlgisizdir"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-3-1','coktan_secmeli','Suyu tasarruflu kullanmak neden önemlidir? Günlük yaşam açısından düşün.','["İsrafı artırır.","Su sınırsızdır.","Doğal kaynakları korur.","Sadece faturayı etkiler."]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-3-2','coktan_secmeli','Elektrik tasarrufu için? Günlük yaşam açısından düşün.','["Kullanılmayan cihazı kapatmak","Tüm ışıkları açık bırakmak","Cihazları gereksiz çalıştırmak","Şarjı sürekli bağlı tutmak"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-3-3','coktan_secmeli','Kâğıdı iki yüzlü kullanmak ne sağlar? Günlük yaşam açısından düşün.','["İsrafı","Kirliliği","Kaynak tasarrufu","Daha çok kesim"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-3-4','coktan_secmeli','Kaynakların bilinçli kullanımı geleceği etkiler mi? Günlük yaşam açısından düşün.','["Evet","Hayır","Sadece bugünü","Sadece okulu"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-3-5','coktan_secmeli','Yeniden kullanılabilir ürünler atığı azaltabilir mi? Günlük yaşam açısından düşün.','["Hayır","Sadece artırır","Evet","İlgisizdir"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-geri','Geri Dönüşüm ve Çevre','Geri Dönüşüm ve Çevre','Geri Dönüşüm ve Çevre ile ilgili gözlem ve günlük yaşam bağlantıları.','',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-cevre'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-1-1','coktan_secmeli','Geri dönüşüm ne sağlar?','["Atığın artmasını","Bazı atıkların yeniden değerlendirilmesini","Kaynağın yok olmasını","Suyun kirlenmesini"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-1-2','coktan_secmeli','Atık pil nereye bırakılmalı?','["Toprağa","Dereye","Yola","Özel toplama noktasına"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-1-3','coktan_secmeli','Cam, kâğıt, plastik ayrıştırılabilir mi?','["Hayır","Evet","Sadece kâğıt","Sadece cam"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-1-4','coktan_secmeli','Atığı azaltmanın yolu?','["Daha çok tek kullanımlık ürün","Gereksiz alışveriş","Çöpü doğaya bırakmak","Tekrar kullanım ve ihtiyaç kadar tüketim"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-1-5','coktan_secmeli','Kompost bazı organik atıklar için değerlendirme yolu olabilir mi?','["Hayır","Evet","Sadece metal için","Sadece cam için"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-2-1','coktan_secmeli','Geri dönüşüm ne sağlar? Aynı bilgiyi başka bir örneğe uygula.','["Atığın artmasını","Kaynağın yok olmasını","Suyun kirlenmesini","Bazı atıkların yeniden değerlendirilmesini"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-2-2','coktan_secmeli','Atık pil nereye bırakılmalı? Aynı bilgiyi başka bir örneğe uygula.','["Toprağa","Özel toplama noktasına","Dereye","Yola"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-2-3','coktan_secmeli','Cam, kâğıt, plastik ayrıştırılabilir mi? Aynı bilgiyi başka bir örneğe uygula.','["Hayır","Sadece kâğıt","Sadece cam","Evet"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-2-4','coktan_secmeli','Atığı azaltmanın yolu? Aynı bilgiyi başka bir örneğe uygula.','["Daha çok tek kullanımlık ürün","Tekrar kullanım ve ihtiyaç kadar tüketim","Gereksiz alışveriş","Çöpü doğaya bırakmak"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-2-5','coktan_secmeli','Kompost bazı organik atıklar için değerlendirme yolu olabilir mi? Aynı bilgiyi başka bir örneğe uygula.','["Hayır","Sadece metal için","Sadece cam için","Evet"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-3-1','coktan_secmeli','Geri dönüşüm ne sağlar? Günlük yaşam açısından düşün.','["Atığın artmasını","Bazı atıkların yeniden değerlendirilmesini","Kaynağın yok olmasını","Suyun kirlenmesini"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-3-2','coktan_secmeli','Atık pil nereye bırakılmalı? Günlük yaşam açısından düşün.','["Toprağa","Dereye","Yola","Özel toplama noktasına"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-3-3','coktan_secmeli','Cam, kâğıt, plastik ayrıştırılabilir mi? Günlük yaşam açısından düşün.','["Hayır","Evet","Sadece kâğıt","Sadece cam"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-3-4','coktan_secmeli','Atığı azaltmanın yolu? Günlük yaşam açısından düşün.','["Daha çok tek kullanımlık ürün","Gereksiz alışveriş","Çöpü doğaya bırakmak","Tekrar kullanım ve ihtiyaç kadar tüketim"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-3-5','coktan_secmeli','Kompost bazı organik atıklar için değerlendirme yolu olabilir mi? Günlük yaşam açısından düşün.','["Hayır","Evet","Sadece metal için","Sadece cam için"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-devre','Devre Elemanları','Devre Elemanları','Devre Elemanları ile ilgili gözlem ve günlük yaşam bağlantıları.','',130,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-elektrik'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-1-1','coktan_secmeli','Basit devrede enerji kaynağı?','["Pil","Anahtar","Ampul","Kablo"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-1-2','coktan_secmeli','Ampulün görevi?','["Akımı kesmek","Kabloyu uzatmak","Elektrik enerjisini ışığa dönüştürmek","Pili şarj etmek"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-1-3','coktan_secmeli','Anahtar ne işe yarar?','["Devreyi açıp kapatmaya","Işık üretmeye","Enerji üretmeye","Kabloyu eritmeye"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-1-4','coktan_secmeli','Bağlantı kablosu ne sağlar?','["Işık kaynağı","Ses kaynağı","Devre elemanları arasında iletken yol","Kütle ölçümü"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-1-5','coktan_secmeli','Duy ne işe yarar?','["Ampulü devreye bağlamaya","Pili ölçmeye","Anahtarı kapatmaya","Kabloyu kesmeye"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-2-1','coktan_secmeli','Basit devrede enerji kaynağı? Aynı bilgiyi başka bir örneğe uygula.','["Anahtar","Ampul","Pil","Kablo"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-2-2','coktan_secmeli','Ampulün görevi? Aynı bilgiyi başka bir örneğe uygula.','["Elektrik enerjisini ışığa dönüştürmek","Akımı kesmek","Kabloyu uzatmak","Pili şarj etmek"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-2-3','coktan_secmeli','Anahtar ne işe yarar? Aynı bilgiyi başka bir örneğe uygula.','["Işık üretmeye","Enerji üretmeye","Devreyi açıp kapatmaya","Kabloyu eritmeye"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-2-4','coktan_secmeli','Bağlantı kablosu ne sağlar? Aynı bilgiyi başka bir örneğe uygula.','["Devre elemanları arasında iletken yol","Işık kaynağı","Ses kaynağı","Kütle ölçümü"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-2-5','coktan_secmeli','Duy ne işe yarar? Aynı bilgiyi başka bir örneğe uygula.','["Pili ölçmeye","Anahtarı kapatmaya","Ampulü devreye bağlamaya","Kabloyu kesmeye"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-3-1','coktan_secmeli','Basit devrede enerji kaynağı? Günlük yaşam açısından düşün.','["Pil","Anahtar","Ampul","Kablo"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-3-2','coktan_secmeli','Ampulün görevi? Günlük yaşam açısından düşün.','["Akımı kesmek","Kabloyu uzatmak","Elektrik enerjisini ışığa dönüştürmek","Pili şarj etmek"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-3-3','coktan_secmeli','Anahtar ne işe yarar? Günlük yaşam açısından düşün.','["Devreyi açıp kapatmaya","Işık üretmeye","Enerji üretmeye","Kabloyu eritmeye"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-3-4','coktan_secmeli','Bağlantı kablosu ne sağlar? Günlük yaşam açısından düşün.','["Işık kaynağı","Ses kaynağı","Devre elemanları arasında iletken yol","Kütle ölçümü"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-3-5','coktan_secmeli','Duy ne işe yarar? Günlük yaşam açısından düşün.','["Ampulü devreye bağlamaya","Pili ölçmeye","Anahtarı kapatmaya","Kabloyu kesmeye"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-devre-kurma','Basit Devre Kurma','Basit Devre Kurma','Basit Devre Kurma ile ilgili gözlem ve günlük yaşam bağlantıları.','',140,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-elektrik'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-1-1','coktan_secmeli','Ampulün yanması için devre nasıl olmalı?','["Açık","Eksik kablolu","Pil olmadan","Kapalı ve doğru bağlı"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-1-2','coktan_secmeli','Devrede bağlantı koparsa ne olur?','["Daha parlak yanar","Ampul yanmayabilir.","Pil büyür","Anahtar kaybolur"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-1-3','coktan_secmeli','İki pil kullanmak ampul parlaklığını etkileyebilir mi?','["Asla","Sadece rengi değişir","Ampul küçülür","Evet, bağlantıya göre artırabilir."]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-1-4','coktan_secmeli','Devre kurarken güvenli düşük gerilimli kaynak kullanmak önemli midir?','["Hayır","Evet","Priz kullanılmalı","Islak elle çalışılmalı"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-1-5','coktan_secmeli','Anahtar açık konumdaysa devre tamamlanmış mıdır?','["Evet","Her zaman","Pil varsa fark etmez","Hayır"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-2-1','coktan_secmeli','Ampulün yanması için devre nasıl olmalı? Aynı bilgiyi başka bir örneğe uygula.','["Açık","Kapalı ve doğru bağlı","Eksik kablolu","Pil olmadan"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-2-2','coktan_secmeli','Devrede bağlantı koparsa ne olur? Aynı bilgiyi başka bir örneğe uygula.','["Daha parlak yanar","Pil büyür","Anahtar kaybolur","Ampul yanmayabilir."]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-2-3','coktan_secmeli','İki pil kullanmak ampul parlaklığını etkileyebilir mi? Aynı bilgiyi başka bir örneğe uygula.','["Asla","Evet, bağlantıya göre artırabilir.","Sadece rengi değişir","Ampul küçülür"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-2-4','coktan_secmeli','Devre kurarken güvenli düşük gerilimli kaynak kullanmak önemli midir? Aynı bilgiyi başka bir örneğe uygula.','["Hayır","Priz kullanılmalı","Islak elle çalışılmalı","Evet"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-2-5','coktan_secmeli','Anahtar açık konumdaysa devre tamamlanmış mıdır? Aynı bilgiyi başka bir örneğe uygula.','["Evet","Hayır","Her zaman","Pil varsa fark etmez"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,25,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-3-1','coktan_secmeli','Ampulün yanması için devre nasıl olmalı? Günlük yaşam açısından düşün.','["Açık","Eksik kablolu","Pil olmadan","Kapalı ve doğru bağlı"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-3-2','coktan_secmeli','Devrede bağlantı koparsa ne olur? Günlük yaşam açısından düşün.','["Daha parlak yanar","Ampul yanmayabilir.","Pil büyür","Anahtar kaybolur"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-3-3','coktan_secmeli','İki pil kullanmak ampul parlaklığını etkileyebilir mi? Günlük yaşam açısından düşün.','["Asla","Sadece rengi değişir","Ampul küçülür","Evet, bağlantıya göre artırabilir."]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-3-4','coktan_secmeli','Devre kurarken güvenli düşük gerilimli kaynak kullanmak önemli midir? Günlük yaşam açısından düşün.','["Hayır","Evet","Priz kullanılmalı","Islak elle çalışılmalı"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-3-5','coktan_secmeli','Anahtar açık konumdaysa devre tamamlanmış mıdır? Günlük yaşam açısından düşün.','["Evet","Her zaman","Pil varsa fark etmez","Hayır"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',2,45,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

