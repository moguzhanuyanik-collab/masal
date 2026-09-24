SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-greetings','Greetings and Introductions at School','Greetings and Introductions at School','Okul ortamında selamlaşma, tanışma ve basit kişisel bilgi ifadelerini anlar ve kullanır.','Hello, I am Ece. Nice to meet you.',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-school'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-school-people-places','People and Places at School','People and Places at School','Okuldaki kişiler ve bölümlerle ilgili temel ifadeleri anlar.','The librarian is in the library.',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-school'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-months','Months of the Year','Months of the Year','Ayları İngilizce adları ve sıralarıyla tanır.','January, February, March...',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-school'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-age-birthday','Ages and Birthday Celebrations','Ages and Birthday Celebrations','Yaş ve doğum günüyle ilgili basit soru ve cevapları anlar.','How old are you? I am nine.',130,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-school'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-national-days','National Days and Celebrations','National Days and Celebrations','Millî ve özel günlerle ilgili kısa kutlama ifadelerini anlar.','Happy Children''s Day!',140,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-school'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-instructions','Classroom Instructions and Language','Classroom Instructions and Language','Sınıf içinde kullanılan yönerge ve kısa iletişim kalıplarını anlar.','Open your book. Work in pairs.',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-classroom'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-classroom-objects','Furniture, Objects and Devices','Furniture, Objects and Devices','Sınıf mobilyası, araç-gereç ve cihazların adlarını tanır.','desk, board, projector, tablet',210,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-classroom'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-school-subjects','School Subjects','School Subjects','Temel ders adlarını ve basit tercih ifadelerini anlar.','I like Maths.',220,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-classroom'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-seasons','Seasons of the Year','Seasons of the Year','Mevsimlerin İngilizce adlarını ve temel özelliklerini tanır.','It is cold in winter.',230,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-classroom'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-body-features','Body Parts and Physical Features','Body Parts and Physical Features','Vücut bölümleri ve basit fiziksel özellikleri anlatır.','She has brown eyes.',300,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-personal'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-character','Personal Characters','Personal Characters','Basit kişilik özelliklerini tanır ve uygun bağlamda kullanır.','He is kind and helpful.',310,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-personal'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-weather','Weather Conditions','Weather Conditions','Hava durumunu kısa ifadelerle anlar ve anlatır.','It is cloudy and windy.',320,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-personal'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-season-clothes','Clothing According to Seasons and Weather','Clothing According to Seasons and Weather','Hava ve mevsime uygun temel giysileri ilişkilendirir.','Wear a coat when it is cold.',330,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-personal'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-clothing-preferences','Preferences for Clothing','Preferences for Clothing','Giysi tercihlerini like / don''t like gibi basit ifadelerle anlatır.','I like my blue T-shirt.',340,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-personal'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-family-members','Family Members','Family Members','Aile bireylerini ve basit akrabalık ilişkilerini tanır.','My aunt is my mother''s sister.',400,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-family'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-family-ages','Ages of Family Members','Ages of Family Members','Aile bireylerinin yaşlarını sorma ve söyleme ifadelerini anlar.','My brother is twelve.',410,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-family'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-routines-chores','Daily Routines and Chores','Daily Routines and Chores','Aile bireylerinin günlük rutin ve ev işlerini anlatan ifadeleri tanır.','Dad cooks dinner. I tidy my room.',420,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-family'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-hobbies-abilities','Hobbies and Abilities','Hobbies and Abilities','Hobiler ve can/can''t ile temel yetenek ifadelerini anlar.','She can swim.',430,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-family'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-countryside','Life in the Countryside','Life in the Countryside','Kırsal yaşamla ilgili temel yer ve günlük yaşam sözcüklerini tanır.','village, field, garden',500,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-home'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-farm-animals','Farmhouses and Farm Animals','Farmhouses and Farm Animals','Çiftlik evi ve çiftlik hayvanlarıyla ilgili temel sözcükleri tanır.','cow, sheep, horse, chicken',510,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-home'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-farm-chores','Activities and Chores on a Farm','Activities and Chores on a Farm','Çiftlikte yapılan basit işleri ve eylemleri anlar.','feed the animals, collect eggs',520,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-home'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-food-meals','Food Items and Meals','Food Items and Meals','Yiyecekler, içecekler ve öğünleri tanır; basit tercih ifadelerini anlar.','I have eggs for breakfast.',600,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-city'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'eng3-ordering-food','Eating Outside and Ordering Food','Eating Outside and Ordering Food','Dışarıda yemek yerken basit sipariş ve nezaket kalıplarını anlar.','Can I have soup, please?',610,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='eng3-city'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-greet-1','coktan_secmeli','Bir öğrenci “Good morning!” dedi. Uygun cevap?','["Good night!","Good morning!","Goodbye!","Sit down!"]',1,'Okulda temel iletişim kalıbı doğru bağlamda kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-greetings' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-greet-2','coktan_secmeli','“Nice to meet you.” ne zaman söylenir?','["Uyurken","Yemek siparişinde","Hava sorarken","Yeni biriyle tanışırken"]',3,'Okulda temel iletişim kalıbı doğru bağlamda kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-greetings' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-greet-3','coktan_secmeli','“What is your name?” neyi sorar?','["Yaşını","Adını","En sevdiğin dersi","Doğum ayını"]',1,'Okulda temel iletişim kalıbı doğru bağlamda kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-greetings' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-greet-4','coktan_secmeli','“My name is Deniz.” ne demektir?','["Ben dokuz yaşındayım.","Ben öğrenciyim.","Ben Deniz''i seviyorum.","Benim adım Deniz."]',3,'Okulda temel iletişim kalıbı doğru bağlamda kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-greetings' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-greet-5','coktan_secmeli','“How are you?” için uygun cevap?','["I''m nine.","I''m fine, thank you.","It''s Monday.","In the library."]',1,'Okulda temel iletişim kalıbı doğru bağlamda kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-greetings' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-greet-6','coktan_secmeli','“This is my friend, Ada.” ne demektir?','["Bu benim öğretmenim.","Ada sınıfta değil.","Ben Ada''yım.","Bu benim arkadaşım Ada."]',3,'Okulda temel iletişim kalıbı doğru bağlamda kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-greetings' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-greet-7','coktan_secmeli','“See you tomorrow.” ne demektir?','["Bugün görüşürüz.","Yarın görüşürüz.","Günaydın.","Hoş geldin."]',1,'Okulda temel iletişim kalıbı doğru bağlamda kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-greetings' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-greet-8','coktan_secmeli','Birini tanıştırırken hangisi kullanılabilir?','["Close the door.","It is rainy.","I like apples.","This is my friend."]',3,'Okulda temel iletişim kalıbı doğru bağlamda kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-greetings' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-greet-9','coktan_secmeli','“Welcome to our school.” ne demektir?','["Okuldan çık.","Okulumuza hoş geldin.","Okulumuz kapalı.","Okulu sevmedim."]',1,'Okulda temel iletişim kalıbı doğru bağlamda kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-greetings' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-greet-10','coktan_secmeli','“Excuse me.” hangi durumda kullanılabilir?','["Renk söylerken","Yaş hesaplanırken","Koşarken","Nazikçe dikkat çekmek isterken"]',3,'Okulda temel iletişim kalıbı doğru bağlamda kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-greetings' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-greet-11','coktan_secmeli','“Thank you for your help.” ne demektir?','["Yardım istemiyorum.","Yardımın için teşekkür ederim.","Hoşça kal.","Özür dilerim."]',1,'Okulda temel iletişim kalıbı doğru bağlamda kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-greetings' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-greet-12','coktan_secmeli','“Who is she?” sorusu neyi sorar?','["Hava durumunu","Saati","Ders adını","Bir kişinin kim olduğunu"]',3,'Okulda temel iletişim kalıbı doğru bağlamda kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-greetings' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-school-vocab-1','coktan_secmeli','“teacher” ne demektir?','["okul müdürü","öğretmen","öğrenci","kantin"]',1,'teacher, öğretmen anlamındadır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-people-places' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-school-vocab-2','coktan_secmeli','“principal” ne demektir?','["kütüphane görevlisi","kütüphane","oyun alanı","okul müdürü"]',3,'principal, okul müdürü anlamındadır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-people-places' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-school-vocab-3','coktan_secmeli','“librarian” ne demektir?','["öğrenci","kütüphane görevlisi","kantin","sınıf"]',1,'librarian, kütüphane görevlisi anlamındadır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-people-places' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-school-vocab-4','coktan_secmeli','“pupil” ne demektir?','["kütüphane","oyun alanı","spor salonu","öğrenci"]',3,'pupil, öğrenci anlamındadır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-people-places' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-school-vocab-5','coktan_secmeli','“library” ne demektir?','["kantin","kütüphane","sınıf","ofis / idari oda"]',1,'library, kütüphane anlamındadır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-people-places' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-school-vocab-6','coktan_secmeli','“canteen” ne demektir?','["oyun alanı","spor salonu","öğretmen","kantin"]',3,'canteen, kantin anlamındadır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-people-places' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-school-vocab-7','coktan_secmeli','“playground” ne demektir?','["sınıf","oyun alanı","ofis / idari oda","okul müdürü"]',1,'playground, oyun alanı anlamındadır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-people-places' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-school-vocab-8','coktan_secmeli','“classroom” ne demektir?','["spor salonu","öğretmen","kütüphane görevlisi","sınıf"]',3,'classroom, sınıf anlamındadır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-people-places' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-school-vocab-9','coktan_secmeli','“sports hall” ne demektir?','["ofis / idari oda","spor salonu","okul müdürü","öğrenci"]',1,'sports hall, spor salonu anlamındadır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-people-places' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-school-vocab-10','coktan_secmeli','“office” ne demektir?','["öğretmen","kütüphane görevlisi","kütüphane","ofis / idari oda"]',3,'office, ofis / idari oda anlamındadır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-people-places' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-school-context-1','coktan_secmeli','Kitap ödünç almak için nereye gidersin?','["canteen","playground","library","sports hall"]',2,'People and places at school bağlamı kullanılır.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-people-places' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-school-context-2','coktan_secmeli','Öğle arasında yiyecek almak için hangi yer uygundur?','["canteen","library","classroom","office"]',0,'People and places at school bağlamı kullanılır.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-people-places' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-school-context-3','coktan_secmeli','“The principal is in the office.” ne demektir?','["Öğrenci bahçede.","Öğretmen kütüphanede.","Müdür ofiste.","Müdür kantinde."]',2,'People and places at school bağlamı kullanılır.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-people-places' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-school-context-4','coktan_secmeli','“There is a library in our school.” ne demektir?','["Okulumuzda bir kütüphane var.","Kütüphane yok.","Okul kapalı.","Sınıf kütüphane."]',0,'People and places at school bağlamı kullanılır.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-people-places' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-school-context-5','coktan_secmeli','“Where is the sports hall?” neyi sorar?','["Spor dersinin saatini","Öğretmenin adını","Spor salonunun yerini","Salonun rengini"]',2,'People and places at school bağlamı kullanılır.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-people-places' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-month-1','coktan_secmeli','“January” ne demektir?','["Ocak","Şubat","Nisan","Haziran"]',0,'January, Ocak anlamındadır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-months' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-month-2','coktan_secmeli','“February” ne demektir?','["Mart","Mayıs","Şubat","Temmuz"]',2,'February, Şubat anlamındadır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-months' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-month-3','coktan_secmeli','“March” ne demektir?','["Mart","Nisan","Haziran","Ağustos"]',0,'March, Mart anlamındadır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-months' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-month-4','coktan_secmeli','“April” ne demektir?','["Mayıs","Temmuz","Nisan","Eylül"]',2,'April, Nisan anlamındadır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-months' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-month-5','coktan_secmeli','“May” ne demektir?','["Mayıs","Haziran","Ağustos","Ekim"]',0,'May, Mayıs anlamındadır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-months' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-month-6','coktan_secmeli','“June” ne demektir?','["Temmuz","Eylül","Haziran","Kasım"]',2,'June, Haziran anlamındadır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-months' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-month-7','coktan_secmeli','“July” ne demektir?','["Temmuz","Ağustos","Ekim","Aralık"]',0,'July, Temmuz anlamındadır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-months' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-month-8','coktan_secmeli','“August” ne demektir?','["Eylül","Kasım","Ağustos","Ocak"]',2,'August, Ağustos anlamındadır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-months' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-month-9','coktan_secmeli','“September” ne demektir?','["Eylül","Ekim","Aralık","Şubat"]',0,'September, Eylül anlamındadır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-months' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-month-10','coktan_secmeli','“October” ne demektir?','["Kasım","Ocak","Ekim","Mart"]',2,'October, Ekim anlamındadır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-months' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-month-11','coktan_secmeli','“November” ne demektir?','["Kasım","Aralık","Şubat","Nisan"]',0,'November, Kasım anlamındadır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-months' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-month-12','coktan_secmeli','“December” ne demektir?','["Ocak","Mart","Aralık","Mayıs"]',2,'December, Aralık anlamındadır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-months' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-month-after-1','coktan_secmeli','January''den sonra hangi ay gelir?','["March","February","April","June"]',1,'January''den sonra February gelir.',1,30,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-months' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-month-after-2','coktan_secmeli','February''den sonra hangi ay gelir?','["April","May","July","March"]',3,'February''den sonra March gelir.',1,31,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-months' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-month-after-3','coktan_secmeli','March''den sonra hangi ay gelir?','["May","April","June","August"]',1,'March''den sonra April gelir.',1,32,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-months' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-month-after-4','coktan_secmeli','April''den sonra hangi ay gelir?','["June","July","September","May"]',3,'April''den sonra May gelir.',1,33,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-months' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-month-after-5','coktan_secmeli','May''den sonra hangi ay gelir?','["July","June","August","October"]',1,'May''den sonra June gelir.',1,34,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-months' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-month-after-6','coktan_secmeli','June''den sonra hangi ay gelir?','["August","September","November","July"]',3,'June''den sonra July gelir.',1,35,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-months' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-age-1','coktan_secmeli','“How old are you?” neyi sorar?','["Adını","Okulunu","Yaşını","Doğum ayını"]',2,'Age and birthday context kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-age-birthday' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-age-2','coktan_secmeli','“I am nine years old.” ne demektir?','["Dokuz yaşındayım.","Saat dokuz.","Dokuz kitabım var.","Dokuz gün var."]',0,'Age and birthday context kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-age-birthday' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-age-3','coktan_secmeli','“When is your birthday?” neyi sorar?','["Yaşını","Adını","Doğum gününün ne zaman olduğunu","Okulunu"]',2,'Age and birthday context kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-age-birthday' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-age-4','coktan_secmeli','“My birthday is in May.” ne demektir?','["Doğum günüm Mayıs ayında.","Mayıs''ta okula gitmem.","Mayıs bir derstir.","Beş yaşındayım."]',0,'Age and birthday context kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-age-birthday' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-age-5','coktan_secmeli','“Happy birthday!” ne zaman söylenir?','["Ders başında","Hava yağmurluyken","Doğum gününde","Vedalaşırken"]',2,'Age and birthday context kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-age-birthday' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-age-6','coktan_secmeli','“She is ten.” cümlesi yaş bağlamında ne demektir?','["O on yaşında.","Saat on.","On kalemi var.","Onuncu sırada."]',0,'Age and birthday context kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-age-birthday' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-age-7','coktan_secmeli','Bir arkadaşın “I''m nine.” diyor. Kaç yaşında?','["8","10","9","11"]',2,'Age and birthday context kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-age-birthday' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-age-8','coktan_secmeli','“How old is your brother?” neyi sorar?','["Erkek kardeşinin yaşını","Adını","Hobisini","Okulunu"]',0,'Age and birthday context kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-age-birthday' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-age-9','coktan_secmeli','“My birthday is in December.” hangi ay?','["Kasım","Ocak","Aralık","Ekim"]',2,'Age and birthday context kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-age-birthday' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-age-10','coktan_secmeli','Doğum günü pastası için hangi kelime uygundur?','["cake","desk","ruler","field"]',0,'Age and birthday context kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-age-birthday' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-age-11','coktan_secmeli','Doğum günü hediyesi için hangi kelime?','["weather","subject","gift","village"]',2,'Age and birthday context kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-age-birthday' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-age-12','coktan_secmeli','Mumlar için İngilizce kelime?','["candles","chairs","clouds","chores"]',0,'Age and birthday context kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-age-birthday' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-national-1','coktan_secmeli','“Happy Children''s Day!” hangi kutlamaya uygundur?','["Doğum günü","Kış tatili","Çocuk Bayramı","Öğle yemeği"]',2,'National days and celebrations bağlamı kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-national-days' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-national-2','coktan_secmeli','“national day” ne demektir?','["millî gün","okul dersi","hava durumu","ev işi"]',0,'National days and celebrations bağlamı kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-national-days' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-national-3','coktan_secmeli','23 April için hangi ifade uygundur?','["New Year''s Day only","Lunch time","Children''s Day","Maths Day"]',2,'National days and celebrations bağlamı kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-national-days' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-national-4','coktan_secmeli','Bir kutlamada “Happy ...!” ne işe yarar?','["Kutlama dileğini iletmeye","Yer sormaya","Yaş söylemeye","Ders seçmeye"]',0,'National days and celebrations bağlamı kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-national-days' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-national-5','coktan_secmeli','“celebration” ne demektir?','["sınıf","mevsim","kutlama","çiftlik"]',2,'National days and celebrations bağlamı kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-national-days' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-national-6','coktan_secmeli','“flag” ne demektir?','["bayrak","masa","çanta","süt"]',0,'National days and celebrations bağlamı kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-national-days' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-national-7','coktan_secmeli','“ceremony” ne demektir?','["oyuncak","yemek","tören","hobi"]',2,'National days and celebrations bağlamı kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-national-days' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-national-8','coktan_secmeli','Bir millî günde okulda ne olabilir?','["a ceremony","a farm chore","a dinner order","a bedroom"]',0,'National days and celebrations bağlamı kullanılır.',2,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-national-days' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-national-9','coktan_secmeli','“We celebrate Children''s Day in April.” ne demektir?','["Mayıs''ta kutlarız.","Çocuk Bayramı yoktur.","Çocuk Bayramı''nı Nisan''da kutlarız.","Nisan bir derstir."]',2,'National days and celebrations bağlamı kullanılır.',2,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-national-days' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-national-10','coktan_secmeli','Kutlama sırasında saygılı davranmak için hangisi uygundur?','["listen and follow the ceremony rules","shout all the time","leave litter","push friends"]',0,'National days and celebrations bağlamı kullanılır.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-national-days' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-inst-1','coktan_secmeli','“Work in pairs.” ne demektir?','["İkişerli çalışın.","Tek başına çalışın.","Kapıyı açın.","Ayağa kalkın."]',0,'Classroom instruction doğru anlamıyla eşleştirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-inst-2','coktan_secmeli','“Raise your hand.” ne demektir?','["Elini indir.","Kitabını kapat.","Elini kaldır.","Koş."]',2,'Classroom instruction doğru anlamıyla eşleştirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-inst-3','coktan_secmeli','“Listen carefully.” ne demektir?','["Dikkatle dinle.","Hızlı konuş.","Yazmayı bırak.","Dışarı çık."]',0,'Classroom instruction doğru anlamıyla eşleştirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-inst-4','coktan_secmeli','“Read the text.” ne demektir?','["Metni sil.","Metni kapat.","Metni oku.","Metni boya."]',2,'Classroom instruction doğru anlamıyla eşleştirilir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-inst-5','coktan_secmeli','“Write your name.” ne demektir?','["Adını yaz.","Yaşını söyle.","Kapıyı aç.","Sıraya geç."]',0,'Classroom instruction doğru anlamıyla eşleştirilir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-inst-6','coktan_secmeli','“Open your notebook.” ne demektir?','["Defterini kapat.","Kitabı ver.","Defterini aç.","Kalemi bırak."]',2,'Classroom instruction doğru anlamıyla eşleştirilir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-inst-7','coktan_secmeli','“Close the door.” ne demektir?','["Kapıyı kapat.","Kapıyı aç.","Pencereyi aç.","Ayağa kalk."]',0,'Classroom instruction doğru anlamıyla eşleştirilir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-inst-8','coktan_secmeli','“Be quiet, please.” ne demektir?','["Daha yüksek konuş.","Koş.","Sessiz ol, lütfen.","Şarkı söyle."]',2,'Classroom instruction doğru anlamıyla eşleştirilir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-inst-9','coktan_secmeli','“Repeat after me.” ne demektir?','["Benden sonra tekrar et.","Beni bekle.","Beni takip et.","Defterini getir."]',0,'Classroom instruction doğru anlamıyla eşleştirilir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-inst-10','coktan_secmeli','“Match the pictures.” ne demektir?','["Resimleri boya.","Resimleri kes.","Resimleri eşleştir.","Resimleri sakla."]',2,'Classroom instruction doğru anlamıyla eşleştirilir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-inst-11','coktan_secmeli','“Circle the correct answer.” ne demektir?','["Doğru cevabı yuvarlak içine al.","Yanlış cevabı sil.","Kitabı kapat.","Soruyu atla."]',0,'Classroom instruction doğru anlamıyla eşleştirilir.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-inst-12','coktan_secmeli','“Take out your book.” ne demektir?','["Kitabını sakla.","Kitabını yırt.","Kitabını çıkar.","Kitabı eve götür."]',2,'Classroom instruction doğru anlamıyla eşleştirilir.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-inst-13','coktan_secmeli','Öğretmen “Don''t run.” diyor. Ne yapmamalısın?','["Koşmamalısın.","Oturmamalısın.","Dinlememelisin.","Okumamalısın."]',0,'Classroom instruction doğru anlamıyla eşleştirilir.',2,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-inst-14','coktan_secmeli','“You must listen to your teacher.” ne demektir?','["Öğretmeni dinlememelisin.","Okuldan çıkmalısın.","Öğretmenini dinlemelisin.","Yemek yemelisin."]',2,'Classroom instruction doğru anlamıyla eşleştirilir.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-object-1','coktan_secmeli','“desk” ne demektir?','["sandalye","projeksiyon cihazı","sıra/masa","bilgisayar"]',2,'desk, sıra/masa anlamındadır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-classroom-objects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-object-2','coktan_secmeli','“chair” ne demektir?','["sandalye","tahta","tablet","cetvel"]',0,'chair, sandalye anlamındadır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-classroom-objects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-object-3','coktan_secmeli','“board” ne demektir?','["projeksiyon cihazı","bilgisayar","tahta","silgi"]',2,'board, tahta anlamındadır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-classroom-objects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-object-4','coktan_secmeli','“projector” ne demektir?','["projeksiyon cihazı","tablet","cetvel","defter"]',0,'projector, projeksiyon cihazı anlamındadır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-classroom-objects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-object-5','coktan_secmeli','“tablet” ne demektir?','["bilgisayar","silgi","tablet","sözlük"]',2,'tablet, tablet anlamındadır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-classroom-objects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-object-6','coktan_secmeli','“computer” ne demektir?','["bilgisayar","cetvel","defter","sıra/masa"]',0,'computer, bilgisayar anlamındadır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-classroom-objects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-object-7','coktan_secmeli','“ruler” ne demektir?','["silgi","sözlük","cetvel","sandalye"]',2,'ruler, cetvel anlamındadır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-classroom-objects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-object-8','coktan_secmeli','“eraser” ne demektir?','["silgi","defter","sıra/masa","tahta"]',0,'eraser, silgi anlamındadır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-classroom-objects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-object-9','coktan_secmeli','“notebook” ne demektir?','["sözlük","sandalye","defter","projeksiyon cihazı"]',2,'notebook, defter anlamındadır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-classroom-objects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-object-10','coktan_secmeli','“dictionary” ne demektir?','["sözlük","sıra/masa","tahta","tablet"]',0,'dictionary, sözlük anlamındadır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-classroom-objects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-object-context-1','coktan_secmeli','Which device can show an image on a screen?','["eraser","ruler","chair","projector"]',3,'Classroom furniture, objects and devices bağlamı.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-classroom-objects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-object-context-2','coktan_secmeli','Which object helps you find word meanings?','["desk","dictionary","board","schoolbag"]',1,'Classroom furniture, objects and devices bağlamı.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-classroom-objects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-object-context-3','coktan_secmeli','“The tablet is on the desk.” ne demektir?','["Tablet masanın altında.","Tablet çantada.","Masa tabletin üstünde.","Tablet masanın üstünde."]',3,'Classroom furniture, objects and devices bağlamı.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-classroom-objects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-object-context-4','coktan_secmeli','“There are two computers.” ne demektir?','["Bir bilgisayar var.","İki bilgisayar var.","Bilgisayar yok.","İki tahta var."]',1,'Classroom furniture, objects and devices bağlamı.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-classroom-objects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-object-context-5','coktan_secmeli','Which object do you use to measure a line?','["eraser","chair","projector","ruler"]',3,'Classroom furniture, objects and devices bağlamı.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-classroom-objects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-subject-1','coktan_secmeli','“Maths” ne demektir?','["Fen Bilimleri","Matematik","İngilizce","Görsel Sanatlar"]',1,'Maths, Matematik anlamındadır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-subjects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-subject-2','coktan_secmeli','“Science” ne demektir?','["Türkçe","Müzik","Beden Eğitimi","Fen Bilimleri"]',3,'Science, Fen Bilimleri anlamındadır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-subjects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-subject-3','coktan_secmeli','“Turkish” ne demektir?','["İngilizce","Türkçe","Görsel Sanatlar","Matematik"]',1,'Turkish, Türkçe anlamındadır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-subjects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-subject-4','coktan_secmeli','“English” ne demektir?','["Müzik","Beden Eğitimi","Fen Bilimleri","İngilizce"]',3,'English, İngilizce anlamındadır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-subjects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-subject-5','coktan_secmeli','“Music” ne demektir?','["Görsel Sanatlar","Müzik","Matematik","Türkçe"]',1,'Music, Müzik anlamındadır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-subjects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-subject-6','coktan_secmeli','“Art” ne demektir?','["Beden Eğitimi","Fen Bilimleri","İngilizce","Görsel Sanatlar"]',3,'Art, Görsel Sanatlar anlamındadır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-subjects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-subject-7','coktan_secmeli','“Physical Education” ne demektir?','["Matematik","Beden Eğitimi","Türkçe","Müzik"]',1,'Physical Education, Beden Eğitimi anlamındadır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-subjects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-subject-context-1','coktan_secmeli','“I like Maths.” ne demektir?','["Matematik zorunlu değil.","Müzik seviyorum.","Matematik dersim yok.","Matematiği seviyorum."]',3,'School subjects ve preference bağlamı.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-subjects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-subject-context-2','coktan_secmeli','Which subject is about numbers and calculations?','["Music","Maths","Art","English"]',1,'School subjects ve preference bağlamı.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-subjects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-subject-context-3','coktan_secmeli','Which subject can include experiments about nature?','["Music","Art","PE","Science"]',3,'School subjects ve preference bağlamı.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-subjects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-subject-context-4','coktan_secmeli','Which subject includes songs and rhythm?','["Maths","Music","Science","Turkish"]',1,'School subjects ve preference bağlamı.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-subjects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-subject-context-5','coktan_secmeli','Which subject includes drawing and painting?','["English","Maths","Science","Art"]',3,'School subjects ve preference bağlamı.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-subjects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-subject-context-6','coktan_secmeli','Which subject includes physical games and movement?','["Maths","Physical Education","Turkish","Art"]',1,'School subjects ve preference bağlamı.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-subjects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-subject-context-7','coktan_secmeli','“My favourite subject is English.” ne demektir?','["İngilizceyi sevmiyorum.","İngilizce öğretmeniyim.","Bugün İngilizce yok.","En sevdiğim ders İngilizce."]',3,'School subjects ve preference bağlamı.',1,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-school-subjects' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-season-1','coktan_secmeli','“spring” ne demektir?','["yaz","kış","sonbahar","ilkbahar"]',3,'spring, ilkbahar anlamındadır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-seasons' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-season-2','coktan_secmeli','“summer” ne demektir?','["sonbahar","yaz","ilkbahar","kış"]',1,'summer, yaz anlamındadır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-seasons' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-season-3','coktan_secmeli','“autumn” ne demektir?','["kış","yaz","ilkbahar","sonbahar"]',3,'autumn, sonbahar anlamındadır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-seasons' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-season-4','coktan_secmeli','“winter” ne demektir?','["ilkbahar","kış","sonbahar","yaz"]',1,'winter, kış anlamındadır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-seasons' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-season-context-1','coktan_secmeli','It is usually hot in __.','["summer","winter","autumn","spring"]',0,'Seasons of the year bağlamı.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-seasons' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-season-context-2','coktan_secmeli','It can be snowy in __.','["summer","spring","winter","autumn"]',2,'Seasons of the year bağlamı.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-seasons' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-season-context-3','coktan_secmeli','Flowers often grow in __.','["spring","winter","autumn","night"]',0,'Seasons of the year bağlamı.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-seasons' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-season-context-4','coktan_secmeli','Leaves can fall in __.','["summer","spring","autumn","morning"]',2,'Seasons of the year bağlamı.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-seasons' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-season-context-5','coktan_secmeli','Which season comes after spring?','["summer","winter","autumn","spring"]',0,'Seasons of the year bağlamı.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-seasons' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-season-context-6','coktan_secmeli','Which season comes after autumn?','["summer","spring","winter","autumn"]',2,'Seasons of the year bağlamı.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-seasons' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-season-context-7','coktan_secmeli','“It is cold in winter.” ne demektir?','["Kışın hava soğuktur.","Yazın hava soğuktur.","Kış sıcak bir derstir.","Kış bir ay adıdır."]',0,'Seasons of the year bağlamı.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-seasons' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-season-context-8','coktan_secmeli','“My favourite season is spring.” ne demektir?','["İlkbaharı sevmiyorum.","En sevdiğim ay Ocak.","En sevdiğim mevsim ilkbahar.","Hava yağmurlu."]',2,'Seasons of the year bağlamı.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-seasons' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-body-1','coktan_secmeli','“head” ne demektir?','["gözler","burun","kollar","baş"]',3,'head, baş anlamındadır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-body-features' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-body-2','coktan_secmeli','“eyes” ne demektir?','["kulaklar","gözler","ağız","bacaklar"]',1,'eyes, gözler anlamındadır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-body-features' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-body-3','coktan_secmeli','“ears” ne demektir?','["burun","kollar","saç","kulaklar"]',3,'ears, kulaklar anlamındadır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-body-features' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-body-4','coktan_secmeli','“nose” ne demektir?','["ağız","burun","bacaklar","baş"]',1,'nose, burun anlamındadır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-body-features' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-body-5','coktan_secmeli','“mouth” ne demektir?','["kollar","saç","gözler","ağız"]',3,'mouth, ağız anlamındadır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-body-features' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-body-6','coktan_secmeli','“arms” ne demektir?','["bacaklar","kollar","baş","kulaklar"]',1,'arms, kollar anlamındadır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-body-features' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-body-7','coktan_secmeli','“legs” ne demektir?','["saç","gözler","burun","bacaklar"]',3,'legs, bacaklar anlamındadır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-body-features' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-body-8','coktan_secmeli','“hair” ne demektir?','["baş","saç","kulaklar","ağız"]',1,'hair, saç anlamındadır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-body-features' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-feature-1','coktan_secmeli','“She has blue eyes.” ne demektir?','["Onun mavi saçı var.","O mavi giyiyor.","Onun mavi gözleri var.","O üzgün."]',2,'Body parts and physical features bağlamı.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-body-features' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-feature-2','coktan_secmeli','“He has short hair.” ne demektir?','["Onun kısa saçı var.","O kısa boylu.","Onun saçı yok.","O yaşlı."]',0,'Body parts and physical features bağlamı.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-body-features' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-feature-3','coktan_secmeli','“tall” ne demektir?','["kısa boylu","genç","uzun boylu","utangaç"]',2,'Body parts and physical features bağlamı.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-body-features' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-feature-4','coktan_secmeli','“short” fiziksel özellik olarak ne demektir?','["kısa boylu","uzun boylu","yardımsever","neşeli"]',0,'Body parts and physical features bağlamı.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-body-features' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-feature-5','coktan_secmeli','“curly hair” ne demektir?','["düz saç","uzun kol","kıvırcık saç","mavi göz"]',2,'Body parts and physical features bağlamı.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-body-features' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-feature-6','coktan_secmeli','“long hair” ne demektir?','["uzun saç","kısa saç","uzun boy","uzun kol"]',0,'Body parts and physical features bağlamı.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-body-features' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-char-1','coktan_secmeli','“kind” ne demektir?','["yardımsever","nazik/iyi kalpli","komik","çalışkan"]',1,'kind, nazik/iyi kalpli anlamındadır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-character' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-char-2','coktan_secmeli','“helpful” ne demektir?','["arkadaş canlısı","utangaç","nazik/iyi kalpli","yardımsever"]',3,'helpful, yardımsever anlamındadır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-character' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-char-3','coktan_secmeli','“friendly” ne demektir?','["komik","arkadaş canlısı","çalışkan","yardımsever"]',1,'friendly, arkadaş canlısı anlamındadır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-character' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-char-4','coktan_secmeli','“funny” ne demektir?','["utangaç","nazik/iyi kalpli","arkadaş canlısı","komik"]',3,'funny, komik anlamındadır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-character' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-char-5','coktan_secmeli','“shy” ne demektir?','["çalışkan","utangaç","yardımsever","komik"]',1,'shy, utangaç anlamındadır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-character' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-char-6','coktan_secmeli','“hard-working” ne demektir?','["nazik/iyi kalpli","arkadaş canlısı","utangaç","çalışkan"]',3,'hard-working, çalışkan anlamındadır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-character' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-char-context-1','coktan_secmeli','A person who helps friends is __.','["shy","lazy","helpful","angry"]',2,'Personal character vocabulary kullanılır.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-character' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-char-context-2','coktan_secmeli','A person who is nice to others can be __.','["kind","rude","sleepy","hungry"]',0,'Personal character vocabulary kullanılır.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-character' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-char-context-3','coktan_secmeli','“My friend is funny.” ne demektir?','["Arkadaşım üzgün.","Arkadaşım uzun boylu.","Arkadaşım komik.","Arkadaşım aç."]',2,'Personal character vocabulary kullanılır.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-character' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-char-context-4','coktan_secmeli','“She is hard-working.” ne demektir?','["O çalışkan.","O uykulu.","O kısa boylu.","O yağmurlu."]',0,'Personal character vocabulary kullanılır.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-character' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-char-context-5','coktan_secmeli','“He is shy.” ne demektir?','["O kızgın.","O yaşlı.","O utangaç.","O aç."]',2,'Personal character vocabulary kullanılır.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-character' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-char-context-6','coktan_secmeli','Which word describes a person who makes friends easily?','["friendly","snowy","wooden","hungry"]',0,'Personal character vocabulary kullanılır.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-character' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-weather-1','coktan_secmeli','“sunny” ne demektir?','["yağmurlu","güneşli","rüzgârlı","fırtınalı"]',1,'sunny, güneşli anlamındadır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-weather' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-weather-2','coktan_secmeli','“rainy” ne demektir?','["karlı","bulutlu","güneşli","yağmurlu"]',3,'rainy, yağmurlu anlamındadır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-weather' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-weather-3','coktan_secmeli','“snowy” ne demektir?','["rüzgârlı","karlı","fırtınalı","yağmurlu"]',1,'snowy, karlı anlamındadır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-weather' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-weather-4','coktan_secmeli','“windy” ne demektir?','["bulutlu","güneşli","karlı","rüzgârlı"]',3,'windy, rüzgârlı anlamındadır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-weather' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-weather-5','coktan_secmeli','“cloudy” ne demektir?','["fırtınalı","bulutlu","yağmurlu","rüzgârlı"]',1,'cloudy, bulutlu anlamındadır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-weather' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-weather-6','coktan_secmeli','“stormy” ne demektir?','["güneşli","karlı","bulutlu","fırtınalı"]',3,'stormy, fırtınalı anlamındadır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-weather' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-weather-context-1','coktan_secmeli','“What''s the weather like?” neyi sorar?','["Yaşı","Ders adını","Hava durumunu","Aileyi"]',2,'Weather condition bağlamı.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-weather' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-weather-context-2','coktan_secmeli','Take an umbrella. It is __.','["rainy","sunny","dry","hot"]',0,'Weather condition bağlamı.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-weather' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-weather-context-3','coktan_secmeli','Wear a warm coat. It is __.','["hot","sunny","cold","dry"]',2,'Weather condition bağlamı.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-weather' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-weather-context-4','coktan_secmeli','“It is cloudy today.” ne demektir?','["Bugün hava bulutlu.","Bugün kar yağıyor.","Bugün çok sıcak.","Bugün ders yok."]',0,'Weather condition bağlamı.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-weather' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-weather-context-5','coktan_secmeli','Strong wind can mean it is __.','["snowy","sunny","windy","quiet"]',2,'Weather condition bağlamı.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-weather' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-weather-context-6','coktan_secmeli','Dark clouds and thunder can mean it is __.','["stormy","sunny","dry","warm"]',0,'Weather condition bağlamı.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-weather' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-clothes-1','coktan_secmeli','“coat” ne demektir?','["botlar","kaban/mont","tişört","yağmurluk"]',1,'coat, kaban/mont anlamındadır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-season-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-clothes-2','coktan_secmeli','“boots” ne demektir?','["atkı","şort","kaban/mont","botlar"]',3,'boots, botlar anlamındadır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-season-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-clothes-3','coktan_secmeli','“scarf” ne demektir?','["tişört","atkı","yağmurluk","botlar"]',1,'scarf, atkı anlamındadır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-season-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-clothes-4','coktan_secmeli','“T-shirt” ne demektir?','["şort","kaban/mont","atkı","tişört"]',3,'T-shirt, tişört anlamındadır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-season-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-clothes-5','coktan_secmeli','“shorts” ne demektir?','["yağmurluk","şort","botlar","tişört"]',1,'shorts, şort anlamındadır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-season-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-clothes-6','coktan_secmeli','“raincoat” ne demektir?','["kaban/mont","atkı","şort","yağmurluk"]',3,'raincoat, yağmurluk anlamındadır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-season-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-clothes-context-1','coktan_secmeli','It is snowy and cold. What should you wear?','["shorts and sandals","a swimsuit","a coat and boots","a thin T-shirt only"]',2,'Clothing is related to seasons and weather.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-season-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-clothes-context-2','coktan_secmeli','It is rainy. Which item is useful?','["a raincoat","a swimsuit","shorts only","a sun hat only"]',0,'Clothing is related to seasons and weather.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-season-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-clothes-context-3','coktan_secmeli','It is hot in summer. Which is suitable?','["a thick coat","winter boots","a T-shirt and shorts","a scarf"]',2,'Clothing is related to seasons and weather.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-season-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-clothes-context-4','coktan_secmeli','“Wear your scarf.” ne demektir?','["Atkını tak.","Şortunu giy.","Şemsiyeni aç.","Ayakkabını çıkar."]',0,'Clothing is related to seasons and weather.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-season-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-clothes-context-5','coktan_secmeli','Clothes can change according to __.','["school subject only","age only","weather and season","month name only"]',2,'Clothing is related to seasons and weather.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-season-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-clothes-context-6','coktan_secmeli','Which clothes are suitable for winter?','["coat, scarf and boots","shorts, T-shirt and sandals","swimsuit and hat","only socks"]',0,'Clothing is related to seasons and weather.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-season-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-pref-1','coktan_secmeli','“I like my red T-shirt.” ne demektir?','["Kırmızı tişörtüm yok.","Kırmızı tişörtümü seviyorum.","Kırmızıdan nefret ediyorum.","Tişört kırık."]',1,'Simple clothing preferences are expressed with like/don''t like/prefer.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-clothing-preferences' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-pref-2','coktan_secmeli','“I don''t like boots.” ne demektir?','["Botları seviyorum.","Botlarım yeni.","Botlar siyah.","Botları sevmiyorum."]',3,'Simple clothing preferences are expressed with like/don''t like/prefer.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-clothing-preferences' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-pref-3','coktan_secmeli','Which question asks about clothing preference?','["How old are you?","What do you like to wear?","Where is the library?","What''s the weather like?"]',1,'Simple clothing preferences are expressed with like/don''t like/prefer.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-clothing-preferences' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-pref-4','coktan_secmeli','“My favourite colour is blue.” ne demektir?','["Mavi giymem.","Hava mavi.","Mavi bir mevsimdir.","En sevdiğim renk mavi."]',3,'Simple clothing preferences are expressed with like/don''t like/prefer.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-clothing-preferences' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-pref-5','coktan_secmeli','“I prefer the green dress.” neye yakındır?','["Yeşil elbiseyi satıyorum.","Yeşil elbiseyi tercih ederim.","Yeşil elbise küçük.","Elbise yeşil değil."]',1,'Simple clothing preferences are expressed with like/don''t like/prefer.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-clothing-preferences' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-pref-6','coktan_secmeli','A: Do you like this hat? B: Yes, I do. B ne anlatıyor?','["Şapkayı sevmediğini","Şapkayı kaybettiğini","Şapkanın fiyatını","Şapkayı sevdiğini"]',3,'Simple clothing preferences are expressed with like/don''t like/prefer.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-clothing-preferences' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-pref-7','coktan_secmeli','A: Do you like this coat? B: No, I don''t. Ne anlama gelir?','["Kabanı sevdiğini","Kabanı sevmediğini","Kabanı aldığını","Kabanın rengini"]',1,'Simple clothing preferences are expressed with like/don''t like/prefer.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-clothing-preferences' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-pref-8','coktan_secmeli','Which sentence is a preference?','["The shoes are under the bed.","It is Monday.","I am nine.","I like blue shoes."]',3,'Simple clothing preferences are expressed with like/don''t like/prefer.',2,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-clothing-preferences' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-pref-9','coktan_secmeli','“I like skirts, but I don''t like shorts.” ne anlatır?','["İkisini de sevdiğini","Etek sevip şort sevmediğini","İkisini de sevmediğini","Hava durumunu"]',1,'Simple clothing preferences are expressed with like/don''t like/prefer.',2,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-clothing-preferences' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-pref-10','coktan_secmeli','Preferences can be different between people. Doğru mu?','["Hayır","Sadece renklerde","Sadece mevsimlerde","Evet"]',3,'Simple clothing preferences are expressed with like/don''t like/prefer.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-clothing-preferences' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-1','coktan_secmeli','“mother” ne demektir?','["baba","erkek kardeş","büyükbaba","anne"]',3,'mother, anne anlamındadır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-members' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-2','coktan_secmeli','“father” ne demektir?','["kız kardeş","baba","büyükanne","teyze/hala"]',1,'father, baba anlamındadır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-members' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-3','coktan_secmeli','“sister” ne demektir?','["erkek kardeş","büyükbaba","amca/dayı","kız kardeş"]',3,'sister, kız kardeş anlamındadır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-members' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-4','coktan_secmeli','“brother” ne demektir?','["büyükanne","erkek kardeş","teyze/hala","anne"]',1,'brother, erkek kardeş anlamındadır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-members' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-5','coktan_secmeli','“grandmother” ne demektir?','["büyükbaba","amca/dayı","baba","büyükanne"]',3,'grandmother, büyükanne anlamındadır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-members' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-6','coktan_secmeli','“grandfather” ne demektir?','["teyze/hala","büyükbaba","anne","kız kardeş"]',1,'grandfather, büyükbaba anlamındadır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-members' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-7','coktan_secmeli','“aunt” ne demektir?','["amca/dayı","baba","erkek kardeş","teyze/hala"]',3,'aunt, teyze/hala anlamındadır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-members' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-8','coktan_secmeli','“uncle” ne demektir?','["anne","amca/dayı","kız kardeş","büyükanne"]',1,'uncle, amca/dayı anlamındadır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-members' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-context-1','coktan_secmeli','My mother''s sister is my __.','["uncle","brother","aunt","grandfather"]',2,'Family relation vocabulary kullanılır.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-members' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-context-2','coktan_secmeli','My father''s brother is my __.','["uncle","aunt","sister","grandmother"]',0,'Family relation vocabulary kullanılır.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-members' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-context-3','coktan_secmeli','“This is my grandmother.” ne demektir?','["Bu benim annem.","Bu benim teyzem.","Bu benim büyükannem.","Bu benim kardeşim."]',2,'Family relation vocabulary kullanılır.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-members' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-context-4','coktan_secmeli','“He is my grandfather.” ne demektir?','["O benim büyükbabam.","O benim amcam.","O benim babam.","O benim kardeşim."]',0,'Family relation vocabulary kullanılır.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-members' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-age-1','coktan_secmeli','“My sister is eleven.” ne demektir?','["Kız kardeşim on birinci sınıfta.","On bir kız kardeşim var.","Kardeşim saat on birde.","Kız kardeşim on bir yaşında."]',3,'Family ages context.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-ages' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-age-2','coktan_secmeli','How old is your mother? neyi sorar?','["Annenin adını","Annenin yaşını","Mesleğini","Hobisini"]',1,'Family ages context.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-ages' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-age-3','coktan_secmeli','“My grandfather is sixty.” ne demektir?','["Büyükbabam altmış kitap okur.","Saat altmış.","Altmış büyükbabam var.","Büyükbabam altmış yaşında."]',3,'Family ages context.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-ages' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-age-4','coktan_secmeli','“She is thirty-five.” yaş bağlamında ne demektir?','["O 35 numaralı evde.","O otuz beş yaşında.","35 kalemi var.","Saat 35."]',1,'Family ages context.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-ages' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-age-5','coktan_secmeli','A: How old is your brother? B: He is twelve. Kardeş kaç yaşında?','["10","11","13","12"]',3,'Family ages context.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-ages' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-age-6','coktan_secmeli','Age means __.','["isim","yaş","meslek","hobi"]',1,'Family ages context.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-ages' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-age-7','coktan_secmeli','“My parents are adults.” neye yakındır?','["Anne-babam çocuk.","Anne-babam okulda.","Anne-babam öğretmen zorunlu.","Anne-babam yetişkin."]',3,'Family ages context.',2,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-ages' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-age-8','coktan_secmeli','Which question asks an age?','["Who is she?","How old is she?","Where is she?","What can she do?"]',1,'Family ages context.',2,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-ages' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-age-9','coktan_secmeli','“I am younger than my sister.” ne demektir?','["Kız kardeşimden daha büyüğüm.","Aynı yaştayız.","Kardeşim yok.","Kız kardeşimden daha küçüğüm."]',3,'Family ages context.',2,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-ages' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-family-age-10','coktan_secmeli','“My brother is older than me.” ne demektir?','["Benden daha küçük.","Erkek kardeşim benden daha büyük.","Aynı yaşta.","Kardeşim öğretmen."]',1,'Family ages context.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-family-ages' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-chore-1','coktan_secmeli','“tidy my room” ne demektir?','["sofrayı hazırlamak","odamı toplamak","akşam yemeği pişirmek","yatağı toplamak"]',1,'tidy my room, odamı toplamak anlamındadır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-routines-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-chore-2','coktan_secmeli','“set the table” ne demektir?','["bulaşıkları yıkamak","evcil hayvanı beslemek","odamı toplamak","sofrayı hazırlamak"]',3,'set the table, sofrayı hazırlamak anlamındadır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-routines-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-chore-3','coktan_secmeli','“wash the dishes” ne demektir?','["akşam yemeği pişirmek","bulaşıkları yıkamak","yatağı toplamak","sofrayı hazırlamak"]',1,'wash the dishes, bulaşıkları yıkamak anlamındadır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-routines-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-chore-4','coktan_secmeli','“cook dinner” ne demektir?','["evcil hayvanı beslemek","odamı toplamak","bulaşıkları yıkamak","akşam yemeği pişirmek"]',3,'cook dinner, akşam yemeği pişirmek anlamındadır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-routines-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-chore-5','coktan_secmeli','“feed the pet” ne demektir?','["yatağı toplamak","evcil hayvanı beslemek","sofrayı hazırlamak","akşam yemeği pişirmek"]',1,'feed the pet, evcil hayvanı beslemek anlamındadır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-routines-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-chore-6','coktan_secmeli','“make the bed” ne demektir?','["odamı toplamak","bulaşıkları yıkamak","evcil hayvanı beslemek","yatağı toplamak"]',3,'make the bed, yatağı toplamak anlamındadır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-routines-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-chore-context-1','coktan_secmeli','“I tidy my room every day.” ne demektir?','["Her gün yemek yaparım.","Her gün okula gitmem.","Her gün odamı toplarım.","Odamı hiç toplamam."]',2,'Daily routines and chores context.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-routines-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-chore-context-2','coktan_secmeli','“Dad cooks dinner.” ne demektir?','["Babam akşam yemeğini pişirir.","Babam sofrayı toplar.","Babam uyur.","Babam okula gider."]',0,'Daily routines and chores context.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-routines-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-chore-context-3','coktan_secmeli','Which is a chore?','["play a game","watch clouds","set the table","have blue eyes"]',2,'Daily routines and chores context.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-routines-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-chore-context-4','coktan_secmeli','“She feeds the cat.” ne demektir?','["O kediyi besler.","O kediyle uyur.","O kediyi çizer.","O kediyi görmez."]',0,'Daily routines and chores context.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-routines-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-chore-context-5','coktan_secmeli','A routine is something you __.','["never do","only dream","do regularly","cannot describe"]',2,'Daily routines and chores context.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-routines-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-chore-context-6','coktan_secmeli','“We share chores at home.” ne demektir?','["Ev işlerini paylaşırız.","Ev işi yapmayız.","Sadece bir kişi çalışır.","Evde yaşamayız."]',0,'Daily routines and chores context.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-routines-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-chore-context-7','coktan_secmeli','Which sentence shows a daily routine?','["It is rainy.","My bag is blue.","I get up at seven.","This is a farm."]',2,'Daily routines and chores context.',1,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-routines-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-chore-context-8','coktan_secmeli','“Mum washes the dishes.” hangi ev işi?','["bulaşıkları yıkamak","odanın toplanması","hayvan beslemek","alışveriş yapmak"]',0,'Daily routines and chores context.',1,27,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-routines-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-hobby-1','coktan_secmeli','“swim” ne demektir?','["bisiklete binmek","resim çizmek","kitap okumak","yüzmek"]',3,'swim, yüzmek anlamındadır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-hobbies-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-hobby-2','coktan_secmeli','“ride a bike” ne demektir?','["satranç oynamak","bisiklete binmek","şarkı söylemek","yüzmek"]',1,'ride a bike, bisiklete binmek anlamındadır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-hobbies-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-hobby-3','coktan_secmeli','“play chess” ne demektir?','["resim çizmek","kitap okumak","bisiklete binmek","satranç oynamak"]',3,'play chess, satranç oynamak anlamındadır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-hobbies-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-hobby-4','coktan_secmeli','“draw pictures” ne demektir?','["şarkı söylemek","resim çizmek","yüzmek","satranç oynamak"]',1,'draw pictures, resim çizmek anlamındadır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-hobbies-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-hobby-5','coktan_secmeli','“sing songs” ne demektir?','["kitap okumak","bisiklete binmek","resim çizmek","şarkı söylemek"]',3,'sing songs, şarkı söylemek anlamındadır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-hobbies-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-hobby-6','coktan_secmeli','“read books” ne demektir?','["yüzmek","kitap okumak","satranç oynamak","şarkı söylemek"]',1,'read books, kitap okumak anlamındadır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-hobbies-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-ability-1','coktan_secmeli','“I can swim.” ne demektir?','["Yüzebilirim.","Yüzemem.","Koşabilirim.","Yüzmeyi sevmem."]',0,'Hobbies and abilities context.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-hobbies-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-ability-2','coktan_secmeli','“She can''t ride a bike.” ne demektir?','["O bisiklete binebilir.","O bisikleti sever.","O bisiklete binemez.","O bisiklet alır."]',2,'Hobbies and abilities context.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-hobbies-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-ability-3','coktan_secmeli','Which question asks about ability?','["Can you swim?","How old are you?","Where is the farm?","What is the weather like?"]',0,'Hobbies and abilities context.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-hobbies-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-ability-4','coktan_secmeli','A hobby is an activity you __.','["must do as a punishment","use as weather","enjoy doing in free time","wear in winter"]',2,'Hobbies and abilities context.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-hobbies-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-ability-5','coktan_secmeli','“My hobby is drawing.” ne demektir?','["Hobim resim çizmek.","Mesleğim ressam.","Resim çizemem.","Hobim yüzmek."]',0,'Hobbies and abilities context.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-hobbies-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-ability-6','coktan_secmeli','A: Can he play chess? B: Yes, he can. Ne anlatır?','["Oynayamadığını","Satranç sevmediğini","Satranç oynayabildiğini","Satranç olmadığını"]',2,'Hobbies and abilities context.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-hobbies-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-ability-7','coktan_secmeli','“We like reading books.” ne demektir?','["Kitap okumayı severiz.","Kitap okumayız.","Kitap yazmak zorundayız.","Kitaplarımız kayıp."]',0,'Hobbies and abilities context.',1,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-hobbies-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-ability-8','coktan_secmeli','Which is an ability?','["is rainy","is nine years old","can sing","is in May"]',2,'Hobbies and abilities context.',1,27,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-hobbies-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-country-1','coktan_secmeli','“village” ne demektir?','["tarla","köy","ahır","kırsal bölge"]',1,'village, köy anlamındadır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-countryside' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-country-2','coktan_secmeli','“field” ne demektir?','["bahçe","nehir","köy","tarla"]',3,'field, tarla anlamındadır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-countryside' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-country-3','coktan_secmeli','“garden” ne demektir?','["ahır","bahçe","kırsal bölge","tarla"]',1,'garden, bahçe anlamındadır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-countryside' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-country-4','coktan_secmeli','“barn” ne demektir?','["nehir","köy","bahçe","ahır"]',3,'barn, ahır anlamındadır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-countryside' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-country-5','coktan_secmeli','“river” ne demektir?','["kırsal bölge","nehir","tarla","ahır"]',1,'river, nehir anlamındadır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-countryside' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-country-6','coktan_secmeli','“countryside” ne demektir?','["köy","bahçe","nehir","kırsal bölge"]',3,'countryside, kırsal bölge anlamındadır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-countryside' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-country-context-1','coktan_secmeli','“I live in a village.” ne demektir?','["Bir şehirde yaşıyorum.","Bir çiftlikte çalışıyorum.","Bir köyde yaşıyorum.","Köye gitmiyorum."]',2,'Life in the countryside context.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-countryside' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-country-context-2','coktan_secmeli','Which place can have crops?','["field","classroom","canteen","library"]',0,'Life in the countryside context.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-countryside' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-country-context-3','coktan_secmeli','“There is a river near the village.” ne demektir?','["Köyde nehir yok.","Nehir okulda.","Köyün yakınında bir nehir var.","Köy bir nehirdir."]',2,'Life in the countryside context.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-countryside' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-country-context-4','coktan_secmeli','Countryside is usually related to __.','["villages and fields","only skyscrapers","only airports","classrooms"]',0,'Life in the countryside context.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-countryside' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-country-context-5','coktan_secmeli','Which one is a countryside place?','["shopping mall only","classroom","farm","sports hall"]',2,'Life in the countryside context.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-countryside' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-country-context-6','coktan_secmeli','“The garden is behind the house.” ne demektir?','["Bahçe evin arkasında.","Bahçe evin önünde.","Ev bahçenin içinde.","Bahçe okulda."]',0,'Life in the countryside context.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-countryside' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-animal-1','coktan_secmeli','“cow” ne demektir?','["koyun","inek","tavuk","ördek"]',1,'cow, inek anlamındadır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-animals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-animal-2','coktan_secmeli','“sheep” ne demektir?','["at","keçi","çiftlik evi","koyun"]',3,'sheep, koyun anlamındadır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-animals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-animal-3','coktan_secmeli','“horse” ne demektir?','["tavuk","at","ördek","ahır"]',1,'horse, at anlamındadır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-animals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-animal-4','coktan_secmeli','“chicken” ne demektir?','["keçi","çiftlik evi","inek","tavuk"]',3,'chicken, tavuk anlamındadır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-animals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-animal-5','coktan_secmeli','“goat” ne demektir?','["ördek","keçi","ahır","koyun"]',1,'goat, keçi anlamındadır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-animals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-animal-6','coktan_secmeli','“duck” ne demektir?','["çiftlik evi","inek","at","ördek"]',3,'duck, ördek anlamındadır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-animals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-animal-7','coktan_secmeli','“farmhouse” ne demektir?','["ahır","çiftlik evi","koyun","tavuk"]',1,'farmhouse, çiftlik evi anlamındadır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-animals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-animal-8','coktan_secmeli','“barn” ne demektir?','["inek","at","keçi","ahır"]',3,'barn, ahır anlamındadır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-animals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-animal-context-1','coktan_secmeli','Which animal can give us milk?','["cow","chicken","duck","horse"]',0,'Farmhouses and farm animals context.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-animals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-animal-context-2','coktan_secmeli','Which animal can lay eggs?','["cow","horse","chicken","sheep"]',2,'Farmhouses and farm animals context.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-animals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-animal-context-3','coktan_secmeli','“The horses are in the field.” ne demektir?','["Atlar tarlada.","Atlar ahırda.","İnekler tarlada.","Atlar okulda."]',0,'Farmhouses and farm animals context.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-animals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-animal-context-4','coktan_secmeli','“There are three sheep.” ne demektir?','["Üç inek var.","Koyun yok.","Üç koyun var.","Bir koyun var."]',2,'Farmhouses and farm animals context.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-animals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-animal-context-5','coktan_secmeli','Farm animals should be __.','["treated with care","hurt","left without water","frightened"]',0,'Farmhouses and farm animals context.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-animals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-animal-context-6','coktan_secmeli','A barn is a place for __.','["school lessons","city buses","farm animals or farm storage","libraries"]',2,'Farmhouses and farm animals context.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-animals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-chore-1','coktan_secmeli','“feed the animals” ne demektir?','["yumurtaları toplamak","ahırı temizlemek","ineği sağmak","hayvanları beslemek"]',3,'feed the animals, hayvanları beslemek anlamındadır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-chore-2','coktan_secmeli','“collect eggs” ne demektir?','["bitkileri sulamak","yumurtaları toplamak","sebze toplamak","hayvanları beslemek"]',1,'collect eggs, yumurtaları toplamak anlamındadır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-chore-3','coktan_secmeli','“water the plants” ne demektir?','["ahırı temizlemek","ineği sağmak","yumurtaları toplamak","bitkileri sulamak"]',3,'water the plants, bitkileri sulamak anlamındadır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-chore-4','coktan_secmeli','“clean the barn” ne demektir?','["sebze toplamak","ahırı temizlemek","hayvanları beslemek","bitkileri sulamak"]',1,'clean the barn, ahırı temizlemek anlamındadır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-chore-5','coktan_secmeli','“pick vegetables” ne demektir?','["ineği sağmak","yumurtaları toplamak","ahırı temizlemek","sebze toplamak"]',3,'pick vegetables, sebze toplamak anlamındadır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-chore-6','coktan_secmeli','“milk the cow” ne demektir?','["hayvanları beslemek","ineği sağmak","bitkileri sulamak","sebze toplamak"]',1,'milk the cow, ineği sağmak anlamındadır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-chore-context-1','coktan_secmeli','“We feed the animals every morning.” ne demektir?','["Her sabah hayvanları besleriz.","Her sabah uyuruz.","Hayvanları hiç beslemeyiz.","Her sabah okula gitmeyiz."]',0,'Activities and chores on a farm context.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-chore-context-2','coktan_secmeli','Which chore helps plants?','["collect eggs","clean the barn","water the plants","milk the cow"]',2,'Activities and chores on a farm context.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-chore-context-3','coktan_secmeli','Which chore is about eggs?','["collect eggs","water plants","feed a horse","pick apples"]',0,'Activities and chores on a farm context.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-chore-context-4','coktan_secmeli','“They clean the barn.” ne demektir?','["Ahırı boyarlar.","Ahırda uyurlar.","Ahırı temizlerler.","Ahırı kapatırlar."]',2,'Activities and chores on a farm context.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-chore-context-5','coktan_secmeli','Farm chores should be done __.','["safely and responsibly","carelessly","without water for animals","by hurting animals"]',0,'Activities and chores on a farm context.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-farm-chore-context-6','coktan_secmeli','“I pick tomatoes in the garden.” ne demektir?','["Bahçede domates ekerim kesin.","Domates yemem.","Bahçede domates toplarım.","Bahçe yok."]',2,'Activities and chores on a farm context.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-farm-chores' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-food-1','coktan_secmeli','“bread” ne demektir?','["peynir","süt","pirinç/pilav","ekmek"]',3,'bread, ekmek anlamındadır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-food-meals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-food-2','coktan_secmeli','“cheese” ne demektir?','["yumurta","peynir","çorba","salata"]',1,'cheese, peynir anlamındadır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-food-meals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-food-3','coktan_secmeli','“egg” ne demektir?','["süt","pirinç/pilav","su","yumurta"]',3,'egg, yumurta anlamındadır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-food-meals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-food-4','coktan_secmeli','“milk” ne demektir?','["çorba","süt","salata","kahvaltı"]',1,'milk, süt anlamındadır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-food-meals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-food-5','coktan_secmeli','“soup” ne demektir?','["pirinç/pilav","su","öğle yemeği","çorba"]',3,'soup, çorba anlamındadır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-food-meals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-food-6','coktan_secmeli','“rice” ne demektir?','["salata","pirinç/pilav","kahvaltı","akşam yemeği"]',1,'rice, pirinç/pilav anlamındadır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-food-meals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-food-7','coktan_secmeli','“salad” ne demektir?','["su","öğle yemeği","ekmek","salata"]',3,'salad, salata anlamındadır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-food-meals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-food-8','coktan_secmeli','“water” ne demektir?','["kahvaltı","su","akşam yemeği","peynir"]',1,'water, su anlamındadır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-food-meals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-food-9','coktan_secmeli','“breakfast” ne demektir?','["öğle yemeği","ekmek","yumurta","kahvaltı"]',3,'breakfast, kahvaltı anlamındadır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-food-meals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-food-10','coktan_secmeli','“lunch” ne demektir?','["akşam yemeği","öğle yemeği","peynir","süt"]',1,'lunch, öğle yemeği anlamındadır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-food-meals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-food-11','coktan_secmeli','“dinner” ne demektir?','["ekmek","yumurta","çorba","akşam yemeği"]',3,'dinner, akşam yemeği anlamındadır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-food-meals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-food-context-1','coktan_secmeli','“I have eggs for breakfast.” ne demektir?','["Akşam yumurta yerim.","Yumurta sevmem.","Kahvaltı yapmam.","Kahvaltıda yumurta yerim."]',3,'Food items and meals context.',1,30,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-food-meals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-food-context-2','coktan_secmeli','Which meal is usually in the morning?','["dinner","breakfast","lunch","snack only"]',1,'Food items and meals context.',1,31,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-food-meals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-food-context-3','coktan_secmeli','Which meal is usually around midday?','["breakfast","dinner","midnight","lunch"]',3,'Food items and meals context.',1,32,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-food-meals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-food-context-4','coktan_secmeli','Which is a drink?','["bread","water","rice","salad"]',1,'Food items and meals context.',1,33,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-food-meals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-food-context-5','coktan_secmeli','“I like soup.” ne demektir?','["Çorba istemem.","Çorba soğuk.","Çorba yok.","Çorbayı severim."]',3,'Food items and meals context.',1,34,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-food-meals' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-order-1','coktan_secmeli','“Can I have soup, please?” ne demektir?','["Çorbayı sevmiyorum.","Çorba nerede?","Çorba soğuk mu?","Çorba alabilir miyim, lütfen?"]',3,'Eating outside and ordering food context.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-ordering-food' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-order-2','coktan_secmeli','“I''d like some water, please.” neye yakındır?','["Su istemiyorum.","Biraz su istiyorum, lütfen.","Suyu dökün.","Su çok sıcak."]',1,'Eating outside and ordering food context.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-ordering-food' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-order-3','coktan_secmeli','A waiter asks “What would you like?” Ne soruyor?','["Yaşını","Adını","Hava durumunu","Ne istediğini"]',3,'Eating outside and ordering food context.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-ordering-food' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-order-4','coktan_secmeli','Sipariş sonunda hangi ifade naziktir?','["Go away.","Thank you.","No!","Be quiet!"]',1,'Eating outside and ordering food context.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-ordering-food' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-order-5','coktan_secmeli','“The bill, please.” ne demektir?','["Menü, lütfen.","Su, lütfen.","Masa, lütfen.","Hesap, lütfen."]',3,'Eating outside and ordering food context.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-ordering-food' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-order-6','coktan_secmeli','“menu” ne demektir?','["hesap","menü","masa","garson"]',1,'Eating outside and ordering food context.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-ordering-food' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-order-7','coktan_secmeli','“waiter” ne demektir?','["öğretmen","çiftçi","öğrenci","garson"]',3,'Eating outside and ordering food context.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-ordering-food' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-order-8','coktan_secmeli','“restaurant” ne demektir?','["kütüphane","restoran","çiftlik","sınıf"]',1,'Eating outside and ordering food context.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-ordering-food' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-order-9','coktan_secmeli','Which sentence is a polite order?','["Give me food!","I don''t listen.","Close the school.","Can I have a sandwich, please?"]',3,'Eating outside and ordering food context.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-ordering-food' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-order-10','coktan_secmeli','“Anything else?” neye yakındır?','["Kaç yaşındasın?","Başka bir şey ister misiniz?","Hava nasıl?","Neredesin?"]',1,'Eating outside and ordering food context.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-ordering-food' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-order-11','coktan_secmeli','A: Can I have milk? B: Yes, of course. Ne oldu?','["Hava soruldu.","Yaş söylendi.","Ders seçildi.","Nazik bir istek kabul edildi."]',3,'Eating outside and ordering food context.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-ordering-food' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-order-12','coktan_secmeli','“No, thank you.” hangi durumda kullanılabilir?','["Bağırırken","Bir teklifi nazikçe reddederken","Yer tarif ederken","Yaş sorarken"]',1,'Eating outside and ordering food context.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-ordering-food' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-order-13','coktan_secmeli','Yemek siparişinde “please” kullanmak ne gösterir?','["Hava durumu","Yaş","Konum","Nezaket"]',3,'Eating outside and ordering food context.',2,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-ordering-food' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'eng3-order-14','coktan_secmeli','“I would like chicken and rice.” ne demektir?','["Tavuk ve pilav sevmiyorum.","Tavuk ve pilav istiyorum.","Tavuk çiftlikte.","Pilav yok."]',1,'Eating outside and ordering food context.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='eng3-ordering-food' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;
