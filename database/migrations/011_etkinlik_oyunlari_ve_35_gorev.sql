SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS etkinlik_oyunlari (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  kod VARCHAR(50) NOT NULL,
  ad VARCHAR(120) NOT NULL,
  emoji VARCHAR(24) NOT NULL DEFAULT '',
  kategori VARCHAR(120) NOT NULL DEFAULT '',
  sure VARCHAR(30) NOT NULL DEFAULT '',
  renk VARCHAR(24) NOT NULL DEFAULT '',
  aciklama VARCHAR(255) NOT NULL DEFAULT '',
  sira INT NOT NULL DEFAULT 0,
  aktif TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  UNIQUE KEY uk_etkinlik_oyun_kod (kod),
  KEY ix_etkinlik_oyun_sira (aktif,sira)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS etkinlik_sorulari (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  oyun_id INT UNSIGNED NOT NULL,
  sira SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  gorsel VARCHAR(500) NOT NULL DEFAULT '',
  soru VARCHAR(500) NOT NULL,
  secenekler_json LONGTEXT NOT NULL,
  dogru_cevap_indeksi TINYINT UNSIGNED NOT NULL DEFAULT 0,
  sonuc VARCHAR(255) NOT NULL DEFAULT '',
  aciklama TEXT NULL,
  aktif TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  UNIQUE KEY uk_etkinlik_soru_sira (oyun_id,sira),
  KEY ix_etkinlik_soru_oyun (oyun_id,aktif,sira)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('hece_birlestir','Heceleri Birleştir','🧩','Türkçe & kelime','2–3 dk','#f7e4ff','Heceleri birleştir, doğru kelimeyi bul.',4,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'ki + tap','Bu heceler birleşince hangi kelime oluşur?','["Kitap","Kapı","Takip","Kita"]',0,'Kitap','ki + tap = kitap.',1
FROM etkinlik_oyunlari WHERE kod='hece_birlestir'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'o + kul','Bu heceler birleşince hangi kelime oluşur?','["Okul","Kolu","Oluk","Kulak"]',0,'Okul','o + kul = okul.',1
FROM etkinlik_oyunlari WHERE kod='hece_birlestir'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'ka + lem','Bu heceler birleşince hangi kelime oluşur?','["Kalem","Kelam","Kale","Leke"]',0,'Kalem','ka + lem = kalem.',1
FROM etkinlik_oyunlari WHERE kod='hece_birlestir'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'ma + sa','Bu heceler birleşince hangi kelime oluşur?','["Masa","Sama","Asma","Masal"]',0,'Masa','ma + sa = masa.',1
FROM etkinlik_oyunlari WHERE kod='hece_birlestir'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'a + ra + ba','Bu heceler birleşince hangi kelime oluşur?','["Araba","Bara","Arı","Aralık"]',0,'Araba','a + ra + ba = araba.',1
FROM etkinlik_oyunlari WHERE kod='hece_birlestir'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('kelime_yakala','Kelimeyi Yakala','🎯','Türkçe & okuma','2–3 dk','#ffe8ef','Görsele bak, doğru kelimeyi yakala.',5,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'🍎','Bu görselin adı hangisidir?','["Elma","Armut","Muz","Kiraz"]',0,'Elma','🍎 görseli elmayı gösterir.',1
FROM etkinlik_oyunlari WHERE kod='kelime_yakala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'🐱','Bu görselin adı hangisidir?','["Kedi","Köpek","Kuş","Balık"]',0,'Kedi','🐱 görseli kediyi gösterir.',1
FROM etkinlik_oyunlari WHERE kod='kelime_yakala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'🏠','Bu görselin adı hangisidir?','["Ev","Okul","Araba","Ağaç"]',0,'Ev','🏠 görseli evi gösterir.',1
FROM etkinlik_oyunlari WHERE kod='kelime_yakala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'☀️','Bu görselin adı hangisidir?','["Güneş","Ay","Bulut","Yıldız"]',0,'Güneş','☀️ görseli güneşi gösterir.',1
FROM etkinlik_oyunlari WHERE kod='kelime_yakala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'✏️','Bu görselin adı hangisidir?','["Kalem","Defter","Silgi","Çanta"]',0,'Kalem','✏️ görseli kalemi gösterir.',1
FROM etkinlik_oyunlari WHERE kod='kelime_yakala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('ona_tamamla','10''a Tamamla','🔟','Matematik & toplama','2–3 dk','#e4f4ff','Eksik sayıyı bul, toplamı 10 yap.',6,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'8 + ? = 10','8''e kaç eklersek 10 olur?','["1","2","3","4"]',1,'2','8 + 2 = 10.',1
FROM etkinlik_oyunlari WHERE kod='ona_tamamla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'6 + ? = 10','6''ya kaç eklersek 10 olur?','["2","3","4","5"]',2,'4','6 + 4 = 10.',1
FROM etkinlik_oyunlari WHERE kod='ona_tamamla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'7 + ? = 10','7''ye kaç eklersek 10 olur?','["1","2","3","4"]',2,'3','7 + 3 = 10.',1
FROM etkinlik_oyunlari WHERE kod='ona_tamamla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'5 + ? = 10','5''e kaç eklersek 10 olur?','["3","4","5","6"]',2,'5','5 + 5 = 10.',1
FROM etkinlik_oyunlari WHERE kod='ona_tamamla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'9 + ? = 10','9''a kaç eklersek 10 olur?','["0","1","2","3"]',1,'1','9 + 1 = 10.',1
FROM etkinlik_oyunlari WHERE kod='ona_tamamla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('sayi_avi','Sayı Avı','🔢','Matematik & dikkat','2–3 dk','#e6f6ee','Nesneleri say, doğru sayıyı bul.',7,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'🍎 🍎 🍎 🍎 🍎','Kaç elma var?','["4","5","6","7"]',1,'5','Elmalar tek tek sayıldığında 5 tane vardır.',1
FROM etkinlik_oyunlari WHERE kod='sayi_avi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'⭐ ⭐ ⭐','Kaç yıldız var?','["2","3","4","5"]',1,'3','Toplam 3 yıldız vardır.',1
FROM etkinlik_oyunlari WHERE kod='sayi_avi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'🐟 🐟 🐟 🐟 🐟 🐟','Kaç balık var?','["5","6","7","8"]',1,'6','Toplam 6 balık vardır.',1
FROM etkinlik_oyunlari WHERE kod='sayi_avi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'⚽ ⚽ ⚽ ⚽','Kaç top var?','["3","4","5","6"]',1,'4','Toplam 4 top vardır.',1
FROM etkinlik_oyunlari WHERE kod='sayi_avi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'🌼 🌼 🌼 🌼 🌼 🌼 🌼','Kaç çiçek var?','["6","7","8","9"]',1,'7','Toplam 7 çiçek vardır.',1
FROM etkinlik_oyunlari WHERE kod='sayi_avi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('dogru_yanlis','Doğru mu, Yanlış mı?','✅','Hayat Bilgisi & güvenlik','2–3 dk','#fff1d9','Davranışı değerlendir, doğru kararı ver.',8,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'🚦','Karşıya geçerken yaya geçidini kullanmak güvenlidir.','["✅ Doğru","❌ Yanlış"]',0,'Doğru','Yaya geçidi karşıya geçmek için güvenli alanlardan biridir.',1
FROM etkinlik_oyunlari WHERE kod='dogru_yanlis'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'🔌','Prize metal bir cisim sokmak güvenlidir.','["✅ Doğru","❌ Yanlış"]',1,'Yanlış','Elektrik prizlerine yabancı cisim sokmak tehlikelidir.',1
FROM etkinlik_oyunlari WHERE kod='dogru_yanlis'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'🧼','Yemekten önce ellerimizi yıkamak sağlıklı bir davranıştır.','["✅ Doğru","❌ Yanlış"]',0,'Doğru','El yıkamak hijyene yardımcı olur.',1
FROM etkinlik_oyunlari WHERE kod='dogru_yanlis'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'🗑️','Çöpü yere atmak çevremizi korur.','["✅ Doğru","❌ Yanlış"]',1,'Yanlış','Çöpler uygun çöp kutusuna atılmalıdır.',1
FROM etkinlik_oyunlari WHERE kod='dogru_yanlis'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'🙋','Sınıfta söz almak için parmak kaldırmak uygun bir davranıştır.','["✅ Doğru","❌ Yanlış"]',0,'Doğru','Parmak kaldırmak sınıf düzenine yardımcı olur.',1
FROM etkinlik_oyunlari WHERE kod='dogru_yanlis'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('golgesini_bul','Gölgesini Bul','🌑','Görsel dikkat','2–3 dk','#eee7ff','Nesnenin biçimini düşün, doğru gölgeyi seç.',9,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'⚽ → ?','Topun gölgesi hangi şekle daha çok benzer?','["● Daire","▲ Üçgen","■ Kare"]',0,'● Daire','Top yuvarlak olduğu için gölgesi daireye benzer.',1
FROM etkinlik_oyunlari WHERE kod='golgesini_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'📦 → ?','Kutunun gölgesi önden bakınca hangi şekle benzeyebilir?','["■ Kare","● Daire","▲ Üçgen"]',0,'■ Kare','Bir kutunun düz yüzü kareye benzeyebilir.',1
FROM etkinlik_oyunlari WHERE kod='golgesini_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'🔺 → ?','Üçgen biçimli nesnenin gölgesi hangisidir?','["▲ Üçgen","● Daire","■ Kare"]',0,'▲ Üçgen','Üçgen biçimin gölgesi de üçgen biçiminde görünür.',1
FROM etkinlik_oyunlari WHERE kod='golgesini_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'🍽️ → ?','Yuvarlak tabağın gölgesi hangisine benzer?','["● Daire","▲ Üçgen","▭ Dikdörtgen"]',0,'● Daire','Yuvarlak tabak daire biçimine benzer.',1
FROM etkinlik_oyunlari WHERE kod='golgesini_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'📕 → ?','Kapalı bir kitabın üstten görünüşü hangi şekle daha çok benzer?','["▭ Dikdörtgen","● Daire","▲ Üçgen"]',0,'▭ Dikdörtgen','Kitabın kapağı çoğunlukla dikdörtgen biçimindedir.',1
FROM etkinlik_oyunlari WHERE kod='golgesini_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('ritmi_tekrarla','Ritmi Tekrarla','👏','Müzik & hafıza','2–3 dk','#e9f0ff','Ritmi takip et, sıradaki vuruşu bul.',10,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'👏 👏 🦵 · 👏 👏 ?','Ritim aynı şekilde devam ederse sırada ne var?','["🦵 Diz vuruşu","👏 Alkış","🤫 Sessizlik"]',0,'🦵 Diz vuruşu','Ritim iki alkış ve bir diz vuruşu şeklinde tekrar ediyor.',1
FROM etkinlik_oyunlari WHERE kod='ritmi_tekrarla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'👏 🦵 👏 🦵 ?','Sıradaki vuruş hangisidir?','["👏 Alkış","🦵 Diz vuruşu","🔔 Zil"]',0,'👏 Alkış','Alkış ve diz vuruşu sırayla tekrar ediyor.',1
FROM etkinlik_oyunlari WHERE kod='ritmi_tekrarla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'🦵 🦵 👏 · 🦵 🦵 ?','Ritmi tamamla.','["👏 Alkış","🦵 Diz vuruşu","🤫 Sessizlik"]',0,'👏 Alkış','İki diz vuruşundan sonra bir alkış geliyor.',1
FROM etkinlik_oyunlari WHERE kod='ritmi_tekrarla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'👏 👏 👏 · 👏 👏 ?','Üçlü ritmi tamamla.','["👏 Alkış","🦵 Diz vuruşu","🔔 Zil"]',0,'👏 Alkış','Üç alkışlık grup tekrar ediyor.',1
FROM etkinlik_oyunlari WHERE kod='ritmi_tekrarla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'👏 🤫 👏 🤫 ?','Alkış ve sessizlik sırası nasıl devam eder?','["👏 Alkış","🤫 Sessizlik","🦵 Diz vuruşu"]',0,'👏 Alkış','Alkış ve sessizlik sırayla tekrar ediyor.',1
FROM etkinlik_oyunlari WHERE kod='ritmi_tekrarla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

