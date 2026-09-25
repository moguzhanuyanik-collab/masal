SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'ink8-cocukluk','Mustafa Kemal''in Çocukluğu ve Eğitim Hayatı','Mustafa Kemal''in Çocukluğu ve Eğitim Hayatı','Mustafa Kemal''in Çocukluğu ve Eğitim Hayatı konusunu kronoloji, neden-sonuç ve tarihsel kanıtla değerlendirir.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='ink8-kahraman'
WHERE d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-1-1','coktan_secmeli','Mustafa Kemal hangi şehirde doğmuştur?','["Selanik","İstanbul","Ankara","Samsun"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cocukluk' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-1-2','coktan_secmeli','Mustafa Kemal''in askerî eğitim aldığı okullardan biri hangisidir?','["Galatasaray Lisesi","Darülfünun Hukuk","Manastır Askerî İdadisi","Mülkiye Mektebi yalnız"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cocukluk' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-1-3','coktan_secmeli','Selanik''in çok kültürlü yapısı Mustafa Kemal''in fikir dünyasını etkileyen çevresel unsurlardan biri olarak ele alınır mı?','["Evet","Hayır","Selanik kapalı bir köydü","Şehrin etkisi olmadığı kabul edilir"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cocukluk' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-1-4','coktan_secmeli','Mustafa Kemal''e “Kemal” adını hangi okul döneminde matematik öğretmeninin verdiği anlatılır?','["Mahalle Mektebi","Harp Akademisi","Askerî Rüştiye","Şemsi Efendi Okulu"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cocukluk' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-1-5','coktan_secmeli','Mustafa Kemal''in askerlik mesleğini seçmesinde askerî okulların etkisi olmuş mudur?','["Evet","Hayır","Askerî okul okumamıştır","Meslek seçimiyle ilgisi yoktur"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cocukluk' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-1-6','coktan_secmeli','Mustafa Kemal''in eğitim yaşamında farklı şehirlerde bulunması ne sağlamıştır?','["Sadece tek kültürü tanımasını","Eğitimi bırakmasını","Farklı çevre ve fikirlerle karşılaşmasını","Sadece ticaret yapmasını"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cocukluk' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-1-7','coktan_secmeli','Manastır''da tarih ve edebiyat ilgisinin gelişmesi fikir dünyasına katkı sağlamış mıdır?','["Evet","Hayır","Bu dersleri hiç görmemiştir","Sadece matematikle ilgilenmiştir"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cocukluk' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-1-8','coktan_secmeli','Harp Akademisini bitirdikten sonra Mustafa Kemal''in mesleği neydi?','["Öğretmen","Doktor","Kurmay subay","Mühendis"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cocukluk' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'ink8-fikir','Osmanlı''nın Son Dönemi ve Fikir Hayatı','Osmanlı''nın Son Dönemi ve Fikir Hayatı','Osmanlı''nın Son Dönemi ve Fikir Hayatı konusunu kronoloji, neden-sonuç ve tarihsel kanıtla değerlendirir.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='ink8-kahraman'
WHERE d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-2-1','coktan_secmeli','Fransız İhtilali''nin yaydığı milliyetçilik düşüncesi çok uluslu Osmanlı Devleti''ni etkilemiş midir?','["Hayır","Evet","Sadece Amerika''yı etkiledi","Milliyetçilik ortaya çıkmadı"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-fikir' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-2-2','coktan_secmeli','Sanayi İnkılabı Avrupa devletlerinin ham madde ve pazar arayışını artırmış mıdır?','["Hayır","Üretimi azaltmıştır","Ticareti bitirmiştir","Evet"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-fikir' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-2-3','coktan_secmeli','Osmanlıcılık fikrinin amacı neydi?','["Yalnız Avrupa ile birleşmek","Farklı unsurları ortak Osmanlı kimliği altında bir arada tutmak","Sanayiyi durdurmak","Saltanatı kaldırmak doğrudan"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-fikir' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-2-4','coktan_secmeli','İslamcılık düşüncesi hangi ortaklığı öne çıkarıyordu?','["Sadece dil birliği","Sadece ekonomik birlik","Yerel yönetim","Dinî birlik"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-fikir' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-2-5','coktan_secmeli','Türkçülük düşüncesi hangi kimliği öne çıkardı?','["Sadece Osmanlı hanedanını","Türk millî kimliğini","Avrupa vatandaşlığını","Yerel şehir kimliğini"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-fikir' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-2-6','coktan_secmeli','Batıcılık düşüncesi neyi savunan akımlardan biriydi?','["Batıyla tüm ilişkiyi kesmeyi","Sanayiyi yasaklamayı","Eğitimi kaldırmayı","Batı''daki bilimsel ve kurumsal gelişmelerden yararlanmayı"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-fikir' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-2-7','coktan_secmeli','Trablusgarp Savaşı Mustafa Kemal''in görev aldığı savaşlardan biri midir?','["Hayır","Evet","Sadece Balkan Savaşlarında görev aldı","Savaşa katılmadı"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-fikir' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-2-8','coktan_secmeli','Balkan Savaşları Osmanlı Devleti''nin Balkanlardaki toprak kayıplarını artırmış mıdır?','["Hayır","Topraklarını genişletmiştir","Balkanlarla ilgisi yoktur","Evet"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-fikir' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'ink8-birinci-dunya','Birinci Dünya Savaşı ve Osmanlı Devleti','Birinci Dünya Savaşı ve Osmanlı Devleti','Birinci Dünya Savaşı ve Osmanlı Devleti konusunu kronoloji, neden-sonuç ve tarihsel kanıtla değerlendirir.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='ink8-uyanis'
WHERE d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-3-1','coktan_secmeli','Birinci Dünya Savaşı 1914''te başlamış mıdır?','["Hayır, 1919''da başladı","1923''te başladı","Evet","1939''da başladı"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-birinci-dunya' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-3-2','coktan_secmeli','Osmanlı Devleti savaşta İttifak Devletleri yanında yer aldı mı?','["Evet","Hayır","Tarafsız kaldı","İtilaf Devletlerine katıldı"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-birinci-dunya' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-3-3','coktan_secmeli','Çanakkale Cephesi''nde İtilaf Devletleri boğazları geçmeyi başarabildi mi?','["Evet","Savaşmadan geçti","Hayır","Boğazlar kullanılmadı"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-birinci-dunya' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-3-4','coktan_secmeli','Mustafa Kemal Çanakkale Cephesi''nde görev yaptı mı?','["Evet","Hayır","Sadece Kafkasya''da görev yaptı","Savaşta yoktu"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-birinci-dunya' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-3-5','coktan_secmeli','Osmanlı Devleti''nin Kanal Cephesi''ndeki hedeflerinden biri Süveyş Kanalı üzerinde etkili olmak mıydı?','["Hayır","Sadece Balkanlara gitmekti","Evet","Kanal yoktu"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-birinci-dunya' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-3-6','coktan_secmeli','Kafkas Cephesi Osmanlı-Rus mücadelesinin yaşandığı cephelerden biri miydi?','["Evet","Hayır","Sadece İngiltere ile savaşıldı","Avrupa''da değildi diye cephe yoktu"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-birinci-dunya' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-3-7','coktan_secmeli','Birinci Dünya Savaşı sonunda Osmanlı Devleti hangi ateşkes antlaşmasını imzaladı?','["Mudanya Ateşkesi","Lozan Antlaşması","Mondros Ateşkes Antlaşması","Ankara Antlaşması"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-birinci-dunya' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-3-8','coktan_secmeli','Mondros Ateşkes Antlaşması 30 Ekim 1918''de imzalandı mı?','["Evet","Hayır","1920''de imzalandı","1923''te imzalandı"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-birinci-dunya' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'ink8-milli-mucadele-baslangic','Mondros''tan Millî Mücadele''nin Örgütlenmesine','Mondros''tan Millî Mücadele''nin Örgütlenmesine','Mondros''tan Millî Mücadele''nin Örgütlenmesine konusunu kronoloji, neden-sonuç ve tarihsel kanıtla değerlendirir.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='ink8-uyanis'
WHERE d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-4-1','coktan_secmeli','Mustafa Kemal Samsun''a hangi tarihte çıktı?','["23 Nisan 1920","29 Ekim 1923","30 Ağustos 1922","19 Mayıs 1919"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-milli-mucadele-baslangic' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-4-2','coktan_secmeli','Amasya Genelgesi''nde millî bağımsızlığın milletin azim ve kararıyla sağlanacağı vurgulandı mı?','["Hayır","Evet","Saltanatın güçlendirilmesi tek konu olarak işlendi","Meclisin kapatılması istendi"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-milli-mucadele-baslangic' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-4-3','coktan_secmeli','Erzurum Kongresi bölgesel toplanmasına rağmen millî kararlar aldı mı?','["Hayır","Sadece yerel ticaret konuşuldu","Kongre yapılmadı","Evet"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-milli-mucadele-baslangic' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-4-4','coktan_secmeli','Sivas Kongresi''nin önemli sonuçlarından biri millî cemiyetlerin tek çatı altında birleştirilmesi midir?','["Hayır","Evet","Cemiyetler dağıtıldı","Sadece askerî okul açıldı"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-milli-mucadele-baslangic' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-4-5','coktan_secmeli','Temsil Heyeti''nin yetkileri Sivas Kongresi''nden sonra genişledi mi?','["Hayır","Heyet kaldırıldı","Sadece Erzurum''da kaldı","Evet"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-milli-mucadele-baslangic' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-4-6','coktan_secmeli','Misak-ı Millî kararları hangi mecliste kabul edildi?','["TBMM","Son Osmanlı Mebusan Meclisi","Saltanat Şûrası","Lozan Konferansı"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-milli-mucadele-baslangic' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-4-7','coktan_secmeli','İstanbul''un resmen işgal edilmesi TBMM''nin açılış sürecini hızlandıran gelişmelerden biri oldu mu?','["Hayır","TBMM daha önce kapandı","İşgalle ilgisi yoktu","Evet"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-milli-mucadele-baslangic' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-4-8','coktan_secmeli','Millî Mücadele döneminde genelgeler ve kongreler kamuoyu ve örgütlenme açısından önemli miydi?','["Hayır","Evet","Sadece askerî emirler kullanıldı","Toplantı yapılmadı"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-milli-mucadele-baslangic' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'ink8-meclis','TBMM''nin Açılması ve Düzenli Ordu','TBMM''nin Açılması ve Düzenli Ordu','TBMM''nin Açılması ve Düzenli Ordu konusunu kronoloji, neden-sonuç ve tarihsel kanıtla değerlendirir.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='ink8-destan'
WHERE d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-5-1','coktan_secmeli','TBMM ne zaman açıldı?','["23 Nisan 1920","19 Mayıs 1919","29 Ekim 1923","1 Kasım 1922"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-meclis' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-5-2','coktan_secmeli','TBMM''nin açılmasıyla millî egemenlik anlayışı kurumsal bir merkez kazandı mı?','["Hayır","Meclis yetkisizdi","Evet","Sadece yerel bir kurul oluşturuldu"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-meclis' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-5-3','coktan_secmeli','İlk TBMM yasama ve yürütme yetkilerini kendi bünyesinde toplamış mıydı?','["Evet","Hayır","Hiç yetkisi yoktu","Sadece yargı görevindeydi"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-meclis' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-5-4','coktan_secmeli','Kuvayımilliye birliklerinden düzenli orduya geçilmesinin nedenlerinden biri disiplin ve koordinasyon ihtiyacı mıydı?','["Hayır","Kuvayımilliye tüm savaşları tek başına bitirmişti","Evet","Orduya ihtiyaç yoktu"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-meclis' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-5-5','coktan_secmeli','İstiklal Mahkemeleri hangi dönemde TBMM tarafından kuruldu?','["Millî Mücadele döneminde","Tanzimat döneminde","Lale Devri''nde","1950 sonrasında"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-meclis' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-5-6','coktan_secmeli','TBMM''nin açılması egemenliğin kaynağına ilişkin hangi anlayışı öne çıkardı?','["Mutlak monarşi","Feodal egemenlik","Millî egemenlik","Sömürge yönetimi"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-meclis' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-5-7','coktan_secmeli','Düzenli ordunun kurulması Batı Cephesi''ndeki savaşların yürütülmesi açısından önemli miydi?','["Evet","Hayır","Batı Cephesi yoktu","Sadece diplomatik amaçlıydı"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-meclis' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-5-8','coktan_secmeli','TBMM Hükûmeti Millî Mücadele sırasında diplomatik ilişkiler de yürüttü mü?','["Hayır","Sadece askerî faaliyet yaptı","Evet","Dış temas yasaktı"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-meclis' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'ink8-cepheler','Millî Mücadele Cepheleri ve Antlaşmalar','Millî Mücadele Cepheleri ve Antlaşmalar','Millî Mücadele Cepheleri ve Antlaşmalar konusunu kronoloji, neden-sonuç ve tarihsel kanıtla değerlendirir.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='ink8-destan'
WHERE d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-6-1','coktan_secmeli','I. İnönü Savaşı hangi cephede gerçekleşti?','["Doğu Cephesi","Batı Cephesi","Güney Cephesi","Kafkas Cephesi"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cepheler' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-6-2','coktan_secmeli','Sakarya Meydan Muharebesi 1921''de gerçekleşti mi?','["Hayır","1915''te","1923''te","Evet"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cepheler' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-6-3','coktan_secmeli','Büyük Taarruz hangi yıl başladı?','["1919","1922","1920","1924"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cepheler' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-6-4','coktan_secmeli','30 Ağustos hangi zaferle ilişkilidir?','["I. İnönü","Çanakkale","Trablusgarp","Başkomutanlık Meydan Muharebesi"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cepheler' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-6-5','coktan_secmeli','Mudanya Ateşkes Antlaşması askerî çatışmaların sona ermesi sürecinde önemli midir?','["Hayır","Evet","Bir ticaret anlaşmasıdır","Bir eğitim protokolüdür"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cepheler' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-6-6','coktan_secmeli','Lozan Barış Antlaşması hangi yıl imzalandı?','["1919","1920","1925","1923"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cepheler' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-6-7','coktan_secmeli','Doğu Cephesi''nde Ermenistan ile imzalanan antlaşma hangisidir?','["Lozan","Gümrü Antlaşması","Mudanya","Montrö"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cepheler' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-6-8','coktan_secmeli','Güney Cephesi''nde yerel direniş önemli rol oynamış mıdır?','["Hayır","Hiç çatışma yaşanmadı","Sadece düzenli ordu vardı","Evet"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cepheler' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'ink8-ilkeler','Atatürk İlkeleri','Atatürk İlkeleri','Atatürk İlkeleri konusunu kronoloji, neden-sonuç ve tarihsel kanıtla değerlendirir.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='ink8-ataturkculuk'
WHERE d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-7-1','coktan_secmeli','Cumhuriyetçilik ilkesi hangi yönetim anlayışını temel alır?','["Mutlak monarşiyi","Sömürge yönetimini","Egemenliğin millete ait olduğu cumhuriyet yönetimini","Derebeyliği"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-ilkeler' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-7-2','coktan_secmeli','Milliyetçilik ilkesi programda millî birlik ve bağımsızlık düşünceleriyle ilişkilendirilir mi?','["Evet","Hayır","Sadece ekonomik bir kavramdır","Yalnız yerel yönetimdir"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-ilkeler' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-7-3','coktan_secmeli','Halkçılık ilkesi vatandaşların kanun önünde eşitliği düşüncesiyle ilişkilidir mi?','["Hayır","Ayrıcalıklı sınıfları zorunlu kılar","Evet","Sadece köylülerle ilgilidir"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-ilkeler' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-7-4','coktan_secmeli','Laiklik ilkesi devlet ve hukuk düzeninin din kurallarından bağımsız yürütülmesiyle ilişkilendirilir mi?','["Evet","Hayır","Din özgürlüğünü kaldırmak demektir","Sadece ekonomiyle ilgilidir"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-ilkeler' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-7-5','coktan_secmeli','Devletçilik ilkesi ekonomik kalkınmada devletin düzenleyici ve gerektiğinde yatırımcı rolüyle ilişkilendirilir mi?','["Hayır","Özel girişimi tamamen yasaklamak anlamına gelir","Evet","Ekonomiyle ilgisizdir"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-ilkeler' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-7-6','coktan_secmeli','İnkılapçılık ilkesi değişen şartlara göre çağdaşlaşma ve yenilikleri sürdürmeyle ilişkilidir mi?','["Evet","Hayır","Tüm değişimi reddeder","Sadece askerî bir ilkedir"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-ilkeler' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-7-7','coktan_secmeli','Atatürk ilkeleri birbirinden tamamen kopuk mu ele alınır?','["Evet","Sadece ikisi ilişkilidir","Hayır, birbirini tamamlayan bir bütün olarak ele alınır.","İlkeler arasında hiçbir bağ yoktur"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-ilkeler' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-7-8','coktan_secmeli','Millî egemenlik düşüncesi en doğrudan hangi ilkeyle ilişkilidir?','["Cumhuriyetçilik","Devletçilik","Laiklik","İnkılapçılık yalnız"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-ilkeler' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'ink8-inkilaplar','Siyasi, Hukuki, Eğitimsel ve Toplumsal İnkılaplar','Siyasi, Hukuki, Eğitimsel ve Toplumsal İnkılaplar','Siyasi, Hukuki, Eğitimsel ve Toplumsal İnkılaplar konusunu kronoloji, neden-sonuç ve tarihsel kanıtla değerlendirir.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='ink8-ataturkculuk'
WHERE d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-8-1','coktan_secmeli','Saltanat hangi yıl kaldırıldı?','["1920","1923","1925","1922"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-inkilaplar' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-8-2','coktan_secmeli','Cumhuriyet ne zaman ilan edildi?','["23 Nisan 1920","29 Ekim 1923","19 Mayıs 1919","30 Ağustos 1922"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-inkilaplar' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-8-3','coktan_secmeli','Halifelik hangi yıl kaldırıldı?','["1922","1923","1928","1924"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-inkilaplar' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-8-4','coktan_secmeli','Tevhid-i Tedrisat Kanunu eğitimde birlik sağlamayı amaçladı mı?','["Hayır","Evet","Eğitimi kaldırdı","Sadece askerî okulları kapsadı"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-inkilaplar' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-8-5','coktan_secmeli','Türk Medeni Kanunu 1926''da kabul edildi mi?','["Hayır","1920''de","1934''te","Evet"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-inkilaplar' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-8-6','coktan_secmeli','Harf İnkılabı Latin esaslı Türk alfabesine geçişle ilişkili midir?','["Hayır","Evet","Arap alfabesine geçiştir","Alfabe değişmedi"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-inkilaplar' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-8-7','coktan_secmeli','Soyadı Kanunu hangi yıl kabul edildi?','["1923","1928","1938","1934"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-inkilaplar' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-8-8','coktan_secmeli','Kadınlara milletvekili seçme ve seçilme hakkı Türkiye''de 1934''te tanındı mı?','["Hayır","Evet","1920''de","1950''de"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-inkilaplar' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'ink8-cok-parti','Çok Partili Hayata Geçiş Denemeleri','Çok Partili Hayata Geçiş Denemeleri','Çok Partili Hayata Geçiş Denemeleri konusunu kronoloji, neden-sonuç ve tarihsel kanıtla değerlendirir.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='ink8-demokrasi'
WHERE d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-9-1','coktan_secmeli','Terakkiperver Cumhuriyet Fırkası hangi dönemde kuruldu?','["Cumhuriyet''in ilk yıllarında","Tanzimat döneminde","Millî Mücadele başlamadan önce","1950 sonrasında"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cok-parti' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-9-2','coktan_secmeli','Serbest Cumhuriyet Fırkası 1930''da kuruldu mu?','["Hayır","1920''de","Evet","1946''da"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cok-parti' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-9-3','coktan_secmeli','Çok partili hayata geçiş denemeleri farklı siyasi görüşlerin mecliste temsil edilmesi arayışıyla ilişkili miydi?','["Evet","Hayır","Sadece askerî amaçlıydı","Seçimlerle ilgisi yoktu"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cok-parti' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-9-4','coktan_secmeli','Terakkiperver Cumhuriyet Fırkası uzun süre faaliyet gösterdi mi?','["Evet onlarca yıl","Hâlen faaliyet gösterir","Hayır","Hiç kurulmadı"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cok-parti' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-9-5','coktan_secmeli','Serbest Cumhuriyet Fırkası kısa süre sonra kendini feshetti mi?','["Evet","Hayır","İktidar partisi oldu","Hiç seçime katılmadı"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cok-parti' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-9-6','coktan_secmeli','Cumhuriyetin ilk yıllarındaki çok partili denemeler kalıcı çok partili sisteme hemen dönüşebildi mi?','["Evet 1923''te kalıcı oldu","Siyasi parti yoktu","Hayır","Meclis kapandı"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cok-parti' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-9-7','coktan_secmeli','Siyasi partiler demokratik sistemde farklı görüşlerin örgütlenme araçlarından biri midir?','["Evet","Hayır","Sadece devlet kurumudur","Seçimle ilgisizdir"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cok-parti' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-9-8','coktan_secmeli','Bu dönemdeki siyasi gelişmeler tarihsel koşulları içinde değerlendirilmelidir mi?','["Hayır","Bağlam önemsizdir","Evet","Sadece bugünkü koşullar kullanılır"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cok-parti' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'ink8-cumhuriyet','Cumhuriyet Döneminde Demokratikleşme','Cumhuriyet Döneminde Demokratikleşme','Cumhuriyet Döneminde Demokratikleşme konusunu kronoloji, neden-sonuç ve tarihsel kanıtla değerlendirir.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='ink8-demokrasi'
WHERE d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-10-1','coktan_secmeli','Cumhuriyet yönetiminde seçimler siyasi katılım yollarından biri midir?','["Hayır","Evet","Sadece atama vardır","Seçim cumhuriyetle ilgisizdir"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cumhuriyet' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-10-2','coktan_secmeli','Millî egemenlik anlayışında yönetim yetkisinin kaynağı kimdir?','["Hanedan","Yabancı devlet","Tek bir sınıf","Millet"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cumhuriyet' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-10-3','coktan_secmeli','Kadınların siyasi haklarının genişletilmesi demokratik katılımın kapsamını artırmış mıdır?','["Hayır","Evet","Siyasi katılımı azaltmıştır","Kadınlara hak tanınmamıştır"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cumhuriyet' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-10-4','coktan_secmeli','Belediye seçimlerinde kadınlara seçme ve seçilme hakkı 1930''da tanındı mı?','["Hayır","1923''te","1950''de","Evet"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cumhuriyet' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-10-5','coktan_secmeli','Muhtarlık seçimlerinde kadınların hakları 1933''te genişletildi mi?','["Hayır","Evet","1919''da","1945''te"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cumhuriyet' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-10-6','coktan_secmeli','Milletvekili seçme ve seçilme hakkının 1934''te tanınması siyasi katılım açısından önemli bir değişim miydi?','["Hayır","Sadece eğitim alanındaydı","Seçimle ilgisi yoktu","Evet"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cumhuriyet' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-10-7','coktan_secmeli','Demokratikleşme yalnız seçimlerden mi oluşur?','["Evet","Hayır; hukuk, temsil, haklar ve kurumlar da önemlidir.","Sadece parti sayısıdır","Sadece meclis binasıdır"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cumhuriyet' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-10-8','coktan_secmeli','Cumhuriyet dönemi siyasi gelişmeleri değerlendirirken dönemin iç ve dış koşulları dikkate alınmalı mıdır?','["Hayır","Koşullar önemli değildir","Sadece kişisel görüş yeterlidir","Evet"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-cumhuriyet' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'ink8-dis-politika','Atatürk Dönemi Dış Politikanın Temel Konuları','Atatürk Dönemi Dış Politikanın Temel Konuları','Atatürk Dönemi Dış Politikanın Temel Konuları konusunu kronoloji, neden-sonuç ve tarihsel kanıtla değerlendirir.','',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='ink8-dis'
WHERE d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-11-1','coktan_secmeli','Atatürk dönemi dış politikası bağımsızlık ve egemenlik ilkelerini gözetmiş midir?','["Hayır","Bağımsızlık dış politikayla ilgisizdir","Evet","Sadece ekonomik konular ele alınmıştır"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-dis-politika' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-11-2','coktan_secmeli','Musul Sorunu Türkiye ile hangi devlet arasında başlıca anlaşmazlık konularından biriydi?','["Birleşik Krallık","Japonya","Brezilya","İsveç"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-dis-politika' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-11-3','coktan_secmeli','Montrö Boğazlar Sözleşmesi hangi yıl imzalandı?','["1923","1930","1936","1939"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-dis-politika' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-11-4','coktan_secmeli','Montrö Sözleşmesi Türkiye''nin Boğazlar üzerindeki yetkilerini artırdı mı?','["Evet","Hayır","Boğazları tamamen kapattı","Türkiye''nin yetkisini kaldırdı"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-dis-politika' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-11-5','coktan_secmeli','Türkiye Milletler Cemiyetine hangi yıl üye oldu?','["1920","1923","1932","1938"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-dis-politika' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-11-6','coktan_secmeli','Balkan Antantı hangi yıl kuruldu?','["1934","1924","1930","1939"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-dis-politika' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-11-7','coktan_secmeli','Sadabat Paktı hangi yıl imzalandı?','["1923","1932","1937","1945"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-dis-politika' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-11-8','coktan_secmeli','Dış politikada sorunların diplomasi yoluyla çözülmesi önemsenmiş midir?','["Evet","Hayır","Diplomasi kullanılmamıştır","Sadece iç politika yürütülmüştür"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-dis-politika' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'ink8-hatay','Hatay ve Bölgesel Gelişmeler','Hatay ve Bölgesel Gelişmeler','Hatay ve Bölgesel Gelişmeler konusunu kronoloji, neden-sonuç ve tarihsel kanıtla değerlendirir.','',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='ink8-dis'
WHERE d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-12-1','coktan_secmeli','Hatay sorunu hangi devletin manda yönetimi altındaki Suriye bölgesiyle ilişkiliydi?','["İtalya","Almanya","Sovyetler Birliği","Fransa"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-hatay' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-12-2','coktan_secmeli','Hatay Devleti hangi yıl kuruldu?','["1923","1938","1930","1945"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-hatay' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-12-3','coktan_secmeli','Hatay Türkiye''ye hangi yıl katıldı?','["1936","1937","1946","1939"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-hatay' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-12-4','coktan_secmeli','Hatay''ın Türkiye''ye katılması diplomatik süreçlerle gerçekleşti mi?','["Hayır","Evet","Sadece savaşla","Hiç görüşme yapılmadı"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-hatay' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-12-5','coktan_secmeli','Atatürk Hatay meselesini dış politika gündeminde önemsemiş miydi?','["Hayır","Hatay gündemde değildi","Sadece ekonomik bir konu sayıldı","Evet"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-hatay' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-12-6','coktan_secmeli','Hatay''ın Türkiye''ye katılması Atatürk''ün vefatından sonra tamamlandı mı?','["Hayır","Evet","1923''te tamamlandı","Atatürk döneminde 1930''da tamamlandı"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-hatay' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-12-7','coktan_secmeli','Hatay meselesinde uluslararası görüşmeler ve yerel siyasi süreçler rol oynadı mı?','["Hayır","Sadece tek taraflı karar","Uluslararası süreç yoktu","Evet"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-hatay' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-12-8','coktan_secmeli','Hatay''ın katılımı Türkiye''nin güney sınırıyla ilgili bir gelişme miydi?','["Hayır","Evet","Batı sınırıyla","Doğu sınırıyla"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-hatay' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'ink8-vefat','Atatürk''ün Vefatı ve Yankıları','Atatürk''ün Vefatı ve Yankıları','Atatürk''ün Vefatı ve Yankıları konusunu kronoloji, neden-sonuç ve tarihsel kanıtla değerlendirir.','',130,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='ink8-sonrasi'
WHERE d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-13-1','coktan_secmeli','Mustafa Kemal Atatürk hangi tarihte vefat etti?','["10 Kasım 1938","29 Ekim 1923","23 Nisan 1920","19 Mayıs 1919"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-vefat' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-13-2','coktan_secmeli','Atatürk nerede vefat etti?','["Anıtkabir","Samsun","Dolmabahçe Sarayı","TBMM binası"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-vefat' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-13-3','coktan_secmeli','Atatürk''ün vefatından sonra cumhurbaşkanı kim seçildi?','["İsmet İnönü","Kazım Karabekir","Fevzi Çakmak","Celal Bayar"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-vefat' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-13-4','coktan_secmeli','Atatürk''ün naaşı Anıtkabir''e hangi yıl nakledildi?','["1938","1945","1953","1960"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-vefat' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-13-5','coktan_secmeli','Atatürk''ün vefatı Türkiye''de ve yurt dışında geniş yankı uyandırdı mı?','["Evet","Hayır","Sadece Ankara''da duyuldu","Yurt dışında haber olmadı"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-vefat' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-13-6','coktan_secmeli','Anıtkabir Ankara''da mıdır?','["Hayır","İstanbul''dadır","Evet","Samsun''dadır"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-vefat' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-13-7','coktan_secmeli','10 Kasım Türkiye''de Atatürk''ü anma günü olarak kabul edilir mi?','["Evet","Hayır","Sadece resmî tatildir","Başka bir olayla ilgilidir"]',0,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-vefat' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-13-8','coktan_secmeli','Atatürk''ün düşünce ve uygulamaları Türkiye Cumhuriyeti tarihinin incelenmesinde temel konulardan biri midir?','["Hayır","Cumhuriyet tarihiyle ilgisizdir","Evet","Sadece askerî tarihte yer alır"]',2,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-vefat' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'ink8-ikinci-dunya','İkinci Dünya Savaşı Sürecinde Türkiye','İkinci Dünya Savaşı Sürecinde Türkiye','İkinci Dünya Savaşı Sürecinde Türkiye konusunu kronoloji, neden-sonuç ve tarihsel kanıtla değerlendirir.','',140,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='ink8-sonrasi'
WHERE d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-14-1','coktan_secmeli','İkinci Dünya Savaşı hangi yıl başladı?','["1914","1939","1923","1945"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-ikinci-dunya' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-14-2','coktan_secmeli','Savaş hangi yıl sona erdi?','["1938","1940","1950","1945"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-ikinci-dunya' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-14-3','coktan_secmeli','Türkiye savaşın büyük bölümünde fiilen savaşa girmeden tarafsızlık politikası izledi mi?','["Hayır, başından itibaren cephedeydi","Evet","Savaş Türkiye''de başladı","Hiç diplomasi yürütmedi"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-ikinci-dunya' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-14-4','coktan_secmeli','Türkiye 1945''te Almanya ve Japonya''ya savaş ilan etti mi?','["Hayır","1939''da ilan etti","1950''de ilan etti","Evet"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-ikinci-dunya' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-14-5','coktan_secmeli','Savaş yılları Türkiye ekonomisinde kıtlık ve devletin olağanüstü tedbirleri gibi sonuçlara yol açtı mı?','["Hayır","Evet","Ekonomi hiç etkilenmedi","Sadece turizm arttı"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-ikinci-dunya' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-14-6','coktan_secmeli','İkinci Dünya Savaşı sonrasında Birleşmiş Milletler kuruldu mu?','["Hayır","Birinci Dünya Savaşı öncesinde kuruldu","Sadece Avrupa Birliği kuruldu","Evet"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-ikinci-dunya' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-14-7','coktan_secmeli','Türkiye Birleşmiş Milletlerin kurucu üyeleri arasında yer aldı mı?','["Hayır","Evet","Üyeliği 1980''de başladı","BM''ye hiç katılmadı"]',1,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-ikinci-dunya' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8i-14-8','coktan_secmeli','Savaş sonrası uluslararası ortam Türkiye''nin dış politika ve güvenlik tercihlerini etkiledi mi?','["Hayır","Dış politika etkilenmedi","Uluslararası sistem değişmedi","Evet"]',3,'Tarihsel bilgi kronoloji, neden-sonuç ve bağlam dikkate alınarak değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='ink8-ikinci-dunya' AND (d.kod='inkilap' OR d.ad='T.C. İnkılap Tarihi ve Atatürkçülük')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

