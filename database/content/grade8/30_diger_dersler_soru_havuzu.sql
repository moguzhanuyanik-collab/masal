SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'gs8-kompozisyon','Kompozisyon, Renk ve Görsel Dil','Kompozisyon, Renk ve Görsel Dil','Kompozisyon, Renk ve Görsel Dil becerilerini güvenli ve uygulamalı biçimde geliştirir.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='gs8-uretim'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-1-1','coktan_secmeli','Kompozisyonda denge neyi ifade eder?','["Görsel ağırlığın düzenli dağılımını","Sadece simetriyi","Sadece rengi","Sadece çerçeveyi"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-kompozisyon' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-1-2','coktan_secmeli','Kontrast ne sağlar?','["Her şeyi aynı gösterir","Sadece sesi değiştirir","Ögeler arasında fark ve vurgu","Boyutu kaldırır"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-kompozisyon' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-1-3','coktan_secmeli','Renklerin sıcak-soğuk etkisi görsel anlatımı etkileyebilir mi?','["Evet","Hayır","Renklerin etkisi yoktur","Sadece malzeme etkiler"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-kompozisyon' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-1-4','coktan_secmeli','Odak noktası ne işe yarar?','["Eseri görünmez yapar.","Sadece imza yeridir.","İzleyicinin dikkatini yönlendirir.","Renkleri siler."]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-kompozisyon' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-1-5','coktan_secmeli','Ritim görsel sanatlarda tekrar ve hareket hissi oluşturabilir mi?','["Evet","Hayır","Sadece müzikte vardır","Görsel ritim olmaz"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-kompozisyon' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-1-6','coktan_secmeli','Negatif boşluk kompozisyonun parçası mıdır?','["Hayır","Boş alan hatadır","Evet","Sadece çerçevedir"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-kompozisyon' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'gs8-dijital-sanat','Geleneksel ve Dijital Üretim Teknikleri','Geleneksel ve Dijital Üretim Teknikleri','Geleneksel ve Dijital Üretim Teknikleri becerilerini güvenli ve uygulamalı biçimde geliştirir.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='gs8-uretim'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-2-1','coktan_secmeli','Dijital çizim geleneksel çizimden farklı araçlar kullanabilir mi?','["Hayır","Aynı araç zorunlu","Dijital sanat yoktur","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-dijital-sanat' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-2-2','coktan_secmeli','Katman kullanımı dijital tasarımda düzenlemeyi kolaylaştırır mı?','["Hayır","Evet","Katman görüntüyü bozar","Sadece fotoğrafta"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-dijital-sanat' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-2-3','coktan_secmeli','Kolaj farklı görselleri bir araya getiren bir teknik olabilir mi?','["Hayır","Sadece tek çizgi kullanır","Kolaj müzik terimidir","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-dijital-sanat' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-2-4','coktan_secmeli','Malzemenin özelliği seçilen tekniği etkileyebilir mi?','["Hayır","Evet","Malzeme önemsiz","Sadece konu belirler"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-dijital-sanat' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-2-5','coktan_secmeli','Dijital görsel kullanırken telif hakları dikkate alınmalı mıdır?','["Hayır","İnternetteki her görsel serbesttir","Kaynak gerekmez","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-dijital-sanat' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-2-6','coktan_secmeli','Farklı teknikleri birlikte kullanmak karma teknik olarak adlandırılabilir mi?','["Hayır","Evet","Teknikler birleştirilemez","Sadece dijitalde olur"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-dijital-sanat' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'gs8-miras-konu','Sanat, Kimlik ve Kültürel Miras','Sanat, Kimlik ve Kültürel Miras','Sanat, Kimlik ve Kültürel Miras becerilerini güvenli ve uygulamalı biçimde geliştirir.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='gs8-miras'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-3-1','coktan_secmeli','Kültürel miras sanat eserlerinde toplumsal kimliği yansıtabilir mi?','["Hayır","Sanat kültürden bağımsızdır","Evet","Sadece fiyatı yansıtır"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-miras-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-3-2','coktan_secmeli','Müzeler sanat ve kültür mirasını korumaya yardım eder mi?','["Evet","Hayır","Sadece satış yapar","Sadece eğlence alanıdır"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-miras-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-3-3','coktan_secmeli','Tarihî eserlerin izinsiz değiştirilmesi uygun mudur?','["Evet","Sadece küçükse","Hayır","Koruma gereksizdir"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-miras-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-3-4','coktan_secmeli','Geleneksel motifler çağdaş sanat içinde yeniden yorumlanabilir mi?','["Evet","Hayır","Motif değiştirilemez","Çağdaş sanat miras kullanmaz"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-miras-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-3-5','coktan_secmeli','Sanat eserinin üretildiği dönem eserin yorumunu etkileyebilir mi?','["Hayır","Dönem önemsizdir","Evet","Sadece malzeme önemlidir"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-miras-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-3-6','coktan_secmeli','Kültürel mirası belgelemek korumaya katkı sağlayabilir mi?','["Evet","Hayır","Belgeleme gereksizdir","Sadece satış için yapılır"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-miras-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'gs8-elestiri','Sanat Eserini Çözümleme ve Yorumlama','Sanat Eserini Çözümleme ve Yorumlama','Sanat Eserini Çözümleme ve Yorumlama becerilerini güvenli ve uygulamalı biçimde geliştirir.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='gs8-estetik'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-4-1','coktan_secmeli','Sanat eleştirisinde önce eserde görülen ögeler betimlenebilir mi?','["Hayır","Evet","Doğrudan yargı verilir","Eser görülmeden yorumlanır"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-elestiri' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-4-2','coktan_secmeli','Yorum ile nesnel betimleme aynı şey midir?','["Evet","Her zaman","Sadece modern sanatta","Hayır"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-elestiri' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-4-3','coktan_secmeli','Sanatçının seçtiği malzeme anlamı etkileyebilir mi?','["Hayır","Evet","Sadece fiyatı etkiler","Malzeme görünmezdir"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-elestiri' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-4-4','coktan_secmeli','Bir eserin tek bir doğru yorumu olmak zorunda mıdır?','["Evet","Her zaman","Yorum yapılamaz","Hayır"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-elestiri' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-4-5','coktan_secmeli','Eleştiride görüşü görsel kanıtla desteklemek önemli midir?','["Hayır","Evet","Kanıt gerekmez","Sadece beğeni yeter"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-elestiri' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-4-6','coktan_secmeli','Estetik yargılar kişisel ve kültürel etkenlerden etkilenebilir mi?','["Hayır","Herkes aynı düşünür","Kültür etkisizdir","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='gs8-elestiri' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'muz8-soyleme','Dinleme, Söyleme ve Ses Sağlığı','Dinleme, Söyleme ve Ses Sağlığı','Dinleme, Söyleme ve Ses Sağlığı becerilerini güvenli ve uygulamalı biçimde geliştirir.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='muz8-dinleme'
WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-5-1','coktan_secmeli','Birlikte müzik yaparken diğerlerini dinlemek uyumu artırır mı?','["Evet","Hayır","Sadece kendi sesimizi duymalıyız","Uyum önemli değildir"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-soyleme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-5-2','coktan_secmeli','Doğru nefes kullanımı şarkı söylemeye destek olur mu?','["Hayır","Nefes önemli değildir","Evet","Sadece çalgıda"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-soyleme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-5-3','coktan_secmeli','Ses sağlığı için uzun süre bağırmak uygun mudur?','["Hayır","Evet","Her zaman","Sadece provada"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-soyleme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-5-4','coktan_secmeli','Ses aralığı kişiden kişiye değişebilir mi?','["Hayır","Herkes aynıdır","Evet","Sadece yaşa göre değil"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-soyleme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-5-5','coktan_secmeli','Toplu söylemede tempo ortak tutulmalı mıdır?','["Evet","Hayır","Herkes farklı tempo kullanmalı","Tempo yoktur"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-soyleme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-5-6','coktan_secmeli','Isınma egzersizleri ses kullanımını hazırlayabilir mi?','["Hayır","Sadece sporda olur","Evet","Ses ısınmaz"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-soyleme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'muz8-ritim','Ritim, Tempo, Nota ve Form','Ritim, Tempo, Nota ve Form','Ritim, Tempo, Nota ve Form becerilerini güvenli ve uygulamalı biçimde geliştirir.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='muz8-algi'
WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-6-1','coktan_secmeli','Tempo neyi ifade eder?','["Ses yüksekliğini","Rengi","Söz sayısını","Müziğin hızını"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-ritim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-6-2','coktan_secmeli','Ritim neyle ilgilidir?','["Sadece melodi adıyla","Vuruş ve süre düzeniyle","Sadece çalgı rengiyle","Sadece sözlerle"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-ritim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-6-3','coktan_secmeli','Ölçü çizgileri müzik yazısında düzen sağlar mı?','["Hayır","Sadece süstür","Nota yazısında kullanılmaz","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-ritim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-6-4','coktan_secmeli','Dinamik işaretler ses şiddetiyle ilgili olabilir mi?','["Hayır","Evet","Sadece hızla","Sadece perdeyle"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-ritim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-6-5','coktan_secmeli','Müzik formu eserin bölümlerinin düzeniyle ilişkili midir?','["Hayır","Sadece sözleri ifade eder","Form yoktur","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-ritim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-6-6','coktan_secmeli','Bir ritim kalıbı farklı çalgılarla icra edilebilir mi?','["Hayır","Evet","Tek çalgı zorunlu","Ritim çalgıdan bağımsız değildir"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-ritim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'muz8-uretim','Müziksel Üretim ve Düzenleme','Müziksel Üretim ve Düzenleme','Müziksel Üretim ve Düzenleme becerilerini güvenli ve uygulamalı biçimde geliştirir.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='muz8-yaratici'
WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-7-1','coktan_secmeli','Kısa bir ritim motifi geliştirilebilir mi?','["Hayır","Motif değişmez","Evet","Sadece hazır müzik kullanılır"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-uretim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-7-2','coktan_secmeli','Dijital müzik yazılımları düzenleme için kullanılabilir mi?','["Evet","Hayır","Sadece oyun içindir","Müzikle ilgisizdir"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-uretim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-7-3','coktan_secmeli','Bir ezgiye farklı eşlik yazmak müziksel düzenleme sayılabilir mi?','["Hayır","Eşlik yazılamaz","Evet","Sadece kopyadır"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-uretim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-7-4','coktan_secmeli','Doğaçlama önceden tamamen yazılmamış müzik üretimini içerebilir mi?','["Evet","Hayır","Her nota önceden yazılır","Doğaçlama müzik değildir"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-uretim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-7-5','coktan_secmeli','Müzik üretiminde telif ve kaynak önemli midir?','["Hayır","Her eser serbesttir","Evet","Kaynak gerekmez"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-uretim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-7-6','coktan_secmeli','Grup bestesinde görev paylaşımı yapılabilir mi?','["Evet","Hayır","Tek kişi yapmak zorundadır","Görev paylaşımı müzikte olmaz"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-uretim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'muz8-miras','Müzik Kültürü ve Ortak Miras','Müzik Kültürü ve Ortak Miras','Müzik Kültürü ve Ortak Miras becerilerini güvenli ve uygulamalı biçimde geliştirir.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='muz8-kultur'
WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-8-1','coktan_secmeli','Türküler kültürel hafıza taşıyabilir mi?','["Hayır","Evet","Sadece eğlencedir","Kültürle ilgisizdir"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-miras' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-8-2','coktan_secmeli','Farklı bölgelerin müzik özellikleri farklı olabilir mi?','["Hayır","Her bölge aynıdır","Yerel müzik yoktur","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-miras' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-8-3','coktan_secmeli','Geleneksel çalgılar kültürel mirasın parçası olabilir mi?','["Hayır","Evet","Sadece modern çalgılar","Çalgı miras değildir"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-miras' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-8-4','coktan_secmeli','Farklı kültürlerin müziklerini dinlemek kültürel anlayışı artırabilir mi?','["Hayır","Sadece kendi kültürü dinlenir","Müzik kültürle ilgisizdir","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-miras' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-8-5','coktan_secmeli','Müzik arşivleri eserlerin korunmasına katkı sağlar mı?','["Hayır","Evet","Arşiv gereksizdir","Sadece yeni eserler korunur"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-miras' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-8-6','coktan_secmeli','Bir eseri kaynağıyla birlikte tanımak kültürel bağlamı anlamaya yardım eder mi?','["Hayır","Kaynak önemsizdir","Sadece melodi yeter","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='muz8-miras' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'bes8-beceri','Hareket Becerileri ve Koordinasyon','Hareket Becerileri ve Koordinasyon','Hareket Becerileri ve Koordinasyon becerilerini güvenli ve uygulamalı biçimde geliştirir.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='bes8-hareket'
WHERE d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-9-1','coktan_secmeli','Koordinasyon farklı vücut bölümlerini uyumlu kullanma becerisi midir?','["Evet","Hayır","Sadece güçtür","Sadece hızdır"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-beceri' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-9-2','coktan_secmeli','Denge sporda temel hareket becerilerinden biri midir?','["Hayır","Sadece jimnastikte","Evet","Sporla ilgisizdir"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-beceri' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-9-3','coktan_secmeli','Teknik hareket öğrenirken önce güvenli ve kontrollü uygulama yapılmalı mıdır?','["Evet","Hayır","Hemen maksimum hız","Güvenlik sonradan"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-beceri' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-9-4','coktan_secmeli','Performans gelişimi düzenli pratikle desteklenebilir mi?','["Hayır","Pratik etkisizdir","Evet","Sadece yetenek önemlidir"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-beceri' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-9-5','coktan_secmeli','Hareket alanını kontrol etmek sakatlanma riskini azaltır mı?','["Evet","Hayır","Alan önemli değildir","Sadece hız önemlidir"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-beceri' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-9-6','coktan_secmeli','Farklı sporlar farklı koordinasyon becerileri geliştirebilir mi?','["Hayır","Tüm sporlar aynıdır","Evet","Koordinasyon değişmez"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-beceri' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'bes8-zindelik-konu','Fiziksel Uygunluk ve Sağlıklı Yaşam','Fiziksel Uygunluk ve Sağlıklı Yaşam','Fiziksel Uygunluk ve Sağlıklı Yaşam becerilerini güvenli ve uygulamalı biçimde geliştirir.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='bes8-zindelik'
WHERE d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-10-1','coktan_secmeli','Aerobik dayanıklılık kalp-dolaşım sistemiyle ilişkili midir?','["Hayır","Sadece kas boyuyla","Sadece esneklikle","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-zindelik-konu' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-10-2','coktan_secmeli','Esneklik eklem hareket açıklığıyla ilişkili midir?','["Hayır","Evet","Sadece süratle","Sadece dayanıklılıkla"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-zindelik-konu' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-10-3','coktan_secmeli','Isınma egzersizleri yoğun etkinlik öncesinde yararlı mıdır?','["Hayır","Sadece etkinlik sonrası","Isınma gereksizdir","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-zindelik-konu' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-10-4','coktan_secmeli','Yeterli sıvı alımı fiziksel etkinlikte önemli midir?','["Hayır","Evet","Su performansı bozar","Sadece yarışta"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-zindelik-konu' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-10-5','coktan_secmeli','Uyku fiziksel toparlanmayı etkiler mi?','["Hayır","Sadece beslenme etkiler","Uyku gereksizdir","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-zindelik-konu' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-10-6','coktan_secmeli','Ağrı veya sakatlanma şüphesinde zorlamaya devam etmek doğru mudur?','["Evet","Hayır","Her zaman","Sadece maçsa"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-zindelik-konu' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'bes8-strateji','Takım Stratejisi ve Adil Oyun','Takım Stratejisi ve Adil Oyun','Takım Stratejisi ve Adil Oyun becerilerini güvenli ve uygulamalı biçimde geliştirir.','',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='bes8-takim'
WHERE d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-11-1','coktan_secmeli','Takım oyununda strateji neyi düzenler?','["Sadece formayı","Sadece skor tabelasını","Oyuncuların amaç doğrultusunda birlikte hareketini","Sadece seyirciyi"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-strateji' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-11-2','coktan_secmeli','Adil oyun rakibe ve kurallara saygıyı içerir mi?','["Evet","Hayır","Sadece kazanan için","Kurallar önemli değildir"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-strateji' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-11-3','coktan_secmeli','Takım içi iletişim performansı etkileyebilir mi?','["Hayır","Sadece bireysel yetenek","Evet","İletişim gereksizdir"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-strateji' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-11-4','coktan_secmeli','Hakem kararına saygılı itiraz biçimleri var mıdır?','["Evet","Hayır","Bağırmak tek yoldur","Kurallar yoktur"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-strateji' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-11-5','coktan_secmeli','Rakibin zayıf noktasını kurallar içinde değerlendirmek strateji olabilir mi?','["Hayır","Her strateji hiledir","Evet","Rakip gözlenmez"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-strateji' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-11-6','coktan_secmeli','Mağlubiyetten sonra performansı analiz etmek gelişime katkı sağlar mı?','["Evet","Hayır","Sadece galibiyet analiz edilir","Analiz gereksizdir"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-strateji' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'bes8-spor-kultur','Spor Kültürü ve Güvenlik','Spor Kültürü ve Güvenlik','Spor Kültürü ve Güvenlik becerilerini güvenli ve uygulamalı biçimde geliştirir.','',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='bes8-kultur'
WHERE d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-12-1','coktan_secmeli','Spor kültürü yalnız profesyonel yarışmadan mı oluşur?','["Evet","Hayır","Sadece olimpiyatlardan","Sadece futboldan"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-spor-kultur' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-12-2','coktan_secmeli','Seyirci davranışlarında saygı ve güvenlik önemli midir?','["Hayır","Sadece skor önemli","Kurallar seyirciye uygulanmaz","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-spor-kultur' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-12-3','coktan_secmeli','Doping adil spor anlayışına uygun mudur?','["Evet","Hayır","Sadece profesyonelde","Performans artıyorsa uygundur"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-spor-kultur' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-12-4','coktan_secmeli','Spor tesislerinde güvenlik kurallarına uyulmalı mıdır?','["Hayır","Sadece görevliler","Kurallar gereksizdir","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-spor-kultur' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-12-5','coktan_secmeli','Geleneksel sporlar kültürel mirasın parçası olabilir mi?','["Hayır","Evet","Sadece modern sporlar","Spor kültür değildir"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-spor-kultur' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-12-6','coktan_secmeli','Spor etkinliği planlarken yaş ve fiziksel özellikler dikkate alınmalı mıdır?','["Hayır","Herkes aynı programı yapmalı","Sadece süre önemlidir","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='bes8-spor-kultur' AND (d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'reh8-plan','Sınav Hazırlığı ve Çalışma Planı','Sınav Hazırlığı ve Çalışma Planı','Sınav Hazırlığı ve Çalışma Planı becerilerini güvenli ve uygulamalı biçimde geliştirir.','',130,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='reh8-sinav'
WHERE d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-13-1','coktan_secmeli','Çalışma planında gerçekçi hedefler belirlemek yararlı mıdır?','["Evet","Hayır","Hedef belirsiz olmalı","Plan gereksizdir"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-plan' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-13-2','coktan_secmeli','Deneme sınavı sonuçlarını konu bazında analiz etmek ne sağlar?','["Sadece puana bakmayı","Dersi bırakmayı","Eksik alanları görmeye","Sonucu gizlemeyi"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-plan' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-13-3','coktan_secmeli','Uzun çalışma oturumları arasında kısa molalar vermek odaklanmaya yardım edebilir mi?','["Evet","Hayır","Hiç mola verilmemeli","Mola öğrenmeyi siler"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-plan' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-13-4','coktan_secmeli','Uyku düzenini bozarak çalışmak sürdürülebilir bir yöntem midir?','["Evet her zaman","Uyku gereksizdir","Genellikle hayır","Sadece sınavdan sonra uyunur"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-plan' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-13-5','coktan_secmeli','Hedefi haftalık küçük görevlere bölmek yararlı mıdır?','["Evet","Hayır","Hedef karmaşıklaşır","Sadece son gün çalışılır"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-plan' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-13-6','coktan_secmeli','Yanlış soruları neden yanlış yaptığını incelemek öğrenmeyi destekler mi?','["Hayır","Yanlışlar silinmeli","Evet","Sadece doğru sayısı önemlidir"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-plan' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'reh8-tercih','Lise Türleri, İlgi ve Kariyer Farkındalığı','Lise Türleri, İlgi ve Kariyer Farkındalığı','Lise Türleri, İlgi ve Kariyer Farkındalığı becerilerini güvenli ve uygulamalı biçimde geliştirir.','',140,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='reh8-kariyer'
WHERE d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-14-1','coktan_secmeli','Lise seçerken ilgi ve güçlü yönler dikkate alınmalı mıdır?','["Hayır","Sadece arkadaş tercihi","Sadece okul binası","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-tercih' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-14-2','coktan_secmeli','Okulların program ve imkânlarını araştırmak doğru karar vermeye yardım eder mi?','["Hayır","Evet","Araştırma gereksizdir","Sadece isim önemlidir"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-tercih' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-14-3','coktan_secmeli','Kariyer seçimi tek seferde değişmez biçimde belirlenmek zorunda mıdır?','["Evet","13 yaşında kesinleşir","İlgi değişmez","Hayır"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-tercih' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-14-4','coktan_secmeli','Meslekleri tanımak için güvenilir bilgi kaynakları kullanılmalı mıdır?','["Hayır","Evet","Sadece söylenti","Sadece sosyal medya yorumu"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-tercih' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-14-5','coktan_secmeli','Beceri ve ilgi alanları zamanla gelişebilir mi?','["Hayır","Değişmez","Sadece not değişir","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-tercih' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-14-6','coktan_secmeli','Tercih yaparken ulaşım, eğitim programı ve kişisel hedefler birlikte değerlendirilebilir mi?','["Hayır","Evet","Sadece tek ölçüt","Hedef önemli değildir"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-tercih' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'reh8-iletisim','Akran İlişkileri, Sınırlar ve İletişim','Akran İlişkileri, Sınırlar ve İletişim','Akran İlişkileri, Sınırlar ve İletişim becerilerini güvenli ve uygulamalı biçimde geliştirir.','',150,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='reh8-iliski'
WHERE d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-15-1','coktan_secmeli','Akran baskısında kişisel sınırları ifade etmek önemli midir?','["Hayır","Her isteğe uyulmalı","Evet","Sınır koymak yanlıştır"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-iletisim' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-15-2','coktan_secmeli','“Hayır” diyebilmek sağlıklı sınırların parçası olabilir mi?','["Evet","Hayır","Her zaman kaba","Sadece yetişkinler diyebilir"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-iletisim' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-15-3','coktan_secmeli','Anlaşmazlıkta karşı tarafı dinlemek çözümü kolaylaştırabilir mi?','["Hayır","Sadece kendi görüşümüz","Evet","Dinlemek zayıflıktır"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-iletisim' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-15-4','coktan_secmeli','Zorbalıkla karşılaşınca güvenilir yetişkinden yardım istemek doğru mudur?','["Evet","Hayır","Gizlemek gerekir","Aynı davranışla karşılık verilir"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-iletisim' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-15-5','coktan_secmeli','Arkadaşlıkta kişisel bilgileri izinsiz paylaşmak doğru mudur?','["Evet","Sadece yakın arkadaşsa","Hayır","İnternette izin gerekmez"]',2,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-iletisim' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-15-6','coktan_secmeli','Empati karşı tarafın bakış açısını anlamaya yardım eder mi?','["Evet","Hayır","Sadece kendi fikrimiz","Empati iletişim değildir"]',0,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-iletisim' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'reh8-denge','Dijital Denge, Stres ve Güvenli Yaşam','Dijital Denge, Stres ve Güvenli Yaşam','Dijital Denge, Stres ve Güvenli Yaşam becerilerini güvenli ve uygulamalı biçimde geliştirir.','',160,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='reh8-guven'
WHERE d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-16-1','coktan_secmeli','Yoğun sınav döneminde uyku ve dinlenme önemli midir?','["Hayır","Evet","Sadece çalışma önemlidir","Uyku zaman kaybıdır"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-denge' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-16-2','coktan_secmeli','Stres tamamen yok edilmesi gereken bir duygu mudur?','["Evet her zaman","Stres sadece başarısızlık demektir","Stres yaşayan herkes hastadır","Hayır; yönetilebilir ve belli düzeyde normaldir."]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-denge' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-16-3','coktan_secmeli','Düzenli hareket stres yönetimine yardımcı olabilir mi?','["Hayır","Evet","Sadece puanı düşürür","Hareket gereksizdir"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-denge' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-16-4','coktan_secmeli','Ekran kullanımına sınır koymak uyku ve odaklanmayı destekleyebilir mi?','["Hayır","Ekran uyku yerine geçer","Sınır gereksizdir","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-denge' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-16-5','coktan_secmeli','Çevrim içi tanımadığımız kişilere kişisel bilgi vermek güvenli midir?','["Evet","Hayır","Sadece gece","Sadece sosyal medyada"]',1,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-denge' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8o-16-6','coktan_secmeli','Uzun süren ve günlük yaşamı zorlaştıran yoğun stres durumunda bir yetişkin veya uzmandan destek istemek uygun mudur?','["Hayır","Gizlenmeli","Destek istemek zayıflıktır","Evet"]',3,'Konu bilgisi uygulama, güvenlik ve günlük yaşam bağlamında değerlendirilir.',3,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='reh8-denge' AND (d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

