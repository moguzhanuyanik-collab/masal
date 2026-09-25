SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'din8-kader-kavram','Kader, Kaza ve İrade','Kader, Kaza ve İrade','Kader, Kaza ve İrade kavramlarını anlam, değer ve günlük yaşam açısından değerlendirir.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='din8-kader'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-1-1','coktan_secmeli','Kader kavramı genel olarak neyi ifade eder?','["Allah''ın evrendeki ölçü ve düzeni bilip takdir etmesini","İnsanın hiçbir seçimi olmamasını","Sadece şansı","Sadece geçmiş olayları"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kader-kavram' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-1-2','coktan_secmeli','Kaza neyi ifade eder?','["Sadece insan planını","Sadece doğa yasasını","Takdir edilen olayların zamanı geldiğinde gerçekleşmesini","Sadece dua etmeyi"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kader-kavram' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-1-3','coktan_secmeli','İnsan irade sahibi midir?','["Evet","Hayır","Hiç seçim yapamaz","Sadece çocukken"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kader-kavram' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-1-4','coktan_secmeli','İnsanın seçimlerinden sorumlu olması irade ile ilişkili midir?','["Hayır","Sorumluluk yoktur","Evet","Sadece kader belirler"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kader-kavram' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-1-5','coktan_secmeli','Doğa yasaları evrendeki düzenle ilişkilendirilebilir mi?','["Evet","Hayır","Düzen yoktur","Sadece insanlar için"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kader-kavram' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-1-6','coktan_secmeli','Kader inancı tembelliği haklı çıkarır mı?','["Evet","Her zaman","Hayır","Çalışmak gereksizdir"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kader-kavram' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-1-7','coktan_secmeli','İnsan sonucu kontrol edemese de elinden geleni yapmakla sorumlu mudur?','["Evet","Hayır","Hiç çaba gerekmez","Sadece başkaları sorumludur"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kader-kavram' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-1-8','coktan_secmeli','Özgür irade sınırsız mıdır?','["Evet, doğa yasalarını da değiştirebilir","Hiç irade yoktur","Hayır, insanın imkân ve koşulları içinde seçim yapması söz konusudur.","Sadece yetişkinlerde vardır"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kader-kavram' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'din8-emek','Emek, Rızık, Tevekkül ve Sorumluluk','Emek, Rızık, Tevekkül ve Sorumluluk','Emek, Rızık, Tevekkül ve Sorumluluk kavramlarını anlam, değer ve günlük yaşam açısından değerlendirir.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='din8-kader'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-2-1','coktan_secmeli','Tevekkül neyi ifade eder?','["Hiç çalışmadan beklemeyi","Gerekli çabayı gösterdikten sonra Allah''a güvenmeyi","Sorumluluktan kaçmayı","Plan yapmamayı"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-emek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-2-2','coktan_secmeli','Rızık kavramı neyle ilişkilidir?','["Sadece parayla","Sadece sınav notuyla","Sadece şansla","Canlıların yararlanacağı nimet ve imkânlarla"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-emek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-2-3','coktan_secmeli','Emek vermek sorumluluk bilinciyle ilişkili midir?','["Hayır","Evet","Çalışmak gereksizdir","Sadece yetişkinler için"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-emek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-2-4','coktan_secmeli','Bir öğrenci çalışmadan “kaderimde varsa olur” derse bu tevekkül anlayışıyla uyumlu mudur?','["Evet","Tam örnektir","Çalışmak tevekküle aykırıdır","Hayır"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-emek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-2-5','coktan_secmeli','Tedbir almak tevekkülle çelişir mi?','["Evet","Hayır","Tedbir güvensizliktir","Sadece dua yeterlidir"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-emek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-2-6','coktan_secmeli','Başarı için plan ve çaba göstermek önemli midir?','["Hayır","Sadece sonuç önemlidir","Emek gereksizdir","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-emek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-2-7','coktan_secmeli','İnsan seçimlerinin sonuçlarını dikkate almalı mıdır?','["Hayır","Evet","Sonuçlar önemsizdir","Sorumluluk yoktur"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-emek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-2-8','coktan_secmeli','Sağlık için önlem almak ve tedavi olmak kader inancıyla çelişir mi?','["Evet","Tedavi yasaktır","Önlem gereksizdir","Hayır"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-emek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'din8-zekat-kavram','Zekât, Sadaka ve İnfak','Zekât, Sadaka ve İnfak','Zekât, Sadaka ve İnfak kavramlarını anlam, değer ve günlük yaşam açısından değerlendirir.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='din8-zekat'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-3-1','coktan_secmeli','Zekât İslam''da mali ibadetlerden biri midir?','["Hayır","Sadece gelenek","Evet","Sadece dua"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-zekat-kavram' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-3-2','coktan_secmeli','Sadaka yalnız para vermek midir?','["Hayır","Evet","Sadece zenginler verir","Sadece bayramda"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-zekat-kavram' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-3-3','coktan_secmeli','İnfak neyi ifade eder?','["Sadece alışveriş yapmayı","Borç almayı","Allah rızası için mal ve imkânlardan paylaşmayı","Mal biriktirmeyi"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-zekat-kavram' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-3-4','coktan_secmeli','Zekâtın toplumsal dayanışmaya katkısı olabilir mi?','["Evet","Hayır","Toplumu ayırır","Sadece bireyseldir"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-zekat-kavram' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-3-5','coktan_secmeli','Zekât için belirli mali şartlar aranır mı?','["Hayır","Herkes aynı miktarı verir","Evet","Sadece çocuklar verir"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-zekat-kavram' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-3-6','coktan_secmeli','Sadaka-i cariye kalıcı yarar sağlayan hayırlarla ilişkilendirilebilir mi?','["Evet","Hayır","Sadece bir günlük yardımdır","Hayır kavramı yoktur"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-zekat-kavram' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-3-7','coktan_secmeli','Yardımın gösteriş için yapılması ahlaki açıdan uygun mudur?','["Evet","Her zaman","Hayır","Niyet önemli değildir"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-zekat-kavram' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-3-8','coktan_secmeli','İhtiyaç sahibinin onurunu korumak yardımda önemli midir?','["Evet","Hayır","Yardım alan küçümsenebilir","Sadece miktar önemlidir"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-zekat-kavram' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'din8-yardim','Yardımlaşma ve Paylaşma','Yardımlaşma ve Paylaşma','Yardımlaşma ve Paylaşma kavramlarını anlam, değer ve günlük yaşam açısından değerlendirir.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='din8-zekat'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-4-1','coktan_secmeli','Yardımlaşma toplumsal bağları güçlendirebilir mi?','["Hayır","Toplumu böler","Sadece aile içinde","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-yardim' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-4-2','coktan_secmeli','Paylaşmak yalnız maddi şeylerle mi sınırlıdır?','["Evet","Hayır","Sadece para paylaşılır","Bilgi ve zaman paylaşılmaz"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-yardim' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-4-3','coktan_secmeli','Gönüllü yardım faaliyetleri toplumsal dayanışmaya katkı sağlar mı?','["Hayır","Sadece devlet yapar","Gönüllülük gereksizdir","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-yardim' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-4-4','coktan_secmeli','İhtiyaç sahibini rencide etmeden yardım etmek önemli midir?','["Hayır","Evet","Yardımda nezaket gerekmez","Sadece miktar önemlidir"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-yardim' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-4-5','coktan_secmeli','Komşuluk ilişkilerinde yardımlaşma teşvik edilir mi?','["Hayır","Komşuluk önemsizdir","Sadece akraba önemlidir","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-yardim' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-4-6','coktan_secmeli','İsrafı azaltmak paylaşmaya kaynak ayırmayı kolaylaştırabilir mi?','["Hayır","Evet","İsraf yararlıdır","Paylaşmayla ilgisizdir"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-yardim' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-4-7','coktan_secmeli','Afet zamanlarında dayanışma önemli midir?','["Hayır","Sadece bireysel hareket edilir","Yardım zararlıdır","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-yardim' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-4-8','coktan_secmeli','Yardım ederken güvenilir kurumları kullanmak uygun olabilir mi?','["Hayır","Evet","Kurumlar kullanılmamalı","Kaynak kontrolü gerekmez"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-yardim' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'din8-din-birey','Din, Birey ve Toplum','Din, Birey ve Toplum','Din, Birey ve Toplum kavramlarını anlam, değer ve günlük yaşam açısından değerlendirir.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='din8-hayat'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-5-1','coktan_secmeli','Din bireyin anlam arayışına cevaplar sunabilir mi?','["Evet","Hayır","Sadece ekonomiyle ilgilidir","Bireyle ilgisizdir"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-din-birey' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-5-2','coktan_secmeli','Din toplumsal değer ve davranışları etkileyebilir mi?','["Hayır","Toplumla ilgisi yoktur","Evet","Sadece özel alandır"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-din-birey' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-5-3','coktan_secmeli','İslam''da canın korunması önemli bir değer midir?','["Evet","Hayır","Sadece mal önemlidir","Canın değeri yoktur"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-din-birey' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-5-4','coktan_secmeli','Aklın korunması temel değerlerle ilişkilendirilebilir mi?','["Hayır","Akıl önemsizdir","Evet","Sadece beden önemlidir"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-din-birey' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-5-5','coktan_secmeli','Neslin ve ailenin korunması toplumsal hayatla ilişkili midir?','["Evet","Hayır","Sadece bireyseldir","Aile önemsizdir"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-din-birey' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-5-6','coktan_secmeli','Malın korunması hak ve sorumluluklarla ilişkili midir?','["Hayır","Mülkiyet kavramı yoktur","Evet","Sadece devlet malı korunur"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-din-birey' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-5-7','coktan_secmeli','Din özgürlüğü başkalarının inançlarına saygıyı gerektirir mi?','["Evet","Hayır","Sadece kendi inancı önemlidir","Saygı gerekmez"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-din-birey' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-5-8','coktan_secmeli','Toplumsal barışta adalet ve merhametin rolü olabilir mi?','["Hayır","Sadece güç önemlidir","Evet","Değerler etkisizdir"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-din-birey' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'din8-deger','Temel Değerler ve Güzel Ahlak','Temel Değerler ve Güzel Ahlak','Temel Değerler ve Güzel Ahlak kavramlarını anlam, değer ve günlük yaşam açısından değerlendirir.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='din8-hayat'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-6-1','coktan_secmeli','Doğruluk güzel ahlakın bir parçası mıdır?','["Hayır","Evet","Sadece okul kuralıdır","Sadece ticarette"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-6-2','coktan_secmeli','Adalet neyi gerektirir?','["Kayırmayı","Hileyi","Ayrımcılığı","Hak ve hakkaniyeti gözetmeyi"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-6-3','coktan_secmeli','Sabır pasif biçimde hiçbir şey yapmamak mıdır?','["Evet","Hayır","Her zaman","Çaba sabra aykırıdır"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-6-4','coktan_secmeli','Şükür nimetlerin değerini bilmekle ilişkilendirilebilir mi?','["Hayır","Sadece söz söylemektir","İsrafla ilgilidir","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-6-5','coktan_secmeli','Emanete riayet güvenilirlikle ilişkili midir?','["Hayır","Evet","Emanet önemsizdir","Sadece maddi şeylerde"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-6-6','coktan_secmeli','Kul hakkını gözetmek başkalarının haklarına saygıyla ilişkili midir?','["Hayır","Sadece kişinin kendi hakkı önemlidir","Hak kavramı yoktur","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-6-7','coktan_secmeli','Affetmek her durumda haksızlığı onaylamak mıdır?','["Evet","Hayır","Affetmek adaleti kaldırır","Sadece zayıflıktır"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-6-8','coktan_secmeli','Güzel ahlak söz ve davranış bütünlüğünü gerektirir mi?','["Hayır","Sadece söz yeterlidir","Davranış önemli değildir","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'din8-hz-muhammed','Hz. Muhammed''in Doğruluğu ve Güvenilirliği','Hz. Muhammed''in Doğruluğu ve Güvenilirliği','Hz. Muhammed''in Doğruluğu ve Güvenilirliği kavramlarını anlam, değer ve günlük yaşam açısından değerlendirir.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='din8-ornek'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-7-1','coktan_secmeli','Hz. Muhammed''in güvenilirliğini ifade eden lakap?','["el-Kebir","el-Melik","el-Emin","el-Katip"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-hz-muhammed' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-7-2','coktan_secmeli','Doğruluk Hz. Muhammed''in örnek davranışlarından biri midir?','["Evet","Hayır","Sadece ticarette","Doğruluk önemli değildir"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-hz-muhammed' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-7-3','coktan_secmeli','Verdiği sözü tutmak güvenilirlikle ilişkili midir?','["Hayır","Sözler önemli değildir","Evet","Sadece yazılı söz geçerlidir"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-hz-muhammed' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-7-4','coktan_secmeli','Hz. Muhammed insanlara karşı adaletli davranmayı önemsemiş midir?','["Evet","Hayır","Sadece yakınlarına","Adaletle ilgilenmemiştir"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-hz-muhammed' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-7-5','coktan_secmeli','İnsanlara değer vermek onun örnekliğinde yer alır mı?','["Hayır","Sadece belirli gruplara","Evet","İnsan ilişkileri önemsizdir"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-hz-muhammed' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-7-6','coktan_secmeli','İstişare etmek karar öncesi görüş almaktır. Hz. Muhammed''in uygulamalarında görülür mü?','["Evet","Hayır","Hiç danışmamıştır","İstişare yasaktır"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-hz-muhammed' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-7-7','coktan_secmeli','Merhametli davranışlar onun örnekliğinin parçası mıdır?','["Hayır","Merhamet önemsizdir","Evet","Sadece çocuklara"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-hz-muhammed' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-7-8','coktan_secmeli','Hz. Muhammed''in söz ve davranışları Müslümanlar için örnek kabul edilir mi?','["Evet","Hayır","Sadece tarihsel bilgi sayılır","Davranışları bilinmez"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-hz-muhammed' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'din8-merhamet','Merhamet, İstişare ve Hakkı Gözetme','Merhamet, İstişare ve Hakkı Gözetme','Merhamet, İstişare ve Hakkı Gözetme kavramlarını anlam, değer ve günlük yaşam açısından değerlendirir.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='din8-ornek'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-8-1','coktan_secmeli','İstişare ne demektir?','["Tek başına karar dayatmak","Susmak","Emir vermek","Danışmak ve görüş alışverişi yapmak"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-merhamet' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-8-2','coktan_secmeli','Merhamet yalnız acımak mıdır?','["Evet","Hayır; yardım, anlayış ve zarar vermemeyi de içerir.","Sadece üzülmektir","Sadece hayvanlara yöneliktir"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-merhamet' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-8-3','coktan_secmeli','Hakkı gözetmek adaletle ilişkili midir?','["Hayır","Sadece güçle","Hak önemsizdir","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-merhamet' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-8-4','coktan_secmeli','Bir anlaşmazlıkta karşı tarafı dinlemek yapıcı bir davranış mıdır?','["Hayır","Evet","Söz kesmek gerekir","Dinlemek zayıflıktır"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-merhamet' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-8-5','coktan_secmeli','Affedicilik merhametle ilişkilendirilebilir mi?','["Hayır","Sadece korkudur","Merhametle ilgisizdir","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-merhamet' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-8-6','coktan_secmeli','Danışarak karar almak ortak sorumluluğu güçlendirebilir mi?','["Hayır","Evet","Sadece zamanı uzatır","Kararı zayıflatır"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-merhamet' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-8-7','coktan_secmeli','Güçlü olanın zayıfın hakkını koruması adaletle uyumlu mudur?','["Hayır","Güçlü olan her şeyi yapabilir","Hak sadece güçlüye aittir","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-merhamet' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-8-8','coktan_secmeli','Merhamet ve adalet birlikte gözetilebilir mi?','["Hayır","Evet","Birbirine zıttır","Sadece biri seçilir"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-merhamet' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'din8-kuran-yapi','Kur''an-ı Kerim''in Temel Özellikleri','Kur''an-ı Kerim''in Temel Özellikleri','Kur''an-ı Kerim''in Temel Özellikleri kavramlarını anlam, değer ve günlük yaşam açısından değerlendirir.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='din8-kuran'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-9-1','coktan_secmeli','Kur''an-ı Kerim kaç sureden oluşur?','["114","99","120","40"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kuran-yapi' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-9-2','coktan_secmeli','Kur''an''ın bölümlerine ne denir?','["Cüz sadece bölüm adı değildir","Mihrap","Sure","Minare"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kuran-yapi' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-9-3','coktan_secmeli','Sureleri oluşturan vahiy cümlelerine ne denir?','["Ayet","Hadis","Dua","Hutbe"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kuran-yapi' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-9-4','coktan_secmeli','Kur''an''ın ilk suresi hangisidir?','["Nas","Bakara","Fâtiha","Yasin"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kuran-yapi' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-9-5','coktan_secmeli','Kur''an''ın son suresi hangisidir?','["Nas","Fâtiha","Bakara","Kehf"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kuran-yapi' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-9-6','coktan_secmeli','Kur''an Arapça indirilmiş midir?','["Hayır","Türkçe indirildi","Evet","Farsça indirildi"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kuran-yapi' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-9-7','coktan_secmeli','Kur''an''ın anlaşılması için meal ve tefsir çalışmalarından yararlanılabilir mi?','["Evet","Hayır","Anlamaya çalışmak gerekmez","Sadece ezber yeterlidir"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kuran-yapi' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-9-8','coktan_secmeli','Kur''an''a saygılı davranmak Müslümanların önem verdiği bir tutum mudur?','["Hayır","Sadece tarih kitabıdır","Evet","Saygıyla ilgisi yoktur"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kuran-yapi' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'din8-kuran-mesaj','Kur''an''ın Ana Konuları ve Mesajları','Kur''an''ın Ana Konuları ve Mesajları','Kur''an''ın Ana Konuları ve Mesajları kavramlarını anlam, değer ve günlük yaşam açısından değerlendirir.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='din8-kuran'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-10-1','coktan_secmeli','Kur''an''ın ana konularından biri inanç mıdır?','["Hayır","Evet","Sadece tarih","Sadece coğrafya"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kuran-mesaj' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-10-2','coktan_secmeli','İbadetler Kur''an''ın ele aldığı konulardan mıdır?','["Hayır","Sadece ekonomi","Sadece savaş","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kuran-mesaj' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-10-3','coktan_secmeli','Ahlaki değerler Kur''an''ın mesajlarında yer alır mı?','["Hayır","Evet","Ahlakla ilgilenmez","Sadece ibadet anlatır"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kuran-mesaj' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-10-4','coktan_secmeli','Kur''an adaleti teşvik eder mi?','["Hayır","Adalet önemsizdir","Sadece bireysel konular vardır","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kuran-mesaj' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-10-5','coktan_secmeli','Kur''an insanı düşünmeye ve aklını kullanmaya yönelten ifadeler içerir mi?','["Hayır","Evet","Düşünmeyi yasaklar","Sadece ezberi ister"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kuran-mesaj' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-10-6','coktan_secmeli','Peygamber kıssaları Kur''an''da ibret ve ders amacıyla yer alır mı?','["Hayır","Sadece tarih listesi","Kıssa yoktur","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kuran-mesaj' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-10-7','coktan_secmeli','Kur''an insan ve toplum hayatına ilişkin ilkeler sunar mı?','["Hayır","Evet","Sadece bireysel dua","Toplumla ilgisizdir"]',1,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kuran-mesaj' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8d-10-8','coktan_secmeli','Kur''an''ın mesajlarını bağlam ve bütünlük içinde anlamaya çalışmak önemli midir?','["Hayır","Tek cümle yeter","Bağlam gereksizdir","Evet"]',3,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='din8-kuran-mesaj' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

