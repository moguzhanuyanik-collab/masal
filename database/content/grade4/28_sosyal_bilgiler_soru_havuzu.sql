SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-kimlik','Resmî Kimlik ve Bireysel Özellikler','Resmî Kimlik ve Bireysel Özellikler','Resmî Kimlik ve Bireysel Özellikler ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-birey'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-1-1','coktan_secmeli','Resmî kimlik belgesinde hangisi bulunabilir?','["Ad-soyad ve doğum bilgisi","Sınav notu","En sevdiği renk","Hobisi zorunlu"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-1-2','coktan_secmeli','Bireysel farklılıklar saygıyla karşılanmalı mı?','["Hayır","Sadece okulda","Evet","Sadece yetişkinlerde"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-1-3','coktan_secmeli','İlgi ve yetenek aynı şey midir?','["Her zaman değil","Her zaman aynıdır","İkisi de kimlik numarasıdır","İkisi de adres"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-1-4','coktan_secmeli','Empati ne demektir?','["Başkalarını dışlamak","Sadece kendi fikrini düşünmek","Kendini başkasının yerine koymaya çalışmak","Kural bozmak"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-2-1','coktan_secmeli','Resmî kimlik belgesinde hangisi bulunabilir? Günlük yaşam örneğini düşün.','["Sınav notu","Ad-soyad ve doğum bilgisi","En sevdiği renk","Hobisi zorunlu"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-2-2','coktan_secmeli','Bireysel farklılıklar saygıyla karşılanmalı mı? Günlük yaşam örneğini düşün.','["Hayır","Sadece okulda","Sadece yetişkinlerde","Evet"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-2-3','coktan_secmeli','İlgi ve yetenek aynı şey midir? Günlük yaşam örneğini düşün.','["Her zaman aynıdır","Her zaman değil","İkisi de kimlik numarasıdır","İkisi de adres"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-2-4','coktan_secmeli','Empati ne demektir? Günlük yaşam örneğini düşün.','["Başkalarını dışlamak","Sadece kendi fikrini düşünmek","Kural bozmak","Kendini başkasının yerine koymaya çalışmak"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-3-1','coktan_secmeli','Resmî kimlik belgesinde hangisi bulunabilir? En uygun açıklamayı seç.','["Sınav notu","En sevdiği renk","Ad-soyad ve doğum bilgisi","Hobisi zorunlu"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-3-2','coktan_secmeli','Bireysel farklılıklar saygıyla karşılanmalı mı? En uygun açıklamayı seç.','["Evet","Hayır","Sadece okulda","Sadece yetişkinlerde"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-3-3','coktan_secmeli','İlgi ve yetenek aynı şey midir? En uygun açıklamayı seç.','["Her zaman aynıdır","İkisi de kimlik numarasıdır","Her zaman değil","İkisi de adres"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-3-4','coktan_secmeli','Empati ne demektir? En uygun açıklamayı seç.','["Kendini başkasının yerine koymaya çalışmak","Başkalarını dışlamak","Sadece kendi fikrini düşünmek","Kural bozmak"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-kronoloji','Kendi Yaşamımda Kronoloji','Kendi Yaşamımda Kronoloji','Kendi Yaşamımda Kronoloji ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-birey'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-1-1','coktan_secmeli','Kronoloji neyi anlatır?','["Olayların zaman sırasını","Yerini","Rengini","Fiyatını"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-1-2','coktan_secmeli','Doğum ve okula başlama olayları nasıl sıralanır?','["Renge göre","Boyuta göre","Zamana göre","Rastgele"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-1-3','coktan_secmeli','Zaman şeridi ne işe yarar?','["Olayları sırayla göstermeye","Kütle ölçmeye","Yön bulmaya","Para saymaya"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-1-4','coktan_secmeli','Tarih bilgisi kronolojide önemli midir?','["Hayır","Sadece haritada","Evet","Sadece grafikte"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-2-1','coktan_secmeli','Kronoloji neyi anlatır? Günlük yaşam örneğini düşün.','["Yerini","Olayların zaman sırasını","Rengini","Fiyatını"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-2-2','coktan_secmeli','Doğum ve okula başlama olayları nasıl sıralanır? Günlük yaşam örneğini düşün.','["Renge göre","Boyuta göre","Rastgele","Zamana göre"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-2-3','coktan_secmeli','Zaman şeridi ne işe yarar? Günlük yaşam örneğini düşün.','["Kütle ölçmeye","Olayları sırayla göstermeye","Yön bulmaya","Para saymaya"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-2-4','coktan_secmeli','Tarih bilgisi kronolojide önemli midir? Günlük yaşam örneğini düşün.','["Hayır","Sadece haritada","Sadece grafikte","Evet"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-3-1','coktan_secmeli','Kronoloji neyi anlatır? En uygun açıklamayı seç.','["Yerini","Rengini","Olayların zaman sırasını","Fiyatını"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-3-2','coktan_secmeli','Doğum ve okula başlama olayları nasıl sıralanır? En uygun açıklamayı seç.','["Zamana göre","Renge göre","Boyuta göre","Rastgele"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-3-3','coktan_secmeli','Zaman şeridi ne işe yarar? En uygun açıklamayı seç.','["Kütle ölçmeye","Yön bulmaya","Olayları sırayla göstermeye","Para saymaya"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-3-4','coktan_secmeli','Tarih bilgisi kronolojide önemli midir? En uygun açıklamayı seç.','["Evet","Hayır","Sadece haritada","Sadece grafikte"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-aile-tarih','Aile Tarihi ve Kültür','Aile Tarihi ve Kültür','Aile Tarihi ve Kültür ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-kultur'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-1-1','coktan_secmeli','Aile geçmişini öğrenmede hangi kaynak yardımcı olabilir?','["Aile büyükleri ve eski fotoğraflar","Sadece reklamlar","Rastgele söylentiler","Oyun puanı"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-1-2','coktan_secmeli','Sözlü tarih çalışması neyi kullanabilir?','["Sadece cetvel","Terazi","Görüşme","Hesap makinesi"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-1-3','coktan_secmeli','Kültürel ögeye örnek?','["Geleneksel yemek","Şifre","Trafik ışığı","Pilin kutbu"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-1-4','coktan_secmeli','Aile yadigârları geçmiş hakkında bilgi verebilir mi?','["Hayır","Sadece para değeri vardır","Evet","Sadece yeniyse"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-2-1','coktan_secmeli','Aile geçmişini öğrenmede hangi kaynak yardımcı olabilir? Günlük yaşam örneğini düşün.','["Sadece reklamlar","Aile büyükleri ve eski fotoğraflar","Rastgele söylentiler","Oyun puanı"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-2-2','coktan_secmeli','Sözlü tarih çalışması neyi kullanabilir? Günlük yaşam örneğini düşün.','["Sadece cetvel","Terazi","Hesap makinesi","Görüşme"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-2-3','coktan_secmeli','Kültürel ögeye örnek? Günlük yaşam örneğini düşün.','["Şifre","Geleneksel yemek","Trafik ışığı","Pilin kutbu"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-2-4','coktan_secmeli','Aile yadigârları geçmiş hakkında bilgi verebilir mi? Günlük yaşam örneğini düşün.','["Hayır","Sadece para değeri vardır","Sadece yeniyse","Evet"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-3-1','coktan_secmeli','Aile geçmişini öğrenmede hangi kaynak yardımcı olabilir? En uygun açıklamayı seç.','["Sadece reklamlar","Rastgele söylentiler","Aile büyükleri ve eski fotoğraflar","Oyun puanı"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-3-2','coktan_secmeli','Sözlü tarih çalışması neyi kullanabilir? En uygun açıklamayı seç.','["Görüşme","Sadece cetvel","Terazi","Hesap makinesi"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-3-3','coktan_secmeli','Kültürel ögeye örnek? En uygun açıklamayı seç.','["Şifre","Trafik ışığı","Geleneksel yemek","Pilin kutbu"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-3-4','coktan_secmeli','Aile yadigârları geçmiş hakkında bilgi verebilir mi? En uygun açıklamayı seç.','["Evet","Hayır","Sadece para değeri vardır","Sadece yeniyse"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-mucadele','Millî Mücadele ve Kahramanlar','Millî Mücadele ve Kahramanlar','Millî Mücadele ve Kahramanlar ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-kultur'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-1-1','coktan_secmeli','Mustafa Kemal Atatürk Millî Mücadele''nin lideridir. Doğru mu?','["Evet","Hayır","Sadece bir yazar","Bir şehir adı"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-1-2','coktan_secmeli','Millî Mücadele''nin amacı neydi?','["Yeni oyuncak üretmek","Ticaret yapmak","Bağımsızlığı ve vatanı savunmak","Sadece eğitim gezisi"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-1-3','coktan_secmeli','Kahramanlık hikâyeleri neyi anlamaya yardım eder?','["Dönemin mücadele ve fedakârlıklarını","Hava durumunu","Matematik işlemini","Elektrik devresini"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-1-4','coktan_secmeli','Tarihî olaylar kaynaklarla incelenmeli midir?','["Hayır","Sadece söylenti yeter","Evet","Kaynak gerekmez"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-2-1','coktan_secmeli','Mustafa Kemal Atatürk Millî Mücadele''nin lideridir. Doğru mu? Günlük yaşam örneğini düşün.','["Hayır","Evet","Sadece bir yazar","Bir şehir adı"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-2-2','coktan_secmeli','Millî Mücadele''nin amacı neydi? Günlük yaşam örneğini düşün.','["Yeni oyuncak üretmek","Ticaret yapmak","Sadece eğitim gezisi","Bağımsızlığı ve vatanı savunmak"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-2-3','coktan_secmeli','Kahramanlık hikâyeleri neyi anlamaya yardım eder? Günlük yaşam örneğini düşün.','["Hava durumunu","Dönemin mücadele ve fedakârlıklarını","Matematik işlemini","Elektrik devresini"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-2-4','coktan_secmeli','Tarihî olaylar kaynaklarla incelenmeli midir? Günlük yaşam örneğini düşün.','["Hayır","Sadece söylenti yeter","Kaynak gerekmez","Evet"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-3-1','coktan_secmeli','Mustafa Kemal Atatürk Millî Mücadele''nin lideridir. Doğru mu? En uygun açıklamayı seç.','["Hayır","Sadece bir yazar","Evet","Bir şehir adı"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-3-2','coktan_secmeli','Millî Mücadele''nin amacı neydi? En uygun açıklamayı seç.','["Bağımsızlığı ve vatanı savunmak","Yeni oyuncak üretmek","Ticaret yapmak","Sadece eğitim gezisi"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-3-3','coktan_secmeli','Kahramanlık hikâyeleri neyi anlamaya yardım eder? En uygun açıklamayı seç.','["Hava durumunu","Matematik işlemini","Dönemin mücadele ve fedakârlıklarını","Elektrik devresini"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-3-4','coktan_secmeli','Tarihî olaylar kaynaklarla incelenmeli midir? En uygun açıklamayı seç.','["Evet","Hayır","Sadece söylenti yeter","Kaynak gerekmez"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-yon','Yön, Kroki ve Konum','Yön, Kroki ve Konum','Yön, Kroki ve Konum ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-cevre'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-1-1','coktan_secmeli','Ana yönlerden biri?','["Kuzey","Yukarı","Sağ","Ön"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-1-2','coktan_secmeli','Güneş genel olarak hangi yönden doğar?','["Batı","Kuzey","Doğu","Güney"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-1-3','coktan_secmeli','Kroki neyi gösterir?','["Yerlerin birbirine göre konumunu","Kütleyi","Sıcaklığı","Yaşı"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-1-4','coktan_secmeli','Pusula ne için kullanılabilir?','["Kütle ölçmek","Ses ölçmek","Yön bulmak","Para saymak"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-2-1','coktan_secmeli','Ana yönlerden biri? Günlük yaşam örneğini düşün.','["Yukarı","Kuzey","Sağ","Ön"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-2-2','coktan_secmeli','Güneş genel olarak hangi yönden doğar? Günlük yaşam örneğini düşün.','["Batı","Kuzey","Güney","Doğu"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-2-3','coktan_secmeli','Kroki neyi gösterir? Günlük yaşam örneğini düşün.','["Kütleyi","Yerlerin birbirine göre konumunu","Sıcaklığı","Yaşı"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-2-4','coktan_secmeli','Pusula ne için kullanılabilir? Günlük yaşam örneğini düşün.','["Kütle ölçmek","Ses ölçmek","Para saymak","Yön bulmak"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-3-1','coktan_secmeli','Ana yönlerden biri? En uygun açıklamayı seç.','["Yukarı","Sağ","Kuzey","Ön"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-3-2','coktan_secmeli','Güneş genel olarak hangi yönden doğar? En uygun açıklamayı seç.','["Doğu","Batı","Kuzey","Güney"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-3-3','coktan_secmeli','Kroki neyi gösterir? En uygun açıklamayı seç.','["Kütleyi","Sıcaklığı","Yerlerin birbirine göre konumunu","Yaşı"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-3-4','coktan_secmeli','Pusula ne için kullanılabilir? En uygun açıklamayı seç.','["Yön bulmak","Kütle ölçmek","Ses ölçmek","Para saymak"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-dogal-beseri','Doğal ve Beşerî Unsurlar','Doğal ve Beşerî Unsurlar','Doğal ve Beşerî Unsurlar ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-cevre'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-1-1','coktan_secmeli','Dağ doğal unsur mudur?','["Evet","Hayır","Sadece beşerî","Teknolojik"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-1-2','coktan_secmeli','Köprü beşerî unsur mudur?','["Hayır","Doğal dağdır","Evet","Canlıdır"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-1-3','coktan_secmeli','İklim insanların yaşamını etkileyebilir mi?','["Evet","Hayır","Sadece hayvanları","Sadece bitkileri"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-1-4','coktan_secmeli','Doğal afetlere karşı hazırlık önemli midir?','["Hayır","Afet engellenir her zaman","Evet","Sadece yetişkinlere"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-2-1','coktan_secmeli','Dağ doğal unsur mudur? Günlük yaşam örneğini düşün.','["Hayır","Evet","Sadece beşerî","Teknolojik"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-2-2','coktan_secmeli','Köprü beşerî unsur mudur? Günlük yaşam örneğini düşün.','["Hayır","Doğal dağdır","Canlıdır","Evet"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-2-3','coktan_secmeli','İklim insanların yaşamını etkileyebilir mi? Günlük yaşam örneğini düşün.','["Hayır","Evet","Sadece hayvanları","Sadece bitkileri"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-2-4','coktan_secmeli','Doğal afetlere karşı hazırlık önemli midir? Günlük yaşam örneğini düşün.','["Hayır","Afet engellenir her zaman","Sadece yetişkinlere","Evet"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-3-1','coktan_secmeli','Dağ doğal unsur mudur? En uygun açıklamayı seç.','["Hayır","Sadece beşerî","Evet","Teknolojik"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-3-2','coktan_secmeli','Köprü beşerî unsur mudur? En uygun açıklamayı seç.','["Evet","Hayır","Doğal dağdır","Canlıdır"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-3-3','coktan_secmeli','İklim insanların yaşamını etkileyebilir mi? En uygun açıklamayı seç.','["Hayır","Sadece hayvanları","Evet","Sadece bitkileri"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-3-4','coktan_secmeli','Doğal afetlere karşı hazırlık önemli midir? En uygun açıklamayı seç.','["Evet","Hayır","Afet engellenir her zaman","Sadece yetişkinlere"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-teknoloji','Teknolojik Ürünlerin Değişimi','Teknolojik Ürünlerin Değişimi','Teknolojik Ürünlerin Değişimi ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-bilim'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-1-1','coktan_secmeli','Teknolojik ürünler zamanla değişebilir mi?','["Evet","Hayır","Her zaman aynı","Sadece renk değişir"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-1-2','coktan_secmeli','İcat nedir?','["Sadece keşfedilmiş doğa olayı","Tarih yazma","Yeni bir araç veya yöntem geliştirme","Harita çizme"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-1-3','coktan_secmeli','Telefonların geçmişten bugüne değişimi neyi gösterir?','["Teknolojik gelişimi","Kültürün yok olduğunu","Doğanın değişmediğini","Matematik kuralını"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-1-4','coktan_secmeli','Teknoloji ihtiyaçlardan etkilenebilir mi?','["Hayır","Sadece tesadüf","Evet","İhtiyaçla ilgisiz"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-2-1','coktan_secmeli','Teknolojik ürünler zamanla değişebilir mi? Günlük yaşam örneğini düşün.','["Hayır","Evet","Her zaman aynı","Sadece renk değişir"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-2-2','coktan_secmeli','İcat nedir? Günlük yaşam örneğini düşün.','["Sadece keşfedilmiş doğa olayı","Tarih yazma","Harita çizme","Yeni bir araç veya yöntem geliştirme"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-2-3','coktan_secmeli','Telefonların geçmişten bugüne değişimi neyi gösterir? Günlük yaşam örneğini düşün.','["Kültürün yok olduğunu","Teknolojik gelişimi","Doğanın değişmediğini","Matematik kuralını"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-2-4','coktan_secmeli','Teknoloji ihtiyaçlardan etkilenebilir mi? Günlük yaşam örneğini düşün.','["Hayır","Sadece tesadüf","İhtiyaçla ilgisiz","Evet"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-3-1','coktan_secmeli','Teknolojik ürünler zamanla değişebilir mi? En uygun açıklamayı seç.','["Hayır","Her zaman aynı","Evet","Sadece renk değişir"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-3-2','coktan_secmeli','İcat nedir? En uygun açıklamayı seç.','["Yeni bir araç veya yöntem geliştirme","Sadece keşfedilmiş doğa olayı","Tarih yazma","Harita çizme"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-3-3','coktan_secmeli','Telefonların geçmişten bugüne değişimi neyi gösterir? En uygun açıklamayı seç.','["Kültürün yok olduğunu","Doğanın değişmediğini","Teknolojik gelişimi","Matematik kuralını"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-3-4','coktan_secmeli','Teknoloji ihtiyaçlardan etkilenebilir mi? En uygun açıklamayı seç.','["Evet","Hayır","Sadece tesadüf","İhtiyaçla ilgisiz"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-guvenli-teknoloji','Güvenli ve Sorumlu Teknoloji Kullanımı','Güvenli ve Sorumlu Teknoloji Kullanımı','Güvenli ve Sorumlu Teknoloji Kullanımı ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-bilim'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-1-1','coktan_secmeli','Kişisel şifre paylaşılmalı mı?','["Hayır","Evet herkesle","Sosyal medyada","Tanımadıklarla"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-1-2','coktan_secmeli','İnternette bilgi doğrulanmalı mı?','["Hayır","Her şey doğrudur","Evet","Sadece resimler"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-1-3','coktan_secmeli','Ekran süresinde denge önemli midir?','["Evet","Hayır","Sınırsız olmalı","Uyku yerine geçer"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-1-4','coktan_secmeli','Siber zorbalıkta ne yapılmalı?','["Aynısını yapmak","Gizlemek","Güvenilir yetişkine bildirmek","Şifre paylaşmak"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-2-1','coktan_secmeli','Kişisel şifre paylaşılmalı mı? Günlük yaşam örneğini düşün.','["Evet herkesle","Hayır","Sosyal medyada","Tanımadıklarla"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-2-2','coktan_secmeli','İnternette bilgi doğrulanmalı mı? Günlük yaşam örneğini düşün.','["Hayır","Her şey doğrudur","Sadece resimler","Evet"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-2-3','coktan_secmeli','Ekran süresinde denge önemli midir? Günlük yaşam örneğini düşün.','["Hayır","Evet","Sınırsız olmalı","Uyku yerine geçer"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-2-4','coktan_secmeli','Siber zorbalıkta ne yapılmalı? Günlük yaşam örneğini düşün.','["Aynısını yapmak","Gizlemek","Şifre paylaşmak","Güvenilir yetişkine bildirmek"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-3-1','coktan_secmeli','Kişisel şifre paylaşılmalı mı? En uygun açıklamayı seç.','["Evet herkesle","Sosyal medyada","Hayır","Tanımadıklarla"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-3-2','coktan_secmeli','İnternette bilgi doğrulanmalı mı? En uygun açıklamayı seç.','["Evet","Hayır","Her şey doğrudur","Sadece resimler"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-3-3','coktan_secmeli','Ekran süresinde denge önemli midir? En uygun açıklamayı seç.','["Hayır","Sınırsız olmalı","Evet","Uyku yerine geçer"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-3-4','coktan_secmeli','Siber zorbalıkta ne yapılmalı? En uygun açıklamayı seç.','["Güvenilir yetişkine bildirmek","Aynısını yapmak","Gizlemek","Şifre paylaşmak"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-ihtiyac','İstek, İhtiyaç ve Bilinçli Tüketim','İstek, İhtiyaç ve Bilinçli Tüketim','İstek, İhtiyaç ve Bilinçli Tüketim ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-ekonomi'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-1-1','coktan_secmeli','Su temel ihtiyaç mıdır?','["Evet","Hayır","Sadece istek","Lüks"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-1-2','coktan_secmeli','Yeni bir oyuncak her zaman ihtiyaç mıdır?','["Evet","Su gibidir","Hayır","Besin gibidir"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-1-3','coktan_secmeli','Bilinçli tüketici ne yapar?','["İhtiyacını ve bütçesini değerlendirir.","Rastgele alır","Etikete bakmaz","Fiyat karşılaştırmaz"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-1-4','coktan_secmeli','Ürün etiketi neden okunur?','["Renk seçmek için","Reklam için","İçerik, tarih ve kullanım bilgisi için","Boyut büyütmek için"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-2-1','coktan_secmeli','Su temel ihtiyaç mıdır? Günlük yaşam örneğini düşün.','["Hayır","Evet","Sadece istek","Lüks"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-2-2','coktan_secmeli','Yeni bir oyuncak her zaman ihtiyaç mıdır? Günlük yaşam örneğini düşün.','["Evet","Su gibidir","Besin gibidir","Hayır"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-2-3','coktan_secmeli','Bilinçli tüketici ne yapar? Günlük yaşam örneğini düşün.','["Rastgele alır","İhtiyacını ve bütçesini değerlendirir.","Etikete bakmaz","Fiyat karşılaştırmaz"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-2-4','coktan_secmeli','Ürün etiketi neden okunur? Günlük yaşam örneğini düşün.','["Renk seçmek için","Reklam için","Boyut büyütmek için","İçerik, tarih ve kullanım bilgisi için"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-3-1','coktan_secmeli','Su temel ihtiyaç mıdır? En uygun açıklamayı seç.','["Hayır","Sadece istek","Evet","Lüks"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-3-2','coktan_secmeli','Yeni bir oyuncak her zaman ihtiyaç mıdır? En uygun açıklamayı seç.','["Hayır","Evet","Su gibidir","Besin gibidir"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-3-3','coktan_secmeli','Bilinçli tüketici ne yapar? En uygun açıklamayı seç.','["Rastgele alır","Etikete bakmaz","İhtiyacını ve bütçesini değerlendirir.","Fiyat karşılaştırmaz"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-3-4','coktan_secmeli','Ürün etiketi neden okunur? En uygun açıklamayı seç.','["İçerik, tarih ve kullanım bilgisi için","Renk seçmek için","Reklam için","Boyut büyütmek için"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-butce','Aile Bütçesi ve Tasarruf','Aile Bütçesi ve Tasarruf','Aile Bütçesi ve Tasarruf ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-ekonomi'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-1-1','coktan_secmeli','Bütçe neyi düzenler?','["Gelir ve gider planını","Hava durumunu","Ders saatini","Yönleri"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-1-2','coktan_secmeli','Tasarruf ne demektir?','["Hiç kullanmamak","İsraf etmek","Kaynakları gereksiz harcamamak","Borçlanmak"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-1-3','coktan_secmeli','Gelirden fazla gider sürdürülebilir midir?','["Genellikle hayır","Her zaman evet","Bütçeyi güçlendirir","Gider önemli değildir"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-1-4','coktan_secmeli','Harcamaları kaydetmek ne sağlar?','["Parayı otomatik çoğaltır","Fiyatı değiştirir","Bütçeyi takip etmeyi","Ürünü büyütür"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-2-1','coktan_secmeli','Bütçe neyi düzenler? Günlük yaşam örneğini düşün.','["Hava durumunu","Gelir ve gider planını","Ders saatini","Yönleri"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-2-2','coktan_secmeli','Tasarruf ne demektir? Günlük yaşam örneğini düşün.','["Hiç kullanmamak","İsraf etmek","Borçlanmak","Kaynakları gereksiz harcamamak"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-2-3','coktan_secmeli','Gelirden fazla gider sürdürülebilir midir? Günlük yaşam örneğini düşün.','["Her zaman evet","Genellikle hayır","Bütçeyi güçlendirir","Gider önemli değildir"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-2-4','coktan_secmeli','Harcamaları kaydetmek ne sağlar? Günlük yaşam örneğini düşün.','["Parayı otomatik çoğaltır","Fiyatı değiştirir","Ürünü büyütür","Bütçeyi takip etmeyi"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-3-1','coktan_secmeli','Bütçe neyi düzenler? En uygun açıklamayı seç.','["Hava durumunu","Ders saatini","Gelir ve gider planını","Yönleri"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-3-2','coktan_secmeli','Tasarruf ne demektir? En uygun açıklamayı seç.','["Kaynakları gereksiz harcamamak","Hiç kullanmamak","İsraf etmek","Borçlanmak"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-3-3','coktan_secmeli','Gelirden fazla gider sürdürülebilir midir? En uygun açıklamayı seç.','["Her zaman evet","Bütçeyi güçlendirir","Genellikle hayır","Gider önemli değildir"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-3-4','coktan_secmeli','Harcamaları kaydetmek ne sağlar? En uygun açıklamayı seç.','["Bütçeyi takip etmeyi","Parayı otomatik çoğaltır","Fiyatı değiştirir","Ürünü büyütür"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-hak','Çocuk Hakları ve Sorumluluklar','Çocuk Hakları ve Sorumluluklar','Çocuk Hakları ve Sorumluluklar ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-vatandas'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-1-1','coktan_secmeli','Eğitim çocuk hakkı mıdır?','["Evet","Hayır","Sadece ödül","Sadece yetişkin hakkı"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-1-2','coktan_secmeli','Haklarla birlikte ne bulunur?','["Sadece istekler","Hile","Sorumluluklar","İsraf"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-1-3','coktan_secmeli','Çocukların güvenli yaşama hakkı var mıdır?','["Evet","Hayır","Sadece okulda","Sadece evde"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-1-4','coktan_secmeli','Başkalarının haklarına saygı gerekli midir?','["Hayır","Sadece kendi hakkımız önemli","Evet","Kurallar gereksiz"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-2-1','coktan_secmeli','Eğitim çocuk hakkı mıdır? Günlük yaşam örneğini düşün.','["Hayır","Evet","Sadece ödül","Sadece yetişkin hakkı"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-2-2','coktan_secmeli','Haklarla birlikte ne bulunur? Günlük yaşam örneğini düşün.','["Sadece istekler","Hile","İsraf","Sorumluluklar"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-2-3','coktan_secmeli','Çocukların güvenli yaşama hakkı var mıdır? Günlük yaşam örneğini düşün.','["Hayır","Evet","Sadece okulda","Sadece evde"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-2-4','coktan_secmeli','Başkalarının haklarına saygı gerekli midir? Günlük yaşam örneğini düşün.','["Hayır","Sadece kendi hakkımız önemli","Kurallar gereksiz","Evet"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-3-1','coktan_secmeli','Eğitim çocuk hakkı mıdır? En uygun açıklamayı seç.','["Hayır","Sadece ödül","Evet","Sadece yetişkin hakkı"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-3-2','coktan_secmeli','Haklarla birlikte ne bulunur? En uygun açıklamayı seç.','["Sorumluluklar","Sadece istekler","Hile","İsraf"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-3-3','coktan_secmeli','Çocukların güvenli yaşama hakkı var mıdır? En uygun açıklamayı seç.','["Hayır","Sadece okulda","Evet","Sadece evde"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-3-4','coktan_secmeli','Başkalarının haklarına saygı gerekli midir? En uygun açıklamayı seç.','["Evet","Hayır","Sadece kendi hakkımız önemli","Kurallar gereksiz"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-kurum','Kurumlar ve Katılım','Kurumlar ve Katılım','Kurumlar ve Katılım ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-vatandas'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-1-1','coktan_secmeli','Belediye yerel hizmetlerle ilgilenebilir mi?','["Evet","Hayır","Sadece okul notları","Sadece aile kararları"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-1-2','coktan_secmeli','Muhtarlık yerel yönetim birimi midir?','["Hayır","Bir spor kulübü","Evet","Bir bilim laboratuvarı"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-1-3','coktan_secmeli','Sorunları ilgili kuruma bildirmek katılım mıdır?','["Evet","Hayır","Sadece şikâyet","Kuralsızlık"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-1-4','coktan_secmeli','Kamu kurumları ne için çalışır?','["Sadece satış için","Sadece oyun için","Toplumsal ihtiyaç ve hizmetler için","Sadece reklam için"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-2-1','coktan_secmeli','Belediye yerel hizmetlerle ilgilenebilir mi? Günlük yaşam örneğini düşün.','["Hayır","Evet","Sadece okul notları","Sadece aile kararları"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-2-2','coktan_secmeli','Muhtarlık yerel yönetim birimi midir? Günlük yaşam örneğini düşün.','["Hayır","Bir spor kulübü","Bir bilim laboratuvarı","Evet"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-2-3','coktan_secmeli','Sorunları ilgili kuruma bildirmek katılım mıdır? Günlük yaşam örneğini düşün.','["Hayır","Evet","Sadece şikâyet","Kuralsızlık"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-2-4','coktan_secmeli','Kamu kurumları ne için çalışır? Günlük yaşam örneğini düşün.','["Sadece satış için","Sadece oyun için","Sadece reklam için","Toplumsal ihtiyaç ve hizmetler için"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-3-1','coktan_secmeli','Belediye yerel hizmetlerle ilgilenebilir mi? En uygun açıklamayı seç.','["Hayır","Sadece okul notları","Evet","Sadece aile kararları"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-3-2','coktan_secmeli','Muhtarlık yerel yönetim birimi midir? En uygun açıklamayı seç.','["Evet","Hayır","Bir spor kulübü","Bir bilim laboratuvarı"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-3-3','coktan_secmeli','Sorunları ilgili kuruma bildirmek katılım mıdır? En uygun açıklamayı seç.','["Hayır","Sadece şikâyet","Evet","Kuralsızlık"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-3-4','coktan_secmeli','Kamu kurumları ne için çalışır? En uygun açıklamayı seç.','["Toplumsal ihtiyaç ve hizmetler için","Sadece satış için","Sadece oyun için","Sadece reklam için"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-ulkeler','Dünya''daki Ülkeler ve Kültürler','Dünya''daki Ülkeler ve Kültürler','Dünya''daki Ülkeler ve Kültürler ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',130,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-kuresel'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-1-1','coktan_secmeli','Farklı ülkelerin farklı kültürleri olabilir mi?','["Evet","Hayır","Hepsi aynıdır","Kültür yoktur"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-1-2','coktan_secmeli','Bir ülkenin bayrağı millî sembol müdür?','["Hayır","Sadece süs","Evet","Sadece reklam"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-1-3','coktan_secmeli','Kültürel farklılıklara nasıl yaklaşılmalı?','["Saygıyla","Alayla","Dışlayarak","Yasaklayarak"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-1-4','coktan_secmeli','Komşu ülkeleri haritada görmek ne sağlar?','["Kütleyi ölçmeye","Saati öğrenmeye","Coğrafi konumu anlamaya","Elektrik üretmeye"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-2-1','coktan_secmeli','Farklı ülkelerin farklı kültürleri olabilir mi? Günlük yaşam örneğini düşün.','["Hayır","Evet","Hepsi aynıdır","Kültür yoktur"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-2-2','coktan_secmeli','Bir ülkenin bayrağı millî sembol müdür? Günlük yaşam örneğini düşün.','["Hayır","Sadece süs","Sadece reklam","Evet"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-2-3','coktan_secmeli','Kültürel farklılıklara nasıl yaklaşılmalı? Günlük yaşam örneğini düşün.','["Alayla","Saygıyla","Dışlayarak","Yasaklayarak"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-2-4','coktan_secmeli','Komşu ülkeleri haritada görmek ne sağlar? Günlük yaşam örneğini düşün.','["Kütleyi ölçmeye","Saati öğrenmeye","Elektrik üretmeye","Coğrafi konumu anlamaya"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-3-1','coktan_secmeli','Farklı ülkelerin farklı kültürleri olabilir mi? En uygun açıklamayı seç.','["Hayır","Hepsi aynıdır","Evet","Kültür yoktur"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-3-2','coktan_secmeli','Bir ülkenin bayrağı millî sembol müdür? En uygun açıklamayı seç.','["Evet","Hayır","Sadece süs","Sadece reklam"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-3-3','coktan_secmeli','Kültürel farklılıklara nasıl yaklaşılmalı? En uygun açıklamayı seç.','["Alayla","Dışlayarak","Saygıyla","Yasaklayarak"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-3-4','coktan_secmeli','Komşu ülkeleri haritada görmek ne sağlar? En uygun açıklamayı seç.','["Coğrafi konumu anlamaya","Kütleyi ölçmeye","Saati öğrenmeye","Elektrik üretmeye"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-ortak','Küresel Sorunlar ve Dayanışma','Küresel Sorunlar ve Dayanışma','Küresel Sorunlar ve Dayanışma ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',140,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-kuresel'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-1-1','coktan_secmeli','Çevre kirliliği sınırları aşan sorun olabilir mi?','["Evet","Hayır","Sadece tek evde","Sadece okulda"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-1-2','coktan_secmeli','Afetlerde ülkeler birbirine yardım edebilir mi?','["Hayır","Yardım yasaktır","Evet","Sadece ticaret olur"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-1-3','coktan_secmeli','Dünya çocuklarının ortak ihtiyaçlarından biri?','["Güvenlik ve eğitim","Aynı oyuncak","Aynı dil","Aynı kıyafet"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-1-4','coktan_secmeli','Küresel sorunlarda iş birliği önemli midir?','["Hayır","Tek kişi yeter","Evet","Sorunlar ortak değildir"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-2-1','coktan_secmeli','Çevre kirliliği sınırları aşan sorun olabilir mi? Günlük yaşam örneğini düşün.','["Hayır","Evet","Sadece tek evde","Sadece okulda"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-2-2','coktan_secmeli','Afetlerde ülkeler birbirine yardım edebilir mi? Günlük yaşam örneğini düşün.','["Hayır","Yardım yasaktır","Sadece ticaret olur","Evet"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-2-3','coktan_secmeli','Dünya çocuklarının ortak ihtiyaçlarından biri? Günlük yaşam örneğini düşün.','["Aynı oyuncak","Güvenlik ve eğitim","Aynı dil","Aynı kıyafet"]',1,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-2-4','coktan_secmeli','Küresel sorunlarda iş birliği önemli midir? Günlük yaşam örneğini düşün.','["Hayır","Tek kişi yeter","Sorunlar ortak değildir","Evet"]',3,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-3-1','coktan_secmeli','Çevre kirliliği sınırları aşan sorun olabilir mi? En uygun açıklamayı seç.','["Hayır","Sadece tek evde","Evet","Sadece okulda"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-3-2','coktan_secmeli','Afetlerde ülkeler birbirine yardım edebilir mi? En uygun açıklamayı seç.','["Evet","Hayır","Yardım yasaktır","Sadece ticaret olur"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-3-3','coktan_secmeli','Dünya çocuklarının ortak ihtiyaçlarından biri? En uygun açıklamayı seç.','["Aynı oyuncak","Aynı dil","Güvenlik ve eğitim","Aynı kıyafet"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-3-4','coktan_secmeli','Küresel sorunlarda iş birliği önemli midir? En uygun açıklamayı seç.','["Evet","Hayır","Tek kişi yeter","Sorunlar ortak değildir"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

