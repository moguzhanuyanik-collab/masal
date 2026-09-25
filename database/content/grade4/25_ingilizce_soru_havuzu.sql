SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-instructions','Classroom Instructions','Classroom Instructions','Classroom Instructions ile ilgili temel iletişim kalıpları.','',10,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-classroom'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-instructions-1-1','coktan_secmeli','“Open your book.” ne demektir?','["Kitabını aç.","Kitabını kapat.","Ayağa kalk.","Kalemini ver."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-instructions-1-2','coktan_secmeli','“Stand up.” ne demektir?','["Otur.","Koş.","Ayağa kalk.","Yaz."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-instructions-1-3','coktan_secmeli','“Be quiet, please.” ne demektir?','["Sessiz ol, lütfen.","Bağır.","Koş.","Kapıyı aç."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-instructions-1-4','coktan_secmeli','“Listen to me.” ne demektir?','["Bana bakma.","Yazmayı bırak.","Beni dinle.","Dışarı çık."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-instructions-2-1','coktan_secmeli','“Open your book.” ne demektir? Benzer bağlamı düşün.','["Kitabını kapat.","Kitabını aç.","Ayağa kalk.","Kalemini ver."]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-instructions-2-2','coktan_secmeli','“Stand up.” ne demektir? Benzer bağlamı düşün.','["Otur.","Koş.","Yaz.","Ayağa kalk."]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-instructions-2-3','coktan_secmeli','“Be quiet, please.” ne demektir? Benzer bağlamı düşün.','["Bağır.","Sessiz ol, lütfen.","Koş.","Kapıyı aç."]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-instructions-2-4','coktan_secmeli','“Listen to me.” ne demektir? Benzer bağlamı düşün.','["Bana bakma.","Yazmayı bırak.","Dışarı çık.","Beni dinle."]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-instructions-3-1','coktan_secmeli','“Open your book.” ne demektir? Benzer bağlamı düşün.','["Kitabını kapat.","Ayağa kalk.","Kitabını aç.","Kalemini ver."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-instructions-3-2','coktan_secmeli','“Stand up.” ne demektir? Benzer bağlamı düşün.','["Ayağa kalk.","Otur.","Koş.","Yaz."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-instructions-3-3','coktan_secmeli','“Be quiet, please.” ne demektir? Benzer bağlamı düşün.','["Bağır.","Koş.","Sessiz ol, lütfen.","Kapıyı aç."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-instructions-3-4','coktan_secmeli','“Listen to me.” ne demektir? Benzer bağlamı düşün.','["Beni dinle.","Bana bakma.","Yazmayı bırak.","Dışarı çık."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-permission','Asking for Permission','Asking for Permission','Asking for Permission ile ilgili temel iletişim kalıpları.','',20,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-classroom'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-permission-1-1','coktan_secmeli','“May I come in?” ne için kullanılır?','["İçeri girmek için izin isteme","Yaş sorma","Saat sorma","Yemek isteme"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-permission' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-permission-1-2','coktan_secmeli','“Can I use your pencil?” ne demektir?','["Kalemin nerede?","Kalemi kır.","Kalemini kullanabilir miyim?","Kalemin mavi."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-permission' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-permission-1-3','coktan_secmeli','Uygun cevap: “May I open the window?”','["Yes, you may.","I am ten.","It is rainy.","Blue."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-permission' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-permission-1-4','coktan_secmeli','“Sorry, you can''t.” ne demektir?','["Evet yapabilirsin.","Teşekkürler.","Üzgünüm, yapamazsın.","Hoş geldin."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-permission' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-permission-2-1','coktan_secmeli','“May I come in?” ne için kullanılır? Benzer bağlamı düşün.','["Yaş sorma","İçeri girmek için izin isteme","Saat sorma","Yemek isteme"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-permission' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-permission-2-2','coktan_secmeli','“Can I use your pencil?” ne demektir? Benzer bağlamı düşün.','["Kalemin nerede?","Kalemi kır.","Kalemin mavi.","Kalemini kullanabilir miyim?"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-permission' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-permission-2-3','coktan_secmeli','Uygun cevap: “May I open the window?” Benzer bağlamı düşün.','["I am ten.","Yes, you may.","It is rainy.","Blue."]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-permission' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-permission-2-4','coktan_secmeli','“Sorry, you can''t.” ne demektir? Benzer bağlamı düşün.','["Evet yapabilirsin.","Teşekkürler.","Hoş geldin.","Üzgünüm, yapamazsın."]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-permission' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-permission-3-1','coktan_secmeli','“May I come in?” ne için kullanılır? Benzer bağlamı düşün.','["Yaş sorma","Saat sorma","İçeri girmek için izin isteme","Yemek isteme"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-permission' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-permission-3-2','coktan_secmeli','“Can I use your pencil?” ne demektir? Benzer bağlamı düşün.','["Kalemini kullanabilir miyim?","Kalemin nerede?","Kalemi kır.","Kalemin mavi."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-permission' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-permission-3-3','coktan_secmeli','Uygun cevap: “May I open the window?” Benzer bağlamı düşün.','["I am ten.","It is rainy.","Yes, you may.","Blue."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-permission' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-permission-3-4','coktan_secmeli','“Sorry, you can''t.” ne demektir? Benzer bağlamı düşün.','["Üzgünüm, yapamazsın.","Evet yapabilirsin.","Teşekkürler.","Hoş geldin."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-permission' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-countries','Countries and Nationalities','Countries and Nationalities','Countries and Nationalities ile ilgili temel iletişim kalıpları.','',30,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-nationality'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-countries-1-1','coktan_secmeli','Turkey → ?','["Turkish","German","French","Japanese"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-countries' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-countries-1-2','coktan_secmeli','Germany → ?','["Turkish","British","German","Spanish"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-countries' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-countries-1-3','coktan_secmeli','Japan → ?','["Japanese","French","Turkish","German"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-countries' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-countries-1-4','coktan_secmeli','France → ?','["German","Japanese","French","Turkish"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-countries' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-countries-2-1','coktan_secmeli','Turkey → ? Benzer bağlamı düşün.','["German","Turkish","French","Japanese"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-countries' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-countries-2-2','coktan_secmeli','Germany → ? Benzer bağlamı düşün.','["Turkish","British","Spanish","German"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-countries' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-countries-2-3','coktan_secmeli','Japan → ? Benzer bağlamı düşün.','["French","Japanese","Turkish","German"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-countries' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-countries-2-4','coktan_secmeli','France → ? Benzer bağlamı düşün.','["German","Japanese","Turkish","French"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-countries' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-countries-3-1','coktan_secmeli','Turkey → ? Benzer bağlamı düşün.','["German","French","Turkish","Japanese"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-countries' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-countries-3-2','coktan_secmeli','Germany → ? Benzer bağlamı düşün.','["German","Turkish","British","Spanish"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-countries' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-countries-3-3','coktan_secmeli','Japan → ? Benzer bağlamı düşün.','["French","Turkish","Japanese","German"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-countries' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-countries-3-4','coktan_secmeli','France → ? Benzer bağlamı düşün.','["French","German","Japanese","Turkish"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-countries' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-language','Languages and Origins','Languages and Origins','Languages and Origins ile ilgili temel iletişim kalıpları.','',40,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-nationality'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-language-1-1','coktan_secmeli','“I am from Türkiye.” ne demektir?','["Türkiye''denim.","Türkiye''yi seviyorum.","Türkçe konuşamıyorum.","Türkiye bir dildir."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-language' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-language-1-2','coktan_secmeli','“Where are you from?” neyi sorar?','["Yaşını","Saatini","Hangi ülkeden olduğunu","Mesleğini"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-language' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-language-1-3','coktan_secmeli','“I speak English.” ne demektir?','["İngilizce konuşurum.","İngiltere''denim.","İngilizceyi sevmem.","İngilizce bir şehir."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-language' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-language-1-4','coktan_secmeli','Country and nationality are exactly the same word every time?','["Yes","Only in Turkish","No","Only in class"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-language' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-language-2-1','coktan_secmeli','“I am from Türkiye.” ne demektir? Benzer bağlamı düşün.','["Türkiye''yi seviyorum.","Türkiye''denim.","Türkçe konuşamıyorum.","Türkiye bir dildir."]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-language' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-language-2-2','coktan_secmeli','“Where are you from?” neyi sorar? Benzer bağlamı düşün.','["Yaşını","Saatini","Mesleğini","Hangi ülkeden olduğunu"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-language' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-language-2-3','coktan_secmeli','“I speak English.” ne demektir? Benzer bağlamı düşün.','["İngiltere''denim.","İngilizce konuşurum.","İngilizceyi sevmem.","İngilizce bir şehir."]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-language' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-language-2-4','coktan_secmeli','Country and nationality are exactly the same word every time? Benzer bağlamı düşün.','["Yes","Only in Turkish","Only in class","No"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-language' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-language-3-1','coktan_secmeli','“I am from Türkiye.” ne demektir? Benzer bağlamı düşün.','["Türkiye''yi seviyorum.","Türkçe konuşamıyorum.","Türkiye''denim.","Türkiye bir dildir."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-language' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-language-3-2','coktan_secmeli','“Where are you from?” neyi sorar? Benzer bağlamı düşün.','["Hangi ülkeden olduğunu","Yaşını","Saatini","Mesleğini"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-language' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-language-3-3','coktan_secmeli','“I speak English.” ne demektir? Benzer bağlamı düşün.','["İngiltere''denim.","İngilizceyi sevmem.","İngilizce konuşurum.","İngilizce bir şehir."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-language' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-language-3-4','coktan_secmeli','Country and nationality are exactly the same word every time? Benzer bağlamı düşün.','["No","Yes","Only in Turkish","Only in class"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-language' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-abilities','Abilities: can / can''t','Abilities: can / can''t','Abilities: can / can''t ile ilgili temel iletişim kalıpları.','',50,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-cartoon'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-abilities-1-1','coktan_secmeli','“I can swim.” ne demektir?','["Yüzebilirim.","Yüzemem.","Koşarım.","Uyurum."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-abilities-1-2','coktan_secmeli','“He can''t fly.” ne demektir?','["O uçabilir.","O yüzebilir.","O uçamaz.","O koşamaz."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-abilities-1-3','coktan_secmeli','Which asks about ability?','["Can you ride a bike?","How old are you?","Where are you from?","What time is it?"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-abilities-1-4','coktan_secmeli','A: Can she sing? B: Yes, she can. Ne anlatır?','["Söyleyemediğini","Şarkı sevmediğini","Şarkı söyleyebildiğini","Şarkı olmadığını"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-abilities-2-1','coktan_secmeli','“I can swim.” ne demektir? Benzer bağlamı düşün.','["Yüzemem.","Yüzebilirim.","Koşarım.","Uyurum."]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-abilities-2-2','coktan_secmeli','“He can''t fly.” ne demektir? Benzer bağlamı düşün.','["O uçabilir.","O yüzebilir.","O koşamaz.","O uçamaz."]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-abilities-2-3','coktan_secmeli','Which asks about ability? Benzer bağlamı düşün.','["How old are you?","Can you ride a bike?","Where are you from?","What time is it?"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-abilities-2-4','coktan_secmeli','A: Can she sing? B: Yes, she can. Ne anlatır? Benzer bağlamı düşün.','["Söyleyemediğini","Şarkı sevmediğini","Şarkı olmadığını","Şarkı söyleyebildiğini"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-abilities-3-1','coktan_secmeli','“I can swim.” ne demektir? Benzer bağlamı düşün.','["Yüzemem.","Koşarım.","Yüzebilirim.","Uyurum."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-abilities-3-2','coktan_secmeli','“He can''t fly.” ne demektir? Benzer bağlamı düşün.','["O uçamaz.","O uçabilir.","O yüzebilir.","O koşamaz."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-abilities-3-3','coktan_secmeli','Which asks about ability? Benzer bağlamı düşün.','["How old are you?","Where are you from?","Can you ride a bike?","What time is it?"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-abilities-3-4','coktan_secmeli','A: Can she sing? B: Yes, she can. Ne anlatır? Benzer bağlamı düşün.','["Şarkı söyleyebildiğini","Söyleyemediğini","Şarkı sevmediğini","Şarkı olmadığını"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-actions','Action Verbs','Action Verbs','Action Verbs ile ilgili temel iletişim kalıpları.','',60,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-cartoon'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-actions-1-1','coktan_secmeli','run','["koşmak","uçmak","yüzmek","okumak"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-actions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-actions-1-2','coktan_secmeli','jump','["yazmak","uyumak","zıplamak","yüzmek"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-actions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-actions-1-3','coktan_secmeli','climb','["tırmanmak","oturmak","yemek","çizmek"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-actions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-actions-1-4','coktan_secmeli','ride a bike','["kitap okumak","şarkı söylemek","bisiklete binmek","uyumak"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-actions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-actions-2-1','coktan_secmeli','run Benzer bağlamı düşün.','["uçmak","koşmak","yüzmek","okumak"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-actions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-actions-2-2','coktan_secmeli','jump Benzer bağlamı düşün.','["yazmak","uyumak","yüzmek","zıplamak"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-actions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-actions-2-3','coktan_secmeli','climb Benzer bağlamı düşün.','["oturmak","tırmanmak","yemek","çizmek"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-actions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-actions-2-4','coktan_secmeli','ride a bike Benzer bağlamı düşün.','["kitap okumak","şarkı söylemek","uyumak","bisiklete binmek"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-actions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-actions-3-1','coktan_secmeli','run Benzer bağlamı düşün.','["uçmak","yüzmek","koşmak","okumak"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-actions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-actions-3-2','coktan_secmeli','jump Benzer bağlamı düşün.','["zıplamak","yazmak","uyumak","yüzmek"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-actions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-actions-3-3','coktan_secmeli','climb Benzer bağlamı düşün.','["oturmak","yemek","tırmanmak","çizmek"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-actions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-actions-3-4','coktan_secmeli','ride a bike Benzer bağlamı düşün.','["bisiklete binmek","kitap okumak","şarkı söylemek","uyumak"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-actions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-hobbies','Hobbies and Free Time','Hobbies and Free Time','Hobbies and Free Time ile ilgili temel iletişim kalıpları.','',70,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-free-time'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-hobbies-1-1','coktan_secmeli','read books','["kitap okumak","yemek yapmak","koşmak","uyumak"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-hobbies' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-hobbies-1-2','coktan_secmeli','play chess','["resim çizmek","yüzmek","satranç oynamak","şarkı söylemek"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-hobbies' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-hobbies-1-3','coktan_secmeli','draw pictures','["resim çizmek","satranç oynamak","koşmak","okumak"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-hobbies' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-hobbies-1-4','coktan_secmeli','play football','["kitap okumak","yemek yapmak","futbol oynamak","uyumak"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-hobbies' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-hobbies-2-1','coktan_secmeli','read books Benzer bağlamı düşün.','["yemek yapmak","kitap okumak","koşmak","uyumak"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-hobbies' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-hobbies-2-2','coktan_secmeli','play chess Benzer bağlamı düşün.','["resim çizmek","yüzmek","şarkı söylemek","satranç oynamak"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-hobbies' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-hobbies-2-3','coktan_secmeli','draw pictures Benzer bağlamı düşün.','["satranç oynamak","resim çizmek","koşmak","okumak"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-hobbies' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-hobbies-2-4','coktan_secmeli','play football Benzer bağlamı düşün.','["kitap okumak","yemek yapmak","uyumak","futbol oynamak"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-hobbies' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-hobbies-3-1','coktan_secmeli','read books Benzer bağlamı düşün.','["yemek yapmak","koşmak","kitap okumak","uyumak"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-hobbies' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-hobbies-3-2','coktan_secmeli','play chess Benzer bağlamı düşün.','["satranç oynamak","resim çizmek","yüzmek","şarkı söylemek"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-hobbies' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-hobbies-3-3','coktan_secmeli','draw pictures Benzer bağlamı düşün.','["satranç oynamak","koşmak","resim çizmek","okumak"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-hobbies' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-hobbies-3-4','coktan_secmeli','play football Benzer bağlamı düşün.','["futbol oynamak","kitap okumak","yemek yapmak","uyumak"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-hobbies' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-likes','Likes and Dislikes','Likes and Dislikes','Likes and Dislikes ile ilgili temel iletişim kalıpları.','',80,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-free-time'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-likes-1-1','coktan_secmeli','“I like reading.” ne demektir?','["Okumayı severim.","Okumayı sevmem.","Okuyamam.","Okuyorum zorunlu."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-likes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-likes-1-2','coktan_secmeli','“I don''t like swimming.”','["Yüzmeyi severim.","Yüzemem kesin.","Yüzmeyi sevmem.","Yüzüyorum."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-likes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-likes-1-3','coktan_secmeli','Which sentence is a preference?','["I like chess.","It is Monday.","I am ten.","Open the door."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-likes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-likes-1-4','coktan_secmeli','“My favourite hobby is drawing.”','["Resim çizemem.","Hobim yok.","En sevdiğim hobi resim çizmek.","En sevdiğim ders matematik."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-likes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-likes-2-1','coktan_secmeli','“I like reading.” ne demektir? Benzer bağlamı düşün.','["Okumayı sevmem.","Okumayı severim.","Okuyamam.","Okuyorum zorunlu."]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-likes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-likes-2-2','coktan_secmeli','“I don''t like swimming.” Benzer bağlamı düşün.','["Yüzmeyi severim.","Yüzemem kesin.","Yüzüyorum.","Yüzmeyi sevmem."]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-likes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-likes-2-3','coktan_secmeli','Which sentence is a preference? Benzer bağlamı düşün.','["It is Monday.","I like chess.","I am ten.","Open the door."]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-likes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-likes-2-4','coktan_secmeli','“My favourite hobby is drawing.” Benzer bağlamı düşün.','["Resim çizemem.","Hobim yok.","En sevdiğim ders matematik.","En sevdiğim hobi resim çizmek."]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-likes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-likes-3-1','coktan_secmeli','“I like reading.” ne demektir? Benzer bağlamı düşün.','["Okumayı sevmem.","Okuyamam.","Okumayı severim.","Okuyorum zorunlu."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-likes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-likes-3-2','coktan_secmeli','“I don''t like swimming.” Benzer bağlamı düşün.','["Yüzmeyi sevmem.","Yüzmeyi severim.","Yüzemem kesin.","Yüzüyorum."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-likes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-likes-3-3','coktan_secmeli','Which sentence is a preference? Benzer bağlamı düşün.','["It is Monday.","I am ten.","I like chess.","Open the door."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-likes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-likes-3-4','coktan_secmeli','“My favourite hobby is drawing.” Benzer bağlamı düşün.','["En sevdiğim hobi resim çizmek.","Resim çizemem.","Hobim yok.","En sevdiğim ders matematik."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-likes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-routine','Daily Routines','Daily Routines','Daily Routines ile ilgili temel iletişim kalıpları.','',90,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-my-day'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-routine-1-1','coktan_secmeli','get up','["uyanmak/kalkmak","uyumak","yemek","koşmak"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-routine-1-2','coktan_secmeli','have breakfast','["ödev yapmak","uyumak","kahvaltı yapmak","yüzmek"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-routine-1-3','coktan_secmeli','go to school','["okula gitmek","eve dönmek","uyumak","yemek"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-routine-1-4','coktan_secmeli','do homework','["kahvaltı yapmak","oynamak","ödev yapmak","uyumak"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-routine-2-1','coktan_secmeli','get up Benzer bağlamı düşün.','["uyumak","uyanmak/kalkmak","yemek","koşmak"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-routine-2-2','coktan_secmeli','have breakfast Benzer bağlamı düşün.','["ödev yapmak","uyumak","yüzmek","kahvaltı yapmak"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-routine-2-3','coktan_secmeli','go to school Benzer bağlamı düşün.','["eve dönmek","okula gitmek","uyumak","yemek"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-routine-2-4','coktan_secmeli','do homework Benzer bağlamı düşün.','["kahvaltı yapmak","oynamak","uyumak","ödev yapmak"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-routine-3-1','coktan_secmeli','get up Benzer bağlamı düşün.','["uyumak","yemek","uyanmak/kalkmak","koşmak"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-routine-3-2','coktan_secmeli','have breakfast Benzer bağlamı düşün.','["kahvaltı yapmak","ödev yapmak","uyumak","yüzmek"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-routine-3-3','coktan_secmeli','go to school Benzer bağlamı düşün.','["eve dönmek","uyumak","okula gitmek","yemek"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-routine-3-4','coktan_secmeli','do homework Benzer bağlamı düşün.','["ödev yapmak","kahvaltı yapmak","oynamak","uyumak"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-time','Telling the Time','Telling the Time','Telling the Time ile ilgili temel iletişim kalıpları.','',100,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-my-day'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-time-1-1','coktan_secmeli','“It is seven o''clock.”','["Saat yedi.","Saat sekiz.","Yedinci gün.","Yedi yaş."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-time' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-time-1-2','coktan_secmeli','“It is half past eight.”','["Saat sekiz.","Saat dokuz buçuk.","Saat sekiz buçuk.","Saat yedi buçuk."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-time' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-time-1-3','coktan_secmeli','What time is it? neyi sorar?','["Saati","Yaşı","Ülkeyi","Mesleği"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-time' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-time-1-4','coktan_secmeli','“At nine o''clock” neyi anlatır?','["Dokuz yaşında","Dokuz kişi","Saat dokuzda","Dokuz gün"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-time' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-time-2-1','coktan_secmeli','“It is seven o''clock.” Benzer bağlamı düşün.','["Saat sekiz.","Saat yedi.","Yedinci gün.","Yedi yaş."]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-time' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-time-2-2','coktan_secmeli','“It is half past eight.” Benzer bağlamı düşün.','["Saat sekiz.","Saat dokuz buçuk.","Saat yedi buçuk.","Saat sekiz buçuk."]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-time' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-time-2-3','coktan_secmeli','What time is it? neyi sorar? Benzer bağlamı düşün.','["Yaşı","Saati","Ülkeyi","Mesleği"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-time' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-time-2-4','coktan_secmeli','“At nine o''clock” neyi anlatır? Benzer bağlamı düşün.','["Dokuz yaşında","Dokuz kişi","Dokuz gün","Saat dokuzda"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-time' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-time-3-1','coktan_secmeli','“It is seven o''clock.” Benzer bağlamı düşün.','["Saat sekiz.","Yedinci gün.","Saat yedi.","Yedi yaş."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-time' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-time-3-2','coktan_secmeli','“It is half past eight.” Benzer bağlamı düşün.','["Saat sekiz buçuk.","Saat sekiz.","Saat dokuz buçuk.","Saat yedi buçuk."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-time' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-time-3-3','coktan_secmeli','What time is it? neyi sorar? Benzer bağlamı düşün.','["Yaşı","Ülkeyi","Saati","Mesleği"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-time' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-time-3-4','coktan_secmeli','“At nine o''clock” neyi anlatır? Benzer bağlamı düşün.','["Saat dokuzda","Dokuz yaşında","Dokuz kişi","Dokuz gün"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-time' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-experiment','Simple Experiment Instructions','Simple Experiment Instructions','Simple Experiment Instructions ile ilgili temel iletişim kalıpları.','',110,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-science'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-experiment-1-1','coktan_secmeli','“Mix the water and salt.”','["Su ve tuzu karıştır.","Suyu dök.","Tuzu at.","Kabı kapat."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-experiment' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-experiment-1-2','coktan_secmeli','“Pour the water.”','["Suyu dondur.","Suyu iç.","Suyu dök.","Suyu ölç."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-experiment' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-experiment-1-3','coktan_secmeli','“Cut the paper.”','["Kâğıdı kes.","Kâğıdı boya.","Kâğıdı katla.","Kâğıdı yak."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-experiment' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-experiment-1-4','coktan_secmeli','Safety instructions are important in experiments?','["No","Only at home","Yes","Only for adults"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-experiment' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-experiment-2-1','coktan_secmeli','“Mix the water and salt.” Benzer bağlamı düşün.','["Suyu dök.","Su ve tuzu karıştır.","Tuzu at.","Kabı kapat."]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-experiment' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-experiment-2-2','coktan_secmeli','“Pour the water.” Benzer bağlamı düşün.','["Suyu dondur.","Suyu iç.","Suyu ölç.","Suyu dök."]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-experiment' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-experiment-2-3','coktan_secmeli','“Cut the paper.” Benzer bağlamı düşün.','["Kâğıdı boya.","Kâğıdı kes.","Kâğıdı katla.","Kâğıdı yak."]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-experiment' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-experiment-2-4','coktan_secmeli','Safety instructions are important in experiments? Benzer bağlamı düşün.','["No","Only at home","Only for adults","Yes"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-experiment' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-experiment-3-1','coktan_secmeli','“Mix the water and salt.” Benzer bağlamı düşün.','["Suyu dök.","Tuzu at.","Su ve tuzu karıştır.","Kabı kapat."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-experiment' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-experiment-3-2','coktan_secmeli','“Pour the water.” Benzer bağlamı düşün.','["Suyu dök.","Suyu dondur.","Suyu iç.","Suyu ölç."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-experiment' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-experiment-3-3','coktan_secmeli','“Cut the paper.” Benzer bağlamı düşün.','["Kâğıdı boya.","Kâğıdı katla.","Kâğıdı kes.","Kâğıdı yak."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-experiment' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-experiment-3-4','coktan_secmeli','Safety instructions are important in experiments? Benzer bağlamı düşün.','["Yes","No","Only at home","Only for adults"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-experiment' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-location','Location Expressions','Location Expressions','Location Expressions ile ilgili temel iletişim kalıpları.','',120,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-science'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-location-1-1','coktan_secmeli','on','["üstünde","altında","yanında","içinde"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-location' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-location-1-2','coktan_secmeli','under','["üstünde","yanında","altında","içinde"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-location' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-location-1-3','coktan_secmeli','next to','["yanında","arasında","üstünde","arkasında"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-location' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-location-1-4','coktan_secmeli','in','["üstünde","altında","içinde","önünde"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-location' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-location-2-1','coktan_secmeli','on Benzer bağlamı düşün.','["altında","üstünde","yanında","içinde"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-location' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-location-2-2','coktan_secmeli','under Benzer bağlamı düşün.','["üstünde","yanında","içinde","altında"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-location' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-location-2-3','coktan_secmeli','next to Benzer bağlamı düşün.','["arasında","yanında","üstünde","arkasında"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-location' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-location-2-4','coktan_secmeli','in Benzer bağlamı düşün.','["üstünde","altında","önünde","içinde"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-location' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-location-3-1','coktan_secmeli','on Benzer bağlamı düşün.','["altında","yanında","üstünde","içinde"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-location' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-location-3-2','coktan_secmeli','under Benzer bağlamı düşün.','["altında","üstünde","yanında","içinde"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-location' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-location-3-3','coktan_secmeli','next to Benzer bağlamı düşün.','["arasında","üstünde","yanında","arkasında"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-location' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-location-3-4','coktan_secmeli','in Benzer bağlamı düşün.','["içinde","üstünde","altında","önünde"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-location' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-jobnames','Jobs','Jobs','Jobs ile ilgili temel iletişim kalıpları.','',130,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-jobs'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-jobnames-1-1','coktan_secmeli','doctor','["doktor","öğretmen","pilot","aşçı"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-jobnames' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-jobnames-1-2','coktan_secmeli','teacher','["doktor","çiftçi","öğretmen","şoför"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-jobnames' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-jobnames-1-3','coktan_secmeli','pilot','["pilot","hemşire","aşçı","öğretmen"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-jobnames' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-jobnames-1-4','coktan_secmeli','farmer','["pilot","doktor","çiftçi","garson"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-jobnames' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-jobnames-2-1','coktan_secmeli','doctor Benzer bağlamı düşün.','["öğretmen","doktor","pilot","aşçı"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-jobnames' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-jobnames-2-2','coktan_secmeli','teacher Benzer bağlamı düşün.','["doktor","çiftçi","şoför","öğretmen"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-jobnames' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-jobnames-2-3','coktan_secmeli','pilot Benzer bağlamı düşün.','["hemşire","pilot","aşçı","öğretmen"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-jobnames' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-jobnames-2-4','coktan_secmeli','farmer Benzer bağlamı düşün.','["pilot","doktor","garson","çiftçi"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-jobnames' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-jobnames-3-1','coktan_secmeli','doctor Benzer bağlamı düşün.','["öğretmen","pilot","doktor","aşçı"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-jobnames' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-jobnames-3-2','coktan_secmeli','teacher Benzer bağlamı düşün.','["öğretmen","doktor","çiftçi","şoför"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-jobnames' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-jobnames-3-3','coktan_secmeli','pilot Benzer bağlamı düşün.','["hemşire","aşçı","pilot","öğretmen"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-jobnames' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-jobnames-3-4','coktan_secmeli','farmer Benzer bağlamı düşün.','["çiftçi","pilot","doktor","garson"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-jobnames' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-workplaces','Workplaces','Workplaces','Workplaces ile ilgili temel iletişim kalıpları.','',140,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-jobs'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-workplaces-1-1','coktan_secmeli','A doctor works in a __.','["hospital","school","farm","airport"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-workplaces' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-workplaces-1-2','coktan_secmeli','A teacher works in a __.','["hospital","farm","school","restaurant"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-workplaces' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-workplaces-1-3','coktan_secmeli','A farmer works on a __.','["farm","hospital","school","airport"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-workplaces' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-workplaces-1-4','coktan_secmeli','A waiter can work in a __.','["farm","hospital","restaurant","school"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-workplaces' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-workplaces-2-1','coktan_secmeli','A doctor works in a __. Benzer bağlamı düşün.','["school","hospital","farm","airport"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-workplaces' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-workplaces-2-2','coktan_secmeli','A teacher works in a __. Benzer bağlamı düşün.','["hospital","farm","restaurant","school"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-workplaces' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-workplaces-2-3','coktan_secmeli','A farmer works on a __. Benzer bağlamı düşün.','["hospital","farm","school","airport"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-workplaces' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-workplaces-2-4','coktan_secmeli','A waiter can work in a __. Benzer bağlamı düşün.','["farm","hospital","school","restaurant"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-workplaces' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-workplaces-3-1','coktan_secmeli','A doctor works in a __. Benzer bağlamı düşün.','["school","farm","hospital","airport"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-workplaces' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-workplaces-3-2','coktan_secmeli','A teacher works in a __. Benzer bağlamı düşün.','["school","hospital","farm","restaurant"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-workplaces' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-workplaces-3-3','coktan_secmeli','A farmer works on a __. Benzer bağlamı düşün.','["hospital","school","farm","airport"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-workplaces' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-workplaces-3-4','coktan_secmeli','A waiter can work in a __. Benzer bağlamı düşün.','["restaurant","farm","hospital","school"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-workplaces' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-clothes-vocab','Clothes','Clothes','Clothes ile ilgili temel iletişim kalıpları.','',150,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-clothes'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-clothes-vocab-1-1','coktan_secmeli','coat','["mont/kaban","şort","şapka","çorap"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-clothes-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-clothes-vocab-1-2','coktan_secmeli','boots','["tişört","şort","botlar","etek"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-clothes-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-clothes-vocab-1-3','coktan_secmeli','T-shirt','["tişört","mont","atkı","bot"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-clothes-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-clothes-vocab-1-4','coktan_secmeli','scarf','["pantolon","şort","atkı","eldiven"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-clothes-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-clothes-vocab-2-1','coktan_secmeli','coat Benzer bağlamı düşün.','["şort","mont/kaban","şapka","çorap"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-clothes-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-clothes-vocab-2-2','coktan_secmeli','boots Benzer bağlamı düşün.','["tişört","şort","etek","botlar"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-clothes-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-clothes-vocab-2-3','coktan_secmeli','T-shirt Benzer bağlamı düşün.','["mont","tişört","atkı","bot"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-clothes-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-clothes-vocab-2-4','coktan_secmeli','scarf Benzer bağlamı düşün.','["pantolon","şort","eldiven","atkı"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-clothes-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-clothes-vocab-3-1','coktan_secmeli','coat Benzer bağlamı düşün.','["şort","şapka","mont/kaban","çorap"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-clothes-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-clothes-vocab-3-2','coktan_secmeli','boots Benzer bağlamı düşün.','["botlar","tişört","şort","etek"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-clothes-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-clothes-vocab-3-3','coktan_secmeli','T-shirt Benzer bağlamı düşün.','["mont","atkı","tişört","bot"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-clothes-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-clothes-vocab-3-4','coktan_secmeli','scarf Benzer bağlamı düşün.','["atkı","pantolon","şort","eldiven"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-clothes-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-weather-clothes','Weather and Clothes','Weather and Clothes','Weather and Clothes ile ilgili temel iletişim kalıpları.','',160,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-clothes'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-weather-clothes-1-1','coktan_secmeli','It is cold. Wear a __.','["coat","swimsuit","shorts","sandals"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-weather-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-weather-clothes-1-2','coktan_secmeli','It is rainy. A __ is useful.','["swimsuit","T-shirt only","raincoat","shorts"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-weather-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-weather-clothes-1-3','coktan_secmeli','It is hot. You can wear __.','["shorts","thick coat","winter boots","scarf"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-weather-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-weather-clothes-1-4','coktan_secmeli','Clothes can change with __.','["maths","age only","weather","school subject"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-weather-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-weather-clothes-2-1','coktan_secmeli','It is cold. Wear a __. Benzer bağlamı düşün.','["swimsuit","coat","shorts","sandals"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-weather-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-weather-clothes-2-2','coktan_secmeli','It is rainy. A __ is useful. Benzer bağlamı düşün.','["swimsuit","T-shirt only","shorts","raincoat"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-weather-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-weather-clothes-2-3','coktan_secmeli','It is hot. You can wear __. Benzer bağlamı düşün.','["thick coat","shorts","winter boots","scarf"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-weather-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-weather-clothes-2-4','coktan_secmeli','Clothes can change with __. Benzer bağlamı düşün.','["maths","age only","school subject","weather"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-weather-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-weather-clothes-3-1','coktan_secmeli','It is cold. Wear a __. Benzer bağlamı düşün.','["swimsuit","shorts","coat","sandals"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-weather-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-weather-clothes-3-2','coktan_secmeli','It is rainy. A __ is useful. Benzer bağlamı düşün.','["raincoat","swimsuit","T-shirt only","shorts"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-weather-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-weather-clothes-3-3','coktan_secmeli','It is hot. You can wear __. Benzer bağlamı düşün.','["thick coat","winter boots","shorts","scarf"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-weather-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-weather-clothes-3-4','coktan_secmeli','Clothes can change with __. Benzer bağlamı düşün.','["weather","maths","age only","school subject"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-weather-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-appearance','Appearance','Appearance','Appearance ile ilgili temel iletişim kalıpları.','',170,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-friends'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-appearance-1-1','coktan_secmeli','tall','["uzun boylu","kısa boylu","utangaç","komik"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-appearance' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-appearance-1-2','coktan_secmeli','short hair','["uzun saç","mavi göz","kısa saç","uzun boy"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-appearance' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-appearance-1-3','coktan_secmeli','blue eyes','["mavi gözler","kıvırcık saç","uzun kol","sarı mont"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-appearance' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-appearance-1-4','coktan_secmeli','curly hair','["düz saç","kısa boy","kıvırcık saç","yeşil göz"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-appearance' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-appearance-2-1','coktan_secmeli','tall Benzer bağlamı düşün.','["kısa boylu","uzun boylu","utangaç","komik"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-appearance' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-appearance-2-2','coktan_secmeli','short hair Benzer bağlamı düşün.','["uzun saç","mavi göz","uzun boy","kısa saç"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-appearance' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-appearance-2-3','coktan_secmeli','blue eyes Benzer bağlamı düşün.','["kıvırcık saç","mavi gözler","uzun kol","sarı mont"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-appearance' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-appearance-2-4','coktan_secmeli','curly hair Benzer bağlamı düşün.','["düz saç","kısa boy","yeşil göz","kıvırcık saç"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-appearance' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-appearance-3-1','coktan_secmeli','tall Benzer bağlamı düşün.','["kısa boylu","utangaç","uzun boylu","komik"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-appearance' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-appearance-3-2','coktan_secmeli','short hair Benzer bağlamı düşün.','["kısa saç","uzun saç","mavi göz","uzun boy"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-appearance' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-appearance-3-3','coktan_secmeli','blue eyes Benzer bağlamı düşün.','["kıvırcık saç","uzun kol","mavi gözler","sarı mont"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-appearance' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-appearance-3-4','coktan_secmeli','curly hair Benzer bağlamı düşün.','["kıvırcık saç","düz saç","kısa boy","yeşil göz"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-appearance' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-personality','Personality','Personality','Personality ile ilgili temel iletişim kalıpları.','',180,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-friends'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-personality-1-1','coktan_secmeli','kind','["nazik/iyi kalpli","kaba","aç","yağmurlu"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-personality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-personality-1-2','coktan_secmeli','helpful','["bencil","uykulu","yardımsever","karlı"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-personality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-personality-1-3','coktan_secmeli','funny','["komik","uzun boylu","aç","soğuk"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-personality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-personality-1-4','coktan_secmeli','shy','["yardımsever","uzun boylu","utangaç","güneşli"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-personality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-personality-2-1','coktan_secmeli','kind Benzer bağlamı düşün.','["kaba","nazik/iyi kalpli","aç","yağmurlu"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-personality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-personality-2-2','coktan_secmeli','helpful Benzer bağlamı düşün.','["bencil","uykulu","karlı","yardımsever"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-personality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-personality-2-3','coktan_secmeli','funny Benzer bağlamı düşün.','["uzun boylu","komik","aç","soğuk"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-personality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-personality-2-4','coktan_secmeli','shy Benzer bağlamı düşün.','["yardımsever","uzun boylu","güneşli","utangaç"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-personality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-personality-3-1','coktan_secmeli','kind Benzer bağlamı düşün.','["kaba","aç","nazik/iyi kalpli","yağmurlu"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-personality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-personality-3-2','coktan_secmeli','helpful Benzer bağlamı düşün.','["yardımsever","bencil","uykulu","karlı"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-personality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-personality-3-3','coktan_secmeli','funny Benzer bağlamı düşün.','["uzun boylu","aç","komik","soğuk"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-personality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-personality-3-4','coktan_secmeli','shy Benzer bağlamı düşün.','["utangaç","yardımsever","uzun boylu","güneşli"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-personality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-food-vocab','Food and Drinks','Food and Drinks','Food and Drinks ile ilgili temel iletişim kalıpları.','',190,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-food'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-vocab-1-1','coktan_secmeli','bread','["ekmek","süt","su","elma"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-vocab-1-2','coktan_secmeli','cheese','["çorba","su","peynir","muz"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-vocab-1-3','coktan_secmeli','milk','["süt","ekmek","pirinç","salata"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-vocab-1-4','coktan_secmeli','water','["peynir","ekmek","su","yumurta"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-vocab-2-1','coktan_secmeli','bread Benzer bağlamı düşün.','["süt","ekmek","su","elma"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-vocab-2-2','coktan_secmeli','cheese Benzer bağlamı düşün.','["çorba","su","muz","peynir"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-vocab-2-3','coktan_secmeli','milk Benzer bağlamı düşün.','["ekmek","süt","pirinç","salata"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-vocab-2-4','coktan_secmeli','water Benzer bağlamı düşün.','["peynir","ekmek","yumurta","su"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-vocab-3-1','coktan_secmeli','bread Benzer bağlamı düşün.','["süt","su","ekmek","elma"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-vocab-3-2','coktan_secmeli','cheese Benzer bağlamı düşün.','["peynir","çorba","su","muz"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-vocab-3-3','coktan_secmeli','milk Benzer bağlamı düşün.','["ekmek","pirinç","süt","salata"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-vocab-3-4','coktan_secmeli','water Benzer bağlamı düşün.','["su","peynir","ekmek","yumurta"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-food-pref','Food Preferences','Food Preferences','Food Preferences ile ilgili temel iletişim kalıpları.','',200,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-food'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-pref-1-1','coktan_secmeli','“I like apples.”','["Elmayı severim.","Elmayı sevmem.","Elma yok.","Elma pişiririm."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-pref-1-2','coktan_secmeli','“I don''t like milk.”','["Sütü severim.","Süt içerim zorunlu.","Sütü sevmem.","Süt yok."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-pref-1-3','coktan_secmeli','Which is a drink?','["water","bread","cheese","rice"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-pref-1-4','coktan_secmeli','Which is food?','["water","juice","bread","tea"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-pref-2-1','coktan_secmeli','“I like apples.” Benzer bağlamı düşün.','["Elmayı sevmem.","Elmayı severim.","Elma yok.","Elma pişiririm."]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,21,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-pref-2-2','coktan_secmeli','“I don''t like milk.” Benzer bağlamı düşün.','["Sütü severim.","Süt içerim zorunlu.","Süt yok.","Sütü sevmem."]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,22,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-pref-2-3','coktan_secmeli','Which is a drink? Benzer bağlamı düşün.','["bread","water","cheese","rice"]',1,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,23,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-pref-2-4','coktan_secmeli','Which is food? Benzer bağlamı düşün.','["water","juice","tea","bread"]',3,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,24,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-pref-3-1','coktan_secmeli','“I like apples.” Benzer bağlamı düşün.','["Elmayı sevmem.","Elma yok.","Elmayı severim.","Elma pişiririm."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,41,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-pref-3-2','coktan_secmeli','“I don''t like milk.” Benzer bağlamı düşün.','["Sütü sevmem.","Sütü severim.","Süt içerim zorunlu.","Süt yok."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,42,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-pref-3-3','coktan_secmeli','Which is a drink? Benzer bağlamı düşün.','["bread","cheese","water","rice"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,43,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-pref-3-4','coktan_secmeli','Which is food? Benzer bağlamı düşün.','["bread","water","juice","tea"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',2,44,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

