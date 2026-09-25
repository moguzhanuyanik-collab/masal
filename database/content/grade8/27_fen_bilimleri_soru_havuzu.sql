SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'fen8-mevsim','Mevsimlerin Oluşumu','Mevsimlerin Oluşumu','Mevsimlerin Oluşumu konusunu deney, model ve günlük yaşamla ilişkilendirir.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='fen8-iklim'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-1-1','coktan_secmeli','Mevsimlerin oluşmasının temel nedeni nedir?','["Dünya''nın eksen eğikliği ve Güneş etrafındaki dolanması","Dünya-Güneş uzaklığının ay boyunca değişmesi","Ay''ın evreleri","Güneş''in Dünya etrafında dönmesi"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-mevsim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-1-2','coktan_secmeli','Kuzey Yarım Küre yaz yaşarken Güney Yarım Küre genellikle hangi mevsimi yaşar?','["Yaz","İlkbahar zorunlu","Kış","Aynı mevsim"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-mevsim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-1-3','coktan_secmeli','21 Haziran civarında Kuzey Yarım Küre''de gündüz süresi nasıldır?','["Yılın en uzun gündüzlerinden biridir.","Yılın en kısa gündüzüdür.","Gece-gündüz mutlaka eşittir.","24 saat gece olur."]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-mevsim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-1-4','coktan_secmeli','Ekinoks tarihlerinde gece ve gündüz süreleri yaklaşık nasıldır?','["Gece iki kat uzundur.","Gündüz iki kat uzundur.","Eşittir.","Mevsime göre ölçülemez."]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-mevsim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-1-5','coktan_secmeli','Dünya''nın eksen eğikliği olmasaydı mevsim farklılıkları bugünkü gibi olur muydu?','["Hayır","Evet aynen olurdu","Sadece geceler değişirdi","Ay belirlerdi"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-mevsim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-1-6','coktan_secmeli','Güneş ışınlarının daha dik gelmesi yüzeyde birim alana düşen enerjiyi nasıl etkiler?','["Azaltır","Değiştirmez","Artırır","Sıfırlar"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-mevsim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-1-7','coktan_secmeli','Dünya Güneş''e en yakınken her yerde yaz olur mu?','["Hayır","Evet","Sadece kuzeyde","Sadece ekvatorda"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-mevsim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-1-8','coktan_secmeli','Mevsim oluşumunu açıklarken hangi iki hareket/özellik birlikte ele alınır?','["Günlük dönme ve Ay''ın dolanması","Bulutlanma ve rüzgâr","Eksen eğikliği ve yıllık dolanma","Gelgit ve Ay evresi"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-mevsim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'fen8-iklim-hava','İklim ve Hava Olayları','İklim ve Hava Olayları','İklim ve Hava Olayları konusunu deney, model ve günlük yaşamla ilişkilendirir.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='fen8-iklim'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-2-1','coktan_secmeli','Hava olayı hangi zaman ölçeğinde incelenir?','["Yüzlerce yıllık ortalama zorunlu","Kısa süreli atmosfer koşulları","Jeolojik çağ","Sadece mevsim adı"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-iklim-hava' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-2-2','coktan_secmeli','İklim neyi ifade eder?','["Bir günlük sıcaklığı","Saatlik rüzgârı","Tek yağmur olayını","Bir bölgenin uzun yıllar boyunca gözlenen hava koşullarının genel karakterini"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-iklim-hava' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-2-3','coktan_secmeli','Hava tahminiyle ilgilenen bilim dalı?','["Genetik","Meteoroloji","Astronomi","Jeoloji"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-iklim-hava' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-2-4','coktan_secmeli','İklim bilimi?','["Meteoroloji sadece","Fizik tedavi","Paleontoloji","Klimatoloji"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-iklim-hava' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-2-5','coktan_secmeli','“Konya bugün yağmurlu.” ifadesi iklim mi hava olayı mı?','["İklim","Hava olayı","Mevsim tanımı","Küresel ısınma"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-iklim-hava' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-2-6','coktan_secmeli','“Akdeniz yazları sıcak ve kuraktır.” ifadesi neyi anlatır?','["Günlük hava tahminini","Saatlik basıncı","Tek fırtınayı","İklim özelliğini"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-iklim-hava' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-2-7','coktan_secmeli','İklim değişikliği uzun dönemli sıcaklık ve yağış düzenlerini etkileyebilir mi?','["Hayır","Evet","Sadece saatlik hava değişir","İklim değişmez"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-iklim-hava' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-2-8','coktan_secmeli','Tek bir soğuk gün küresel iklim eğilimini tek başına çürütür mü?','["Evet","Her zaman","Sadece kışın","Hayır"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-iklim-hava' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'fen8-dna-yapi','DNA, Gen ve Kromozom','DNA, Gen ve Kromozom','DNA, Gen ve Kromozom konusunu deney, model ve günlük yaşamla ilişkilendirir.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='fen8-dna'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-3-1','coktan_secmeli','DNA''nın yapı birimi nedir?','["Amino asit","Hücre","Nükleotit","Organ"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-dna-yapi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-3-2','coktan_secmeli','Nükleotitte hangisi bulunur?','["Şeker, fosfat ve organik baz","Protein, yağ ve su","Sadece baz","Sadece şeker"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-dna-yapi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-3-3','coktan_secmeli','Gen nedir?','["Tüm hücrenin adı","Bir organ","DNA üzerinde belirli bir özelliğe ilişkin bilgi taşıyan bölüm","Sadece kromozom sayısı"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-dna-yapi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-3-4','coktan_secmeli','Kromozom ne içerir?','["DNA ve protein yapıları","Sadece su","Sadece yağ","Sadece mineral"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-dna-yapi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-3-5','coktan_secmeli','Adenin DNA''da hangi bazla eşleşir?','["Guanin","Sitozin","Timin","Urasil"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-dna-yapi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-3-6','coktan_secmeli','Guanin hangi bazla eşleşir?','["Sitozin","Adenin","Timin","Urasil"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-dna-yapi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-3-7','coktan_secmeli','DNA kendini eşleyebilir mi?','["Hayır","Sadece protein eşlenir","Evet","Sadece hücre zarı eşlenir"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-dna-yapi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-3-8','coktan_secmeli','Aynı türün sağlıklı bireylerinde kromozom sayısı genellikle aynı mıdır?','["Evet","Hayır","Her bireyde rastgele","Yaşa göre sürekli değişir"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-dna-yapi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'fen8-kalitim','Kalıtım, Mutasyon ve Modifikasyon','Kalıtım, Mutasyon ve Modifikasyon','Kalıtım, Mutasyon ve Modifikasyon konusunu deney, model ve günlük yaşamla ilişkilendirir.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='fen8-dna'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-4-1','coktan_secmeli','Baskın alel hangi durumda fenotipte görülebilir?','["Sadece iki çekinik alelle","Hiçbir zaman","Sadece çevre etkisiyle","Tek kopya bulunsa bile"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kalitim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-4-2','coktan_secmeli','Çekinik özellik genellikle hangi durumda fenotipte ortaya çıkar?','["Bir baskın alel varken her zaman","İki çekinik alel birlikte olduğunda","Sadece yaşla","Sadece beslenmeyle"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kalitim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-4-3','coktan_secmeli','Mutasyon DNA''da değişiklik oluşturabilir mi?','["Hayır","Sadece davranışı değiştirir","DNA sabittir","Evet"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kalitim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-4-4','coktan_secmeli','Modifikasyon kalıtsal DNA dizisini değiştirmek zorunda mıdır?','["Evet her zaman","Hayır","Sadece kromozom sayısını değiştirir","Genleri yok eder"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kalitim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-4-5','coktan_secmeli','Güneşte bronzlaşma modifikasyona örnek olabilir mi?','["Hayır, mutlaka mutasyondur","Sadece adaptasyondur","Kalıtsal olmak zorundadır","Evet"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kalitim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-4-6','coktan_secmeli','Adaptasyon nedir?','["Bireyin kısa süreli alışkanlığı","Canlının yaşama ve üreme başarısını artıran kalıtsal özellik","Her çevresel değişim","Sadece öğrenilmiş davranış"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kalitim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-4-7','coktan_secmeli','Akraba evliliği bazı çekinik kalıtsal hastalıkların görülme olasılığını artırabilir mi?','["Hayır","Her zaman azaltır","Genetikle ilgisizdir","Evet"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kalitim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-4-8','coktan_secmeli','Genotip neyi ifade eder?','["Sadece dış görünüşünü","Canlının genetik yapısını","Sadece yaşadığı ortamı","Sadece beslenmesini"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kalitim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'fen8-kati-basinc','Katı Basıncı','Katı Basıncı','Katı Basıncı konusunu deney, model ve günlük yaşamla ilişkilendirir.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='fen8-basinc'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-5-1','coktan_secmeli','Katı basıncı hangi iki büyüklüğe bağlıdır?','["Kuvvet ve temas yüzey alanı","Sıcaklık ve renk","Hacim ve sıcaklık","Sadece kütle"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kati-basinc' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-5-2','coktan_secmeli','Aynı ağırlıktaki cismin temas alanı azalırsa basınç ne olur?','["Azalır","Değişmez","Artar","Sıfır olur"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kati-basinc' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-5-3','coktan_secmeli','Kar ayakkabılarının geniş yapılmasının nedeni?','["Temas alanını artırıp basıncı azaltmak","Basıncı artırmak","Ağırlığı artırmak","Sürtünmeyi sıfırlamak"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kati-basinc' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-5-4','coktan_secmeli','Keskin bıçağın kolay kesmesi hangi ilkeyle ilişkilidir?','["Büyük alanda küçük basınç","Sıvı basıncı","Küçük alanda daha büyük basınç","Gaz basıncı"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kati-basinc' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-5-5','coktan_secmeli','Cismin ağırlığı artarsa aynı yüzeyde katı basıncı ne olur?','["Artar","Azalır","Değişmez","Önce azalır"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kati-basinc' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-5-6','coktan_secmeli','Basınç birimi nedir?','["Newton","Joule","Pascal","Watt"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kati-basinc' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-5-7','coktan_secmeli','Aynı kuvvetle 2 cm² yerine 4 cm² yüzeye basılırsa basınç?','["Azalır","Artar","Aynı kalır","İki kat kesin artar"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kati-basinc' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-5-8','coktan_secmeli','Katı basıncı yüzey alanıyla ters orantılı mıdır?','["Hayır","Her zaman doğru orantılı","Evet, kuvvet sabitken.","Alan etkisizdir"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kati-basinc' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'fen8-sivi-gaz','Sıvı ve Gaz Basıncı','Sıvı ve Gaz Basıncı','Sıvı ve Gaz Basıncı konusunu deney, model ve günlük yaşamla ilişkilendirir.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='fen8-basinc'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-6-1','coktan_secmeli','Sıvı basıncı derinlikle nasıl değişir?','["Azalır","Derinlik arttıkça artar.","Değişmez","Sıfırlanır"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-sivi-gaz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-6-2','coktan_secmeli','Sıvı basıncı sıvının yoğunluğuna bağlı mıdır?','["Hayır","Sadece renge","Sadece kaba","Evet"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-sivi-gaz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-6-3','coktan_secmeli','Aynı sıvıda aynı derinlikte basınç kap şekline bağlı mıdır?','["Evet","Hayır","Sadece geniş kapta","Sadece dar kapta"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-sivi-gaz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-6-4','coktan_secmeli','Pascal prensibi hangi sistemlerde kullanılabilir?','["Sadece elektrik devresinde","Sadece aynalarda","Sadece mıknatısta","Hidrolik sistemlerde"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-sivi-gaz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-6-5','coktan_secmeli','Atmosfer basıncı var mıdır?','["Hayır","Evet","Sadece suda","Sadece uzayda"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-sivi-gaz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-6-6','coktan_secmeli','Yükseklere çıkıldıkça açık hava basıncı genellikle ne olur?','["Artar","Değişmez","İki kat olur","Azalır"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-sivi-gaz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-6-7','coktan_secmeli','Pipetle sıvı içmede açık hava basıncı rol oynar mı?','["Hayır","Evet","Sadece yerçekimi","Sadece sıcaklık"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-sivi-gaz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-6-8','coktan_secmeli','Barometre ne ölçer?','["Sıcaklığı","Nem dışında hiçbir şeyi","Elektrik akımını","Açık hava basıncını"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-sivi-gaz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'fen8-periyodik','Periyodik Sistem ve Elementler','Periyodik Sistem ve Elementler','Periyodik Sistem ve Elementler konusunu deney, model ve günlük yaşamla ilişkilendirir.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='fen8-madde'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-7-1','coktan_secmeli','Periyodik tabloda yatay sıralara ne denir?','["Grup","Blok","Periyot","Katman"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-periyodik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-7-2','coktan_secmeli','Dikey sütunlara ne denir?','["Grup","Periyot","Yörünge","Kabuk"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-periyodik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-7-3','coktan_secmeli','Metaller genellikle elektrik iletkeni midir?','["Hayır","Sadece ametaller","Evet","İletkenlik yoktur"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-periyodik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-7-4','coktan_secmeli','Ametallerin çoğu parlak metalik görünüm gösterir mi?','["Hayır","Evet her zaman","Sadece gazlar","Tüm elementler aynıdır"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-periyodik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-7-5','coktan_secmeli','Yarı metaller bazı özellikleri bakımından metal ve ametaller arasında olabilir mi?','["Hayır","Sadece metaldir","Evet","Sadece ametaldir"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-periyodik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-7-6','coktan_secmeli','Elementler atom numarasına göre sıralanır mı?','["Evet","Hayır","Sadece kütleye göre","Renge göre"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-periyodik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-7-7','coktan_secmeli','Aynı gruptaki elementler benzer kimyasal özellik gösterebilir mi?','["Hayır","Grup etkisiz","Evet","Sadece periyot önemlidir"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-periyodik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-7-8','coktan_secmeli','Soy gazlar periyodik tabloda bir grup oluşturur mu?','["Evet","Hayır","Element değildir","Sadece metal grubudur"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-periyodik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'fen8-kimyasal','Fiziksel-Kimyasal Değişim, Asit ve Baz','Fiziksel-Kimyasal Değişim, Asit ve Baz','Fiziksel-Kimyasal Değişim, Asit ve Baz konusunu deney, model ve günlük yaşamla ilişkilendirir.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='fen8-madde'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-8-1','coktan_secmeli','Fiziksel değişimde maddenin kimliği değişir mi?','["Evet her zaman","Sadece katıda","Sadece gazda","Hayır"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kimyasal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-8-2','coktan_secmeli','Kimyasal değişimde yeni maddeler oluşabilir mi?','["Hayır","Evet","Sadece şekil değişir","Sadece hâl değişir"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kimyasal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-8-3','coktan_secmeli','Demirin paslanması hangi değişimdir?','["Fiziksel","Sadece hâl değişimi","Geri dönüşümsüz olduğu için fiziksel","Kimyasal"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kimyasal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-8-4','coktan_secmeli','Buzun erimesi?','["Kimyasal değişim","Fiziksel değişim","Nükleer değişim","Tepkime zorunlu"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kimyasal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-8-5','coktan_secmeli','Asitlerin pH değeri genellikle 7''den küçük müdür?','["Hayır","Her zaman 7","Her zaman 14","Evet"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kimyasal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-8-6','coktan_secmeli','Bazların pH değeri genellikle 7''den büyük müdür?','["Hayır","Evet","Her zaman 0","Her zaman 7"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kimyasal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-8-7','coktan_secmeli','Asit ve baz tepkimesi nötralleşmeye yol açabilir mi?','["Hayır","Sadece donma olur","Sadece buharlaşma olur","Evet"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kimyasal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-8-8','coktan_secmeli','Kimyasal tepkimelerde toplam kütle korunur mu?','["Hayır","Kapalı sistemde evet","Her zaman yarıya iner","Kütle kavramı yoktur"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-kimyasal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'fen8-basit-makine','Basit Makineler ve İş Kolaylığı','Basit Makineler ve İş Kolaylığı','Basit Makineler ve İş Kolaylığı konusunu deney, model ve günlük yaşamla ilişkilendirir.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='fen8-makine'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-9-1','coktan_secmeli','Basit makineler işten kazanç sağlar mı?','["Hayır, ideal durumda iş korunur.","Evet, her zaman","İşi sıfırlar","Enerji üretir"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-basit-makine' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-9-2','coktan_secmeli','Basit makineler kuvvetten kazanç sağlayabilir mi?','["Hayır","Sadece hızdan","Evet","Sadece zamandan"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-basit-makine' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-9-3','coktan_secmeli','Kaldıraçta destek noktası ne işe yarar?','["Dönme ekseni oluşturur.","Enerji üretir","Kütleyi değiştirir","Sürtünmeyi yok eder"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-basit-makine' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-9-4','coktan_secmeli','Sabit makara kuvvetin yönünü değiştirebilir mi?','["Hayır","Kuvveti her zaman ikiye böler","Evet","İp gerektirmez"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-basit-makine' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-9-5','coktan_secmeli','Hareketli makara kuvvetten kazanç sağlayabilir mi?','["Evet","Hayır","Sadece yön değiştirir","Yükü artırır"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-basit-makine' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-9-6','coktan_secmeli','Eğik düzlem kuvveti azaltırken yolu artırabilir mi?','["Hayır","Yolu azaltır","Evet","İş oluşturur"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-basit-makine' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-9-7','coktan_secmeli','Vida hangi basit makineyle ilişkilendirilebilir?','["Eğik düzlem","Makara","Kaldıraç","Çıkrık değildir"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-basit-makine' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-9-8','coktan_secmeli','Dişli çarklar hareket yönü ve hızını değiştirebilir mi?','["Hayır","Sadece kütleyi değiştirir","Evet","Enerji üretir"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-basit-makine' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'fen8-makine-sistem','Basit Makine Sistemleri','Basit Makine Sistemleri','Basit Makine Sistemleri konusunu deney, model ve günlük yaşamla ilişkilendirir.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='fen8-makine'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-10-1','coktan_secmeli','Bisiklette hangi basit makine örnekleri bulunabilir?','["Sadece makara","Dişli ve tekerlek-mil","Sadece eğik düzlem","Hiçbiri"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-makine-sistem' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-10-2','coktan_secmeli','Makas hangi basit makineyle ilişkilidir?','["Sabit makara","Vida sadece","Eğik düzlem değil","Kaldıraç"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-makine-sistem' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-10-3','coktan_secmeli','Kriko kuvvet kazancı sağlayabilir mi?','["Hayır","Evet","Sadece hız artırır","Yükü hafifletmez"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-makine-sistem' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-10-4','coktan_secmeli','Kapı kolu tekerlek-mil sistemine örnek olabilir mi?','["Hayır","Sadece kaldıraç değildir","Basit makine değildir","Evet"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-makine-sistem' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-10-5','coktan_secmeli','Birden fazla basit makine birleşerek bileşik makine oluşturabilir mi?','["Hayır","Evet","Sadece tek makine kullanılabilir","Birleşince çalışmaz"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-makine-sistem' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-10-6','coktan_secmeli','Kuvvet kazancı arttıkça yol kaybı görülebilir mi?','["Hayır","Her şeyden kazanç olur","Yol etkilenmez","Evet"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-makine-sistem' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-10-7','coktan_secmeli','İdeal basit makinede enerji korunumu geçerli midir?','["Hayır","Evet","Enerji üretilir","Enerji yok olur"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-makine-sistem' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-10-8','coktan_secmeli','Sürtünme gerçek makinelerde verimi azaltabilir mi?','["Hayır","Verimi her zaman artırır","Sürtünme yoktur","Evet"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-makine-sistem' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'fen8-besin-zinciri','Besin Zinciri, Enerji Akışı ve Madde Döngüleri','Besin Zinciri, Enerji Akışı ve Madde Döngüleri','Besin Zinciri, Enerji Akışı ve Madde Döngüleri konusunu deney, model ve günlük yaşamla ilişkilendirir.','',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='fen8-enerji'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-11-1','coktan_secmeli','Üreticiler enerjiyi genellikle nereden alır?','["Tüketicilerden","Topraktan enerji olarak","Güneş''ten","Sadece sudan"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-besin-zinciri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-11-2','coktan_secmeli','Besin zincirinde enerji üst basamaklara aktarılırken azalır mı?','["Evet","Hayır","Artar","Aynı kalır"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-besin-zinciri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-11-3','coktan_secmeli','Ayrıştırıcılar madde döngüsüne katkı sağlar mı?','["Hayır","Sadece tüketicidir","Evet","Maddeyi sistemden çıkarır"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-besin-zinciri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-11-4','coktan_secmeli','Karbon döngüsünde fotosentez rol oynar mı?','["Evet","Hayır","Sadece yanma","Sadece solunum"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-besin-zinciri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-11-5','coktan_secmeli','Su döngüsünde buharlaşma var mıdır?','["Hayır","Sadece donma","Evet","Sadece yağış"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-besin-zinciri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-11-6','coktan_secmeli','Azot döngüsü canlılar için önemli midir?','["Evet","Hayır","Sadece taşlar için","Azot canlılarda kullanılmaz"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-besin-zinciri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-11-7','coktan_secmeli','Bir besin ağındaki türlerden biri azalırsa diğerleri etkilenebilir mi?','["Hayır","Türler bağımsızdır","Evet","Sadece üretici etkilenir"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-besin-zinciri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-11-8','coktan_secmeli','Enerji akışı döngüsel midir?','["Hayır, enerji ekosistemde tek yönlü akar.","Evet madde gibi","Sadece geceleri","Enerji yoktur"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-besin-zinciri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'fen8-surdur','Sürdürülebilir Kalkınma ve Çevre','Sürdürülebilir Kalkınma ve Çevre','Sürdürülebilir Kalkınma ve Çevre konusunu deney, model ve günlük yaşamla ilişkilendirir.','',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='fen8-enerji'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-12-1','coktan_secmeli','Ekolojik ayak izi neyi ifade eder?','["Ayak ölçüsünü","Sadece karbon gazını","Sadece suyu","Tüketimimizin doğa üzerindeki kaynak ve atık baskısını"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-surdur' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-12-2','coktan_secmeli','Yenilenebilir enerji kaynaklarına örnek?','["Kömür","Güneş enerjisi","Petrol","Doğal gaz"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-surdur' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-12-3','coktan_secmeli','Geri dönüşüm ham madde kullanımını azaltabilir mi?','["Hayır","Her zaman artırır","Sadece kâğıtta","Evet"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-surdur' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-12-4','coktan_secmeli','Sürdürülebilir kalkınma neyi gözetir?','["Sadece bugünkü tüketimi","Bugünün ihtiyaçlarını karşılarken geleceğin kaynaklarını korumayı","Sınırsız kaynak kullanımını","Yalnız ekonomik büyümeyi"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-surdur' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-12-5','coktan_secmeli','Enerji verimli cihazlar tüketimi azaltabilir mi?','["Hayır","Her zaman artırır","Verim enerjiyle ilgisiz","Evet"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-surdur' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-12-6','coktan_secmeli','Biyoçeşitliliğin korunması ekosistem dayanıklılığına katkı sağlayabilir mi?','["Hayır","Evet","Tür sayısı önemsiz","Sadece tarımı etkiler"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-surdur' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-12-7','coktan_secmeli','Tek kullanımlık ürünleri azaltmak atığı azaltabilir mi?','["Hayır","Atığı artırır","İlgisiz","Evet"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-surdur' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-12-8','coktan_secmeli','Su tasarrufu sürdürülebilir yaşamın parçası mıdır?','["Hayır","Evet","Su sınırsızdır","Sadece faturayla ilgilidir"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-surdur' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'fen8-elektrik-yuk','Elektrik Yükleri ve Elektriklenme','Elektrik Yükleri ve Elektriklenme','Elektrik Yükleri ve Elektriklenme konusunu deney, model ve günlük yaşamla ilişkilendirir.','',130,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='fen8-elektrik'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-13-1','coktan_secmeli','Aynı cins elektrik yükleri birbirini nasıl etkiler?','["İter","Çeker","Etkilemez her zaman","Nötrler"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-elektrik-yuk' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-13-2','coktan_secmeli','Zıt cins yükler?','["İter","Etkilemez","Çeker","Yok olur"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-elektrik-yuk' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-13-3','coktan_secmeli','Elektron alan cisim hangi yükle yüklenebilir?','["Negatif","Pozitif","Nötr kesin","Yüksüz"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-elektrik-yuk' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-13-4','coktan_secmeli','Elektron veren cisim?','["Negatif kesin","Nötr kesin","Pozitif yüklenebilir","Yük kavramı yok"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-elektrik-yuk' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-13-5','coktan_secmeli','Sürtünme ile elektriklenme elektron aktarımıyla açıklanabilir mi?','["Evet","Hayır","Protonlar cisimler arası geçer zorunlu","Yük oluşmaz"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-elektrik-yuk' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-13-6','coktan_secmeli','Topraklama fazla yüklerin Dünya''ya aktarılmasına yardım eder mi?','["Hayır","Sadece ısıtır","Evet","Sadece yalıtır"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-elektrik-yuk' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-13-7','coktan_secmeli','Elektroskop elektrik yükünü gözlemlemek için kullanılabilir mi?','["Evet","Hayır","Sadece sıcaklık ölçer","Sadece basınç"]',0,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-elektrik-yuk' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-13-8','coktan_secmeli','Nötr cisimde toplam pozitif ve negatif yük miktarı dengede midir?','["Hayır","Pozitif yoktur","Evet","Negatif yoktur"]',2,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-elektrik-yuk' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'fen8-elektrik-enerji','Elektrik Enerjisinin Dönüşümü ve Güvenlik','Elektrik Enerjisinin Dönüşümü ve Güvenlik','Elektrik Enerjisinin Dönüşümü ve Güvenlik konusunu deney, model ve günlük yaşamla ilişkilendirir.','',140,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='fen8-elektrik'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-14-1','coktan_secmeli','Elektrik enerjisi ampulde hangi enerjiye dönüşebilir?','["Sadece kimyasal","Işık ve ısı enerjisine","Sadece çekim","Sadece nükleer"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-elektrik-enerji' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-14-2','coktan_secmeli','Elektrik motoru elektrik enerjisini neye dönüştürür?','["Sadece ışığa","Sadece potansiyele","Maddeye","Hareket enerjisine"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-elektrik-enerji' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-14-3','coktan_secmeli','Jeneratör hareket enerjisinden elektrik enerjisi üretebilir mi?','["Hayır","Evet","Sadece pil üretir","Elektrik dönüşmez"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-elektrik-enerji' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-14-4','coktan_secmeli','Sigorta/devre kesici ne sağlar?','["Akımı sınırsız artırır","Enerji üretir","Kabloyu ısıtır","Aşırı akıma karşı güvenlik"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-elektrik-enerji' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-14-5','coktan_secmeli','Islak elle priz veya elektrikli cihazla temas güvenli midir?','["Evet","Hayır","Sadece düşük ışıkta","Sadece evde"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-elektrik-enerji' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-14-6','coktan_secmeli','Elektrik enerjisinin bilinçli kullanımı enerji tasarrufu sağlar mı?','["Hayır","Tüketimi artırır","Enerji sınırsızdır","Evet"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-elektrik-enerji' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-14-7','coktan_secmeli','Fosil yakıtla elektrik üretimi sera gazı salımına yol açabilir mi?','["Hayır","Evet","Sadece su üretir","Çevreyi etkilemez"]',1,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-elektrik-enerji' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8f-14-8','coktan_secmeli','Yenilenebilir kaynaklardan elektrik üretimi çevresel etkiyi azaltmaya yardımcı olabilir mi?','["Hayır","Her zaman daha kirleticidir","Elektrik üretilemez","Evet"]',3,'Fen bilimleri kavramı deney, model, veri veya günlük yaşam bağlamında değerlendirilir.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='fen8-elektrik-enerji' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

