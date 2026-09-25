SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-selam','Selamlaşma, Dua ve Dinî İfadeler','Selamlaşma, Dua ve Dinî İfadeler','Selamlaşma, Dua ve Dinî İfadeler konusunu temel kavram ve değerlerle açıklar.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-ifadeler'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-sukur','Şükür, Sabır ve Güzel Söz','Şükür, Sabır ve Güzel Söz','Şükür, Sabır ve Güzel Söz konusunu temel kavram ve değerlerle açıklar.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-ifadeler'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-esas','İslam''ın Temel Esasları','İslam''ın Temel Esasları','İslam''ın Temel Esasları konusunu temel kavram ve değerlerle açıklar.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-islam'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-kuran','Kur''an-ı Kerim ve İbadet','Kur''an-ı Kerim ve İbadet','Kur''an-ı Kerim ve İbadet konusunu temel kavram ve değerlerle açıklar.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-islam'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-deger','Sevgi, Saygı, Doğruluk ve Yardımlaşma','Sevgi, Saygı, Doğruluk ve Yardımlaşma','Sevgi, Saygı, Doğruluk ve Yardımlaşma konusunu temel kavram ve değerlerle açıklar.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-ahlak'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-sorumluluk','Sorumluluk ve Kul Hakkı Bilinci','Sorumluluk ve Kul Hakkı Bilinci','Sorumluluk ve Kul Hakkı Bilinci konusunu temel kavram ve değerlerle açıklar.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-ahlak'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-hayat','Hz. Muhammed''in Hayatı','Hz. Muhammed''in Hayatı','Hz. Muhammed''in Hayatı konusunu temel kavram ve değerlerle açıklar.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-hz-muhammed'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-ornek','Hz. Muhammed''in Örnek Davranışları','Hz. Muhammed''in Örnek Davranışları','Hz. Muhammed''in Örnek Davranışları konusunu temel kavram ve değerlerle açıklar.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-hz-muhammed'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-beden','Beden ve Çevre Temizliği','Beden ve Çevre Temizliği','Beden ve Çevre Temizliği konusunu temel kavram ve değerlerle açıklar.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-temizlik'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-ibadet-temiz','İbadet ve Temizlik İlişkisi','İbadet ve Temizlik İlişkisi','İbadet ve Temizlik İlişkisi konusunu temel kavram ve değerlerle açıklar.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-temizlik'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-1','coktan_secmeli','“Selamün aleyküm” ifadesi ne amaçla kullanılır?','["Selamlaşma","Vedalaşma zorunlu","Alışveriş","Saat sorma"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-selam' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-2','coktan_secmeli','Dua neyi ifade eder?','["Sadece şarkıyı","Alışverişi","İnsanın Allah''a yönelmesini","Oyun kuralını"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-selam' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-3','coktan_secmeli','“İnşallah” hangi anlamla kullanılır?','["Allah dilerse","Teşekkür","Hoş geldin","Güle güle"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-selam' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-4','coktan_secmeli','“Maşallah” güzel bir durum karşısında kullanılabilir mi?','["Hayır","Sadece vedada","Evet","Sadece yemekte"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-selam' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-5','coktan_secmeli','Şükür ne demektir?','["Nimetlerin kıymetini bilip teşekkür etmek","İsraf etmek","Kaba davranmak","Şikâyet etmek"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sukur' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-6','coktan_secmeli','Sabır neyi gerektirir?','["Hemen vazgeçmek","Kırıcı olmak","Zorluklarda direnç ve ölçülü davranış","Hile yapmak"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sukur' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-7','coktan_secmeli','Güzel söz söylemek neden önemlidir?','["İyi iletişim ve saygıyı destekler.","Kavgayı artırır.","İsraf oluşturur.","Kuralları bozar."]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sukur' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-8','coktan_secmeli','Nimetleri israf etmemek şükürle ilişkilendirilebilir mi?','["Hayır","Sadece para için","Evet","İsraf iyidir"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sukur' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-9','coktan_secmeli','İslam dininin kutsal kitabı?','["Kur''an-ı Kerim","Tevrat","İncil","Zebur"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-esas' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-10','coktan_secmeli','Müslümanların inandığı tek ilah?','["Bir insan","Bir yıldız","Allah","Bir nesne"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-esas' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-11','coktan_secmeli','Peygamberler ne için gönderilmiştir?','["İnsanlara doğru yolu bildirmek için","Sadece ticaret için","Sadece savaş için","Sadece bilim deneyi için"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-esas' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-12','coktan_secmeli','İbadet neyi ifade eder?','["Sadece oyun","Sadece alışveriş","Allah''a kulluk ve bağlılık davranışlarını","Sadece spor"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-esas' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-13','coktan_secmeli','Kur''an-ı Kerim kime vahyedilmiştir?','["Hz. Muhammed''e","Hz. Musa''ya","Hz. İsa''ya","Hz. Nuh''a"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-kuran' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-14','coktan_secmeli','Kur''an surelerden oluşur mu?','["Hayır","Sadece tek cümle","Evet","Sadece şiir"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-kuran' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-15','coktan_secmeli','Kur''an''a saygılı davranmak önemli midir?','["Evet","Hayır","Sadece yetişkinler için","Sadece camide"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-kuran' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-16','coktan_secmeli','İbadetlerde niyet önemli midir?','["Hayır","Sadece şekil önemlidir","Evet","Niyet yoktur"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-kuran' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-17','coktan_secmeli','Doğruluk güzel ahlak mıdır?','["Evet","Hayır","Sadece okul kuralı","Sadece yetişkinlere"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-18','coktan_secmeli','Yardımlaşma neyi güçlendirir?','["Dışlamayı","Kabalığı","Toplumsal dayanışmayı","İsrafı"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-19','coktan_secmeli','Saygı kimlere gösterilmelidir?','["İnsanlara ve haklara","Sadece tanıdıklara","Sadece büyüklere","Kimseye"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-20','coktan_secmeli','Emaneti korumak hangi değerle ilişkilidir?','["İsraf","Kabalık","Güvenilirlik","Tembellik"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-21','coktan_secmeli','Başkasının hakkını gözetmek önemli midir?','["Evet","Hayır","Sadece kendi hakkımız","Hak yoktur"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sorumluluk' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-22','coktan_secmeli','Verilen görevi yapmak neyi gösterir?','["İsraf","Hile","Sorumluluk","Kabalık"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sorumluluk' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-23','coktan_secmeli','Hata yaptığında özür dilemek güzel davranış mıdır?','["Evet","Hayır","Sadece çocuklar","Özür gereksiz"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sorumluluk' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-24','coktan_secmeli','Adil olmak neyi gerektirir?','["Kayırmayı","Hileyi","Hakkaniyetli davranmayı","Dışlamayı"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sorumluluk' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-25','coktan_secmeli','Hz. Muhammed nerede doğmuştur?','["Mekke''de","Medine''de","Kudüs''te","İstanbul''da"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-hayat' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-26','coktan_secmeli','Hz. Muhammed''in annesinin adı?','["Hatice","Fatma","Âmine","Meryem"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-hayat' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-27','coktan_secmeli','Hz. Muhammed''in babasının adı?','["Abdullah","Ali","Ömer","Bilal"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,27,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-hayat' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-28','coktan_secmeli','Hz. Muhammed hangi şehirden Medine''ye hicret etmiştir?','["Taif''ten","Kudüs''ten","Mekke''den","Şam''dan"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,28,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-hayat' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-29','coktan_secmeli','Hz. Muhammed''in güvenilirliğini anlatan sıfat?','["el-Emin","el-Kebir","el-Malik","el-Katip"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,29,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ornek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-30','coktan_secmeli','Merhametli davranmak onun örnek davranışlarından mıdır?','["Hayır","Sadece savaşta","Evet","Merhamet önemsiz"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,30,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ornek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-31','coktan_secmeli','İstişare etmek ne demektir?','["Danışmak","Tek başına karar dayatmak","Kavga etmek","Susmak"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,31,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ornek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-32','coktan_secmeli','Doğruluk Hz. Muhammed''in örnekliğinde önemli midir?','["Hayır","Sadece ticarette","Evet","Sadece ailede"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,32,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ornek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-33','coktan_secmeli','Temizlik sağlık için önemli midir?','["Evet","Hayır","Sadece görüntü için","Sadece okulda"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,33,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-beden' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-34','coktan_secmeli','Elleri yıkamak hangi temizliğe örnektir?','["Çevre kirliliği","İsraf","Beden temizliği","Trafik"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,34,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-beden' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-35','coktan_secmeli','Çevreyi temiz tutmak dinî ve ahlaki sorumlulukla ilişkilendirilebilir mi?','["Evet","Hayır","Sadece belediyenin işi","Çevre önemli değil"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,35,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-beden' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-36','coktan_secmeli','İsraf etmemek çevre temizliğini destekler mi?','["Hayır","İsraf iyidir","Evet","Sadece su için"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,36,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-beden' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-37','coktan_secmeli','Abdest neyle ilişkilidir?','["İbadet öncesi temizlik","Alışveriş","Trafik","Spor"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,37,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ibadet-temiz' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-38','coktan_secmeli','Namazda temizliğe önem verilir mi?','["Hayır","Sadece kıyafet rengi","Evet","Temizlik gerekmez"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,38,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ibadet-temiz' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-39','coktan_secmeli','Temiz elbise ibadet adabıyla ilişkilidir mi?','["Evet","Hayır","Sadece bayramda","Sadece okulda"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,39,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ibadet-temiz' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-40','coktan_secmeli','Manevi temizlik hangi davranışlarla desteklenebilir?','["Yalan söylemekle","Haksızlıkla","Kötü davranışlardan kaçınmakla","Kabalıkla"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,40,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ibadet-temiz' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-1','coktan_secmeli','“Selamün aleyküm” ifadesi ne amaçla kullanılır? Kavramı günlük yaşamla ilişkilendir.','["Vedalaşma zorunlu","Selamlaşma","Alışveriş","Saat sorma"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,101,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-selam' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-2','coktan_secmeli','Dua neyi ifade eder? Kavramı günlük yaşamla ilişkilendir.','["Sadece şarkıyı","Alışverişi","Oyun kuralını","İnsanın Allah''a yönelmesini"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,102,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-selam' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-3','coktan_secmeli','“İnşallah” hangi anlamla kullanılır? Kavramı günlük yaşamla ilişkilendir.','["Teşekkür","Allah dilerse","Hoş geldin","Güle güle"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,103,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-selam' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-4','coktan_secmeli','“Maşallah” güzel bir durum karşısında kullanılabilir mi? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Sadece vedada","Sadece yemekte","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,104,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-selam' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-5','coktan_secmeli','Şükür ne demektir? Kavramı günlük yaşamla ilişkilendir.','["İsraf etmek","Nimetlerin kıymetini bilip teşekkür etmek","Kaba davranmak","Şikâyet etmek"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,105,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sukur' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-6','coktan_secmeli','Sabır neyi gerektirir? Kavramı günlük yaşamla ilişkilendir.','["Hemen vazgeçmek","Kırıcı olmak","Hile yapmak","Zorluklarda direnç ve ölçülü davranış"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,106,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sukur' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-7','coktan_secmeli','Güzel söz söylemek neden önemlidir? Kavramı günlük yaşamla ilişkilendir.','["Kavgayı artırır.","İyi iletişim ve saygıyı destekler.","İsraf oluşturur.","Kuralları bozar."]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,107,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sukur' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-8','coktan_secmeli','Nimetleri israf etmemek şükürle ilişkilendirilebilir mi? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Sadece para için","İsraf iyidir","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,108,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sukur' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-9','coktan_secmeli','İslam dininin kutsal kitabı? Kavramı günlük yaşamla ilişkilendir.','["Tevrat","Kur''an-ı Kerim","İncil","Zebur"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,109,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-esas' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-10','coktan_secmeli','Müslümanların inandığı tek ilah? Kavramı günlük yaşamla ilişkilendir.','["Bir insan","Bir yıldız","Bir nesne","Allah"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,110,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-esas' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-11','coktan_secmeli','Peygamberler ne için gönderilmiştir? Kavramı günlük yaşamla ilişkilendir.','["Sadece ticaret için","İnsanlara doğru yolu bildirmek için","Sadece savaş için","Sadece bilim deneyi için"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,111,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-esas' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-12','coktan_secmeli','İbadet neyi ifade eder? Kavramı günlük yaşamla ilişkilendir.','["Sadece oyun","Sadece alışveriş","Sadece spor","Allah''a kulluk ve bağlılık davranışlarını"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,112,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-esas' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-13','coktan_secmeli','Kur''an-ı Kerim kime vahyedilmiştir? Kavramı günlük yaşamla ilişkilendir.','["Hz. Musa''ya","Hz. Muhammed''e","Hz. İsa''ya","Hz. Nuh''a"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,113,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-kuran' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-14','coktan_secmeli','Kur''an surelerden oluşur mu? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Sadece tek cümle","Sadece şiir","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,114,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-kuran' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-15','coktan_secmeli','Kur''an''a saygılı davranmak önemli midir? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Evet","Sadece yetişkinler için","Sadece camide"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,115,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-kuran' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-16','coktan_secmeli','İbadetlerde niyet önemli midir? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Sadece şekil önemlidir","Niyet yoktur","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,116,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-kuran' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-17','coktan_secmeli','Doğruluk güzel ahlak mıdır? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Evet","Sadece okul kuralı","Sadece yetişkinlere"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,117,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-18','coktan_secmeli','Yardımlaşma neyi güçlendirir? Kavramı günlük yaşamla ilişkilendir.','["Dışlamayı","Kabalığı","İsrafı","Toplumsal dayanışmayı"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,118,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-19','coktan_secmeli','Saygı kimlere gösterilmelidir? Kavramı günlük yaşamla ilişkilendir.','["Sadece tanıdıklara","İnsanlara ve haklara","Sadece büyüklere","Kimseye"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,119,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-20','coktan_secmeli','Emaneti korumak hangi değerle ilişkilidir? Kavramı günlük yaşamla ilişkilendir.','["İsraf","Kabalık","Tembellik","Güvenilirlik"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,120,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-21','coktan_secmeli','Başkasının hakkını gözetmek önemli midir? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Evet","Sadece kendi hakkımız","Hak yoktur"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,121,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sorumluluk' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-22','coktan_secmeli','Verilen görevi yapmak neyi gösterir? Kavramı günlük yaşamla ilişkilendir.','["İsraf","Hile","Kabalık","Sorumluluk"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,122,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sorumluluk' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-23','coktan_secmeli','Hata yaptığında özür dilemek güzel davranış mıdır? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Evet","Sadece çocuklar","Özür gereksiz"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,123,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sorumluluk' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-24','coktan_secmeli','Adil olmak neyi gerektirir? Kavramı günlük yaşamla ilişkilendir.','["Kayırmayı","Hileyi","Dışlamayı","Hakkaniyetli davranmayı"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,124,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sorumluluk' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-25','coktan_secmeli','Hz. Muhammed nerede doğmuştur? Kavramı günlük yaşamla ilişkilendir.','["Medine''de","Mekke''de","Kudüs''te","İstanbul''da"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,125,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-hayat' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-26','coktan_secmeli','Hz. Muhammed''in annesinin adı? Kavramı günlük yaşamla ilişkilendir.','["Hatice","Fatma","Meryem","Âmine"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,126,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-hayat' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-27','coktan_secmeli','Hz. Muhammed''in babasının adı? Kavramı günlük yaşamla ilişkilendir.','["Ali","Abdullah","Ömer","Bilal"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,127,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-hayat' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-28','coktan_secmeli','Hz. Muhammed hangi şehirden Medine''ye hicret etmiştir? Kavramı günlük yaşamla ilişkilendir.','["Taif''ten","Kudüs''ten","Şam''dan","Mekke''den"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,128,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-hayat' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-29','coktan_secmeli','Hz. Muhammed''in güvenilirliğini anlatan sıfat? Kavramı günlük yaşamla ilişkilendir.','["el-Kebir","el-Emin","el-Malik","el-Katip"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,129,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ornek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-30','coktan_secmeli','Merhametli davranmak onun örnek davranışlarından mıdır? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Sadece savaşta","Merhamet önemsiz","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,130,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ornek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-31','coktan_secmeli','İstişare etmek ne demektir? Kavramı günlük yaşamla ilişkilendir.','["Tek başına karar dayatmak","Danışmak","Kavga etmek","Susmak"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,131,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ornek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-32','coktan_secmeli','Doğruluk Hz. Muhammed''in örnekliğinde önemli midir? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Sadece ticarette","Sadece ailede","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,132,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ornek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-33','coktan_secmeli','Temizlik sağlık için önemli midir? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Evet","Sadece görüntü için","Sadece okulda"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,133,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-beden' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-34','coktan_secmeli','Elleri yıkamak hangi temizliğe örnektir? Kavramı günlük yaşamla ilişkilendir.','["Çevre kirliliği","İsraf","Trafik","Beden temizliği"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,134,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-beden' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-35','coktan_secmeli','Çevreyi temiz tutmak dinî ve ahlaki sorumlulukla ilişkilendirilebilir mi? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Evet","Sadece belediyenin işi","Çevre önemli değil"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,135,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-beden' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-36','coktan_secmeli','İsraf etmemek çevre temizliğini destekler mi? Kavramı günlük yaşamla ilişkilendir.','["Hayır","İsraf iyidir","Sadece su için","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,136,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-beden' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-37','coktan_secmeli','Abdest neyle ilişkilidir? Kavramı günlük yaşamla ilişkilendir.','["Alışveriş","İbadet öncesi temizlik","Trafik","Spor"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,137,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ibadet-temiz' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-38','coktan_secmeli','Namazda temizliğe önem verilir mi? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Sadece kıyafet rengi","Temizlik gerekmez","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,138,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ibadet-temiz' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-39','coktan_secmeli','Temiz elbise ibadet adabıyla ilişkilidir mi? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Evet","Sadece bayramda","Sadece okulda"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,139,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ibadet-temiz' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-2-40','coktan_secmeli','Manevi temizlik hangi davranışlarla desteklenebilir? Kavramı günlük yaşamla ilişkilendir.','["Yalan söylemekle","Haksızlıkla","Kabalıkla","Kötü davranışlardan kaçınmakla"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,140,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ibadet-temiz' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-1','coktan_secmeli','“Selamün aleyküm” ifadesi ne amaçla kullanılır? Kavramı günlük yaşamla ilişkilendir.','["Vedalaşma zorunlu","Alışveriş","Selamlaşma","Saat sorma"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,201,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-selam' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-2','coktan_secmeli','Dua neyi ifade eder? Kavramı günlük yaşamla ilişkilendir.','["İnsanın Allah''a yönelmesini","Sadece şarkıyı","Alışverişi","Oyun kuralını"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,202,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-selam' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-3','coktan_secmeli','“İnşallah” hangi anlamla kullanılır? Kavramı günlük yaşamla ilişkilendir.','["Teşekkür","Hoş geldin","Allah dilerse","Güle güle"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,203,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-selam' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-4','coktan_secmeli','“Maşallah” güzel bir durum karşısında kullanılabilir mi? Kavramı günlük yaşamla ilişkilendir.','["Evet","Hayır","Sadece vedada","Sadece yemekte"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,204,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-selam' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-5','coktan_secmeli','Şükür ne demektir? Kavramı günlük yaşamla ilişkilendir.','["İsraf etmek","Kaba davranmak","Nimetlerin kıymetini bilip teşekkür etmek","Şikâyet etmek"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,205,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sukur' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-6','coktan_secmeli','Sabır neyi gerektirir? Kavramı günlük yaşamla ilişkilendir.','["Zorluklarda direnç ve ölçülü davranış","Hemen vazgeçmek","Kırıcı olmak","Hile yapmak"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,206,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sukur' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-7','coktan_secmeli','Güzel söz söylemek neden önemlidir? Kavramı günlük yaşamla ilişkilendir.','["Kavgayı artırır.","İsraf oluşturur.","İyi iletişim ve saygıyı destekler.","Kuralları bozar."]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,207,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sukur' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-8','coktan_secmeli','Nimetleri israf etmemek şükürle ilişkilendirilebilir mi? Kavramı günlük yaşamla ilişkilendir.','["Evet","Hayır","Sadece para için","İsraf iyidir"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,208,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sukur' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-9','coktan_secmeli','İslam dininin kutsal kitabı? Kavramı günlük yaşamla ilişkilendir.','["Tevrat","İncil","Kur''an-ı Kerim","Zebur"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,209,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-esas' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-10','coktan_secmeli','Müslümanların inandığı tek ilah? Kavramı günlük yaşamla ilişkilendir.','["Allah","Bir insan","Bir yıldız","Bir nesne"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,210,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-esas' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-11','coktan_secmeli','Peygamberler ne için gönderilmiştir? Kavramı günlük yaşamla ilişkilendir.','["Sadece ticaret için","Sadece savaş için","İnsanlara doğru yolu bildirmek için","Sadece bilim deneyi için"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,211,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-esas' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-12','coktan_secmeli','İbadet neyi ifade eder? Kavramı günlük yaşamla ilişkilendir.','["Allah''a kulluk ve bağlılık davranışlarını","Sadece oyun","Sadece alışveriş","Sadece spor"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,212,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-esas' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-13','coktan_secmeli','Kur''an-ı Kerim kime vahyedilmiştir? Kavramı günlük yaşamla ilişkilendir.','["Hz. Musa''ya","Hz. İsa''ya","Hz. Muhammed''e","Hz. Nuh''a"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,213,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-kuran' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-14','coktan_secmeli','Kur''an surelerden oluşur mu? Kavramı günlük yaşamla ilişkilendir.','["Evet","Hayır","Sadece tek cümle","Sadece şiir"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,214,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-kuran' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-15','coktan_secmeli','Kur''an''a saygılı davranmak önemli midir? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Sadece yetişkinler için","Evet","Sadece camide"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,215,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-kuran' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-16','coktan_secmeli','İbadetlerde niyet önemli midir? Kavramı günlük yaşamla ilişkilendir.','["Evet","Hayır","Sadece şekil önemlidir","Niyet yoktur"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,216,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-kuran' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-17','coktan_secmeli','Doğruluk güzel ahlak mıdır? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Sadece okul kuralı","Evet","Sadece yetişkinlere"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,217,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-18','coktan_secmeli','Yardımlaşma neyi güçlendirir? Kavramı günlük yaşamla ilişkilendir.','["Toplumsal dayanışmayı","Dışlamayı","Kabalığı","İsrafı"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,218,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-19','coktan_secmeli','Saygı kimlere gösterilmelidir? Kavramı günlük yaşamla ilişkilendir.','["Sadece tanıdıklara","Sadece büyüklere","İnsanlara ve haklara","Kimseye"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,219,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-20','coktan_secmeli','Emaneti korumak hangi değerle ilişkilidir? Kavramı günlük yaşamla ilişkilendir.','["Güvenilirlik","İsraf","Kabalık","Tembellik"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,220,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-21','coktan_secmeli','Başkasının hakkını gözetmek önemli midir? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Sadece kendi hakkımız","Evet","Hak yoktur"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,221,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sorumluluk' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-22','coktan_secmeli','Verilen görevi yapmak neyi gösterir? Kavramı günlük yaşamla ilişkilendir.','["Sorumluluk","İsraf","Hile","Kabalık"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,222,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sorumluluk' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-23','coktan_secmeli','Hata yaptığında özür dilemek güzel davranış mıdır? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Sadece çocuklar","Evet","Özür gereksiz"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,223,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sorumluluk' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-24','coktan_secmeli','Adil olmak neyi gerektirir? Kavramı günlük yaşamla ilişkilendir.','["Hakkaniyetli davranmayı","Kayırmayı","Hileyi","Dışlamayı"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,224,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sorumluluk' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-25','coktan_secmeli','Hz. Muhammed nerede doğmuştur? Kavramı günlük yaşamla ilişkilendir.','["Medine''de","Kudüs''te","Mekke''de","İstanbul''da"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,225,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-hayat' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-26','coktan_secmeli','Hz. Muhammed''in annesinin adı? Kavramı günlük yaşamla ilişkilendir.','["Âmine","Hatice","Fatma","Meryem"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,226,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-hayat' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-27','coktan_secmeli','Hz. Muhammed''in babasının adı? Kavramı günlük yaşamla ilişkilendir.','["Ali","Ömer","Abdullah","Bilal"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,227,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-hayat' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-28','coktan_secmeli','Hz. Muhammed hangi şehirden Medine''ye hicret etmiştir? Kavramı günlük yaşamla ilişkilendir.','["Mekke''den","Taif''ten","Kudüs''ten","Şam''dan"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,228,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-hayat' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-29','coktan_secmeli','Hz. Muhammed''in güvenilirliğini anlatan sıfat? Kavramı günlük yaşamla ilişkilendir.','["el-Kebir","el-Malik","el-Emin","el-Katip"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,229,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ornek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-30','coktan_secmeli','Merhametli davranmak onun örnek davranışlarından mıdır? Kavramı günlük yaşamla ilişkilendir.','["Evet","Hayır","Sadece savaşta","Merhamet önemsiz"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,230,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ornek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-31','coktan_secmeli','İstişare etmek ne demektir? Kavramı günlük yaşamla ilişkilendir.','["Tek başına karar dayatmak","Kavga etmek","Danışmak","Susmak"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,231,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ornek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-32','coktan_secmeli','Doğruluk Hz. Muhammed''in örnekliğinde önemli midir? Kavramı günlük yaşamla ilişkilendir.','["Evet","Hayır","Sadece ticarette","Sadece ailede"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,232,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ornek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-33','coktan_secmeli','Temizlik sağlık için önemli midir? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Sadece görüntü için","Evet","Sadece okulda"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,233,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-beden' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-34','coktan_secmeli','Elleri yıkamak hangi temizliğe örnektir? Kavramı günlük yaşamla ilişkilendir.','["Beden temizliği","Çevre kirliliği","İsraf","Trafik"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,234,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-beden' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-35','coktan_secmeli','Çevreyi temiz tutmak dinî ve ahlaki sorumlulukla ilişkilendirilebilir mi? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Sadece belediyenin işi","Evet","Çevre önemli değil"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,235,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-beden' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-36','coktan_secmeli','İsraf etmemek çevre temizliğini destekler mi? Kavramı günlük yaşamla ilişkilendir.','["Evet","Hayır","İsraf iyidir","Sadece su için"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,236,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-beden' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-37','coktan_secmeli','Abdest neyle ilişkilidir? Kavramı günlük yaşamla ilişkilendir.','["Alışveriş","Trafik","İbadet öncesi temizlik","Spor"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,237,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ibadet-temiz' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-38','coktan_secmeli','Namazda temizliğe önem verilir mi? Kavramı günlük yaşamla ilişkilendir.','["Evet","Hayır","Sadece kıyafet rengi","Temizlik gerekmez"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,238,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ibadet-temiz' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-39','coktan_secmeli','Temiz elbise ibadet adabıyla ilişkilidir mi? Kavramı günlük yaşamla ilişkilendir.','["Hayır","Sadece bayramda","Evet","Sadece okulda"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,239,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ibadet-temiz' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-3-40','coktan_secmeli','Manevi temizlik hangi davranışlarla desteklenebilir? Kavramı günlük yaşamla ilişkilendir.','["Kötü davranışlardan kaçınmakla","Yalan söylemekle","Haksızlıkla","Kabalıkla"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,240,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ibadet-temiz' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

