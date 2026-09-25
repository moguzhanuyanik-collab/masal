SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'tr5-oyun-anlama','Oyun Metinlerinde Anlama','Oyun Metinlerinde Anlama','Oyun Metinlerinde Anlama becerilerini uygular.','',10,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='tr5-oyun' WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-1-1-1','coktan_secmeli','Ana fikir neyi verir?','["Metnin temel iletisini","Her ayrıntıyı","Yazarın adresini","Sayfa sayısını"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-1-1-2','coktan_secmeli','Metinden çıkarım neye dayanır?','["Rastgele tahmine","Kişisel isteğe","Metindeki ipuçlarına","Sadece başlığa"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-1-1-3','coktan_secmeli','Özet nasıl olmalıdır?','["Temel bilgileri kısa ve doğru vermelidir.","Metni aynen tekrar etmelidir.","Daha uzun olmalıdır.","Sadece ilk cümleyi içermelidir."]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-1-1-4','coktan_secmeli','Olay sırası neyi anlamaya yardım eder?','["Yazarın yaşını","Kâğıt boyunu","Metindeki gelişmeleri","Kitap fiyatını"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-1-2-1','coktan_secmeli','Ana fikir neyi verir? Benzer bir bağlamı düşün.','["Her ayrıntıyı","Metnin temel iletisini","Yazarın adresini","Sayfa sayısını"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-1-2-2','coktan_secmeli','Metinden çıkarım neye dayanır? Benzer bir bağlamı düşün.','["Rastgele tahmine","Kişisel isteğe","Sadece başlığa","Metindeki ipuçlarına"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-1-2-3','coktan_secmeli','Özet nasıl olmalıdır? Benzer bir bağlamı düşün.','["Metni aynen tekrar etmelidir.","Temel bilgileri kısa ve doğru vermelidir.","Daha uzun olmalıdır.","Sadece ilk cümleyi içermelidir."]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-1-2-4','coktan_secmeli','Olay sırası neyi anlamaya yardım eder? Benzer bir bağlamı düşün.','["Yazarın yaşını","Kâğıt boyunu","Kitap fiyatını","Metindeki gelişmeleri"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'tr5-oyun-soz','Oyun ve Kurallar Söz Varlığı','Oyun ve Kurallar Söz Varlığı','Oyun ve Kurallar Söz Varlığı becerilerini uygular.','',20,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='tr5-oyun' WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-2-1-1','coktan_secmeli','“strateji” sözcüğü neye yakındır?','["Planlı hareket biçimi","Oyuncu sayısı","Oyun alanı","Ödül"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-soz' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-2-1-2','coktan_secmeli','“adil oyun” neyi anlatır?','["Hileyi","Dışlamayı","Kurallara ve rakibe saygıyı","Kuralsızlığı"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-soz' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-2-1-3','coktan_secmeli','Bağlamdan anlam nasıl bulunabilir?','["Çevredeki sözcük ve cümle ipuçlarıyla","Harf sayarak","Renge bakarak","Sözcüğü silerek"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-soz' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-2-1-4','coktan_secmeli','“rakip” ne demektir?','["Hakem","Seyirci","Karşı tarafta yarışan kişi veya takım","Öğretmen"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-soz' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-2-2-1','coktan_secmeli','“strateji” sözcüğü neye yakındır? Benzer bir bağlamı düşün.','["Oyuncu sayısı","Planlı hareket biçimi","Oyun alanı","Ödül"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-soz' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-2-2-2','coktan_secmeli','“adil oyun” neyi anlatır? Benzer bir bağlamı düşün.','["Hileyi","Dışlamayı","Kuralsızlığı","Kurallara ve rakibe saygıyı"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-soz' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-2-2-3','coktan_secmeli','Bağlamdan anlam nasıl bulunabilir? Benzer bir bağlamı düşün.','["Harf sayarak","Çevredeki sözcük ve cümle ipuçlarıyla","Renge bakarak","Sözcüğü silerek"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-soz' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-2-2-4','coktan_secmeli','“rakip” ne demektir? Benzer bir bağlamı düşün.','["Hakem","Seyirci","Öğretmen","Karşı tarafta yarışan kişi veya takım"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-soz' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'tr5-oyun-yazma','Oyun Kuralı ve Yönerge Yazma','Oyun Kuralı ve Yönerge Yazma','Oyun Kuralı ve Yönerge Yazma becerilerini uygular.','',30,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='tr5-oyun' WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-3-1-1','coktan_secmeli','Oyun kuralı yazarken ne önemlidir?','["Açık ve sıralı anlatım","Belirsiz ifadeler","Eksik adımlar","Rastgele cümleler"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-yazma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-3-1-2','coktan_secmeli','Yönerge cümlesi ne yapar?','["Sadece duygu bildirir.","Sadece kişi tanıtır.","Bir işlemin nasıl yapılacağını açıklar.","Sadece soru sorar."]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-yazma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-3-1-3','coktan_secmeli','“Önce, sonra, son olarak” ne işe yarar?','["İşlem sırasını gösterir.","Karşılaştırma yapar.","Duygu bildirir.","Kişi tanıtır."]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-yazma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-3-1-4','coktan_secmeli','Yönerge gözden geçirilmeli midir?','["Hayır","Sadece başlık","Evet","Sadece resim"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-yazma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-3-2-1','coktan_secmeli','Oyun kuralı yazarken ne önemlidir? Benzer bir bağlamı düşün.','["Belirsiz ifadeler","Açık ve sıralı anlatım","Eksik adımlar","Rastgele cümleler"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-yazma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-3-2-2','coktan_secmeli','Yönerge cümlesi ne yapar? Benzer bir bağlamı düşün.','["Sadece duygu bildirir.","Sadece kişi tanıtır.","Sadece soru sorar.","Bir işlemin nasıl yapılacağını açıklar."]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-yazma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-3-2-3','coktan_secmeli','“Önce, sonra, son olarak” ne işe yarar? Benzer bir bağlamı düşün.','["Karşılaştırma yapar.","İşlem sırasını gösterir.","Duygu bildirir.","Kişi tanıtır."]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-yazma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-3-2-4','coktan_secmeli','Yönerge gözden geçirilmeli midir? Benzer bir bağlamı düşün.','["Hayır","Sadece başlık","Sadece resim","Evet"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-oyun-yazma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'tr5-ataturk-anlama','Atatürk Metinlerinde Ana Fikir ve Çıkarım','Atatürk Metinlerinde Ana Fikir ve Çıkarım','Atatürk Metinlerinde Ana Fikir ve Çıkarım becerilerini uygular.','',40,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='tr5-ataturk' WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-4-1-1','coktan_secmeli','Tarihî metinde ana fikir nasıl belirlenir?','["Metnin bütünündeki temel iletiyle","Tek tarihle","Sadece başlıkla","En uzun cümleyle"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-ataturk-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-4-1-2','coktan_secmeli','Millî Mücadele metninde “bağımsızlık” neyi anlatır?','["Sadece yolculuğu","Sadece ticareti","Bir milletin kendi kararlarını özgürce verebilmesini","Sadece oyunu"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-ataturk-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-4-1-3','coktan_secmeli','Atatürk''ün eğitime verdiği önem anlatılıyorsa uygun başlık?','["Atatürk ve Eğitim","Yeni Oyuncak","Hava Durumu","Spor Salonu"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-ataturk-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-4-1-4','coktan_secmeli','Açık bilgi ile çıkarım aynı mıdır?','["Evet","Her zaman","Hayır","Sadece kısa metinde"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-ataturk-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-4-2-1','coktan_secmeli','Tarihî metinde ana fikir nasıl belirlenir? Benzer bir bağlamı düşün.','["Tek tarihle","Metnin bütünündeki temel iletiyle","Sadece başlıkla","En uzun cümleyle"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-ataturk-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-4-2-2','coktan_secmeli','Millî Mücadele metninde “bağımsızlık” neyi anlatır? Benzer bir bağlamı düşün.','["Sadece yolculuğu","Sadece ticareti","Sadece oyunu","Bir milletin kendi kararlarını özgürce verebilmesini"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-ataturk-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-4-2-3','coktan_secmeli','Atatürk''ün eğitime verdiği önem anlatılıyorsa uygun başlık? Benzer bir bağlamı düşün.','["Yeni Oyuncak","Atatürk ve Eğitim","Hava Durumu","Spor Salonu"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-ataturk-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-4-2-4','coktan_secmeli','Açık bilgi ile çıkarım aynı mıdır? Benzer bir bağlamı düşün.','["Evet","Her zaman","Sadece kısa metinde","Hayır"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-ataturk-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'tr5-kronoloji','Kronoloji ve Bilgi Düzenleme','Kronoloji ve Bilgi Düzenleme','Kronoloji ve Bilgi Düzenleme becerilerini uygular.','',50,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='tr5-ataturk' WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-5-1-1','coktan_secmeli','Kronoloji neyi gösterir?','["Olayların zaman sırasını","Mekânı","Rengi","Fiyatı"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-kronoloji' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-5-1-2','coktan_secmeli','Zaman şeridi ne için kullanılır?','["Kütle ölçmek","Para saymak","Olayları sıraya koymak","Açı ölçmek"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-kronoloji' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-5-1-3','coktan_secmeli','Tarih bilgisi neden önemlidir?','["Olayların zaman ilişkisini kurmak için","Rengi bilmek için","Yazarı değiştirmek için","Metni kısaltmak için"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-kronoloji' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-5-1-4','coktan_secmeli','“Önce-sonra” hangi beceriye yardım eder?','["Eş anlam bulmaya","Noktalama seçmeye","Kronolojik sıralamaya","Kafiye kurmaya"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-kronoloji' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-5-2-1','coktan_secmeli','Kronoloji neyi gösterir? Benzer bir bağlamı düşün.','["Mekânı","Olayların zaman sırasını","Rengi","Fiyatı"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-kronoloji' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-5-2-2','coktan_secmeli','Zaman şeridi ne için kullanılır? Benzer bir bağlamı düşün.','["Kütle ölçmek","Para saymak","Açı ölçmek","Olayları sıraya koymak"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-kronoloji' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-5-2-3','coktan_secmeli','Tarih bilgisi neden önemlidir? Benzer bir bağlamı düşün.','["Rengi bilmek için","Olayların zaman ilişkisini kurmak için","Yazarı değiştirmek için","Metni kısaltmak için"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-kronoloji' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-5-2-4','coktan_secmeli','“Önce-sonra” hangi beceriye yardım eder? Benzer bir bağlamı düşün.','["Eş anlam bulmaya","Noktalama seçmeye","Kafiye kurmaya","Kronolojik sıralamaya"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-kronoloji' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'tr5-kaynak','Kaynak ve Bilgiyi Doğrulama','Kaynak ve Bilgiyi Doğrulama','Kaynak ve Bilgiyi Doğrulama becerilerini uygular.','',60,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='tr5-ataturk' WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-6-1-1','coktan_secmeli','Güvenilir kaynak neden önemlidir?','["Bilginin doğruluğunu destekler.","Metni uzatır.","Rengi seçer.","Sayfayı çoğaltır."]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-6-1-2','coktan_secmeli','İki kaynak çelişirse ne yapılır?','["Rastgele biri seçilir.","İkisi de silinir.","Başka güvenilir kaynaklarla karşılaştırılır.","Bilgi uydurulur."]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-6-1-3','coktan_secmeli','Kaynakça neyi gösterir?','["Yararlanılan kaynakları","Kitabın ağırlığını","Yazarın yaşını","Sayfa rengini"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-6-1-4','coktan_secmeli','Yayın tarihi neye yardım eder?','["Metnin rengini seçmeye","Yazıyı büyütmeye","Bilginin güncelliğini anlamaya","Soru saymaya"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-6-2-1','coktan_secmeli','Güvenilir kaynak neden önemlidir? Benzer bir bağlamı düşün.','["Metni uzatır.","Bilginin doğruluğunu destekler.","Rengi seçer.","Sayfayı çoğaltır."]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-6-2-2','coktan_secmeli','İki kaynak çelişirse ne yapılır? Benzer bir bağlamı düşün.','["Rastgele biri seçilir.","İkisi de silinir.","Bilgi uydurulur.","Başka güvenilir kaynaklarla karşılaştırılır."]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-6-2-3','coktan_secmeli','Kaynakça neyi gösterir? Benzer bir bağlamı düşün.','["Kitabın ağırlığını","Yararlanılan kaynakları","Yazarın yaşını","Sayfa rengini"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-6-2-4','coktan_secmeli','Yayın tarihi neye yardım eder? Benzer bir bağlamı düşün.','["Metnin rengini seçmeye","Yazıyı büyütmeye","Soru saymaya","Bilginin güncelliğini anlamaya"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'tr5-duygu-anlama','Duygu ve Karakter Çözümleme','Duygu ve Karakter Çözümleme','Duygu ve Karakter Çözümleme becerilerini uygular.','',70,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='tr5-duygu' WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-7-1-1','coktan_secmeli','Karakterin davranışı duygusu hakkında ipucu verebilir mi?','["Evet","Hayır","Sadece yaşını verir","Sadece yeri verir"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-7-1-2','coktan_secmeli','“Elleri titriyor, sesi kısılıyordu.” hangi duygu olabilir?','["Neşe kesin","Gurur kesin","Kaygı veya korku","Sıkılma kesin"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-7-1-3','coktan_secmeli','Empati karakteri anlamaya yardım eder mi?','["Evet","Hayır","Sadece olay sırasını bozar","Metinle ilgisizdir"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-7-1-4','coktan_secmeli','Karakterin zamanla değişimi incelenebilir mi?','["Hayır","Karakter değişmez","Evet","Sadece mekân değişir"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-7-2-1','coktan_secmeli','Karakterin davranışı duygusu hakkında ipucu verebilir mi? Benzer bir bağlamı düşün.','["Hayır","Evet","Sadece yaşını verir","Sadece yeri verir"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-7-2-2','coktan_secmeli','“Elleri titriyor, sesi kısılıyordu.” hangi duygu olabilir? Benzer bir bağlamı düşün.','["Neşe kesin","Gurur kesin","Sıkılma kesin","Kaygı veya korku"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-7-2-3','coktan_secmeli','Empati karakteri anlamaya yardım eder mi? Benzer bir bağlamı düşün.','["Hayır","Evet","Sadece olay sırasını bozar","Metinle ilgisizdir"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-7-2-4','coktan_secmeli','Karakterin zamanla değişimi incelenebilir mi? Benzer bir bağlamı düşün.','["Hayır","Karakter değişmez","Sadece mekân değişir","Evet"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'tr5-duygu-soz','Duygu Sözcükleri ve Mecaz','Duygu Sözcükleri ve Mecaz','Duygu Sözcükleri ve Mecaz becerilerini uygular.','',80,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='tr5-duygu' WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-8-1-1','coktan_secmeli','“İçi içine sığmamak” ne anlatır?','["Çok heyecanlanmak","Uyumak","Üşümek","Susamak"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-soz' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-8-1-2','coktan_secmeli','Mecaz anlam nedir?','["Sadece sözlük anlamı","Sadece sayı anlamı","Sözcüğün gerçek anlamından farklı kullanımı","Sadece özel ad"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-soz' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-8-1-3','coktan_secmeli','“Kalbi kuş gibi çarpıyordu.” neyi anlatabilir?','["Heyecanı","Kuş olduğunu","Uçtuğunu","Uyuduğunu"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-soz' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-8-1-4','coktan_secmeli','“sevinç” sözcüğünün zıttına yakın?','["mutluluk","neşe","üzüntü","coşku"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-soz' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-8-2-1','coktan_secmeli','“İçi içine sığmamak” ne anlatır? Benzer bir bağlamı düşün.','["Uyumak","Çok heyecanlanmak","Üşümek","Susamak"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-soz' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-8-2-2','coktan_secmeli','Mecaz anlam nedir? Benzer bir bağlamı düşün.','["Sadece sözlük anlamı","Sadece sayı anlamı","Sadece özel ad","Sözcüğün gerçek anlamından farklı kullanımı"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-soz' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-8-2-3','coktan_secmeli','“Kalbi kuş gibi çarpıyordu.” neyi anlatabilir? Benzer bir bağlamı düşün.','["Kuş olduğunu","Heyecanı","Uçtuğunu","Uyuduğunu"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-soz' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-8-2-4','coktan_secmeli','“sevinç” sözcüğünün zıttına yakın? Benzer bir bağlamı düşün.','["mutluluk","neşe","coşku","üzüntü"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-soz' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'tr5-duygu-yazma','Duygu ve Düşünceyi Yazıyla Anlatma','Duygu ve Düşünceyi Yazıyla Anlatma','Duygu ve Düşünceyi Yazıyla Anlatma becerilerini uygular.','',90,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='tr5-duygu' WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-9-1-1','coktan_secmeli','Duygu yazısında örnek olay anlatımı güçlendirir mi?','["Evet","Hayır","Sadece bilgi metninde","Örnek gereksiz"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-yazma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-9-1-2','coktan_secmeli','Görüşe gerekçe sunmak neden önemlidir?','["Yazıyı bozar.","Başlığı kaldırır.","Düşünceyi daha anlaşılır kılar.","Sadece uzatır."]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-yazma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-9-1-3','coktan_secmeli','Giriş-gelişme-sonuç düzeni kullanılabilir mi?','["Evet","Hayır","Sadece şiirde","Sadece listede"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-yazma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-9-1-4','coktan_secmeli','Yazı bitince ne yapılır?','["Hemen atılır.","Hiç okunmaz.","Gözden geçirilir.","Başlık silinir."]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-yazma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-9-2-1','coktan_secmeli','Duygu yazısında örnek olay anlatımı güçlendirir mi? Benzer bir bağlamı düşün.','["Hayır","Evet","Sadece bilgi metninde","Örnek gereksiz"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-yazma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-9-2-2','coktan_secmeli','Görüşe gerekçe sunmak neden önemlidir? Benzer bir bağlamı düşün.','["Yazıyı bozar.","Başlığı kaldırır.","Sadece uzatır.","Düşünceyi daha anlaşılır kılar."]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-yazma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-9-2-3','coktan_secmeli','Giriş-gelişme-sonuç düzeni kullanılabilir mi? Benzer bir bağlamı düşün.','["Hayır","Evet","Sadece şiirde","Sadece listede"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-yazma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-9-2-4','coktan_secmeli','Yazı bitince ne yapılır? Benzer bir bağlamı düşün.','["Hemen atılır.","Hiç okunmaz.","Başlık silinir.","Gözden geçirilir."]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-duygu-yazma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'tr5-gelenek-anlama','Kültürel Metinleri Anlama','Kültürel Metinleri Anlama','Kültürel Metinleri Anlama becerilerini uygular.','',100,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='tr5-gelenek' WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-10-1-1','coktan_secmeli','Kültürel miras neyi kapsar?','["Geçmişten aktarılan maddi ve manevi değerleri","Sadece yeni teknolojiyi","Hava durumunu","Para birimini"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-gelenek-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-10-1-2','coktan_secmeli','Geleneksel metinden dönem hakkında bilgi çıkarılabilir mi?','["Hayır","Sadece yazar adı","Evet","Sadece sayfa sayısı"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-gelenek-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-10-1-3','coktan_secmeli','Kültürel farklılıklara nasıl yaklaşılır?','["Saygıyla","Alayla","Dışlayarak","Yok sayarak"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-gelenek-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-10-1-4','coktan_secmeli','Geçmiş uygulamalar günümüzle karşılaştırılabilir mi?','["Hayır","Zamanlar karşılaştırılamaz","Evet","Sadece sayılar karşılaştırılır"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-gelenek-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-10-2-1','coktan_secmeli','Kültürel miras neyi kapsar? Benzer bir bağlamı düşün.','["Sadece yeni teknolojiyi","Geçmişten aktarılan maddi ve manevi değerleri","Hava durumunu","Para birimini"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-gelenek-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-10-2-2','coktan_secmeli','Geleneksel metinden dönem hakkında bilgi çıkarılabilir mi? Benzer bir bağlamı düşün.','["Hayır","Sadece yazar adı","Sadece sayfa sayısı","Evet"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-gelenek-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-10-2-3','coktan_secmeli','Kültürel farklılıklara nasıl yaklaşılır? Benzer bir bağlamı düşün.','["Alayla","Saygıyla","Dışlayarak","Yok sayarak"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-gelenek-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-10-2-4','coktan_secmeli','Geçmiş uygulamalar günümüzle karşılaştırılabilir mi? Benzer bir bağlamı düşün.','["Hayır","Zamanlar karşılaştırılamaz","Sadece sayılar karşılaştırılır","Evet"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-gelenek-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'tr5-deyim','Deyim, Atasözü ve Kültürel Söz Varlığı','Deyim, Atasözü ve Kültürel Söz Varlığı','Deyim, Atasözü ve Kültürel Söz Varlığı becerilerini uygular.','',110,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='tr5-gelenek' WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-11-1-1','coktan_secmeli','Atasözü genellikle ne içerir?','["Toplumsal deneyimden gelen öğüt veya yargı","Sadece kişi adı","Sadece tarih","Sadece emir"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-11-1-2','coktan_secmeli','“Damlaya damlaya göl olur.” neyi destekler?','["Su israfını","Hızlı harcamayı","Küçük birikimlerin büyüyebileceğini","Çalışmamayı"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-11-1-3','coktan_secmeli','“Elini taşın altına koymak” ne demektir?','["Sorumluluk almak","Taş taşımak zorunlu","Kaçmak","Dinlenmek"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-11-1-4','coktan_secmeli','Deyimler anlatımı zenginleştirebilir mi?','["Hayır","Anlamı yok eder","Evet","Sadece uzatır"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-11-2-1','coktan_secmeli','Atasözü genellikle ne içerir? Benzer bir bağlamı düşün.','["Sadece kişi adı","Toplumsal deneyimden gelen öğüt veya yargı","Sadece tarih","Sadece emir"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-11-2-2','coktan_secmeli','“Damlaya damlaya göl olur.” neyi destekler? Benzer bir bağlamı düşün.','["Su israfını","Hızlı harcamayı","Çalışmamayı","Küçük birikimlerin büyüyebileceğini"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-11-2-3','coktan_secmeli','“Elini taşın altına koymak” ne demektir? Benzer bir bağlamı düşün.','["Taş taşımak zorunlu","Sorumluluk almak","Kaçmak","Dinlenmek"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-11-2-4','coktan_secmeli','Deyimler anlatımı zenginleştirebilir mi? Benzer bir bağlamı düşün.','["Hayır","Anlamı yok eder","Sadece uzatır","Evet"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'tr5-karsilastir','Geçmiş ve Bugünü Karşılaştırma','Geçmiş ve Bugünü Karşılaştırma','Geçmiş ve Bugünü Karşılaştırma becerilerini uygular.','',120,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='tr5-gelenek' WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-12-1-1','coktan_secmeli','Geçmiş ve bugünü karşılaştırırken ortak ölçüt gerekli mi?','["Evet","Hayır","Rastgele","Sadece tarih yeter"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-karsilastir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-12-1-2','coktan_secmeli','“Eskiden mektup, bugün mesaj” neyi gösterir?','["İletişimin bittiğini","Dil yok olduğunu","İletişim araçlarının değişimini","Sadece kâğıdı"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-karsilastir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-12-1-3','coktan_secmeli','Kültürel uygulamalar zamanla değişebilir mi?','["Evet","Hayır","Asla değişmez","Sadece adı değişir"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-karsilastir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-12-1-4','coktan_secmeli','Benzerlik ve farklılık birlikte verilebilir mi?','["Hayır","Sadece farklılık","Evet","Sadece benzerlik"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-karsilastir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-12-2-1','coktan_secmeli','Geçmiş ve bugünü karşılaştırırken ortak ölçüt gerekli mi? Benzer bir bağlamı düşün.','["Hayır","Evet","Rastgele","Sadece tarih yeter"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-karsilastir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-12-2-2','coktan_secmeli','“Eskiden mektup, bugün mesaj” neyi gösterir? Benzer bir bağlamı düşün.','["İletişimin bittiğini","Dil yok olduğunu","Sadece kâğıdı","İletişim araçlarının değişimini"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-karsilastir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-12-2-3','coktan_secmeli','Kültürel uygulamalar zamanla değişebilir mi? Benzer bir bağlamı düşün.','["Hayır","Evet","Asla değişmez","Sadece adı değişir"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-karsilastir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-12-2-4','coktan_secmeli','Benzerlik ve farklılık birlikte verilebilir mi? Benzer bir bağlamı düşün.','["Hayır","Sadece farklılık","Sadece benzerlik","Evet"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-karsilastir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'tr5-iletisim','İletişim Unsurları ve Nezaket','İletişim Unsurları ve Nezaket','İletişim Unsurları ve Nezaket becerilerini uygular.','',130,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='tr5-iletisim' WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-13-1-1','coktan_secmeli','Aktif dinleme neyi gerektirir?','["Konuşana dikkat vermeyi","Söz kesmeyi","Telefonla ilgilenmeyi","Bağırmayı"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-iletisim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-13-1-2','coktan_secmeli','Beden dili mesajı etkiler mi?','["Hayır","Sadece kelimeler","Evet","Beden dili yoktur"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-iletisim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-13-1-3','coktan_secmeli','Nezaket ifadeleri iletişimi nasıl etkiler?','["Saygılı hâle getirir.","Kavgayı artırır.","Anlamı yok eder.","İletişimi durdurur."]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-iletisim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-13-1-4','coktan_secmeli','Dijital iletişimde saygı gerekli midir?','["Hayır","İnternette kural yok","Evet","Sadece okulda"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-iletisim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-13-2-1','coktan_secmeli','Aktif dinleme neyi gerektirir? Benzer bir bağlamı düşün.','["Söz kesmeyi","Konuşana dikkat vermeyi","Telefonla ilgilenmeyi","Bağırmayı"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-iletisim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-13-2-2','coktan_secmeli','Beden dili mesajı etkiler mi? Benzer bir bağlamı düşün.','["Hayır","Sadece kelimeler","Beden dili yoktur","Evet"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-iletisim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-13-2-3','coktan_secmeli','Nezaket ifadeleri iletişimi nasıl etkiler? Benzer bir bağlamı düşün.','["Kavgayı artırır.","Saygılı hâle getirir.","Anlamı yok eder.","İletişimi durdurur."]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-iletisim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-13-2-4','coktan_secmeli','Dijital iletişimde saygı gerekli midir? Benzer bir bağlamı düşün.','["Hayır","İnternette kural yok","Sadece okulda","Evet"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-iletisim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'tr5-gorsel','Görsel, Grafik ve Çoklu Ortam Okuma','Görsel, Grafik ve Çoklu Ortam Okuma','Görsel, Grafik ve Çoklu Ortam Okuma becerilerini uygular.','',140,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='tr5-iletisim' WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-14-1-1','coktan_secmeli','Grafikte başlık ne işe yarar?','["Verinin konusunu açıklar.","Rengi seçer.","Metni siler.","Yazarı belirler."]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-14-1-2','coktan_secmeli','Afişte görsel ve yazı birlikte mesaj verebilir mi?','["Hayır","Sadece görsel","Evet","Sadece yazı"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-14-1-3','coktan_secmeli','Tablodaki değerler karşılaştırılabilir mi?','["Evet","Hayır","Sadece okunur","Tablo sayı içermez"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-14-1-4','coktan_secmeli','İnfografik ne yapar?','["Sadece hikâye anlatır","Sadece şiirdir","Bilgiyi görsel ve kısa metinle sunabilir.","Sadece ses içerir"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-14-2-1','coktan_secmeli','Grafikte başlık ne işe yarar? Benzer bir bağlamı düşün.','["Rengi seçer.","Verinin konusunu açıklar.","Metni siler.","Yazarı belirler."]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-14-2-2','coktan_secmeli','Afişte görsel ve yazı birlikte mesaj verebilir mi? Benzer bir bağlamı düşün.','["Hayır","Sadece görsel","Sadece yazı","Evet"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-14-2-3','coktan_secmeli','Tablodaki değerler karşılaştırılabilir mi? Benzer bir bağlamı düşün.','["Hayır","Evet","Sadece okunur","Tablo sayı içermez"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-14-2-4','coktan_secmeli','İnfografik ne yapar? Benzer bir bağlamı düşün.','["Sadece hikâye anlatır","Sadece şiirdir","Sadece ses içerir","Bilgiyi görsel ve kısa metinle sunabilir."]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'tr5-tartisma','Görüş Bildirme ve Gerekçelendirme','Görüş Bildirme ve Gerekçelendirme','Görüş Bildirme ve Gerekçelendirme becerilerini uygular.','',150,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='tr5-iletisim' WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-15-1-1','coktan_secmeli','Görüş ile gerçek bilgi aynı mıdır?','["Hayır","Evet","Her zaman","Sadece internette"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-tartisma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-15-1-2','coktan_secmeli','Görüşü desteklemek için ne gerekir?','["Sadece yüksek ses","Sadece tekrar","Gerekçe ve kanıt","Sadece başlık"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-tartisma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-15-1-3','coktan_secmeli','Karşı görüş dinlenmeli midir?','["Evet","Hayır","Sadece aynı fikir","Tartışmada dinleme yok"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-tartisma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-15-1-4','coktan_secmeli','Kişiye değil fikre odaklanmak doğru mudur?','["Hayır","Kişi eleştirilmelidir","Evet","Saygı gerekmez"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-tartisma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-15-2-1','coktan_secmeli','Görüş ile gerçek bilgi aynı mıdır? Benzer bir bağlamı düşün.','["Evet","Hayır","Her zaman","Sadece internette"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-tartisma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-15-2-2','coktan_secmeli','Görüşü desteklemek için ne gerekir? Benzer bir bağlamı düşün.','["Sadece yüksek ses","Sadece tekrar","Sadece başlık","Gerekçe ve kanıt"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-tartisma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-15-2-3','coktan_secmeli','Karşı görüş dinlenmeli midir? Benzer bir bağlamı düşün.','["Hayır","Evet","Sadece aynı fikir","Tartışmada dinleme yok"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-tartisma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-15-2-4','coktan_secmeli','Kişiye değil fikre odaklanmak doğru mudur? Benzer bir bağlamı düşün.','["Hayır","Kişi eleştirilmelidir","Saygı gerekmez","Evet"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-tartisma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'tr5-saglik-anlama','Sağlık Metinlerinde Bilgi ve Ana Fikir','Sağlık Metinlerinde Bilgi ve Ana Fikir','Sağlık Metinlerinde Bilgi ve Ana Fikir becerilerini uygular.','',160,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='tr5-saglik' WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-16-1-1','coktan_secmeli','Sağlık bilgisinin kaynağı kontrol edilmeli mi?','["Evet","Hayır","Her paylaşım doğrudur","Sadece görsel yeter"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-saglik-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-16-1-2','coktan_secmeli','“Düzenli uyku öğrenmeyi destekler.” ana fikir neye yakındır?','["Uyku gereksizdir.","Sadece hafta sonu uyunur.","Uyku sağlıklı yaşam için önemlidir.","Uyku yemek yerine geçer."]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-saglik-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-16-1-3','coktan_secmeli','Bilgilendirici sağlık metninin amacı?','["Doğru bilgi vermek","Sadece eğlendirmek","Sadece reklam","Sadece şiir"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-saglik-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-16-1-4','coktan_secmeli','Anahtar sözcükler konuyu bulmaya yardım eder mi?','["Hayır","Sadece yazım için","Evet","Sadece ses için"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-saglik-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-16-2-1','coktan_secmeli','Sağlık bilgisinin kaynağı kontrol edilmeli mi? Benzer bir bağlamı düşün.','["Hayır","Evet","Her paylaşım doğrudur","Sadece görsel yeter"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-saglik-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-16-2-2','coktan_secmeli','“Düzenli uyku öğrenmeyi destekler.” ana fikir neye yakındır? Benzer bir bağlamı düşün.','["Uyku gereksizdir.","Sadece hafta sonu uyunur.","Uyku yemek yerine geçer.","Uyku sağlıklı yaşam için önemlidir."]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-saglik-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-16-2-3','coktan_secmeli','Bilgilendirici sağlık metninin amacı? Benzer bir bağlamı düşün.','["Sadece eğlendirmek","Doğru bilgi vermek","Sadece reklam","Sadece şiir"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-saglik-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-16-2-4','coktan_secmeli','Anahtar sözcükler konuyu bulmaya yardım eder mi? Benzer bir bağlamı düşün.','["Hayır","Sadece yazım için","Sadece ses için","Evet"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-saglik-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'tr5-neden','Neden-Sonuç, Koşul ve Karşılaştırma','Neden-Sonuç, Koşul ve Karşılaştırma','Neden-Sonuç, Koşul ve Karşılaştırma becerilerini uygular.','',170,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='tr5-saglik' WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-17-1-1','coktan_secmeli','“Düzenli hareket ettiği için kendini zinde hissediyor.” neden?','["Düzenli hareket etmesi","Zinde hissetmesi","Hava","Okul"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-neden' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-17-1-2','coktan_secmeli','“Erken yatarsan sabah dinç kalkarsın.” ilişki?','["Karşılaştırma","Tanım","Koşul","Örnekleme"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-neden' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-17-1-3','coktan_secmeli','“Su, gazlı içeceğe göre daha temel bir içecektir.” ilişki?','["Karşılaştırma","Neden-sonuç","Koşul","Soru"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-neden' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-17-1-4','coktan_secmeli','“Kahvaltı yaptı, bu nedenle enerjisi arttı.” sonuç?','["Kahvaltı yapması","Masaya oturması","Enerjisinin artması","Okula gitmesi"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-neden' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-17-2-1','coktan_secmeli','“Düzenli hareket ettiği için kendini zinde hissediyor.” neden? Benzer bir bağlamı düşün.','["Zinde hissetmesi","Düzenli hareket etmesi","Hava","Okul"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-neden' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-17-2-2','coktan_secmeli','“Erken yatarsan sabah dinç kalkarsın.” ilişki? Benzer bir bağlamı düşün.','["Karşılaştırma","Tanım","Örnekleme","Koşul"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-neden' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-17-2-3','coktan_secmeli','“Su, gazlı içeceğe göre daha temel bir içecektir.” ilişki? Benzer bir bağlamı düşün.','["Neden-sonuç","Karşılaştırma","Koşul","Soru"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-neden' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-17-2-4','coktan_secmeli','“Kahvaltı yaptı, bu nedenle enerjisi arttı.” sonuç? Benzer bir bağlamı düşün.','["Kahvaltı yapması","Masaya oturması","Okula gitmesi","Enerjisinin artması"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-neden' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'tr5-yazim','Yazım, Noktalama ve Metni Gözden Geçirme','Yazım, Noktalama ve Metni Gözden Geçirme','Yazım, Noktalama ve Metni Gözden Geçirme becerilerini uygular.','',180,1 FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='tr5-saglik' WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-18-1-1','coktan_secmeli','Özel ada gelen ek çoğu durumda nasıl ayrılır?','["Kesme işaretiyle","Virgülle","Tireyle her zaman","Hiç ayrılmaz"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-18-1-2','coktan_secmeli','Yazıyı gözden geçirmek ne sağlar?','["Sadece uzatmayı","Başlığı silmeyi","Yazım, noktalama ve anlam hatalarını düzeltmeyi","Kaynağı gizlemeyi"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-18-1-3','coktan_secmeli','Alıntı sözlerde tırnak işareti kullanılabilir mi?','["Evet","Hayır","Sadece nokta","Sadece kesme"]',0,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-18-1-4','coktan_secmeli','Bağlaç olan “de” genellikle nasıl yazılır?','["Her zaman bitişik","Kesmeyle","Ayrı","Rakamla"]',2,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-18-2-1','coktan_secmeli','Özel ada gelen ek çoğu durumda nasıl ayrılır? Benzer bir bağlamı düşün.','["Virgülle","Kesme işaretiyle","Tireyle her zaman","Hiç ayrılmaz"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,11,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-18-2-2','coktan_secmeli','Yazıyı gözden geçirmek ne sağlar? Benzer bir bağlamı düşün.','["Sadece uzatmayı","Başlığı silmeyi","Kaynağı gizlemeyi","Yazım, noktalama ve anlam hatalarını düzeltmeyi"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,12,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-18-2-3','coktan_secmeli','Alıntı sözlerde tırnak işareti kullanılabilir mi? Benzer bir bağlamı düşün.','["Hayır","Evet","Sadece nokta","Sadece kesme"]',1,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,13,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5t-18-2-4','coktan_secmeli','Bağlaç olan “de” genellikle nasıl yazılır? Benzer bir bağlamı düşün.','["Her zaman bitişik","Kesmeyle","Rakamla","Ayrı"]',3,'Metin ve dil bilgisi ipuçlarına göre cevaplanır.',2,14,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='tr5-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

