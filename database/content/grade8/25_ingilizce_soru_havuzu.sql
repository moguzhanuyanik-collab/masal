SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-invitation','Invitations and Making Plans','Invitations and Making Plans','Invitations and Making Plans bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-friendship'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-1-1','coktan_secmeli','“Would you like to come to my birthday party?” is an __.','["invitation","apology","warning","complaint"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-invitation' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-1-2','coktan_secmeli','Which response politely accepts an invitation?','["No way!","I don''t care.","Sure, I''d love to.","Never ask me again."]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-invitation' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-1-3','coktan_secmeli','Which response politely refuses?','["I''m sorry, I can''t. I have plans.","Of course, see you there.","Great idea!","I''d love to."]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-invitation' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-1-4','coktan_secmeli','“How about going to the cinema?” ne ifade eder?','["Bir özür","Bir yasak","Bir öneri","Bir hava tahmini"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-invitation' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-1-5','coktan_secmeli','“Are you free on Saturday?” neyi öğrenmek için sorulur?','["Müsait olup olmadığını","Yaşını","Adresini","Boyunu"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-invitation' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-1-6','coktan_secmeli','Which sentence suggests a plan?','["I met her yesterday.","The café is closed.","Let''s meet at the café at three.","I dislike coffee."]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-invitation' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-friend-quality','Friendship Qualities and Preferences','Friendship Qualities and Preferences','Friendship Qualities and Preferences bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-friendship'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-2-1','coktan_secmeli','A true friend should be __.','["dishonest","selfish","rude","trustworthy"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-friend-quality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-2-2','coktan_secmeli','“I can count on her.” ne demektir?','["Onu sayabilirim.","Ona güvenebilirim.","Onu arayamam.","Onu tanımıyorum."]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-friend-quality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-2-3','coktan_secmeli','Which quality means “dürüst”?','["jealous","lazy","stubborn","honest"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-friend-quality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-2-4','coktan_secmeli','“We have a lot in common.” ne demektir?','["Hiç görüşmüyoruz.","Birçok ortak yönümüz var.","Aynı evde yaşıyoruz.","Akrabayız."]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-friend-quality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-2-5','coktan_secmeli','Which behaviour damages friendship?','["listening","supporting","being honest","breaking promises repeatedly"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-friend-quality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-2-6','coktan_secmeli','“She always backs me up.” ne anlatır?','["Beni engellediğini","Beni desteklediğini","Beni aramadığını","Beni unuttuğunu"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-friend-quality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-routine','Teen Routines and Activities','Teen Routines and Activities','Teen Routines and Activities bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-teen'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-3-1','coktan_secmeli','“I usually hang out with my friends after school.” ne demektir?','["Okuldan sonra uyurum.","Arkadaşlarımla çalışmam.","Okuldan sonra genellikle arkadaşlarımla vakit geçiririm.","Okula gitmem."]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-3-2','coktan_secmeli','Which is a leisure activity?','["going to a concert","taking an exam","doing compulsory paperwork","repairing a road"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-3-3','coktan_secmeli','“once a week” ne demektir?','["günde bir","ayda iki","haftada bir","yılda bir"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-3-4','coktan_secmeli','Which question asks about frequency?','["How often do you play basketball?","Where do you live?","How old are you?","What is your name?"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-3-5','coktan_secmeli','“I rarely watch TV.” ne anlatır?','["Her gün izlediğini","Hiç televizyonu olmadığını","Televizyonu seyrek izlediğini","Sadece sabah izlediğini"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-3-6','coktan_secmeli','Which adverb means “her zaman”?','["always","never","sometimes","rarely"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-pref','Likes, Dislikes and Preferences','Likes, Dislikes and Preferences','Likes, Dislikes and Preferences bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-teen'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-4-1','coktan_secmeli','“I prefer reading to watching TV.” ne demektir?','["İkisini de sevmem.","Televizyon izlemektense okumayı tercih ederim.","Sadece TV izlerim.","Okuyamam."]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-4-2','coktan_secmeli','Which sentence expresses dislike?','["I''m fond of music.","I enjoy cycling.","I love books.","I can''t stand crowded places."]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-4-3','coktan_secmeli','“I''m keen on science fiction.” ne anlatır?','["Bilim kurgudan nefret ettiğini","Bilim kurguya ilgi duyduğunu","Bilim dersinden kaldığını","Film izlemediğini"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-4-4','coktan_secmeli','“I would rather stay home.” ne ifade eder?','["Kesin evden çıkacağım.","Evde kalamam.","Ev yok.","Evde kalmayı tercih ederim."]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-4-5','coktan_secmeli','Which sentence expresses preference?','["Chess is on the table.","I''d rather play chess than video games.","I played yesterday.","Open the game."]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-4-6','coktan_secmeli','“I''m not into extreme sports.” ne demektir?','["Ekstrem spor uzmanıyım.","Her gün yaparım.","Sadece kışın yaparım.","Ekstrem sporlara ilgi duymuyorum."]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-recipe','Recipes and Sequencing','Recipes and Sequencing','Recipes and Sequencing bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-kitchen'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-5-1','coktan_secmeli','Which sequencing word comes first in a recipe?','["First","Finally","After that","Then only"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-recipe' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-5-2','coktan_secmeli','“Then add two eggs.” ne demektir?','["Önce iki yumurta çıkar.","Yumurtaları at.","Sonra iki yumurta ekle.","İki yumurta satın al."]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-recipe' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-5-3','coktan_secmeli','“Finally, bake it for 30 minutes.” ne anlatır?','["Son adımda 30 dakika pişirmeyi","İlk adımda dondurmayı","30 dakika beklememeyi","Malzemeyi çıkarmayı"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-recipe' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-5-4','coktan_secmeli','A recipe usually includes __.','["weather forecast","map coordinates","ingredients and instructions","school rules"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-recipe' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-5-5','coktan_secmeli','“How much flour do we need?” neyi sorar?','["Un miktarını","Unun rengini","Unun markasını","Fırının yerini"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-recipe' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-5-6','coktan_secmeli','Which word means “malzemeler”?','["directions","appliances","ingredients","appointments"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-recipe' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-cooking','Cooking Methods and Kitchen Vocabulary','Cooking Methods and Kitchen Vocabulary','Cooking Methods and Kitchen Vocabulary bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-kitchen'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-6-1','coktan_secmeli','“boil” ne demektir?','["kızartmak","doğramak","karıştırmak","kaynatmak"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-cooking' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-6-2','coktan_secmeli','“fry” ne demektir?','["haşlamak","kızartmak","dilimlemek","soğutmak"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-cooking' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-6-3','coktan_secmeli','Which tool is used to bake a cake?','["kettle","phone","printer","oven"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-cooking' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-6-4','coktan_secmeli','“chop the onions” ne demektir?','["Soğanları kaynat.","Soğanları doğra.","Soğanları iç.","Soğanları dondur."]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-cooking' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-6-5','coktan_secmeli','“stir the soup” ne demektir?','["Çorbayı dök.","Çorbayı kes.","Çorbayı kızart.","Çorbayı karıştır."]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-cooking' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-6-6','coktan_secmeli','Which method cooks food in hot water?','["grilling","boiling","frying","baking"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-cooking' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-call','Phone Conversations','Phone Conversations','Phone Conversations bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-phone'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-7-1','coktan_secmeli','“May I speak to Jane, please?” hangi durumda kullanılır?','["Yol tarif ederken","Yemek sipariş ederken","Telefonda biriyle görüşmek isterken","Hava sorarken"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-call' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-7-2','coktan_secmeli','“Hold on, please.” ne demektir?','["Lütfen hatta bekleyin.","Telefonu kapatın.","Dışarı çıkın.","Beni aramayın."]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-call' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-7-3','coktan_secmeli','“The line is busy.” ne demektir?','["Telefon kapalı.","İnternet hızlı.","Hat meşgul.","Numara değişti."]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-call' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-7-4','coktan_secmeli','“Who is calling?” neyi sorar?','["Arayan kişinin kim olduğunu","Saat kaç olduğunu","Adresini","Mesleğini"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-call' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-7-5','coktan_secmeli','“I''ll call you back.” ne demektir?','["Seni engelleyeceğim.","Telefonu satacağım.","Seni geri arayacağım.","Sana mesaj atmayacağım."]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-call' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-7-6','coktan_secmeli','Which is a polite phone opening?','["Hello, this is Ali speaking.","What do you want?","Don''t call me.","Who cares?"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-call' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-message','Leaving and Taking Messages','Leaving and Taking Messages','Leaving and Taking Messages bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-phone'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-8-1','coktan_secmeli','“Can I take a message?” ne demektir?','["Mesajı silebilir miyim?","Mesajınızı alabilir miyim?","Telefonu alabilir miyim?","Numarayı değiştirebilir miyim?"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-message' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-8-2','coktan_secmeli','“Please tell him to call me.” ne demektir?','["Ona beni aramamasını söyle.","Telefonu kapat.","Mesajı sil.","Lütfen ona beni aramasını söyle."]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-message' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-8-3','coktan_secmeli','Which information is useful in a phone message?','["shoe size only","caller name and reason","favourite colour only","weather only"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-message' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-8-4','coktan_secmeli','“She isn''t available right now.” ne demektir?','["Şu anda burada ve konuşuyor.","Telefonu yok.","Her zaman müsait.","Şu anda müsait değil."]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-message' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-8-5','coktan_secmeli','“Could you repeat that?” ne zaman kullanılır?','["Konuşmayı bitirirken","Söyleneni tekrar duymak istediğimizde","Yemek isterken","Adres vermemek için"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-message' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-8-6','coktan_secmeli','A clear message should be __.','["confusing","incomplete","rude","brief and accurate"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-message' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-online','Internet Habits and Vocabulary','Internet Habits and Vocabulary','Internet Habits and Vocabulary bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-internet'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-9-1','coktan_secmeli','“upload a photo” ne demektir?','["fotoğraf yüklemek","fotoğraf silmek","fotoğraf basmak","fotoğraf çizmek"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-online' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-9-2','coktan_secmeli','“download a file” ne demektir?','["dosya yüklemek","dosya silmek","dosya indirmek","dosyayı yazmak"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-online' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-9-3','coktan_secmeli','A search engine helps users __.','["find information online","cook food","measure temperature","drive a car"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-online' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-9-4','coktan_secmeli','“browse the web” ne demektir?','["kitap basmak","telefonu kapatmak","internette gezinmek","alışveriş merkezinde yürümek"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-online' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-9-5','coktan_secmeli','Which device can access the Internet?','["smartphone","paper notebook","wooden ruler","eraser"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-online' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-9-6','coktan_secmeli','“I use social media twice a day.” ne anlatır?','["Şifreyi","Konumu","Kullanım sıklığını","Yaşı"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-online' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-safety','Online Safety and Responsible Use','Online Safety and Responsible Use','Online Safety and Responsible Use bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-internet'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-10-1','coktan_secmeli','A strong password should be __.','["123456","your first name","the same everywhere","hard to guess and unique"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-safety' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-10-2','coktan_secmeli','Should you share your password with strangers?','["Yes","No","Always","Only online"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-safety' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-10-3','coktan_secmeli','“privacy settings” ne için kullanılır?','["Telefonu şarj etmek için","Yemek sipariş etmek için","Hava tahmini için","Kimlerin bilgi ve içerikleri görebileceğini yönetmek için"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-safety' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-10-4','coktan_secmeli','A suspicious link should be __.','["opened immediately","checked before clicking","shared with everyone","given your password"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-safety' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-10-5','coktan_secmeli','Cyberbullying should be reported to __.','["nobody","the bully only","random users","a trusted adult or platform"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-safety' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-10-6','coktan_secmeli','Personal information such as home address should be shared publicly?','["Yes","No","Always","Only with unknown accounts"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-safety' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-adventure','Adventure Activities','Adventure Activities','Adventure Activities bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-adventures'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-11-1','coktan_secmeli','Which is an adventure sport?','["reading quietly","watching TV","rafting","drawing at home"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-adventure' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-11-2','coktan_secmeli','“go skydiving” ne demektir?','["paraşütle atlamak","kayak yapmak","yüzmek","kamp yapmak"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-adventure' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-11-3','coktan_secmeli','“equipment” ne demektir?','["hava","bilet","ekipman","yemek"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-adventure' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-11-4','coktan_secmeli','Safety gear is important in adventure sports?','["Yes","No","Only for beginners","Only indoors"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-adventure' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-11-5','coktan_secmeli','“climb a mountain” ne demektir?','["dağı çizmek","dağdan kaçmak","dağa tırmanmak","dağı ölçmek"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-adventure' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-11-6','coktan_secmeli','Which activity happens on a river?','["rafting","paragliding","rock climbing","skydiving"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-adventure' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-comparison','Comparing Experiences and Risks','Comparing Experiences and Risks','Comparing Experiences and Risks bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-adventures'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-12-1','coktan_secmeli','“Rafting is more exciting than hiking.” ne anlatır?','["Geçmiş zaman","İki etkinliği karşılaştırır.","Telefon konuşması","Tarif"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-comparison' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-12-2','coktan_secmeli','Which adjective means “tehlikeli”?','["safe","boring","cheap","dangerous"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-comparison' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-12-3','coktan_secmeli','“I think bungee jumping is too risky.” ne ifade eder?','["Kesin bilimsel yasa","Bir görüş","Adres","Tarif"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-comparison' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-12-4','coktan_secmeli','Which activity may require a parachute?','["cycling","swimming","hiking","skydiving"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-comparison' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-12-5','coktan_secmeli','“less dangerous” ne demektir?','["daha tehlikeli","daha az tehlikeli","eşit tehlikeli","tehlikesiz kesin"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-comparison' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-12-6','coktan_secmeli','When comparing risks, what should be considered?','["only colour","only price","only time of day","safety conditions and equipment"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-comparison' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-travel','Travel and Accommodation','Travel and Accommodation','Travel and Accommodation bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',130,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-tourism'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-13-1','coktan_secmeli','“book a room” ne demektir?','["oda ayırtmak","oda temizlemek","oda satmak","oda çizmek"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-travel' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-13-2','coktan_secmeli','A place where tourists stay is a __.','["factory","laboratory","hotel","classroom"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-travel' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-13-3','coktan_secmeli','“single room” ne demektir?','["tek kişilik oda","çift kişilik oda","toplantı salonu","mutfak"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-travel' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-13-4','coktan_secmeli','“How long will you stay?” neyi sorar?','["Yaşı","Mesleği","Kalış süresini","Yemek tercihini"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-travel' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-13-5','coktan_secmeli','A boarding pass is related to __.','["air travel","cooking","school club","housework"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-travel' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-13-6','coktan_secmeli','“check in” at a hotel means __.','["leaving permanently","cooking","registering your arrival","cleaning the room"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-travel' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-attraction','Tourist Attractions and Experiences','Tourist Attractions and Experiences','Tourist Attractions and Experiences bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',140,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-tourism'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-14-1','coktan_secmeli','“historical site” ne demektir?','["alışveriş listesi","telefon hattı","ev işi","tarihî yer"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-attraction' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-14-2','coktan_secmeli','Which place displays historical objects?','["bakery","museum","garage","pharmacy"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-attraction' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-14-3','coktan_secmeli','“The city is famous for its ancient ruins.” ne demektir?','["Şehir yeni fabrikalarıyla ünlüdür.","Şehir denizsizdir.","Şehir kapalıdır.","Şehir antik kalıntılarıyla ünlüdür."]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-attraction' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-14-4','coktan_secmeli','“I have visited Cappadocia twice.” ne anlatır?','["Gelecek tahmini","Geçmiş deneyimi","Tarif","Kural"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-attraction' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-14-5','coktan_secmeli','A guide can help tourists __.','["repair a phone","cook at home","do homework","learn about a place"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-attraction' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-14-6','coktan_secmeli','“local cuisine” ne demektir?','["yerel ulaşım","yerel mutfak","yerel okul","yerel hava"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-attraction' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-housework','Household Chores','Household Chores','Household Chores bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',150,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-chores'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-15-1','coktan_secmeli','“do the laundry” ne demektir?','["bulaşık yıkamak","yemek yapmak","çamaşır yıkamak","odayı boyamak"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-housework' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-15-2','coktan_secmeli','“set the table” ne demektir?','["sofrayı kurmak","sofrayı kaldırmak","masayı satın almak","odayı temizlemek"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-housework' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-15-3','coktan_secmeli','Which is a chore?','["watching a film","playing chess","vacuuming the floor","listening to music"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-housework' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-15-4','coktan_secmeli','“take out the rubbish” ne demektir?','["çöpü dışarı çıkarmak","çöpü eve getirmek","alışveriş yapmak","yemek hazırlamak"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-housework' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-15-5','coktan_secmeli','“wash the dishes” ne demektir?','["çamaşır yıkamak","evi süpürmek","bulaşıkları yıkamak","yatağı toplamak"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-housework' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-15-6','coktan_secmeli','Household chores should be shared fairly?','["Yes","No","Only one person should do all","Children can never help"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-housework' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-responsibility','Responsibilities and Requests','Responsibilities and Requests','Responsibilities and Requests bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',160,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-chores'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-16-1','coktan_secmeli','“It''s your responsibility to tidy your room.” ne demektir?','["Odanı toplama.","Odanı toplamak senin sorumluluğun.","Odan başkasının.","Odayı sat."]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-responsibility' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-16-2','coktan_secmeli','“Could you help me with the dishes?” is a __.','["warning","prediction","invitation to travel","request"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-responsibility' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-16-3','coktan_secmeli','A polite response to a request?','["Never!","Sure, no problem.","Do it yourself!","I don''t care."]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-responsibility' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-16-4','coktan_secmeli','“I have to clean my desk.” ne anlatır?','["Bir tercih","Bir tahmin","Bir geçmiş deneyim","Bir zorunluluk"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-responsibility' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-16-5','coktan_secmeli','“You don''t have to cook today.” ne demektir?','["Bugün yemek yapmalısın.","Bugün yemek yapmak zorunda değilsin.","Yemek yapamazsın.","Yemek yok."]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-responsibility' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-16-6','coktan_secmeli','Being responsible means __.','["avoiding every task","blaming others","breaking promises","doing your duties reliably"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-responsibility' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-invention','Inventions and Discoveries','Inventions and Discoveries','Inventions and Discoveries bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',170,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-science'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-17-1','coktan_secmeli','An invention is __.','["a newly created device or method","a weather event","a family member","a school subject"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-invention' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-17-2','coktan_secmeli','Who invents or develops new things?','["tourists only","chefs only","inventors and researchers","drivers only"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-invention' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-17-3','coktan_secmeli','“discovery” ne demektir?','["keşif","tarif","davet","ev işi"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-invention' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-17-4','coktan_secmeli','Vaccines are related to advances in __.','["tourism","housework","science and medicine","phone etiquette"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-invention' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-17-5','coktan_secmeli','The telephone changed __.','["communication","gravity","seasons","DNA structure"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-invention' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-17-6','coktan_secmeli','Scientific inventions can have both benefits and risks?','["No","They are always perfect","Yes","They never affect society"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-invention' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-process','Scientific Processes and Technology','Scientific Processes and Technology','Scientific Processes and Technology bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',180,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-science'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-18-1','coktan_secmeli','“conduct an experiment” ne demektir?','["deneyi silmek","telefon etmek","seyahat etmek","deney yapmak"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-process' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-18-2','coktan_secmeli','A scientist should record __.','["random rumours","observations and results","passwords","unrelated opinions only"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-process' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-18-3','coktan_secmeli','“hypothesis” ne demektir?','["kesin yasa","telefon mesajı","yemek tarifi","test edilebilir açıklama/tahmin"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-process' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-18-4','coktan_secmeli','Experiments should be repeated when possible?','["No","Yes","One result is always enough","Data should not be checked"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-process' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-18-5','coktan_secmeli','Technology can help scientists __ data.','["hide","ignore","delete automatically","collect and analyse"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-process' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-18-6','coktan_secmeli','Reliable science depends on __.','["rumours","evidence","likes","advertising"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-process' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-disaster','Natural Disasters','Natural Disasters','Natural Disasters bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',190,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-natural'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-19-1','coktan_secmeli','“earthquake” ne demektir?','["sel","kasırga","deprem","kuraklık"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-disaster' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-19-2','coktan_secmeli','“flood” ne demektir?','["sel","deprem","çığ","yangın"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-disaster' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-19-3','coktan_secmeli','“drought” ne demektir?','["fırtına","deprem","kuraklık","heyelan"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-disaster' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-19-4','coktan_secmeli','A hurricane is a type of __.','["powerful storm","earthquake","drought","volcano only"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-disaster' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-19-5','coktan_secmeli','“landslide” ne demektir?','["sel","kuraklık","heyelan","şimşek"]',2,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-disaster' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-19-6','coktan_secmeli','Natural disasters can affect communities and infrastructure?','["Yes","No","Only animals","Only weather stations"]',0,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-disaster' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'eng8-preparedness','Preparedness and Environmental Action','Preparedness and Environmental Action','Preparedness and Environmental Action bağlamında kelime, okuma ve iletişim becerilerini kullanır.','',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='eng8-natural'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-20-1','coktan_secmeli','An emergency kit should include __.','["only toys","water and basic supplies","only books","nothing"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-preparedness' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-20-2','coktan_secmeli','During an earthquake, following official safety guidance is important?','["No","Rumours are better","Safety plans are unnecessary","Yes"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-preparedness' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-20-3','coktan_secmeli','“evacuation” ne demektir?','["kutlama","tahliye","tarif","telefon görüşmesi"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-preparedness' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-20-4','coktan_secmeli','After a disaster, reliable information should come from __.','["anonymous rumours","random comments","unverified posts","official and trusted sources"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-preparedness' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-20-5','coktan_secmeli','Planting trees can help reduce some environmental risks?','["No","Yes","Trees always increase risk","Environment is unrelated"]',1,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-preparedness' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8e-20-6','coktan_secmeli','Communities can prepare for disasters through __.','["ignoring warnings","spreading rumours","removing emergency exits","plans and drills"]',3,'İngilizce ifade ve işlev bağlama göre değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='eng8-preparedness' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

