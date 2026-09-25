SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tt8-problem','Problem Belirleme ve İnovatif Fikir','Problem Belirleme ve İnovatif Fikir','Problem Belirleme ve İnovatif Fikir becerilerini kullanıcı, güvenlik ve sürdürülebilirlik odaklı uygular.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tt8-inovasyon'
WHERE d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-1-1','coktan_secmeli','Tasarım sürecinin ilk adımlarından biri nedir?','["İhtiyaç veya problemi belirlemek","Rastgele üretime başlamak","Sadece renk seçmek","Ürünü satışa çıkarmak"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-problem' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-1-2','coktan_secmeli','İyi tanımlanmış problem ne sağlar?','["Tasarımı gereksiz yapar.","Kullanıcıyı gizler.","Çözüm geliştirmeyi kolaylaştırır.","Maliyeti sıfırlar."]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-problem' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-1-3','coktan_secmeli','Beyin fırtınasında ilk aşamada çok sayıda fikir üretmek yararlı mıdır?','["Evet","Hayır","Tek fikir yeter","Fikirler hemen elenmelidir"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-problem' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-1-4','coktan_secmeli','İnovasyon yalnız tamamen yeni ürün icat etmek midir?','["Evet","Sadece patent almak demektir","Hayır, mevcut ürün veya süreci geliştirmek de olabilir.","Sadece reklamdır"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-problem' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-1-5','coktan_secmeli','Kullanıcının ihtiyacını gözlemlemek tasarıma katkı sağlar mı?','["Evet","Hayır","Kullanıcı önemli değildir","Sadece tasarımcı fikri önemlidir"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-problem' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-1-6','coktan_secmeli','Tasarım kısıtları zaman, maliyet ve malzeme gibi etkenleri içerebilir mi?','["Hayır","Kısıt olmaz","Evet","Sadece renk kısıttır"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-problem' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tt8-fikri-hak','Fikrî Haklar, Patent ve Tasarım Tescili','Fikrî Haklar, Patent ve Tasarım Tescili','Fikrî Haklar, Patent ve Tasarım Tescili becerilerini kullanıcı, güvenlik ve sürdürülebilirlik odaklı uygular.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tt8-inovasyon'
WHERE d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-2-1','coktan_secmeli','Patent neyi korumaya yönelik bir hak türüdür?','["Sadece şiirleri","Sadece şirket adlarını","Sadece resimleri","Buluşları"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-fikri-hak' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-2-2','coktan_secmeli','Marka tescili neyi korumaya yardım eder?','["Sadece teknik buluşu","Mal veya hizmetleri ayırt eden işaretleri","Sadece bina planını","Sadece ders notunu"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-fikri-hak' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-2-3','coktan_secmeli','Endüstriyel tasarım tescili ürünün hangi yönüyle ilgilidir?','["Sadece kimyasal yapısıyla","Sadece satış fiyatıyla","Sadece üretim adediyle","Görsel tasarım özellikleriyle"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-fikri-hak' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-2-4','coktan_secmeli','Başkasının tasarımını izinsiz kopyalamak etik midir?','["Evet","Hayır","Sadece internetteyse","Kaynak yoksa"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-fikri-hak' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-2-5','coktan_secmeli','Kaynak belirtmek fikrî emeğe saygının parçası mıdır?','["Hayır","Sadece öğretmenler için","Kaynak gereksizdir","Evet"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-fikri-hak' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-2-6','coktan_secmeli','Fikrî haklar üreticiyi ve yeniliği teşvik edebilir mi?','["Hayır","Evet","Yeniliği her zaman engeller","Sadece tüketiciyle ilgilidir"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-fikri-hak' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tt8-cad','Bilgisayar Destekli Tasarım','Bilgisayar Destekli Tasarım','Bilgisayar Destekli Tasarım becerilerini kullanıcı, güvenlik ve sürdürülebilirlik odaklı uygular.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tt8-bilgisayar'
WHERE d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-3-1','coktan_secmeli','CAD kısaltması neyle ilişkilidir?','["Sadece muhasebe","Telefon görüşmesi","Bilgisayar destekli tasarım","Müzik kaydı"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-cad' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-3-2','coktan_secmeli','3B modelleme ürünün farklı açılardan incelenmesini sağlar mı?','["Evet","Hayır","Sadece metin üretir","Sadece ses verir"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-cad' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-3-3','coktan_secmeli','Ölçülendirme teknik çizimde önemli midir?','["Hayır","Sadece renk önemlidir","Evet","Boyut belirtilmez"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-cad' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-3-4','coktan_secmeli','Dijital model üretim öncesi hataları fark etmeye yardım edebilir mi?','["Evet","Hayır","Hataları gizler","Üretim sonrası kullanılır sadece"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-cad' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-3-5','coktan_secmeli','Teknik çizimde ölçek kullanılabilir mi?','["Hayır","Sadece haritada","Evet","Tasarımda ölçek yoktur"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-cad' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-3-6','coktan_secmeli','Dosya sürümlerini düzenli kaydetmek tasarım sürecinde yararlı mıdır?','["Evet","Hayır","Eski sürüm gereksizdir","Dosya kaydedilmez"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-cad' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tt8-akilli','Akıllı Ürünler ve Sensör Mantığı','Akıllı Ürünler ve Sensör Mantığı','Akıllı Ürünler ve Sensör Mantığı becerilerini kullanıcı, güvenlik ve sürdürülebilirlik odaklı uygular.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tt8-bilgisayar'
WHERE d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-4-1','coktan_secmeli','Sensör ne yapar?','["Sadece enerji üretir","Çevreden veri algılar.","Sadece görüntü çizer","Sadece depolama yapar"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-akilli' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-4-2','coktan_secmeli','Akıllı üründe kontrol birimi sensör verisini işleyebilir mi?','["Hayır","Sadece kablo yapar","Veri kullanılmaz","Evet"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-akilli' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-4-3','coktan_secmeli','Hareket sensörlü lamba neye göre açılabilir?','["Sadece saate zorunlu","Algılanan harekete","Renge","Kullanıcının boyuna"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-akilli' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-4-4','coktan_secmeli','Akıllı ürün tasarımında gizlilik önemli midir?','["Hayır","Veri her zaman paylaşılmalıdır","Gizlilik tasarımla ilgisizdir","Evet"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-akilli' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-4-5','coktan_secmeli','Sensör verisi yanlışsa ürünün kararı etkilenebilir mi?','["Hayır","Evet","Sensör sonucu önemli değildir","Akıllı ürün veri kullanmaz"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-akilli' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-4-6','coktan_secmeli','Akıllı sistemlerde kullanıcıya manuel kontrol seçeneği yararlı olabilir mi?','["Hayır","Kullanıcı kontrol etmemelidir","Sadece üretici kullanır","Evet"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-akilli' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tt8-hedef','Hedef Kitle ve Ürün Konumlandırma','Hedef Kitle ve Ürün Konumlandırma','Hedef Kitle ve Ürün Konumlandırma becerilerini kullanıcı, güvenlik ve sürdürülebilirlik odaklı uygular.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tt8-tanitim'
WHERE d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-5-1','coktan_secmeli','Hedef kitle neyi ifade eder?','["Ürünün ulaşmak istediği kullanıcı grubunu","Sadece üretim ekibini","Rakip firmayı","Sadece satıcıyı"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-hedef' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-5-2','coktan_secmeli','Aynı ürün her kullanıcı için aynı ihtiyaçları karşılar mı?','["Her zaman","Kullanıcı farkı yoktur","Her zaman değil","Sadece renk değişir"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-hedef' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-5-3','coktan_secmeli','Kullanıcı araştırması ürün kararlarını geliştirebilir mi?','["Evet","Hayır","Sadece reklam için","Ürünü etkilemez"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-hedef' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-5-4','coktan_secmeli','Ürünün faydasını açık anlatmak konumlandırmaya yardım eder mi?','["Hayır","Sadece fiyat yazılır","Evet","Fayda önemli değildir"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-hedef' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-5-5','coktan_secmeli','Hedef kitle belirlerken yaş, kullanım ortamı ve ihtiyaçlar dikkate alınabilir mi?','["Evet","Hayır","Sadece isim","Sadece şehir"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-hedef' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-5-6','coktan_secmeli','Kullanıcı geri bildirimi ürün geliştirmeye katkı sağlar mı?','["Hayır","Ürün hiç değişmez","Evet","Geri bildirim gereksizdir"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-hedef' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tt8-pazarlama','Tanıtım, Marka ve Pazarlama','Tanıtım, Marka ve Pazarlama','Tanıtım, Marka ve Pazarlama becerilerini kullanıcı, güvenlik ve sürdürülebilirlik odaklı uygular.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tt8-tanitim'
WHERE d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-6-1','coktan_secmeli','Marka kimliği hangi ögeleri içerebilir?','["Sadece fiyat","Sadece üretim makinesi","Sadece depo","İsim, logo ve görsel dil"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-pazarlama' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-6-2','coktan_secmeli','Tanıtım mesajı ürünün gerçek özellikleriyle uyumlu olmalı mıdır?','["Hayır","Evet","Abartı her zaman uygundur","Gerçek bilgi gerekmez"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-pazarlama' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-6-3','coktan_secmeli','Pazarlamada etik neyi gerektirir?','["Rakibi karalamayı","Gerçeği gizlemeyi","Sahte yorum üretmeyi","Yanıltıcı bilgi vermemeyi"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-pazarlama' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-6-4','coktan_secmeli','Ürünün ambalajı iletişim aracı olabilir mi?','["Hayır","Evet","Sadece koruma sağlar","Yazı içeremez"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-pazarlama' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-6-5','coktan_secmeli','Farklı tanıtım kanalları farklı hedef kitlelere ulaşabilir mi?','["Hayır","Tek kanal vardır","Hedef kitle önemli değildir","Evet"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-pazarlama' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-6-6','coktan_secmeli','Müşteri geri bildirimi marka güvenini etkileyebilir mi?','["Hayır","Evet","Güven sadece logoya bağlıdır","Geri bildirim okunmaz"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-pazarlama' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tt8-gorsel-dil','Görsel İletişim İlkeleri','Görsel İletişim İlkeleri','Görsel İletişim İlkeleri becerilerini kullanıcı, güvenlik ve sürdürülebilirlik odaklı uygular.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tt8-gorsel'
WHERE d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-7-1','coktan_secmeli','Kontrast ne sağlar?','["Her şeyi aynı gösterir","Sadece ses verir","Ögeler arasında fark ve vurgu","Metni siler"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-gorsel-dil' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-7-2','coktan_secmeli','Hiyerarşi görsel tasarımda ne işe yarar?','["Bilginin önem sırasını göstermeye","Renkleri kaldırmaya","Dosyayı küçültmeye","Sadece kenarlık oluşturmaya"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-gorsel-dil' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-7-3','coktan_secmeli','Okunabilirlik için yazı boyutu ve zemin kontrastı önemli midir?','["Hayır","Sadece font adı","Evet","Metin görünmese de olur"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-gorsel-dil' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-7-4','coktan_secmeli','Boşluk kullanımı tasarımın anlaşılmasını kolaylaştırabilir mi?','["Evet","Hayır","Her yer doldurulmalıdır","Boşluk hata demektir"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-gorsel-dil' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-7-5','coktan_secmeli','Renklerin anlamı bağlama ve kültüre göre değişebilir mi?','["Hayır","Her yerde aynıdır","Evet","Rengin anlamı yoktur"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-gorsel-dil' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-7-6','coktan_secmeli','Görsel iletişimde tutarlılık kullanıcı deneyimini destekler mi?','["Evet","Hayır","Her sayfa tamamen farklı olmalı","Tutarlılık sıkıcı olduğu için yanlıştır"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-gorsel-dil' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tt8-afis','Afiş, Logo ve Dijital Sunum','Afiş, Logo ve Dijital Sunum','Afiş, Logo ve Dijital Sunum becerilerini kullanıcı, güvenlik ve sürdürülebilirlik odaklı uygular.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tt8-gorsel'
WHERE d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-8-1','coktan_secmeli','Afişte ana mesaj kısa ve görünür olmalı mıdır?','["Hayır","Evet","Sadece uzun paragraf","Mesaj gizli olmalıdır"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-afis' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-8-2','coktan_secmeli','Logo karmaşık olmak zorunda mıdır?','["Evet","Ne kadar ayrıntılı o kadar iyi","Sadece fotoğraf olmalıdır","Hayır"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-afis' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-8-3','coktan_secmeli','Dijital sunumda her slayta çok fazla metin koymak uygun mudur?','["Evet her zaman","Genellikle hayır","Yazı okunmasa da olur","Görsel kullanılmamalı"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-afis' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-8-4','coktan_secmeli','Afişte hedef kitleye uygun dil seçilmeli midir?','["Hayır","Herkese aynı ton zorunlu","Dil önemli değildir","Evet"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-afis' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-8-5','coktan_secmeli','Telifli görseller izinsiz kullanılmamalı mıdır?','["Hayır","Evet","İnternetteki her görsel serbesttir","Kaynak gereksizdir"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-afis' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-8-6','coktan_secmeli','Bir tasarım farklı ekran boyutlarında okunabilir olmalı mıdır?','["Hayır","Sadece tek cihaz","Mobil önemli değildir","Evet"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-afis' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tt8-prototip','Prototip ve Test','Prototip ve Test','Prototip ve Test becerilerini kullanıcı, güvenlik ve sürdürülebilirlik odaklı uygular.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tt8-urun'
WHERE d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-9-1','coktan_secmeli','Prototip nedir?','["Ürünün test amaçlı erken örneği","Bitmiş satış ürünü zorunlu","Sadece reklam","Patent belgesi"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-prototip' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-9-2','coktan_secmeli','Prototip neden test edilir?','["Ürünü değiştirmemek için","Sadece fotoğraf çekmek için","Sorunları ve geliştirme alanlarını görmek için","Fiyatı artırmak için"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-prototip' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-9-3','coktan_secmeli','Kâğıt model de prototip olabilir mi?','["Evet","Hayır","Sadece elektronik prototip olur","Sadece 3B yazıcı gerekir"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-prototip' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-9-4','coktan_secmeli','Test sonucunda tasarım değiştirilebilir mi?','["Hayır","İlk tasarım değişmez","Evet","Test sadece onay içindir"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-prototip' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-9-5','coktan_secmeli','Farklı kullanıcılarla test yapmak yararlı mıdır?','["Evet","Hayır","Tek kişi yeter her zaman","Kullanıcı testi gereksizdir"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-prototip' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-9-6','coktan_secmeli','Başarısız prototip süreç için tamamen değersiz midir?','["Evet","Hemen atılmalıdır","Hayır; öğrenme sağlar.","Test sonucu kullanılmaz"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-prototip' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tt8-ergonomi','Ergonomi, Malzeme ve Kullanıcı Deneyimi','Ergonomi, Malzeme ve Kullanıcı Deneyimi','Ergonomi, Malzeme ve Kullanıcı Deneyimi becerilerini kullanıcı, güvenlik ve sürdürülebilirlik odaklı uygular.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tt8-urun'
WHERE d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-10-1','coktan_secmeli','Ergonomi neyle ilgilidir?','["Sadece fiyatına","Sadece rengine","Sadece reklamına","Ürünün insana uygun, rahat ve güvenli kullanımına"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-ergonomi' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-10-2','coktan_secmeli','Bir sandalye tasarımında oturma yüksekliği ergonomiyi etkiler mi?','["Hayır","Evet","Sadece renk","Sandalye ölçüsü önemsizdir"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-ergonomi' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-10-3','coktan_secmeli','Malzeme seçerken dayanıklılık ve kullanım koşulları düşünülmeli midir?','["Hayır","Sadece görünüş","Malzeme fark etmez","Evet"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-ergonomi' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-10-4','coktan_secmeli','Keskin kenarları azaltmak ürün güvenliğini artırabilir mi?','["Hayır","Evet","Sadece estetik","Güvenlikle ilgisiz"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-ergonomi' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-10-5','coktan_secmeli','Kullanıcı deneyimi ürünün kolay anlaşılmasıyla ilişkili midir?','["Hayır","Sadece ambalaj","Kullanıcı öğrenmek zorundadır","Evet"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-ergonomi' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-10-6','coktan_secmeli','Sürdürülebilir malzeme seçimi çevresel etkiyi azaltabilir mi?','["Hayır","Evet","Malzeme çevreyi etkilemez","Sadece fiyatı etkiler"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-ergonomi' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tt8-enerji-donusum','Enerji Dönüşümü ve Verimlilik','Enerji Dönüşümü ve Verimlilik','Enerji Dönüşümü ve Verimlilik becerilerini kullanıcı, güvenlik ve sürdürülebilirlik odaklı uygular.','',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tt8-enerji'
WHERE d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-11-1','coktan_secmeli','Güneş paneli hangi enerjiyi elektriğe dönüştürür?','["Sadece ses","Kimyasal enerjiyi zorunlu","Güneş ışınım enerjisini","Kütleyi"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-enerji-donusum' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-11-2','coktan_secmeli','Elektrik motoru elektrik enerjisini neye dönüştürür?','["Hareket enerjisine","Sadece ışığa","Maddeye","Yerçekimine"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-enerji-donusum' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-11-3','coktan_secmeli','Enerji dönüşümünde verim neden önemlidir?','["Enerji üretmek için","Kütleyi değiştirmek için","Kayıpları azaltmak için","Sadece fiyat için"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-enerji-donusum' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-11-4','coktan_secmeli','Yalıtım enerji tüketimini azaltabilir mi?','["Evet","Hayır","Sadece sesi artırır","Enerjiyle ilgisiz"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-enerji-donusum' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-11-5','coktan_secmeli','LED aydınlatma aynı ışık için daha az enerji tüketebilir mi?','["Hayır","Her zaman daha çok tüketir","Evet","Işık vermez"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-enerji-donusum' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-11-6','coktan_secmeli','Tasarımda enerji kaynağının güvenliği düşünülmeli midir?','["Evet","Hayır","Sadece güç önemli","Güvenlik sonradan eklenir"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-enerji-donusum' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tt8-yenilenebilir','Yenilenebilir Enerji Tasarımları','Yenilenebilir Enerji Tasarımları','Yenilenebilir Enerji Tasarımları becerilerini kullanıcı, güvenlik ve sürdürülebilirlik odaklı uygular.','',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tt8-enerji'
WHERE d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-12-1','coktan_secmeli','Güneş enerjisi yenilenebilir kaynak mıdır?','["Hayır","Evet","Fosil yakıttır","Nükleer yakıttır"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-yenilenebilir' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-12-2','coktan_secmeli','Rüzgâr türbini ne üretmek için kullanılabilir?','["Sadece su","Sadece ısı zorunlu","Petrol","Elektrik enerjisi"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-yenilenebilir' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-12-3','coktan_secmeli','Yenilenebilir enerji sistemi tasarlarken yerel koşullar önemli midir?','["Hayır","Evet","Her yer aynıdır","Sadece renk önemlidir"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-yenilenebilir' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-12-4','coktan_secmeli','Güneş panelinin yönü ve gölgelenmesi performansı etkileyebilir mi?','["Hayır","Panel her durumda aynı","Sadece sıcaklık etkiler","Evet"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-yenilenebilir' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-12-5','coktan_secmeli','Enerji depolama yenilenebilir kaynakların değişken üretimini dengelemeye yardım edebilir mi?','["Hayır","Evet","Depolama gereksiz","Enerji saklanamaz hiçbir biçimde"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-yenilenebilir' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-12-6','coktan_secmeli','Yenilenebilir enerji de çevresel etkiler açısından değerlendirilmelidir mi?','["Hayır","Hiç etkisi olmaz","Değerlendirme gereksizdir","Evet"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-yenilenebilir' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tt8-erisilebilirlik','Erişilebilirlik ve Evrensel Tasarım','Erişilebilirlik ve Evrensel Tasarım','Erişilebilirlik ve Evrensel Tasarım becerilerini kullanıcı, güvenlik ve sürdürülebilirlik odaklı uygular.','',130,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tt8-engelsiz'
WHERE d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-13-1','coktan_secmeli','Evrensel tasarımın amacı nedir?','["Mümkün olduğunca çok kişinin ürünü kullanabilmesini sağlamak","Sadece tek kullanıcıya uygunluk","Sadece estetik","Sadece düşük maliyet"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-erisilebilirlik' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-13-2','coktan_secmeli','Rampa hareket kısıtlılığı olan bireyler için erişilebilirliği artırabilir mi?','["Hayır","Sadece bisiklet için","Evet","Erişilebilirlikle ilgisiz"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-erisilebilirlik' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-13-3','coktan_secmeli','Yüksek kontrast görme güçlüğü yaşayan bazı kullanıcılar için yararlı olabilir mi?','["Evet","Hayır","Kontrast her zaman azaltılmalı","Sadece baskıda"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-erisilebilirlik' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-13-4','coktan_secmeli','Altyazı işitme güçlüğü yaşayan kullanıcıların videoya erişimini artırabilir mi?','["Hayır","Sadece yabancı dil için","Evet","Sesle ilgisiz"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-erisilebilirlik' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-13-5','coktan_secmeli','Erişilebilirlik sonradan eklenen bir özellik olmak zorunda mıdır?','["Hayır; baştan tasarlanabilir.","Evet her zaman","Ürün bittikten sonra düşünülür","Erişilebilirlik tasarım değildir"]',0,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-erisilebilirlik' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-13-6','coktan_secmeli','Kullanıcı çeşitliliğini testlere dahil etmek yararlı mıdır?','["Hayır","Tek kullanıcı yeter","Evet","Farklı ihtiyaçlar önemli değildir"]',2,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-erisilebilirlik' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tt8-yardimci','Yardımcı Teknolojiler ve Engelsiz Ürün','Yardımcı Teknolojiler ve Engelsiz Ürün','Yardımcı Teknolojiler ve Engelsiz Ürün becerilerini kullanıcı, güvenlik ve sürdürülebilirlik odaklı uygular.','',140,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tt8-engelsiz'
WHERE d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-14-1','coktan_secmeli','Ekran okuyucu neye yardımcı olur?','["Ekranı büyütmeden kapatmaya","Sadece oyun oynamaya","Sadece yazıcıya","Görsel arayüzdeki metin ve ögeleri sesli/erişilebilir biçimde sunmaya"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-yardimci' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-14-2','coktan_secmeli','Protez veya yardımcı cihazlar günlük yaşam bağımsızlığını artırabilir mi?','["Hayır","Evet","Sadece spor içindir","Bağımsızlığı azaltır"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-yardimci' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-14-3','coktan_secmeli','Sesle kontrol hareket kısıtlılığı olan bazı kullanıcılar için yararlı olabilir mi?','["Hayır","Sadece müzik içindir","Kontrol sağlamaz","Evet"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-yardimci' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-14-4','coktan_secmeli','Yardımcı teknoloji tasarımında kişiselleştirme önemli olabilir mi?','["Hayır","Evet","Herkesin ihtiyacı aynıdır","Ayarlanabilirlik gereksizdir"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-yardimci' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-14-5','coktan_secmeli','Kullanıcı mahremiyeti yardımcı teknolojilerde de korunmalı mıdır?','["Hayır","Sağlık/kişisel veri serbestçe paylaşılır","Mahremiyet yoktur","Evet"]',3,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-yardimci' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8tt-14-6','coktan_secmeli','Engelsiz ürün tasarımında kullanıcıyla birlikte geliştirme yapmak yararlı mıdır?','["Hayır","Evet","Kullanıcı görüşü alınmamalı","Sadece tasarımcı karar verir"]',1,'Tasarım problemi kullanıcı ihtiyacı, güvenlik, etik ve sürdürülebilirlik açısından değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tt8-yardimci' AND (d.kod='teknoloji_tasarim' OR d.ad='Teknoloji ve Tasarım')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

