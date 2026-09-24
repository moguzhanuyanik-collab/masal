SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'tr2-baglam','Bağlamdan Kelime Anlamı','Bağlamdan Kelime Anlamı','Bir kelimenin anlamını, içinde geçtiği cümlenin verdiği ipuçlarından tahmin ederiz.','“Mert özenle kitabını kapladı.” cümlesinde özenle sözü dikkatli davranmayı anlatır.',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='tr2-degerler'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'tr2-nezaket','Nezaket ve İletişim','Nezaket ve İletişim','Nezaket ifadelerini doğru yerde kullanır ve iletişim kurallarını fark eder.','Lütfen, teşekkür ederim, özür dilerim.',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='tr2-degerler'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'tr2-noktalama','Noktalama İşaretleri','Noktalama İşaretleri','Nokta, virgül, soru işareti, ünlem, iki nokta ve tırnak gibi işaretleri uygun yerde kullanır.','Ece, “Günaydın!” dedi.',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='tr2-degerler'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'tr2-ataturk-metin','Atatürk ve Millî Değerler Metinleri','Atatürk ve Millî Değerler Metinleri','Metindeki kişi, olay, yer ve temel bilgileri belirler.','Metindeki açık bilgiyi bul ve yorumla.',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='tr2-ataturk'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'tr2-olay-sirasi','Olayları Oluş Sırasına Koyuyorum','Olayları Oluş Sırasına Koyuyorum','Bir metindeki olayları önce-sonra ilişkisine göre sıralar.','Önce tohumu ekti, sonra suladı.',300,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='tr2-doga'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'tr2-tahmin','Metnin Devamını Tahmin Ediyorum','Metnin Devamını Tahmin Ediyorum','Metindeki ipuçlarına göre olayın öncesi veya sonrası için uygun tahminde bulunur.','Bulutlar koyulaştıysa yağmur yağması beklenebilir.',310,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='tr2-doga'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'tr2-konu-baslik','Metnin Konusu ve Başlığı','Metnin Konusu ve Başlığı','Metnin ne anlattığını belirler ve uygun başlık seçer.','Konu daha geniştir; başlık kısa ve uygun olmalıdır.',400,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='tr2-okuma'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'tr2-kitap-bolum','Kitabın Bölümlerini Tanıyorum','Kitabın Bölümlerini Tanıyorum','Kapak, içindekiler, sözlük ve kaynakça gibi temel bölümleri fark eder.','İçindekiler bölümü aradığımız kısmı bulmaya yardım eder.',410,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='tr2-okuma'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'tr2-cumle','Anlamlı ve Kurallı Cümle','Anlamlı ve Kurallı Cümle','Kelimeleri doğru sıraya koyar, eksik cümleyi anlamına uygun tamamlar.','“Ela bugün resim yaptı.” anlamlı bir cümledir.',500,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='tr2-yetenek'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'tr2-yazim','Yazım Kurallarını Uyguluyorum','Yazım Kurallarını Uyguluyorum','Cümle başını ve özel adları büyük harfle yazar, yazım alanını düzenli kullanır.','Ankara, Türkiye''nin başkentidir.',510,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='tr2-yetenek'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'tr2-yonerge','Yönergeleri Anlıyorum','Yönergeleri Anlıyorum','Basit yönergeleri doğru sıra ve anlamla uygular.','Önce kâğıdı katla, sonra çizgiyi kes.',600,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='tr2-mucit'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'tr2-bilgi-cikarim','Bilgiden Çıkarım Yapıyorum','Bilgiden Çıkarım Yapıyorum','Metindeki bilgilerden doğrudan yazmayan basit sonuçlara ulaşır.','Pelin şemsiye aldıysa yağmur olabileceğini düşünebiliriz.',610,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='tr2-mucit'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'tr2-kultur-metin','Kültür Hazinemiz Metinleri','Kültür Hazinemiz Metinleri','Kültürel ögeler içeren kısa metinleri anlar ve metindeki bilgileri bulur.','Gelenek, sanat, oyun ve ortak değerleri metinden ayırt eder.',700,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='tr2-kultur'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'tr2-sozcuk-iliski','Sözcükler Arası İlişkiler','Sözcükler Arası İlişkiler','Yakın anlamlı, zıt anlamlı ve aynı konuya ait sözcükleri ayırt eder.','Büyük-küçük zıt anlamlıdır.',710,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='tr2-kultur'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'tr2-haklar-metin','Haklar ve Sorumluluklar Metinleri','Haklar ve Sorumluluklar Metinleri','Çocuk hakları ve sorumluluklar hakkında kısa metinleri anlar.','Hak ve sorumluluğu birbirinden ayırır.',800,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='tr2-haklar'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'tr2-metin-anlama','Kısa Metni Derinlemesine Anlıyorum','Kısa Metni Derinlemesine Anlıyorum','Karakter, olay, yer, zaman, sebep ve sonucu metinden bulur.','Metindeki ayrıntıları bir araya getirerek cevaba ulaşır.',810,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='tr2-haklar'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-1','coktan_secmeli','“Ayşe kırılan oyuncağı onarmak için dikkatle parçaları birleştirdi.” cümlesinde “onarmak” ne demektir?','["saklamak","tamir etmek","satmak","boyamak"]',1,'Cümlenin anlamına göre “tamir etmek” uygundur.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-2','coktan_secmeli','“Mert, arkadaşının fikrine saygı gösterdi.” cümlesinde “saygı göstermek” neyi anlatır?','["alay etmek","görmezden gelmek","kızmak","değer vermek"]',3,'Cümlenin anlamına göre “değer vermek” uygundur.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-3','coktan_secmeli','“Bahçedeki çiçekler sabah güneşinde parlıyordu.” cümlesinde “parlıyordu” sözüne en yakın anlam hangisidir?','["uyuyordu","ışık saçıyordu","soluyordu","saklanıyordu"]',1,'Cümlenin anlamına göre “ışık saçıyordu” uygundur.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-4','coktan_secmeli','“Deniz, ödevini özenle tamamladı.” cümlesinde “özenle” ne demektir?','["aceleyle","rastgele","isteksizce","dikkatli bir şekilde"]',3,'Cümlenin anlamına göre “dikkatli bir şekilde” uygundur.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-5','coktan_secmeli','“Kuşlar göç zamanı sürüler hâlinde uzaklaştı.” cümlesinde “sürü” neyi anlatır?','["tek bir kuş","birlikte hareket eden grup","yuva","ağaç"]',1,'Cümlenin anlamına göre “birlikte hareket eden grup” uygundur.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-6','coktan_secmeli','“Çocuklar sessizce kütüphanede araştırma yaptı.” cümlesinde “araştırma” ne demektir?','["oyun oynama","koşma","uyuma","bilgi arama"]',3,'Cümlenin anlamına göre “bilgi arama” uygundur.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-7','coktan_secmeli','“Ece, yaşlı komşusuna yardım ederek duyarlı davrandı.” cümlesinde “duyarlı” neyi anlatır?','["dikkatsiz","başkalarının durumunu önemseyen","unutkan","kırıcı"]',1,'Cümlenin anlamına göre “başkalarının durumunu önemseyen” uygundur.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-8','coktan_secmeli','“Ali yeni oyunun kurallarını kavradı.” cümlesinde “kavradı” ne demektir?','["unuttu","sildi","sakladı","anladı"]',3,'Cümlenin anlamına göre “anladı” uygundur.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-9','coktan_secmeli','“Rüzgâr şiddetlenince ağaç dalları hızla sallandı.” cümlesinde “şiddetlendi” ne demektir?','["azaldı","güçlendi","durdu","kayboldu"]',1,'Cümlenin anlamına göre “güçlendi” uygundur.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-10','coktan_secmeli','“Öğretmen, öğrencilerin fikirlerini karşılaştırmalarını istedi.” cümlesinde “karşılaştırmak” ne demektir?','["ezberlemek","silmek","çizmek","benzer ve farklı yönlere bakmak"]',3,'Cümlenin anlamına göre “benzer ve farklı yönlere bakmak” uygundur.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-11','coktan_secmeli','“Duru sorunu çözmek için farklı bir yöntem denedi.” cümlesinde “yöntem” ne demektir?','["oyuncak","izlenen yol","renk","soru"]',1,'Cümlenin anlamına göre “izlenen yol” uygundur.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-12','coktan_secmeli','“Köy meydanında geleneksel oyunlar oynandı.” cümlesinde “geleneksel” neyi anlatır?','["yeni icat edilen","yasaklanan","unutulan","uzun zamandır sürdürülen"]',3,'Cümlenin anlamına göre “uzun zamandır sürdürülen” uygundur.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-13','coktan_secmeli','“Mina, arkadaşının sözünü kesmeden sabırla bekledi.” cümlesinde “sabırla” ne demektir?','["bağırarak","acele etmeden","koşarak","korkarak"]',1,'Cümlenin anlamına göre “acele etmeden” uygundur.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-14','coktan_secmeli','“Yağmurdan sonra hava berraklaştı.” cümlesinde “berrak” ne demektir?','["karanlık","gürültülü","sıcak","açık ve temiz"]',3,'Cümlenin anlamına göre “açık ve temiz” uygundur.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-15','coktan_secmeli','“Çocuklar çevreyi korumak için atıkları ayırdı.” cümlesinde “ayırmak” ne demektir?','["karıştırmak","farklı gruplara bölmek","yakmak","saklamak"]',1,'Cümlenin anlamına göre “farklı gruplara bölmek” uygundur.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-16','coktan_secmeli','“Kerem, yaptığı resmi arkadaşlarına sergiledi.” cümlesinde “sergilemek” ne demektir?','["yırtmak","saklamak","satmak","göstermek"]',3,'Cümlenin anlamına göre “göstermek” uygundur.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-17','coktan_secmeli','“Bilim insanı gözlem yaparak bilgi topladı.” cümlesinde “gözlem” ne demektir?','["uyuma","dikkatle inceleme","unutma","boyama"]',1,'Cümlenin anlamına göre “dikkatle inceleme” uygundur.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-18','coktan_secmeli','“Aile, piknik alanını temiz bırakarak sorumlu davrandı.” cümlesinde “sorumlu” neyi anlatır?','["kuralsız","dikkatsiz","tembel","görevini yerine getiren"]',3,'Cümlenin anlamına göre “görevini yerine getiren” uygundur.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-19','coktan_secmeli','“Mert soruya doğru yanıt verdi.” cümlesinde “yanıt” ne demektir?','["soru","cevap","kitap","işaret"]',1,'Cümlenin anlamına göre “cevap” uygundur.',2,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-20','coktan_secmeli','“Eski ev restore edilerek korundu.” cümlesinde “korumak” ne demektir?','["yıkmak","unutmak","boyamak","zarar görmesini önlemek"]',3,'Cümlenin anlamına göre “zarar görmesini önlemek” uygundur.',2,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-21','coktan_secmeli','“Öğrenciler sırayla düşüncelerini ifade etti.” cümlesinde “ifade etmek” ne demektir?','["saklamak","anlatmak","silmek","kesmek"]',1,'Cümlenin anlamına göre “anlatmak” uygundur.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-22','coktan_secmeli','“Ece kitap seçerken kapağı ve başlığı inceledi.” cümlesinde “incelemek” ne demektir?','["atmak","kapamak","unutmak","dikkatle bakmak"]',3,'Cümlenin anlamına göre “dikkatle bakmak” uygundur.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-23','coktan_secmeli','“Mucit yeni bir araç tasarladı.” cümlesinde “tasarlamak” ne demektir?','["satın almak","nasıl olacağını planlamak","saklamak","yıkmak"]',1,'Cümlenin anlamına göre “nasıl olacağını planlamak” uygundur.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-24','coktan_secmeli','“Çocuklar karar vermeden önce seçenekleri değerlendirdi.” cümlesinde “değerlendirmek” ne demektir?','["unutmak","karıştırmak","boyamak","üzerinde düşünüp karar vermek"]',3,'Cümlenin anlamına göre “üzerinde düşünüp karar vermek” uygundur.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-25','coktan_secmeli','“Herkes aynı haklara sahip olmalıdır.” cümlesinde “hak” neyi anlatır?','["ceza","kişiye tanınan özgürlük ve imkân","oyuncak","görev kağıdı"]',1,'Cümlenin anlamına göre “kişiye tanınan özgürlük ve imkân” uygundur.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-26','coktan_secmeli','“Sınıfça ortak bir karar aldılar.” cümlesinde “ortak” ne demektir?','["gizli","tek kişilik","yanlış","birlikte paylaşılan"]',3,'Cümlenin anlamına göre “birlikte paylaşılan” uygundur.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-27','coktan_secmeli','“Atatürk çocuklara büyük önem verirdi.” cümlesinde “önem vermek” neyi anlatır?','["unutmak","değerli bulmak","korkmak","saklamak"]',1,'Cümlenin anlamına göre “değerli bulmak” uygundur.',2,27,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-baglam-28','coktan_secmeli','“Yaşlı ağaç yıllardır ayakta duruyordu.” cümlesinde “yaşlı” sözcüğü burada neyi anlatır?','["çok hızlı","çok küçük","çok parlak","uzun zamandır var olan"]',3,'Cümlenin anlamına göre “uzun zamandır var olan” uygundur.',2,28,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nezaket-1','coktan_secmeli','Bir arkadaşından kalem isterken hangisini söylemek uygundur?','["Kalemini ver!","Kalemini verir misin, lütfen?","Çekil.","Bana ne."]',1,'Uygun ve saygılı davranış “Kalemini verir misin, lütfen?” seçeneğidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nezaket-2','coktan_secmeli','Birine yanlışlıkla çarptığında ne söylemek uygundur?','["Ben yapmadım.","Çekil.","Sus.","Özür dilerim."]',3,'Uygun ve saygılı davranış “Özür dilerim.” seçeneğidir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nezaket-3','coktan_secmeli','Sana yardım eden birine ne söylemelisin?','["Olmaz.","Teşekkür ederim.","Git.","Vermem."]',1,'Uygun ve saygılı davranış “Teşekkür ederim.” seçeneğidir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nezaket-4','coktan_secmeli','Sınıfa girerken öğretmeninle karşılaştın. Hangisi uygundur?','["Yolumdan çekil.","Sessiz ol.","Ben konuşmam.","Günaydın öğretmenim."]',3,'Uygun ve saygılı davranış “Günaydın öğretmenim.” seçeneğidir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nezaket-5','coktan_secmeli','Bir arkadaşın konuşurken ne yapmalısın?','["Sözünü kesmelisin.","Sözünü bitirmesini dinlemelisin.","Daha yüksek sesle konuşmalısın.","Arkanı dönmelisin."]',1,'Uygun ve saygılı davranış “Sözünü bitirmesini dinlemelisin.” seçeneğidir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nezaket-6','coktan_secmeli','Farklı bir fikri olan arkadaşına nasıl davranmalısın?','["Onunla alay etmelisin.","Kızmalısın.","Fikrini yasaklamalısın.","Saygıyla dinlemelisin."]',3,'Uygun ve saygılı davranış “Saygıyla dinlemelisin.” seçeneğidir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nezaket-7','coktan_secmeli','Birinin eşyasını kullanmak istiyorsan önce ne yapmalısın?','["Gizlice almalısın.","İzin istemelisin.","Saklamalısın.","Kırmalısın."]',1,'Uygun ve saygılı davranış “İzin istemelisin.” seçeneğidir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nezaket-8','coktan_secmeli','Sırada beklerken en doğru davranış hangisidir?','["Öne geçmek.","İtmek.","Bağırmak.","Sıranı beklemek."]',3,'Uygun ve saygılı davranış “Sıranı beklemek.” seçeneğidir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nezaket-9','coktan_secmeli','Bir arkadaşın üzgünse ne yapabilirsin?','["Alay edebilirsin.","Nasıl olduğunu sorabilirsin.","Yalnız bırakıp gülersin.","Eşyasını alırsın."]',1,'Uygun ve saygılı davranış “Nasıl olduğunu sorabilirsin.” seçeneğidir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nezaket-10','coktan_secmeli','Konuşmaya katılmak için ne yapmalısın?','["Bağırarak araya girmelisin.","Herkesin sözünü kesmelisin.","Masaya vurmalısın.","Uygun zamanı beklemelisin."]',3,'Uygun ve saygılı davranış “Uygun zamanı beklemelisin.” seçeneğidir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nezaket-11','coktan_secmeli','Misafir geldiğinde uygun davranış hangisidir?','["Görmezden gelmek.","Selam vermek.","Bağırmak.","Kapıyı çarpmak."]',1,'Uygun ve saygılı davranış “Selam vermek.” seçeneğidir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nezaket-12','coktan_secmeli','Arkadaşının başarısı için ne söyleyebilirsin?','["Bana ne.","Olmamış.","Sus.","Tebrik ederim."]',3,'Uygun ve saygılı davranış “Tebrik ederim.” seçeneğidir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nezaket-13','coktan_secmeli','Birinden geçerken yol istemek için ne diyebilirsin?','["Çekil!","Affedersiniz, geçebilir miyim?","Git!","Dur!"]',1,'Uygun ve saygılı davranış “Affedersiniz, geçebilir miyim?” seçeneğidir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nezaket-14','coktan_secmeli','Bir şey anlamadığında öğretmene nasıl sorabilirsin?','["Anlamadım, boş ver.","Bunu yapmayacağım.","Bana anlatma.","Tekrar açıklar mısınız, lütfen?"]',3,'Uygun ve saygılı davranış “Tekrar açıklar mısınız, lütfen?” seçeneğidir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nezaket-15','coktan_secmeli','Bir grup çalışmasında uygun davranış hangisidir?','["Sadece kendi fikrini kabul etmek.","Herkesin fikrini dinlemek.","Malzemeleri saklamak.","Arkadaşları dışlamak."]',1,'Uygun ve saygılı davranış “Herkesin fikrini dinlemek.” seçeneğidir.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nezaket-16','coktan_secmeli','Bir hata yaptığını fark ettiğinde ne yapmalısın?','["Başkasını suçlamalısın.","Saklamalısın.","Aynı hatayı bilerek tekrarlamalısın.","Hatanı kabul edip düzeltmeye çalışmalısın."]',3,'Uygun ve saygılı davranış “Hatanı kabul edip düzeltmeye çalışmalısın.” seçeneğidir.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-1','coktan_secmeli','“Bugün hava güneşli__” boşluğa ne gelmelidir?','["?",".","!",","]',1,'Doğru noktalama “.” kullanımını gerektirir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-2','coktan_secmeli','“Saat kaç__” boşluğa ne gelmelidir?','[".","!",",","?"]',3,'Doğru noktalama “?” kullanımını gerektirir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-3','coktan_secmeli','“Yaşasın, yarışmayı kazandık__” boşluğa ne gelmelidir?','[".","!",",","?"]',1,'Doğru noktalama “!” kullanımını gerektirir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-4','coktan_secmeli','“Çantamda kalem__ silgi ve defter var.” boşluğa ne gelmelidir?','[".","?","!",","]',3,'Doğru noktalama “,” kullanımını gerektirir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-5','coktan_secmeli','“Öğretmen şöyle dedi__ Kitaplarınızı açın.” boşluğa ne gelmelidir?','[".",":",",","?"]',1,'Doğru noktalama “:” kullanımını gerektirir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-6','coktan_secmeli','“Ece__nin kitabı masada.” boşluğa ne gelmelidir?','["-",",",":","''"]',3,'Doğru noktalama “''” kullanımını gerektirir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-7','coktan_secmeli','Hangisinde soru işareti doğru kullanılmıştır?','["Bugün okula gittim?","Nereye gidiyorsun?","Ne güzel gün?","Kalem, silgi?"]',1,'Doğru noktalama “Nereye gidiyorsun?” kullanımını gerektirir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-8','coktan_secmeli','Hangisinde ünlem doğru kullanılmıştır?','["Bugün ders var!","Kaç yaşındasın!","Masada kitap var!","Eyvah, topum kaçtı!"]',3,'Doğru noktalama “Eyvah, topum kaçtı!” kullanımını gerektirir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-9','coktan_secmeli','Hangisinde virgül doğru kullanılmıştır?','["Elma armut, ve muz aldım.","Elma, armut ve muz aldım.","Elma? armut? muz aldım.","Elma. armut. muz aldım."]',1,'Doğru noktalama “Elma, armut ve muz aldım.” kullanımını gerektirir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-10','coktan_secmeli','Hangisinde nokta doğru kullanılmıştır?','["Mert kitap okudu?","Mert kitap okudu!","Mert, kitap okudu?","Mert kitap okudu."]',3,'Doğru noktalama “Mert kitap okudu.” kullanımını gerektirir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-11','coktan_secmeli','“Ankara__ya yarın gideceğiz.” boşluğa hangisi gelmelidir?','[".","''",",","?"]',1,'Doğru noktalama “''” kullanımını gerektirir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-12','coktan_secmeli','“Ali__ Ece ve Mert bahçedeydi.” boşluğa hangisi gelmelidir?','[".","!","?",","]',3,'Doğru noktalama “,” kullanımını gerektirir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-13','coktan_secmeli','“Kim kapıyı çaldı__” boşluğa hangisi gelmelidir?','[".","?",",","!"]',1,'Doğru noktalama “?” kullanımını gerektirir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-14','coktan_secmeli','“Dikkat__ Zemin ıslak.” boşluğa hangisi gelmelidir?','["?",".",",","!"]',3,'Doğru noktalama “!” kullanımını gerektirir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-15','coktan_secmeli','“Malzemeler__ kâğıt, makas ve yapıştırıcı.” boşluğa hangisi gelmelidir?','[".",":",",","?"]',1,'Doğru noktalama “:” kullanımını gerektirir.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-16','coktan_secmeli','Hangisi bir konuşmayı göstermek için tırnak işareti kullanır?','["Öğretmen Sessiz olun dedi.","Öğretmen: Sessiz olun? dedi.","Öğretmen, Sessiz olun! dedi.","Öğretmen, “Sessiz olun.” dedi."]',3,'Doğru noktalama “Öğretmen, “Sessiz olun.” dedi.” kullanımını gerektirir.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-17','coktan_secmeli','“23 Nisan__da tören yaptık.” boşluğa hangisi gelmelidir?','["-","''",",",":"]',1,'Doğru noktalama “''” kullanımını gerektirir.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-18','coktan_secmeli','“Ne kadar güzel bir resim__” boşluğa hangisi gelmelidir?','["?",".",",","!"]',3,'Doğru noktalama “!” kullanımını gerektirir.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-19','coktan_secmeli','“Bugün hangi gün__” boşluğa hangisi gelmelidir?','["!","?",".",","]',1,'Doğru noktalama “?” kullanımını gerektirir.',2,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-20','coktan_secmeli','“Bahçede kedi__ köpek ve kuş gördük.” boşluğa hangisi gelmelidir?','[".","?","!",","]',3,'Doğru noktalama “,” kullanımını gerektirir.',2,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-21','coktan_secmeli','“Önce ellerini yıka__ sonra sofraya otur.” boşluğa hangisi gelmelidir?','[".",",",":","?"]',1,'Doğru noktalama “,” kullanımını gerektirir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-22','coktan_secmeli','“Mert__in çantası kırmızı.” boşluğa hangisi gelmelidir?','[".",",","-","''"]',3,'Doğru noktalama “''” kullanımını gerektirir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-23','coktan_secmeli','Hangisinde iki nokta doğru kullanılmıştır?','["Üç renk: kullandım kırmızı mavi sarı.","Üç renk kullandım: kırmızı, mavi, sarı.","Üç renk kullandım? kırmızı.","Üç renk kullandım, : kırmızı."]',1,'Doğru noktalama “Üç renk kullandım: kırmızı, mavi, sarı.” kullanımını gerektirir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-24','coktan_secmeli','Hangisi noktayla bitmelidir?','["Nereye gidiyorsun","Eyvah çantam yırtıldı","Kim geldi","Bugün kütüphaneye gittik"]',3,'Doğru noktalama “Bugün kütüphaneye gittik” kullanımını gerektirir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-25','coktan_secmeli','Hangisi soru işaretiyle bitmelidir?','["Bugün yağmur yağdı","Bu kitabı kim yazdı","Ne güzel bir çiçek","Duru eve gitti"]',1,'Doğru noktalama “Bu kitabı kim yazdı” kullanımını gerektirir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-26','coktan_secmeli','Hangisi ünlemle bitmeye en uygundur?','["Masa kahverengidir","Ders saat dokuzda","Kitap raftadır","Aman, dikkat et"]',3,'Doğru noktalama “Aman, dikkat et” kullanımını gerektirir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-27','coktan_secmeli','“Sevgili arkadaşım__” hitabından sonra hangi işaret kullanılabilir?','["?",",",".","-"]',1,'Doğru noktalama “,” kullanımını gerektirir.',2,27,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-nokta-28','coktan_secmeli','Hangisinde kesme işareti doğru kullanılmıştır?','["Türkiyenin başkenti Ankara''dır.","Türkiye nin başkenti Ankara''dır.","Türkiye-nin başkenti Ankara''dır.","Türkiye''nin başkenti Ankara''dır."]',3,'Doğru noktalama “Türkiye''nin başkenti Ankara''dır.” kullanımını gerektirir.',2,28,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-1','coktan_secmeli','Tohum ekti → Suladı → Filiz çıktı. İlk olay hangisidir?','["Suladı","Tohum ekti","Filiz çıktı","Meyve topladı"]',1,'Olayların sırasına göre doğru cevap “Tohum ekti”dir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-2','coktan_secmeli','Uyandı → Kahvaltı yaptı → Okula gitti. Son olay hangisidir?','["Uyandı","Kahvaltı yaptı","Yatağa girdi","Okula gitti"]',3,'Olayların sırasına göre doğru cevap “Okula gitti”dir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-3','coktan_secmeli','Kitabı seçti → Ödünç aldı → Eve götürdü. İkinci olay hangisidir?','["Kitabı seçti","Ödünç aldı","Eve götürdü","Kitabı yırttı"]',1,'Olayların sırasına göre doğru cevap “Ödünç aldı”dir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-4','coktan_secmeli','Hamuru hazırladı → Şekil verdi → Fırında pişirdi. Önce ne oldu?','["Şekil verdi","Fırında pişirdi","Servis etti","Hamuru hazırladı"]',3,'Olayların sırasına göre doğru cevap “Hamuru hazırladı”dir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-5','coktan_secmeli','Yağmur başladı → Şemsiyesini açtı → Eve ulaştı. Yağmurdan sonra ne yaptı?','["Eve ulaştı","Şemsiyesini açtı","Uyudu","Ayakkabısını aldı"]',1,'Olayların sırasına göre doğru cevap “Şemsiyesini açtı”dir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-6','coktan_secmeli','Çantasını hazırladı → Montunu giydi → Evden çıktı. Evden çıkmadan hemen önce ne yaptı?','["Çantasını hazırladı","Eve döndü","Uyudu","Montunu giydi"]',3,'Olayların sırasına göre doğru cevap “Montunu giydi”dir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-7','coktan_secmeli','Kâğıdı katladı → Şekil çizdi → Kesti. En son ne yaptı?','["Katladı","Kesti","Çizdi","Boyadı"]',1,'Olayların sırasına göre doğru cevap “Kesti”dir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-8','coktan_secmeli','Saksıya toprak koydu → Tohum ekti → Su verdi. Tohumu ekmeden önce ne yaptı?','["Su verdi","Filiz gördü","Meyve topladı","Saksıya toprak koydu"]',3,'Olayların sırasına göre doğru cevap “Saksıya toprak koydu”dir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-9','coktan_secmeli','Ellerini yıkadı → Sofraya oturdu → Yemeğini yedi. Yemeğinden önce ne yaptı?','["Ellerini yıkamadı","Sofraya oturdu","Uyudu","Dışarı çıktı"]',1,'Olayların sırasına göre doğru cevap “Sofraya oturdu”dir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-10','coktan_secmeli','Soruyu okudu → Düşündü → Cevabı işaretledi. İkinci adım hangisidir?','["Soruyu okudu","Cevabı işaretledi","Kitabı kapattı","Düşündü"]',3,'Olayların sırasına göre doğru cevap “Düşündü”dir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-11','coktan_secmeli','Topu aldı → Bahçeye çıktı → Arkadaşlarıyla oynadı. Oynamadan önce ne yaptı?','["Topu bıraktı","Bahçeye çıktı","Eve döndü","Uyudu"]',1,'Olayların sırasına göre doğru cevap “Bahçeye çıktı”dir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-12','coktan_secmeli','Kütüphaneye girdi → Kitap aradı → Kitabı buldu. Son olay hangisidir?','["Kütüphaneye girdi","Kitap aradı","Kitabı kaybetti","Kitabı buldu"]',3,'Olayların sırasına göre doğru cevap “Kitabı buldu”dir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-13','coktan_secmeli','Resmi çizdi → Boyadı → Panoya astı. Boyamadan sonra ne yaptı?','["Resmi çizdi","Panoya astı","Kâğıdı yırttı","Kalemi sakladı"]',1,'Olayların sırasına göre doğru cevap “Panoya astı”dir.',2,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-14','coktan_secmeli','Bisikletine bindi → Kaskını taktı → Yola çıktı. Güvenli sıra nasıl olmalıdır?','["Yola çıktı → Kaskını taktı → Bisikletine bindi","Bisikletine bindi → Yola çıktı → Kaskını taktı","Kaskı hiç takmadı","Kaskını taktı → Bisikletine bindi → Yola çıktı"]',3,'Olayların sırasına göre doğru cevap “Kaskını taktı → Bisikletine bindi → Yola çıktı”dir.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-15','coktan_secmeli','Önce çöpü ayırdı, sonra geri dönüşüm kutusuna attı. İlk iş nedir?','["Kutuyu taşımak","Çöpü ayırmak","Çöpü yakmak","Kutuyu kapatmak"]',1,'Olayların sırasına göre doğru cevap “Çöpü ayırmak”dir.',2,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-16','coktan_secmeli','Öğretmen yönergeyi açıkladı → Öğrenciler dinledi → Çalışmaya başladılar. Çalışmadan önce ne oldu?','["Çalışma bitti","Teneffüse çıktılar","Eve gittiler","Öğrenciler dinledi"]',3,'Olayların sırasına göre doğru cevap “Öğrenciler dinledi”dir.',2,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-17','coktan_secmeli','Mert malzemeleri topladı → Deneyi yaptı → Sonucu yazdı. Sonuçtan önce ne yaptı?','["Malzemeleri dağıttı","Deneyi yaptı","Eve gitti","Kitabı kapattı"]',1,'Olayların sırasına göre doğru cevap “Deneyi yaptı”dir.',2,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-18','coktan_secmeli','Pelin davetiyeyi hazırladı → Arkadaşına verdi → Arkadaşı okudu. Davetiyeyi kim en son gördü?','["Pelin","Öğretmen","Komşu","Arkadaşı"]',3,'Olayların sırasına göre doğru cevap “Arkadaşı”dir.',2,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-19','coktan_secmeli','Sabah hava açıktı → Öğleden sonra bulutlandı → Akşam yağmur yağdı. Yağmurdan önce ne oldu?','["Sabah oldu","Hava bulutlandı","Güneş doğdu","Kar yağdı"]',1,'Olayların sırasına göre doğru cevap “Hava bulutlandı”dir.',2,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sira-20','coktan_secmeli','Ali önce özür diledi, sonra hatasını düzeltti. İkinci davranış hangisidir?','["Özür dilemek","Kaçmak","Suçlamak","Hatasını düzeltmek"]',3,'Olayların sırasına göre doğru cevap “Hatasını düzeltmek”dir.',2,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-olay-sirasi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-tahmin-1','coktan_secmeli','Gökyüzü karardı, rüzgâr hızlandı. Sonra ne olabilir?','["Hava bir anda çok sakin kalır","Yağmur başlayabilir","Güneş hiç batmaz","Karne dağıtılır"]',1,'Metindeki ipuçlarına en uygun tahmin “Yağmur başlayabilir”dir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-tahmin-2','coktan_secmeli','Ece kitabın son sayfasına geldi. Sonra ne yapması beklenir?','["Kitabın başını unutması","Kalemi kırması","Koşuya başlaması","Kitabı bitirmesi"]',3,'Metindeki ipuçlarına en uygun tahmin “Kitabı bitirmesi”dir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-tahmin-3','coktan_secmeli','Mert çok susadı ve mutfağa gitti. Sonra ne yapabilir?','["Uyuyabilir","Su içebilir","Bisiklete binebilir","Top oynayabilir"]',1,'Metindeki ipuçlarına en uygun tahmin “Su içebilir”dir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-tahmin-4','coktan_secmeli','Top hızla pencereye doğru gidiyor. Sonra ne olabilir?','["Top kitap olur","Pencere kaybolur","Oda küçülür","Pencereye çarpabilir"]',3,'Metindeki ipuçlarına en uygun tahmin “Pencereye çarpabilir”dir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-tahmin-5','coktan_secmeli','Kedi mama kabının yanına geldi ve miyavladı. Ne istiyor olabilir?','["Kitap","Yemek","Kalem","Bisiklet"]',1,'Metindeki ipuçlarına en uygun tahmin “Yemek”dir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-tahmin-6','coktan_secmeli','Duru kaskını takıp bisikletini çıkardı. Sonra ne yapabilir?','["Uyuyabilir","Sınava girebilir","Yemek pişirebilir","Bisiklete binebilir"]',3,'Metindeki ipuçlarına en uygun tahmin “Bisiklete binebilir”dir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-tahmin-7','coktan_secmeli','Öğretmen “Defterlerinizi açın.” dedi. Sonra ne yapmalısın?','["Çantanı eve götürmelisin","Defterini açmalısın","Koşmalısın","Işığı kapatmalısın"]',1,'Metindeki ipuçlarına en uygun tahmin “Defterini açmalısın”dir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-tahmin-8','coktan_secmeli','Fidanın toprağı çok kurudu. Ne yapılması uygun olabilir?','["Kökünü koparmak","Saksıyı kırmak","Güneş görmesini engellemek","Uygun miktarda sulamak"]',3,'Metindeki ipuçlarına en uygun tahmin “Uygun miktarda sulamak”dir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-tahmin-9','coktan_secmeli','Mert sınav kâğıdındaki son soruyu da yaptı. Sonra ne yapması uygundur?','["Kâğıdı yırtmak","Cevaplarını kontrol etmek","Soruları silmek","Sınıftan koşarak çıkmak"]',1,'Metindeki ipuçlarına en uygun tahmin “Cevaplarını kontrol etmek”dir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-tahmin-10','coktan_secmeli','Elektrikler kesildi ve oda karardı. Ne olabilir?','["Güneş sınıfa girer","Defter konuşur","Masa yürür","Işıklar sönebilir"]',3,'Metindeki ipuçlarına en uygun tahmin “Işıklar sönebilir”dir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-tahmin-11','coktan_secmeli','Bir çocuk yere çöp attı. Sorumlu davranmak için sonra ne yapmalıdır?','["Üzerine basmalıdır","Çöpü alıp kutuya atmalıdır","Daha fazla çöp atmalıdır","Oradan kaçmalıdır"]',1,'Metindeki ipuçlarına en uygun tahmin “Çöpü alıp kutuya atmalıdır”dir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-tahmin-12','coktan_secmeli','Ece arkadaşıyla aynı kitabı istiyor. Ne yapmaları uygun olur?','["Kitabı çekiştirmeleri","Kavga etmeleri","Kitabı saklamaları","Sırayla kullanmaları"]',3,'Metindeki ipuçlarına en uygun tahmin “Sırayla kullanmaları”dir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-tahmin-13','coktan_secmeli','Kütüphanede “Sessiz olun” levhası var. Ne yapmalısın?','["Bağırmalısın","Sessiz konuşmalısın","Müzik açmalısın","Koşmalısın"]',1,'Metindeki ipuçlarına en uygun tahmin “Sessiz konuşmalısın”dir.',2,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-tahmin-14','coktan_secmeli','Bir deneyde sonuç beklenenden farklı çıktı. Ne yapmak uygundur?','["Sonucu uydurmak","Malzemeleri atmak","Deneyi saklamak","Adımları yeniden kontrol etmek"]',3,'Metindeki ipuçlarına en uygun tahmin “Adımları yeniden kontrol etmek”dir.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-tahmin-15','coktan_secmeli','Yaşlı komşu ağır poşet taşıyor. Ne yapabilirsin?','["Alay edebilirsin","Güvenli şekilde yardım teklif edebilirsin","Poşeti saklayabilirsin","Yolunu kapatabilirsin"]',1,'Metindeki ipuçlarına en uygun tahmin “Güvenli şekilde yardım teklif edebilirsin”dir.',2,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-tahmin-16','coktan_secmeli','Arkadaşın konuşurken cümlesini tamamlamaya çalışıyor. Ne yapmalısın?','["Sözünü kesmelisin","Bağırmalısın","Arkanı dönmelisin","Sözünü bitirmesini beklemelisin"]',3,'Metindeki ipuçlarına en uygun tahmin “Sözünü bitirmesini beklemelisin”dir.',2,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-tahmin-17','coktan_secmeli','Yarın okul gezisi var ve öğretmen su getirin dedi. Ne yapmalısın?','["Suyu evde bırakmalısın","Çantana su koymalısın","Oyuncağı saklamalısın","Defteri yırtmalısın"]',1,'Metindeki ipuçlarına en uygun tahmin “Çantana su koymalısın”dir.',2,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-tahmin-18','coktan_secmeli','Hava çok soğuk ve dışarı çıkacaksın. Ne yapman beklenir?','["Sadece terlikle çıkman","Montunu evde bırakman","Pencereyi açık bırakman","Uygun kalın kıyafet giymen"]',3,'Metindeki ipuçlarına en uygun tahmin “Uygun kalın kıyafet giymen”dir.',2,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-kitap-1','coktan_secmeli','Bir kitabın adını en kolay nerede görürüz?','["Kaynakçada","Arka sayfanın boş kısmında","Sadece sözlükte","Ön kapakta"]',3,'Doğru cevap “Ön kapakta”dir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kitap-bolum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-kitap-2','coktan_secmeli','Kitaptaki konuların hangi sayfada olduğunu bulmak için hangi bölüme bakılır?','["Kapak resmi","İçindekiler","Kaynakça","Boş sayfa"]',1,'Doğru cevap “İçindekiler”dir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kitap-bolum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-kitap-3','coktan_secmeli','Anlamını bilmediğimiz bir sözcük için kitabın hangi bölümüne bakabiliriz?','["İçindekiler","Ön kapak","Sayfa numarası","Sözlük"]',3,'Doğru cevap “Sözlük”dir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kitap-bolum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-kitap-4','coktan_secmeli','Kitabın yararlandığı kaynakları gösteren bölüm hangisidir?','["İçindekiler","Kaynakça","Başlık","Resim"]',1,'Doğru cevap “Kaynakça”dir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kitap-bolum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-kitap-5','coktan_secmeli','Kitabın ön kısmında adı ve yazarı gösteren bölüm hangisidir?','["Kaynakça","Sözlük","İçindekiler","Ön kapak"]',3,'Doğru cevap “Ön kapak”dir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kitap-bolum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-kitap-6','coktan_secmeli','Sayfa numaraları ne işe yarar?','["Kitabın rengini değiştirmeye","Aradığımız sayfayı bulmaya","Resmi boyamaya","Kitabı ağırlaştırmaya"]',1,'Doğru cevap “Aradığımız sayfayı bulmaya”dir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kitap-bolum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-kitap-7','coktan_secmeli','Bir kitabı seçmeden önce başlık ve kapak görseli bize ne sağlayabilir?','["Kesin olarak tüm sonu bilme","Sayfa sayısını değiştirme","Kitabı yazma","Konu hakkında tahmin"]',3,'Doğru cevap “Konu hakkında tahmin”dir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kitap-bolum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-kitap-8','coktan_secmeli','İçindekiler bölümü hangi bilgiyi verir?','["Kitabın ağırlığını","Bölüm ve sayfa yerlerini","Yazarın boyunu","Kâğıdın rengini"]',1,'Doğru cevap “Bölüm ve sayfa yerlerini”dir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kitap-bolum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-kitap-9','coktan_secmeli','Sözlükte ne bulunur?','["Sadece resimler","Kitabın fiyatı","Okul listesi","Sözcüklerin anlamları"]',3,'Doğru cevap “Sözcüklerin anlamları”dir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kitap-bolum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-kitap-10','coktan_secmeli','Kaynakça neden önemlidir?','["Kitabın kapağını korur","Bilgilerin yararlanılan kaynaklarını gösterir","Sayfaları numaralandırır","Resimleri büyütür"]',1,'Doğru cevap “Bilgilerin yararlanılan kaynaklarını gösterir”dir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kitap-bolum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-kitap-11','coktan_secmeli','Bir kitabın arka kapağında çoğu zaman ne bulunabilir?','["Tüm kitap metni","Sadece matematik işlemi","Okul zil sesi","Kitap hakkında kısa tanıtım"]',3,'Doğru cevap “Kitap hakkında kısa tanıtım”dir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kitap-bolum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-kitap-12','coktan_secmeli','Bir kitabı incelerken önce neye bakmak konu tahmini yapmayı kolaylaştırır?','["Sayfa kenarına","Başlık ve görsellere","Kâğıt kalınlığına","Masaya"]',1,'Doğru cevap “Başlık ve görsellere”dir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kitap-bolum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-1','coktan_secmeli','Hangisi anlamlı ve kurallı bir cümledir?','["Bugün Ece parka mı.","Parka bugün Ece.","Gitti parka.","Ece bugün parka gitti."]',3,'Cümlenin anlamına göre doğru cevap “Ece bugün parka gitti.”dir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-2','coktan_secmeli','“Kuşlar gökyüzünde __.” cümlesini hangisi tamamlar?','["okuyor","uçuyor","yazıyor","yüzüyor"]',1,'Cümlenin anlamına göre doğru cevap “uçuyor”dir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-3','coktan_secmeli','“Balıklar __ yaşar.” cümlesini hangisi tamamlar?','["bulutta","kitapta","dolapta","suda"]',3,'Cümlenin anlamına göre doğru cevap “suda”dir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-4','coktan_secmeli','Hangisi soru cümlesidir?','["Ben kitabı seçtim.","Sen hangi kitabı seçtin?","Kitap çok güzeldi.","Ece kitabı aldı."]',1,'Cümlenin anlamına göre doğru cevap “Sen hangi kitabı seçtin?”dir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-5','coktan_secmeli','Hangisi bir istek cümlesidir?','["Pencere açıktır.","Pencere mavi.","Pencere büyüktür.","Pencereyi açar mısın?"]',3,'Cümlenin anlamına göre doğru cevap “Pencereyi açar mısın?”dir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-6','coktan_secmeli','Kelimeleri doğru sıraya koy: “oynuyor / bahçede / Mert”','["Bahçede oynuyor Mert mi.","Mert bahçede oynuyor.","Oynuyor Mert bahçede.","Bahçede Mert mi oynuyor."]',1,'Cümlenin anlamına göre doğru cevap “Mert bahçede oynuyor.”dir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-7','coktan_secmeli','Kelimeleri doğru sıraya koy: “kitap / Duru / okuyor”','["Kitap Duru okuyor.","Okuyor kitap Duru.","Duru okuyor kitap mı.","Duru kitap okuyor."]',3,'Cümlenin anlamına göre doğru cevap “Duru kitap okuyor.”dir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-8','coktan_secmeli','“Annem pazardan __ aldı.” boşluğa hangisi uygundur?','["koştu","meyve","uyudu","yüzdü"]',1,'Cümlenin anlamına göre doğru cevap “meyve”dir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-9','coktan_secmeli','“Sabah erken __.” cümlesini hangisi tamamlar?','["masa","mavi","kitap","uyandım"]',3,'Cümlenin anlamına göre doğru cevap “uyandım”dir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-10','coktan_secmeli','“Kedi koltuğun altında saklandı.” Kedi nerededir?','["Bahçede","Koltuğun altında","Çatıda","Masanın üstünde"]',1,'Cümlenin anlamına göre doğru cevap “Koltuğun altında”dir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-11','coktan_secmeli','“Ela kırmızı şapkasını taktı.” Şapkanın rengi nedir?','["Mavi","Yeşil","Beyaz","Kırmızı"]',3,'Cümlenin anlamına göre doğru cevap “Kırmızı”dir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-12','coktan_secmeli','“Mert okuldan sonra kütüphaneye gitti.” Mert ne zaman kütüphaneye gitti?','["Gece yarısı","Okuldan sonra","Okuldan önce","Sabah uyanmadan"]',1,'Cümlenin anlamına göre doğru cevap “Okuldan sonra”dir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-13','coktan_secmeli','“Can hızlıca kapıya koştu.” Can ne yaptı?','["Kitap okudu","Uyudu","Yemek yaptı","Kapıya koştu"]',3,'Cümlenin anlamına göre doğru cevap “Kapıya koştu”dir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-14','coktan_secmeli','“Yağmur yağdığı için şemsiyemi açtım.” Şemsiye neden açıldı?','["Güneş doğduğu için","Yağmur yağdığı için","Kitap okumak için","Koşmak için"]',1,'Cümlenin anlamına göre doğru cevap “Yağmur yağdığı için”dir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-15','coktan_secmeli','“Ece çok çalıştı ve resmi tamamladı.” Sonuç nedir?','["Kalemi kaybetti","Uyudu","Dışarı çıktı","Resmi tamamladı"]',3,'Cümlenin anlamına göre doğru cevap “Resmi tamamladı”dir.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-16','coktan_secmeli','Hangisi olumsuz cümledir?','["Bugün parka gittim.","Bugün parka gitmedim.","Park çok güzeldi.","Arkadaşım da geldi."]',1,'Cümlenin anlamına göre doğru cevap “Bugün parka gitmedim.”dir.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-17','coktan_secmeli','Hangisi olumlu cümledir?','["Mert ödevini yapmadı.","Mert okula gitmedi.","Mert kitabı açmadı.","Mert ödevini yaptı."]',3,'Cümlenin anlamına göre doğru cevap “Mert ödevini yaptı.”dir.',2,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-18','coktan_secmeli','“Masada iki kalem ve bir silgi var.” Masada kaç tür eşya söylenmiştir?','["Bir tür","İki tür","Üç tür","Dört tür"]',1,'Cümlenin anlamına göre doğru cevap “İki tür”dir.',2,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-19','coktan_secmeli','Hangisi kısa bir yönergedir?','["Defter mavi.","Ben defter aldım.","Defter masada.","Defterini aç."]',3,'Cümlenin anlamına göre doğru cevap “Defterini aç.”dir.',2,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-20','coktan_secmeli','“Önce ellerini yıka, sonra sofraya otur.” İlk ne yapılmalıdır?','["Sofraya oturmak","Ellerini yıkamak","Uyumak","Dışarı çıkmak"]',1,'Cümlenin anlamına göre doğru cevap “Ellerini yıkamak”dir.',2,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-21','coktan_secmeli','Hangisi bir duygu bildirir?','["Masa sınıfta.","Saat üç.","Kalem kırmızı.","Bu habere çok sevindim."]',3,'Cümlenin anlamına göre doğru cevap “Bu habere çok sevindim.”dir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-22','coktan_secmeli','Hangisi karşılaştırma bildirir?','["Çanta masada.","Bu çanta ötekinden daha hafif.","Çantayı aldım.","Çanta mavidir."]',1,'Cümlenin anlamına göre doğru cevap “Bu çanta ötekinden daha hafif.”dir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-23','coktan_secmeli','“Kışın hava soğur.” cümlesi ne bildirir?','["Soru","Emir","Şaşırma","Bilgi"]',3,'Cümlenin anlamına göre doğru cevap “Bilgi”dir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cumle-24','coktan_secmeli','“Lütfen sıranı bekle.” cümlesinde hangi davranış istenir?','["Koşmak","Sırayı beklemek","Bağırmak","Sırayı bozmak"]',1,'Cümlenin anlamına göre doğru cevap “Sırayı beklemek”dir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-1','coktan_secmeli','Hangisi doğru yazılmıştır?','["ayşe bugün ankaraya gitti.","Ayşe bugün ankara''ya gitti.","ayşe Bugün Ankara''ya gitti.","Ayşe bugün Ankara''ya gitti."]',3,'Yazım kuralına göre doğru biçim “Ayşe bugün Ankara''ya gitti.”dir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-2','coktan_secmeli','Hangisi cümle başında doğru kullanılmıştır?','["bugün hava güzel.","Bugün hava güzel.","BUGÜN hava güzel.","buGün hava güzel."]',1,'Yazım kuralına göre doğru biçim “Bugün hava güzel.”dir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-3','coktan_secmeli','Kişi adı nasıl başlamalıdır?','["Küçük harfle","Rakamla","Noktayla","Büyük harfle"]',3,'Yazım kuralına göre doğru biçim “Büyük harfle”dir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-4','coktan_secmeli','Şehir adı olan “izmir” nasıl yazılmalıdır?','["izmir","İzmir","İZMİR her zaman","iZmir"]',1,'Yazım kuralına göre doğru biçim “İzmir”dir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-5','coktan_secmeli','“mert” kişi adıysa doğru yazımı hangisidir?','["mert","mERT","merT","Mert"]',3,'Yazım kuralına göre doğru biçim “Mert”dir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-6','coktan_secmeli','“Türkiye” sözcüğü neden büyük harfle başlar?','["Uzun olduğu için","Ülke adı olduğu için","Sonunda e olduğu için","İki heceli olduğu için"]',1,'Yazım kuralına göre doğru biçim “Ülke adı olduğu için”dir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-7','coktan_secmeli','Hangisi doğru yazılmıştır?','["23 nisan ulusal egemenlik ve çocuk bayramı","23 Nisan ulusal egemenlik ve çocuk bayramı","23 nisan Ulusal Egemenlik","23 Nisan Ulusal Egemenlik ve Çocuk Bayramı"]',3,'Yazım kuralına göre doğru biçim “23 Nisan Ulusal Egemenlik ve Çocuk Bayramı”dir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-8','coktan_secmeli','Cümlenin sonunda ne bulunmalıdır?','["Her zaman virgül","Uygun noktalama işareti","Her zaman iki nokta","Hiçbir işaret"]',1,'Yazım kuralına göre doğru biçim “Uygun noktalama işareti”dir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-9','coktan_secmeli','Paragraf başında ne yapılır?','["Kelime ortadan bölünür","Sayfa boş bırakılır","Tüm harfler büyütülür","Yeni satırda uygun girintiyle başlanır"]',3,'Yazım kuralına göre doğru biçim “Yeni satırda uygun girintiyle başlanır”dir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-10','coktan_secmeli','Satır sonuna sığmayan bir sözcük nasıl ayrılır?','["Herhangi bir harften","Hece sınırına dikkat edilerek kısa çizgiyle","Rastgele","Hiçbir kurala bakmadan"]',1,'Yazım kuralına göre doğru biçim “Hece sınırına dikkat edilerek kısa çizgiyle”dir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-11','coktan_secmeli','Hangisi özel addır?','["şehir","okul","kitap","Konya"]',3,'Yazım kuralına göre doğru biçim “Konya”dir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-12','coktan_secmeli','Hangisi tür adıdır?','["Ankara","şehir","Türkiye","Atatürk"]',1,'Yazım kuralına göre doğru biçim “şehir”dir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-13','coktan_secmeli','“Ece''nin” yazımında neden kesme işareti vardır?','["Cümleyi bitirmek için","Soru sormak için","Liste yapmak için","Özel ada gelen eki ayırmak için"]',3,'Yazım kuralına göre doğru biçim “Özel ada gelen eki ayırmak için”dir.',2,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-14','coktan_secmeli','Hangisi doğru yazılmıştır?','["Türkiyenin bayrağı","Türkiye''nin bayrağı","Türkiye nin bayrağı","türkiye''nin bayrağı"]',1,'Yazım kuralına göre doğru biçim “Türkiye''nin bayrağı”dir.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-15','coktan_secmeli','Hangisinde cümle başı doğrudur?','["sabah erkenden uyandım.","saBah erkenden uyandım.","SABAH erkenden uyandım.","Sabah erkenden uyandım."]',3,'Yazım kuralına göre doğru biçim “Sabah erkenden uyandım.”dir.',2,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-16','coktan_secmeli','Hangisi okul adı gibi özel ada örnek olabilir?','["okul","Cumhuriyet İlkokulu","sınıf","bahçe"]',1,'Yazım kuralına göre doğru biçim “Cumhuriyet İlkokulu”dir.',2,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-17','coktan_secmeli','Yazıda kelimeler arasında ne bırakılır?','["Virgül her zaman","İki satır","Hiçbir şey","Boşluk"]',3,'Yazım kuralına göre doğru biçim “Boşluk”dir.',2,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-18','coktan_secmeli','Okunaklı yazı için hangisi önemlidir?','["Kelime aralarını birleştirmek","Harfleri anlaşılır yazmak","Satırları karıştırmak","Noktalama kullanmamak"]',1,'Yazım kuralına göre doğru biçim “Harfleri anlaşılır yazmak”dir.',2,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-19','coktan_secmeli','Bir başlık yazarken neye dikkat edilir?','["Her zaman çok uzun olmasına","Metinle ilgisiz olmasına","Sadece rakam olmasına","Başlığın metne uygun olmasına"]',3,'Yazım kuralına göre doğru biçim “Başlığın metne uygun olmasına”dir.',2,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yazim-20','coktan_secmeli','Hangisi doğru yazılmış bir cümledir?','["mert eceye kitabı verdi","Mert, Ece''ye kitabı verdi.","Mert Ece''ye kitabı verdi","Mert, ece''ye kitabı verdi."]',1,'Yazım kuralına göre doğru biçim “Mert, Ece''ye kitabı verdi.”dir.',2,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yonerge-1','coktan_secmeli','“Önce adını yaz, sonra kâğıdı boya.” İlk yapılacak iş nedir?','["Kâğıdı boyamak","Kâğıdı kesmek","Masayı toplamak","Adını yazmak"]',3,'Yönergeye göre doğru işlem “Adını yazmak”dir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yonerge-2','coktan_secmeli','“Kitabı aç ve 10. sayfayı bul.” Ne yapmalısın?','["Kitabı kapatmalısın","Kitabı açıp 10. sayfayı bulmalısın","Sayfayı yırtmalısın","Kitabı saklamalısın"]',1,'Yönergeye göre doğru işlem “Kitabı açıp 10. sayfayı bulmalısın”dir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yonerge-3','coktan_secmeli','“Makasla çizginin üzerinden kes.” Hangi araç gerekir?','["Silgi","Cetvel","Bardak","Makas"]',3,'Yönergeye göre doğru işlem “Makas”dir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yonerge-4','coktan_secmeli','“Üç kırmızı daire çiz.” Kaç daire çizilmelidir?','["Bir","Üç","İki","Dört"]',1,'Yönergeye göre doğru işlem “Üç”dir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yonerge-5','coktan_secmeli','“Mavi kalemle başlığı yaz.” Hangi renk kullanılmalıdır?','["Kırmızı","Sarı","Yeşil","Mavi"]',3,'Yönergeye göre doğru işlem “Mavi”dir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yonerge-6','coktan_secmeli','“Önce ellerini yıka, sonra meyveyi ye.” Meyveyi yemeden önce ne yapılır?','["Koşulur","Eller yıkanır","Uyunur","Kitap açılır"]',1,'Yönergeye göre doğru işlem “Eller yıkanır”dir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yonerge-7','coktan_secmeli','“İki adım ileri, bir adım sağa git.” İlk hareket nedir?','["Bir adım sağa gitmek","Geri gitmek","Durmak","İki adım ileri gitmek"]',3,'Yönergeye göre doğru işlem “İki adım ileri gitmek”dir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yonerge-8','coktan_secmeli','“Defterini kapat ve kalemini kutuya koy.” İkinci iş nedir?','["Defteri açmak","Kalemi kutuya koymak","Masayı silmek","Kitabı almak"]',1,'Yönergeye göre doğru işlem “Kalemi kutuya koymak”dir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yonerge-9','coktan_secmeli','“Resimdeki üçgenleri sarıya boya.” Hangi şekil boyanacaktır?','["Kareler","Daireler","Dikdörtgenler","Üçgenler"]',3,'Yönergeye göre doğru işlem “Üçgenler”dir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yonerge-10','coktan_secmeli','“Cümleyi oku, doğru cevabı işaretle.” Önce ne yapılır?','["Cevap silinir","Cümle okunur","Kâğıt katlanır","Kalem bırakılır"]',1,'Yönergeye göre doğru işlem “Cümle okunur”dir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yonerge-11','coktan_secmeli','“Dört kez alkışla, sonra ellerini indir.” Kaç kez alkışlanır?','["İki","Üç","Beş","Dört"]',3,'Yönergeye göre doğru işlem “Dört”dir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yonerge-12','coktan_secmeli','“Kırmızı kartı masanın üstüne koy.” Kart nereye konur?','["Masanın altına","Masanın üstüne","Dolaba","Çantaya"]',1,'Yönergeye göre doğru işlem “Masanın üstüne”dir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yonerge-13','coktan_secmeli','“İki nesneyi karşılaştır ve uzun olanı seç.” Ne aranıyor?','["Ağır olan nesne","Kırmızı olan nesne","Yuvarlak olan nesne","Uzun olan nesne"]',3,'Yönergeye göre doğru işlem “Uzun olan nesne”dir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yonerge-14','coktan_secmeli','“Metni oku ve başlığını seç.” Okumadan sonra ne yapılır?','["Metin silinir","Başlık seçilir","Kitap kapanır","Resim yırtılır"]',1,'Yönergeye göre doğru işlem “Başlık seçilir”dir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yonerge-15','coktan_secmeli','“Bir bardak su iç ve bardağı yerine koy.” İkinci iş nedir?','["Suyu dökmek","Bardağı saklamak","Koşmak","Bardağı yerine koymak"]',3,'Yönergeye göre doğru işlem “Bardağı yerine koymak”dir.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yonerge-16','coktan_secmeli','“Önce tarihi, sonra başlığı yaz.” Başlıktan önce ne yazılır?','["Cevap","Tarih","Resim","Sayfa numarası"]',1,'Yönergeye göre doğru işlem “Tarih”dir.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yonerge-17','coktan_secmeli','“Soldaki resmi yuvarlak içine al.” Hangi resim seçilir?','["Sağdaki","Ortadaki","En alttaki","Soldaki"]',3,'Yönergeye göre doğru işlem “Soldaki”dir.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-yonerge-18','coktan_secmeli','“Soruyu iki kez oku, sonra cevapla.” Cevaplamadan önce ne yapılır?','["Soruyu silmek","Soruyu iki kez okumak","Kâğıdı kapatmak","Bir kez koşmak"]',1,'Yönergeye göre doğru işlem “Soruyu iki kez okumak”dir.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-1','coktan_secmeli','“büyük” sözcüğünün zıt anlamlısı nedir?','["uzun","küçük","geniş","yüksek"]',1,'Sözcük ilişkisine göre doğru cevap “küçük”dir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-2','coktan_secmeli','“hızlı” sözcüğünün zıt anlamlısı nedir?','["çabuk","erken","güçlü","yavaş"]',3,'Sözcük ilişkisine göre doğru cevap “yavaş”dir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-3','coktan_secmeli','“sıcak” sözcüğünün zıt anlamlısı nedir?','["ılık","soğuk","yaz","güneş"]',1,'Sözcük ilişkisine göre doğru cevap “soğuk”dir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-4','coktan_secmeli','“uzun” sözcüğünün zıt anlamlısı nedir?','["ince","geniş","yüksek","kısa"]',3,'Sözcük ilişkisine göre doğru cevap “kısa”dir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-5','coktan_secmeli','“açık” sözcüğünün zıt anlamlısı nedir?','["aydınlık","kapalı","boş","geniş"]',1,'Sözcük ilişkisine göre doğru cevap “kapalı”dir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-6','coktan_secmeli','“mutlu” sözcüğünün zıt anlamlısı nedir?','["sevinçli","neşeli","gülen","üzgün"]',3,'Sözcük ilişkisine göre doğru cevap “üzgün”dir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-7','coktan_secmeli','“erken” sözcüğünün zıt anlamlısı nedir?','["sabah","geç","hızlı","önce"]',1,'Sözcük ilişkisine göre doğru cevap “geç”dir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-8','coktan_secmeli','“temiz” sözcüğünün zıt anlamlısı nedir?','["düzenli","parlak","yeni","kirli"]',3,'Sözcük ilişkisine göre doğru cevap “kirli”dir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-9','coktan_secmeli','“cevap” sözcüğüne yakın anlamlı hangisidir?','["soru","yanıt","işaret","metin"]',1,'Sözcük ilişkisine göre doğru cevap “yanıt”dir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-10','coktan_secmeli','“misafir” sözcüğüne yakın anlamlı hangisidir?','["ev sahibi","komşu","öğrenci","konuk"]',3,'Sözcük ilişkisine göre doğru cevap “konuk”dir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-11','coktan_secmeli','“yıl” sözcüğüne yakın anlamlı hangisidir?','["ay","sene","hafta","gün"]',1,'Sözcük ilişkisine göre doğru cevap “sene”dir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-12','coktan_secmeli','“öykü” sözcüğüne yakın anlamlı hangisidir?','["şiir","soru","haber","hikâye"]',3,'Sözcük ilişkisine göre doğru cevap “hikâye”dir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-13','coktan_secmeli','Hangisi aynı konu grubundadır: kitap, dergi, __','["çatal","gazete","top","ayakkabı"]',1,'Sözcük ilişkisine göre doğru cevap “gazete”dir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-14','coktan_secmeli','Hangisi aynı konu grubundadır: elma, armut, __','["masa","kalem","kapı","muz"]',3,'Sözcük ilişkisine göre doğru cevap “muz”dir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-15','coktan_secmeli','Hangisi aynı konu grubundadır: anne, baba, __','["öğretmen","kardeş","doktor","şoför"]',1,'Sözcük ilişkisine göre doğru cevap “kardeş”dir.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-16','coktan_secmeli','Hangisi aynı konu grubundadır: kırmızı, mavi, __','["yuvarlak","uzun","hızlı","sarı"]',3,'Sözcük ilişkisine göre doğru cevap “sarı”dir.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-17','coktan_secmeli','Hangisi diğerlerinden farklı bir gruptadır?','["elma","masa","armut","muz"]',1,'Sözcük ilişkisine göre doğru cevap “masa”dir.',2,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-18','coktan_secmeli','Hangisi diğerlerinden farklıdır?','["kedi","köpek","kuş","kalem"]',3,'Sözcük ilişkisine göre doğru cevap “kalem”dir.',2,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-19','coktan_secmeli','“ince” sözcüğünün zıt anlamlısı nedir?','["uzun","kalın","küçük","dar"]',1,'Sözcük ilişkisine göre doğru cevap “kalın”dir.',2,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-20','coktan_secmeli','“yukarı” sözcüğünün zıt anlamlısı nedir?','["ileri","sağ","sol","aşağı"]',3,'Sözcük ilişkisine göre doğru cevap “aşağı”dir.',2,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-21','coktan_secmeli','“yakın” sözcüğünün zıt anlamlısı nedir?','["yan","uzak","ön","geri"]',1,'Sözcük ilişkisine göre doğru cevap “uzak”dir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-22','coktan_secmeli','“eski” sözcüğünün zıt anlamlısı nedir?','["yaşlı","büyük","uzun","yeni"]',3,'Sözcük ilişkisine göre doğru cevap “yeni”dir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-23','coktan_secmeli','“güçlü” sözcüğünün zıt anlamlısı nedir?','["hızlı","güçsüz","uzun","ağır"]',1,'Sözcük ilişkisine göre doğru cevap “güçsüz”dir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-sozcuk-24','coktan_secmeli','“dolu” sözcüğünün zıt anlamlısı nedir?','["kapalı","açık","geniş","boş"]',3,'Sözcük ilişkisine göre doğru cevap “boş”dir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-1','coktan_secmeli','Atatürk ve Çocuk: Eylül ne zaman uyandı?','["Gece yarısı","23 Nisan sabahı","Yaz tatilinde","Akşam"]',1,'23 Nisan sabahı Eylül erkenden uyandı. Okul bahçesi bayraklarla süslenmişti. Eylül şiirini okumak için heyecanlıydı. Törende öğretmeni, Atatürk''ün çocuklara verdiği değerden söz etti. Eylül şiirini okuyunca arkadaşları onu alkışladı. Cevap metindeki bilgiye dayanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-ataturk-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-2','coktan_secmeli','Atatürk ve Çocuk: Okul bahçesi neyle süslenmişti?','["Balonlarla sadece","Kitaplarla","Oyuncaklarla","Bayraklarla"]',3,'23 Nisan sabahı Eylül erkenden uyandı. Okul bahçesi bayraklarla süslenmişti. Eylül şiirini okumak için heyecanlıydı. Törende öğretmeni, Atatürk''ün çocuklara verdiği değerden söz etti. Eylül şiirini okuyunca arkadaşları onu alkışladı. Cevap metindeki bilgiye dayanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-ataturk-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-3','coktan_secmeli','Atatürk ve Çocuk: Eylül neden heyecanlıydı?','["Maça gideceği için","Şiir okuyacağı için","Eve döneceği için","Uyuyacağı için"]',1,'23 Nisan sabahı Eylül erkenden uyandı. Okul bahçesi bayraklarla süslenmişti. Eylül şiirini okumak için heyecanlıydı. Törende öğretmeni, Atatürk''ün çocuklara verdiği değerden söz etti. Eylül şiirini okuyunca arkadaşları onu alkışladı. Cevap metindeki bilgiye dayanır.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-ataturk-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-4','coktan_secmeli','Atatürk ve Çocuk: Öğretmen ne hakkında konuştu?','["Hava durumu","Yemek tarifi","Hayvanlar","Atatürk''ün çocuklara verdiği değer"]',3,'23 Nisan sabahı Eylül erkenden uyandı. Okul bahçesi bayraklarla süslenmişti. Eylül şiirini okumak için heyecanlıydı. Törende öğretmeni, Atatürk''ün çocuklara verdiği değerden söz etti. Eylül şiirini okuyunca arkadaşları onu alkışladı. Cevap metindeki bilgiye dayanır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-ataturk-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-5','coktan_secmeli','Atatürk ve Çocuk: Eylül şiirden sonra ne oldu?','["Okul kapandı","Arkadaşları alkışladı","Yağmur başladı","Eve uyumaya gitti"]',1,'23 Nisan sabahı Eylül erkenden uyandı. Okul bahçesi bayraklarla süslenmişti. Eylül şiirini okumak için heyecanlıydı. Törende öğretmeni, Atatürk''ün çocuklara verdiği değerden söz etti. Eylül şiirini okuyunca arkadaşları onu alkışladı. Cevap metindeki bilgiye dayanır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-ataturk-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-6','coktan_secmeli','Atatürk ve Çocuk: Metnin konusu nedir?','["Kış mevsimi","Bir alışveriş","Bir spor maçı","23 Nisan töreni ve Atatürk''ün çocuklara verdiği değer"]',3,'23 Nisan sabahı Eylül erkenden uyandı. Okul bahçesi bayraklarla süslenmişti. Eylül şiirini okumak için heyecanlıydı. Törende öğretmeni, Atatürk''ün çocuklara verdiği değerden söz etti. Eylül şiirini okuyunca arkadaşları onu alkışladı. Cevap metindeki bilgiye dayanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-ataturk-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-7','coktan_secmeli','Atatürk ve Çocuk: Metne en uygun başlık hangisidir?','["Kayıp Kalem","23 Nisan Heyecanı","Yağmurlu Akşam","Mutfaktaki Pasta"]',1,'23 Nisan sabahı Eylül erkenden uyandı. Okul bahçesi bayraklarla süslenmişti. Eylül şiirini okumak için heyecanlıydı. Törende öğretmeni, Atatürk''ün çocuklara verdiği değerden söz etti. Eylül şiirini okuyunca arkadaşları onu alkışladı. Cevap metindeki bilgiye dayanır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-ataturk-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-8','coktan_secmeli','Atatürk ve Çocuk: Eylül''ün duygusu hangisidir?','["Öfke","Korku","Sıkıntı","Heyecan"]',3,'23 Nisan sabahı Eylül erkenden uyandı. Okul bahçesi bayraklarla süslenmişti. Eylül şiirini okumak için heyecanlıydı. Törende öğretmeni, Atatürk''ün çocuklara verdiği değerden söz etti. Eylül şiirini okuyunca arkadaşları onu alkışladı. Cevap metindeki bilgiye dayanır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-ataturk-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-9','coktan_secmeli','Doğadaki Değişim: Mert neyi gözlemliyordu?','["Bir arabayı","Bir ağacı","Bir kitabı","Bir oyuncağı"]',1,'Mert, okul yolundaki ağacı her hafta gözlemliyordu. İlkbaharda dallarda küçük tomurcuklar gördü. Birkaç hafta sonra yeşil yapraklar çıktı. Yazın ağaç daha gür oldu. Mert değişimleri defterine çizdi. Cevap metindeki bilgiye dayanır.',2,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-doga' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-10','coktan_secmeli','Doğadaki Değişim: Tomurcukları hangi mevsimde gördü?','["Kışın","Sonbaharda","Her gece","İlkbaharda"]',3,'Mert, okul yolundaki ağacı her hafta gözlemliyordu. İlkbaharda dallarda küçük tomurcuklar gördü. Birkaç hafta sonra yeşil yapraklar çıktı. Yazın ağaç daha gür oldu. Mert değişimleri defterine çizdi. Cevap metindeki bilgiye dayanır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-doga' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-11','coktan_secmeli','Doğadaki Değişim: Tomurcuklardan sonra ne çıktı?','["Kar","Yeşil yapraklar","Taş","Oyuncak"]',1,'Mert, okul yolundaki ağacı her hafta gözlemliyordu. İlkbaharda dallarda küçük tomurcuklar gördü. Birkaç hafta sonra yeşil yapraklar çıktı. Yazın ağaç daha gür oldu. Mert değişimleri defterine çizdi. Cevap metindeki bilgiye dayanır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-doga' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-12','coktan_secmeli','Doğadaki Değişim: Yazın ağaç nasıl oldu?','["Yapraksız","Küçük bir taş","Kuru kalem","Daha gür"]',3,'Mert, okul yolundaki ağacı her hafta gözlemliyordu. İlkbaharda dallarda küçük tomurcuklar gördü. Birkaç hafta sonra yeşil yapraklar çıktı. Yazın ağaç daha gür oldu. Mert değişimleri defterine çizdi. Cevap metindeki bilgiye dayanır.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-doga' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-13','coktan_secmeli','Doğadaki Değişim: Mert değişimleri nereye kaydetti?','["Televizyona","Defterine","Çantasının dışına","Duvara"]',1,'Mert, okul yolundaki ağacı her hafta gözlemliyordu. İlkbaharda dallarda küçük tomurcuklar gördü. Birkaç hafta sonra yeşil yapraklar çıktı. Yazın ağaç daha gür oldu. Mert değişimleri defterine çizdi. Cevap metindeki bilgiye dayanır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-doga' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-14','coktan_secmeli','Doğadaki Değişim: Mert''in yaptığı çalışma neye örnektir?','["Rastgele tahmine","Uyumaya","Koşmaya","Gözleme"]',3,'Mert, okul yolundaki ağacı her hafta gözlemliyordu. İlkbaharda dallarda küçük tomurcuklar gördü. Birkaç hafta sonra yeşil yapraklar çıktı. Yazın ağaç daha gür oldu. Mert değişimleri defterine çizdi. Cevap metindeki bilgiye dayanır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-doga' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-15','coktan_secmeli','Doğadaki Değişim: Metnin konusu nedir?','["Bir futbol oyunu","Ağacın mevsimsel değişimi","Bir yemek","Bir alışveriş"]',1,'Mert, okul yolundaki ağacı her hafta gözlemliyordu. İlkbaharda dallarda küçük tomurcuklar gördü. Birkaç hafta sonra yeşil yapraklar çıktı. Yazın ağaç daha gür oldu. Mert değişimleri defterine çizdi. Cevap metindeki bilgiye dayanır.',2,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-doga' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-16','coktan_secmeli','Doğadaki Değişim: En uygun başlık hangisidir?','["Kırmızı Top","Yeni Çanta","Sessiz Sınıf","Ağacın Değişimi"]',3,'Mert, okul yolundaki ağacı her hafta gözlemliyordu. İlkbaharda dallarda küçük tomurcuklar gördü. Birkaç hafta sonra yeşil yapraklar çıktı. Yazın ağaç daha gür oldu. Mert değişimleri defterine çizdi. Cevap metindeki bilgiye dayanır.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-doga' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-17','coktan_secmeli','Kütüphane Kartı: Zeynep nereye gitti?','["Spor salonuna","Okul kütüphanesine","Markete","Hastaneye"]',1,'Zeynep sınıfıyla okul kütüphanesine gitti. Görevli öğretmen kitapların bölümlere göre düzenlendiğini anlattı. Zeynep hayvanlarla ilgili bir kitap seçti. Kitabın içindekiler bölümüne baktı ve ilgisini çeken sayfayı buldu. Kitabı ödünç aldı. Cevap metindeki bilgiye dayanır.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-okuma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-18','coktan_secmeli','Kütüphane Kartı: Kitaplar nasıl düzenlenmişti?','["Renklerine göre sadece","Ağırlıklarına göre","Rastgele","Bölümlere göre"]',3,'Zeynep sınıfıyla okul kütüphanesine gitti. Görevli öğretmen kitapların bölümlere göre düzenlendiğini anlattı. Zeynep hayvanlarla ilgili bir kitap seçti. Kitabın içindekiler bölümüne baktı ve ilgisini çeken sayfayı buldu. Kitabı ödünç aldı. Cevap metindeki bilgiye dayanır.',2,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-okuma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-19','coktan_secmeli','Kütüphane Kartı: Zeynep hangi konuda kitap seçti?','["Arabalar","Hayvanlar","Yemekler","Binalar"]',1,'Zeynep sınıfıyla okul kütüphanesine gitti. Görevli öğretmen kitapların bölümlere göre düzenlendiğini anlattı. Zeynep hayvanlarla ilgili bir kitap seçti. Kitabın içindekiler bölümüne baktı ve ilgisini çeken sayfayı buldu. Kitabı ödünç aldı. Cevap metindeki bilgiye dayanır.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-okuma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-20','coktan_secmeli','Kütüphane Kartı: Aradığı sayfayı bulmak için nereye baktı?','["Arka kapağın dışına","Masaya","Çantaya","İçindekiler bölümüne"]',3,'Zeynep sınıfıyla okul kütüphanesine gitti. Görevli öğretmen kitapların bölümlere göre düzenlendiğini anlattı. Zeynep hayvanlarla ilgili bir kitap seçti. Kitabın içindekiler bölümüne baktı ve ilgisini çeken sayfayı buldu. Kitabı ödünç aldı. Cevap metindeki bilgiye dayanır.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-okuma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-21','coktan_secmeli','Kütüphane Kartı: Zeynep kitabı ne yaptı?','["Yırttı","Ödünç aldı","Sakladı","Boyadı"]',1,'Zeynep sınıfıyla okul kütüphanesine gitti. Görevli öğretmen kitapların bölümlere göre düzenlendiğini anlattı. Zeynep hayvanlarla ilgili bir kitap seçti. Kitabın içindekiler bölümüne baktı ve ilgisini çeken sayfayı buldu. Kitabı ödünç aldı. Cevap metindeki bilgiye dayanır.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-okuma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-22','coktan_secmeli','Kütüphane Kartı: İçindekiler bölümünün görevi nedir?','["Kitabı ağırlaştırmak","Resimleri silmek","Kitabı kapatmak","Bölüm ve sayfaları bulmaya yardım etmek"]',3,'Zeynep sınıfıyla okul kütüphanesine gitti. Görevli öğretmen kitapların bölümlere göre düzenlendiğini anlattı. Zeynep hayvanlarla ilgili bir kitap seçti. Kitabın içindekiler bölümüne baktı ve ilgisini çeken sayfayı buldu. Kitabı ödünç aldı. Cevap metindeki bilgiye dayanır.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-okuma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-23','coktan_secmeli','Kütüphane Kartı: Metnin konusu nedir?','["Spor yarışı","Kütüphanede kitap seçme","Piknik","Yağmur"]',1,'Zeynep sınıfıyla okul kütüphanesine gitti. Görevli öğretmen kitapların bölümlere göre düzenlendiğini anlattı. Zeynep hayvanlarla ilgili bir kitap seçti. Kitabın içindekiler bölümüne baktı ve ilgisini çeken sayfayı buldu. Kitabı ödünç aldı. Cevap metindeki bilgiye dayanır.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-okuma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-24','coktan_secmeli','Kütüphane Kartı: En uygun başlık hangisidir?','["Yeni Bisiklet","Karlı Gün","Mavi Balon","Zeynep Kütüphanede"]',3,'Zeynep sınıfıyla okul kütüphanesine gitti. Görevli öğretmen kitapların bölümlere göre düzenlendiğini anlattı. Zeynep hayvanlarla ilgili bir kitap seçti. Kitabın içindekiler bölümüne baktı ve ilgisini çeken sayfayı buldu. Kitabı ödünç aldı. Cevap metindeki bilgiye dayanır.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-okuma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-25','coktan_secmeli','Resim Yarışması: Can ne yapmayı seviyordu?','["Koşmayı","Resim yapmayı","Yüzmeyi","Uyumayı"]',1,'Can resim yapmayı çok seviyordu. Okulda “Hayalimdeki Şehir” konulu bir çalışma yapılacağını duydu. Önce nasıl bir şehir çizeceğini düşündü. Sonra taslağını hazırladı ve renklerini seçti. Çalışmasını tamamlayınca arkadaşlarına anlattı. Cevap metindeki bilgiye dayanır.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yetenek' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-26','coktan_secmeli','Resim Yarışması: Çalışmanın konusu neydi?','["Hayalimdeki Yemek","Kayıp Top","Deniz Yolculuğu","Hayalimdeki Şehir"]',3,'Can resim yapmayı çok seviyordu. Okulda “Hayalimdeki Şehir” konulu bir çalışma yapılacağını duydu. Önce nasıl bir şehir çizeceğini düşündü. Sonra taslağını hazırladı ve renklerini seçti. Çalışmasını tamamlayınca arkadaşlarına anlattı. Cevap metindeki bilgiye dayanır.',1,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yetenek' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-27','coktan_secmeli','Resim Yarışması: Can ilk olarak ne yaptı?','["Resmi yırttı","Nasıl bir şehir çizeceğini düşündü","Eve gitti","Boyaları attı"]',1,'Can resim yapmayı çok seviyordu. Okulda “Hayalimdeki Şehir” konulu bir çalışma yapılacağını duydu. Önce nasıl bir şehir çizeceğini düşündü. Sonra taslağını hazırladı ve renklerini seçti. Çalışmasını tamamlayınca arkadaşlarına anlattı. Cevap metindeki bilgiye dayanır.',2,27,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yetenek' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-28','coktan_secmeli','Resim Yarışması: Taslak sonrası ne yaptı?','["Uyudu","Sınıftan çıktı","Kitabı kapattı","Renklerini seçti"]',3,'Can resim yapmayı çok seviyordu. Okulda “Hayalimdeki Şehir” konulu bir çalışma yapılacağını duydu. Önce nasıl bir şehir çizeceğini düşündü. Sonra taslağını hazırladı ve renklerini seçti. Çalışmasını tamamlayınca arkadaşlarına anlattı. Cevap metindeki bilgiye dayanır.',1,28,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yetenek' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-29','coktan_secmeli','Resim Yarışması: Çalışma bitince ne yaptı?','["Sakladı","Arkadaşlarına anlattı","Yırttı","Sildi"]',1,'Can resim yapmayı çok seviyordu. Okulda “Hayalimdeki Şehir” konulu bir çalışma yapılacağını duydu. Önce nasıl bir şehir çizeceğini düşündü. Sonra taslağını hazırladı ve renklerini seçti. Çalışmasını tamamlayınca arkadaşlarına anlattı. Cevap metindeki bilgiye dayanır.',1,29,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yetenek' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-30','coktan_secmeli','Resim Yarışması: Can''ın hangi yeteneği öne çıkıyor?','["Yemek pişirme","Tamir","Yüzme","Görsel sanat"]',3,'Can resim yapmayı çok seviyordu. Okulda “Hayalimdeki Şehir” konulu bir çalışma yapılacağını duydu. Önce nasıl bir şehir çizeceğini düşündü. Sonra taslağını hazırladı ve renklerini seçti. Çalışmasını tamamlayınca arkadaşlarına anlattı. Cevap metindeki bilgiye dayanır.',2,30,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yetenek' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-31','coktan_secmeli','Resim Yarışması: Metnin konusu nedir?','["Bir alışveriş","Can''ın resim çalışması","Bir trafik olayı","Bir sağlık sorunu"]',1,'Can resim yapmayı çok seviyordu. Okulda “Hayalimdeki Şehir” konulu bir çalışma yapılacağını duydu. Önce nasıl bir şehir çizeceğini düşündü. Sonra taslağını hazırladı ve renklerini seçti. Çalışmasını tamamlayınca arkadaşlarına anlattı. Cevap metindeki bilgiye dayanır.',1,31,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yetenek' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-32','coktan_secmeli','Resim Yarışması: En uygun başlık hangisidir?','["Kayıp Çanta","Uzun Yol","Karlı Tepe","Can''ın Hayalindeki Şehir"]',3,'Can resim yapmayı çok seviyordu. Okulda “Hayalimdeki Şehir” konulu bir çalışma yapılacağını duydu. Önce nasıl bir şehir çizeceğini düşündü. Sonra taslağını hazırladı ve renklerini seçti. Çalışmasını tamamlayınca arkadaşlarına anlattı. Cevap metindeki bilgiye dayanır.',1,32,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-yetenek' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-33','coktan_secmeli','Su Tasarrufu Fikri: Defne neyi fark etti?','["Elektrik kesildiğini","Gereksiz su aktığını","Kitabın kaybolduğunu","Topun patladığını"]',1,'Defne, musluktan gereksiz su aktığını fark etti. Suyu daha az kullanmak için bir fikir düşündü. Lavabonun yanına “Musluğu kapatmayı unutma!” yazılı küçük bir uyarı kartı hazırladı. Ailesi kartı görünce daha dikkatli olmaya başladı. Cevap metindeki bilgiye dayanır.',2,33,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-mucit' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-34','coktan_secmeli','Su Tasarrufu Fikri: Defne ne yapmak istedi?','["Daha çok su harcamak","Musluğu açık bırakmak","Kartı saklamak","Suyu daha az kullanmak"]',3,'Defne, musluktan gereksiz su aktığını fark etti. Suyu daha az kullanmak için bir fikir düşündü. Lavabonun yanına “Musluğu kapatmayı unutma!” yazılı küçük bir uyarı kartı hazırladı. Ailesi kartı görünce daha dikkatli olmaya başladı. Cevap metindeki bilgiye dayanır.',1,34,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-mucit' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-35','coktan_secmeli','Su Tasarrufu Fikri: Ne hazırladı?','["Oyuncak araba","Uyarı kartı","Yemek","Şapka"]',1,'Defne, musluktan gereksiz su aktığını fark etti. Suyu daha az kullanmak için bir fikir düşündü. Lavabonun yanına “Musluğu kapatmayı unutma!” yazılı küçük bir uyarı kartı hazırladı. Ailesi kartı görünce daha dikkatli olmaya başladı. Cevap metindeki bilgiye dayanır.',1,35,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-mucit' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-36','coktan_secmeli','Su Tasarrufu Fikri: Kartta ne yazıyordu?','["Kapıyı boya","Topu getir","Kitabı kapat","Musluğu kapatmayı unutma!"]',3,'Defne, musluktan gereksiz su aktığını fark etti. Suyu daha az kullanmak için bir fikir düşündü. Lavabonun yanına “Musluğu kapatmayı unutma!” yazılı küçük bir uyarı kartı hazırladı. Ailesi kartı görünce daha dikkatli olmaya başladı. Cevap metindeki bilgiye dayanır.',2,36,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-mucit' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-37','coktan_secmeli','Su Tasarrufu Fikri: Ailesi karttan sonra nasıl davrandı?','["Daha dikkatsiz","Daha dikkatli","Hiç su kullanmadı","Kartı yırttı"]',1,'Defne, musluktan gereksiz su aktığını fark etti. Suyu daha az kullanmak için bir fikir düşündü. Lavabonun yanına “Musluğu kapatmayı unutma!” yazılı küçük bir uyarı kartı hazırladı. Ailesi kartı görünce daha dikkatli olmaya başladı. Cevap metindeki bilgiye dayanır.',1,37,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-mucit' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-38','coktan_secmeli','Su Tasarrufu Fikri: Defne''nin fikri hangi soruna çözüm buluyor?','["Trafiğe","Kitap seçimine","Spora","Su israfına"]',3,'Defne, musluktan gereksiz su aktığını fark etti. Suyu daha az kullanmak için bir fikir düşündü. Lavabonun yanına “Musluğu kapatmayı unutma!” yazılı küçük bir uyarı kartı hazırladı. Ailesi kartı görünce daha dikkatli olmaya başladı. Cevap metindeki bilgiye dayanır.',1,38,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-mucit' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-39','coktan_secmeli','Su Tasarrufu Fikri: Metnin konusu nedir?','["Bir gezi","Su tasarrufu için fikir geliştirme","Bir yemek","Bir yarış"]',1,'Defne, musluktan gereksiz su aktığını fark etti. Suyu daha az kullanmak için bir fikir düşündü. Lavabonun yanına “Musluğu kapatmayı unutma!” yazılı küçük bir uyarı kartı hazırladı. Ailesi kartı görünce daha dikkatli olmaya başladı. Cevap metindeki bilgiye dayanır.',2,39,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-mucit' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-40','coktan_secmeli','Su Tasarrufu Fikri: En uygun başlık hangisidir?','["Kayıp Ayakkabı","Büyük Yarış","Mavi Deniz","Defne''nin Tasarruf Fikri"]',3,'Defne, musluktan gereksiz su aktığını fark etti. Suyu daha az kullanmak için bir fikir düşündü. Lavabonun yanına “Musluğu kapatmayı unutma!” yazılı küçük bir uyarı kartı hazırladı. Ailesi kartı görünce daha dikkatli olmaya başladı. Cevap metindeki bilgiye dayanır.',1,40,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-mucit' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-41','coktan_secmeli','Bayramda Komşuluk: Arda önce kimi ziyaret etti?','["Öğretmenini","Büyüklerini","Doktoru","Şoförü"]',1,'Bayram sabahı Arda ailesiyle büyüklerini ziyaret etti. Daha sonra komşuları kapılarını çaldı. Herkes birbirinin bayramını kutladı. Arda, komşularına hazırlanan ikramları götürmeye yardım etti. Büyükler eski bayram anılarını anlattı. Cevap metindeki bilgiye dayanır.',1,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kultur-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-42','coktan_secmeli','Bayramda Komşuluk: Sonra kimler geldi?','["Sınıf arkadaşları","Turistler","Sporcular","Komşuları"]',3,'Bayram sabahı Arda ailesiyle büyüklerini ziyaret etti. Daha sonra komşuları kapılarını çaldı. Herkes birbirinin bayramını kutladı. Arda, komşularına hazırlanan ikramları götürmeye yardım etti. Büyükler eski bayram anılarını anlattı. Cevap metindeki bilgiye dayanır.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kultur-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-43','coktan_secmeli','Bayramda Komşuluk: Herkes ne yaptı?','["Yarış yaptı","Bayramını kutladı","Uyudu","Kitap sattı"]',1,'Bayram sabahı Arda ailesiyle büyüklerini ziyaret etti. Daha sonra komşuları kapılarını çaldı. Herkes birbirinin bayramını kutladı. Arda, komşularına hazırlanan ikramları götürmeye yardım etti. Büyükler eski bayram anılarını anlattı. Cevap metindeki bilgiye dayanır.',1,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kultur-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-44','coktan_secmeli','Bayramda Komşuluk: Arda neye yardım etti?','["Duvar boyamaya","Bisiklet tamirine","Sınıfı taşımaya","İkramları götürmeye"]',3,'Bayram sabahı Arda ailesiyle büyüklerini ziyaret etti. Daha sonra komşuları kapılarını çaldı. Herkes birbirinin bayramını kutladı. Arda, komşularına hazırlanan ikramları götürmeye yardım etti. Büyükler eski bayram anılarını anlattı. Cevap metindeki bilgiye dayanır.',1,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kultur-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-45','coktan_secmeli','Bayramda Komşuluk: Büyükler ne anlattı?','["Matematik problemi","Eski bayram anılarını","Hava tahmini","Trafik kuralı"]',1,'Bayram sabahı Arda ailesiyle büyüklerini ziyaret etti. Daha sonra komşuları kapılarını çaldı. Herkes birbirinin bayramını kutladı. Arda, komşularına hazırlanan ikramları götürmeye yardım etti. Büyükler eski bayram anılarını anlattı. Cevap metindeki bilgiye dayanır.',2,45,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kultur-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-46','coktan_secmeli','Bayramda Komşuluk: Metinde hangi kültürel değer öne çıkıyor?','["Tek başına kalma","İsraf","Kuralsızlık","Bayramlaşma ve komşuluk"]',3,'Bayram sabahı Arda ailesiyle büyüklerini ziyaret etti. Daha sonra komşuları kapılarını çaldı. Herkes birbirinin bayramını kutladı. Arda, komşularına hazırlanan ikramları götürmeye yardım etti. Büyükler eski bayram anılarını anlattı. Cevap metindeki bilgiye dayanır.',1,46,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kultur-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-47','coktan_secmeli','Bayramda Komşuluk: Metnin konusu nedir?','["Bir spor maçı","Bayramda aile ve komşuluk","Kayıp eşya","Kış hazırlığı"]',1,'Bayram sabahı Arda ailesiyle büyüklerini ziyaret etti. Daha sonra komşuları kapılarını çaldı. Herkes birbirinin bayramını kutladı. Arda, komşularına hazırlanan ikramları götürmeye yardım etti. Büyükler eski bayram anılarını anlattı. Cevap metindeki bilgiye dayanır.',1,47,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kultur-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-48','coktan_secmeli','Bayramda Komşuluk: En uygun başlık hangisidir?','["Yağmurlu Okul","Yeni Kalem","Kırık Bisiklet","Bayramda Komşuluk"]',3,'Bayram sabahı Arda ailesiyle büyüklerini ziyaret etti. Daha sonra komşuları kapılarını çaldı. Herkes birbirinin bayramını kutladı. Arda, komşularına hazırlanan ikramları götürmeye yardım etti. Büyükler eski bayram anılarını anlattı. Cevap metindeki bilgiye dayanır.',2,48,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-kultur-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-49','coktan_secmeli','Oyun Hakkı: Sınıfta hangi konu konuşuldu?','["Yemek tarifi","Çocuk hakları","Hava durumu","Trafik işareti"]',1,'Sınıfta çocuk hakları üzerine konuşuldu. Öğretmen, her çocuğun eğitim alma, güvenli yaşama ve oyun oynama gibi hakları olduğunu anlattı. Ece, haklarımızı kullanırken başkalarının haklarına da saygı göstermemiz gerektiğini söyledi. Cevap metindeki bilgiye dayanır.',1,49,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-haklar-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-50','coktan_secmeli','Oyun Hakkı: Her çocuğun hangi hakkı vardır?','["Başkasının eşyasını alma","Kuralları bozma","İstediğini kırma","Eğitim alma"]',3,'Sınıfta çocuk hakları üzerine konuşuldu. Öğretmen, her çocuğun eğitim alma, güvenli yaşama ve oyun oynama gibi hakları olduğunu anlattı. Ece, haklarımızı kullanırken başkalarının haklarına da saygı göstermemiz gerektiğini söyledi. Cevap metindeki bilgiye dayanır.',1,50,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-haklar-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-51','coktan_secmeli','Oyun Hakkı: Metinde hangi haklardan biri söylenmiştir?','["Başkalarını itme","Oyun oynama","Bağırma","Sırayı bozma"]',1,'Sınıfta çocuk hakları üzerine konuşuldu. Öğretmen, her çocuğun eğitim alma, güvenli yaşama ve oyun oynama gibi hakları olduğunu anlattı. Ece, haklarımızı kullanırken başkalarının haklarına da saygı göstermemiz gerektiğini söyledi. Cevap metindeki bilgiye dayanır.',2,51,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-haklar-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-52','coktan_secmeli','Oyun Hakkı: Ece ne söyledi?','["Sadece kendi hakkımız önemlidir","Kurallar gereksizdir","Kimseyi dinlememeliyiz","Başkalarının haklarına saygı göstermeliyiz"]',3,'Sınıfta çocuk hakları üzerine konuşuldu. Öğretmen, her çocuğun eğitim alma, güvenli yaşama ve oyun oynama gibi hakları olduğunu anlattı. Ece, haklarımızı kullanırken başkalarının haklarına da saygı göstermemiz gerektiğini söyledi. Cevap metindeki bilgiye dayanır.',1,52,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-haklar-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-53','coktan_secmeli','Oyun Hakkı: Güvenli yaşamak metinde ne olarak anlatılmıştır?','["Bir oyuncak","Bir hak","Bir ceza","Bir ders aracı"]',1,'Sınıfta çocuk hakları üzerine konuşuldu. Öğretmen, her çocuğun eğitim alma, güvenli yaşama ve oyun oynama gibi hakları olduğunu anlattı. Ece, haklarımızı kullanırken başkalarının haklarına da saygı göstermemiz gerektiğini söyledi. Cevap metindeki bilgiye dayanır.',1,53,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-haklar-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-54','coktan_secmeli','Oyun Hakkı: Haklarımızı kullanırken neye dikkat etmeliyiz?','["Sadece kendi isteğimize","Eşyaların rengine","Hava durumuna","Başkalarının haklarına"]',3,'Sınıfta çocuk hakları üzerine konuşuldu. Öğretmen, her çocuğun eğitim alma, güvenli yaşama ve oyun oynama gibi hakları olduğunu anlattı. Ece, haklarımızı kullanırken başkalarının haklarına da saygı göstermemiz gerektiğini söyledi. Cevap metindeki bilgiye dayanır.',2,54,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-haklar-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-55','coktan_secmeli','Oyun Hakkı: Metnin konusu nedir?','["Bir gezi","Çocuk hakları ve saygı","Bir yemek","Bir oyun kuralı"]',1,'Sınıfta çocuk hakları üzerine konuşuldu. Öğretmen, her çocuğun eğitim alma, güvenli yaşama ve oyun oynama gibi hakları olduğunu anlattı. Ece, haklarımızı kullanırken başkalarının haklarına da saygı göstermemiz gerektiğini söyledi. Cevap metindeki bilgiye dayanır.',1,55,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-haklar-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-56','coktan_secmeli','Oyun Hakkı: En uygun başlık hangisidir?','["Kayıp Top","Yaz Tatili","Bahçedeki Ağaç","Haklarımızı Biliyoruz"]',3,'Sınıfta çocuk hakları üzerine konuşuldu. Öğretmen, her çocuğun eğitim alma, güvenli yaşama ve oyun oynama gibi hakları olduğunu anlattı. Ece, haklarımızı kullanırken başkalarının haklarına da saygı göstermemiz gerektiğini söyledi. Cevap metindeki bilgiye dayanır.',1,56,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-haklar-metin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-57','coktan_secmeli','Kayıp Defter: Mina neyi bulamadı?','["Kalemini","Defterini","Çantasını","Kitabını"]',1,'Mina teneffüste defterini bulamadı. Önce sırasının altına baktı, sonra çantasını kontrol etti. Defteri göremeyince öğretmenine söyledi. Öğretmeni sınıfta birlikte aramayı önerdi. Defter, kitaplığın yanında bulundu. Cevap metindeki bilgiye dayanır.',2,57,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-metin-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-58','coktan_secmeli','Kayıp Defter: İlk nereye baktı?','["Bahçeye","Kantine","Eve","Sırasının altına"]',3,'Mina teneffüste defterini bulamadı. Önce sırasının altına baktı, sonra çantasını kontrol etti. Defteri göremeyince öğretmenine söyledi. Öğretmeni sınıfta birlikte aramayı önerdi. Defter, kitaplığın yanında bulundu. Cevap metindeki bilgiye dayanır.',1,58,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-metin-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-59','coktan_secmeli','Kayıp Defter: Sonra neyi kontrol etti?','["Pencereyi","Çantasını","Kapıyı","Tahtayı"]',1,'Mina teneffüste defterini bulamadı. Önce sırasının altına baktı, sonra çantasını kontrol etti. Defteri göremeyince öğretmenine söyledi. Öğretmeni sınıfta birlikte aramayı önerdi. Defter, kitaplığın yanında bulundu. Cevap metindeki bilgiye dayanır.',1,59,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-metin-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-60','coktan_secmeli','Kayıp Defter: Defteri bulamayınca kime söyledi?','["Şoföre","Komşuya","Doktora","Öğretmenine"]',3,'Mina teneffüste defterini bulamadı. Önce sırasının altına baktı, sonra çantasını kontrol etti. Defteri göremeyince öğretmenine söyledi. Öğretmeni sınıfta birlikte aramayı önerdi. Defter, kitaplığın yanında bulundu. Cevap metindeki bilgiye dayanır.',2,60,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-metin-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-61','coktan_secmeli','Kayıp Defter: Öğretmen ne önerdi?','["Eve gitmeyi","Birlikte aramayı","Yeni defter almayı","Dersi bitirmeyi"]',1,'Mina teneffüste defterini bulamadı. Önce sırasının altına baktı, sonra çantasını kontrol etti. Defteri göremeyince öğretmenine söyledi. Öğretmeni sınıfta birlikte aramayı önerdi. Defter, kitaplığın yanında bulundu. Cevap metindeki bilgiye dayanır.',1,61,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-metin-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-62','coktan_secmeli','Kayıp Defter: Defter nerede bulundu?','["Bahçede","Evde","Kantinde","Kitaplığın yanında"]',3,'Mina teneffüste defterini bulamadı. Önce sırasının altına baktı, sonra çantasını kontrol etti. Defteri göremeyince öğretmenine söyledi. Öğretmeni sınıfta birlikte aramayı önerdi. Defter, kitaplığın yanında bulundu. Cevap metindeki bilgiye dayanır.',1,62,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-metin-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-63','coktan_secmeli','Kayıp Defter: Mina problemi çözerken nasıl davrandı?','["Sınıftan kaçtı","Sırayla aradı ve yardım istedi","Bağırdı","Defteri unuttu"]',1,'Mina teneffüste defterini bulamadı. Önce sırasının altına baktı, sonra çantasını kontrol etti. Defteri göremeyince öğretmenine söyledi. Öğretmeni sınıfta birlikte aramayı önerdi. Defter, kitaplığın yanında bulundu. Cevap metindeki bilgiye dayanır.',2,63,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-metin-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-metin-64','coktan_secmeli','Kayıp Defter: Metnin konusu nedir?','["Bir gezi","Bir yemek","Bir yarış","Kayıp defteri bulma süreci"]',3,'Mina teneffüste defterini bulamadı. Önce sırasının altına baktı, sonra çantasını kontrol etti. Defteri göremeyince öğretmenine söyledi. Öğretmeni sınıfta birlikte aramayı önerdi. Defter, kitaplığın yanında bulundu. Cevap metindeki bilgiye dayanır.',1,64,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-metin-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-konu-1','coktan_secmeli','“Elif her gün kedisinin suyunu yeniliyor ve mama kabını dolduruyor.” metninin konusu nedir?','["Okul gezisi","Kedi bakımı","Trafik","Yağmur"]',1,'Metnin ana odağı “Kedi bakımı”dir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-konu-baslik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-konu-2','coktan_secmeli','“Çocuklar fidan dikti, toprağı suladı ve çevresini temizledi.” konusu nedir?','["Müzik","Alışveriş","Spor","Çevreyi koruma"]',3,'Metnin ana odağı “Çevreyi koruma”dir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-konu-baslik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-konu-3','coktan_secmeli','“Mert kütüphaneden kitap seçti ve sessizce okudu.” en uygun başlık hangisidir?','["Yeni Top","Mert Kütüphanede","Karlı Gün","Mutfak"]',1,'Metnin ana odağı “Mert Kütüphanede”dir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-konu-baslik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-konu-4','coktan_secmeli','“Aylin her sabah dişlerini fırçalar ve ellerini yıkar.” konusu nedir?','["Ulaşım","Sanat","Oyun","Kişisel temizlik"]',3,'Metnin ana odağı “Kişisel temizlik”dir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-konu-baslik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-konu-5','coktan_secmeli','“Can bisiklete binmeden önce kaskını taktı.” en uygun başlık hangisidir?','["Kırmızı Elma","Güvenli Bisiklet","Sessiz Kitap","Yaz Yağmuru"]',1,'Metnin ana odağı “Güvenli Bisiklet”dir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-konu-baslik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-konu-6','coktan_secmeli','“Sınıfça farklı ülkelerin çocuk oyunlarını araştırdılar.” konusu nedir?','["Yemek tarifi","Hastalık","Para","Çocuk oyunları ve kültür"]',3,'Metnin ana odağı “Çocuk oyunları ve kültür”dir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-konu-baslik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-konu-7','coktan_secmeli','“Ece küçük bir robot tasarlayıp görevlerini anlattı.” en uygun başlık?','["Kayıp Defter","Ece''nin Robotu","Bahçe","Deniz"]',1,'Metnin ana odağı “Ece''nin Robotu”dir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-konu-baslik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-konu-8','coktan_secmeli','“Su gereksiz akmasın diye musluk kapatıldı.” konusu nedir?','["Müzik","Koşu","Resim","Su tasarrufu"]',3,'Metnin ana odağı “Su tasarrufu”dir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-konu-baslik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-konu-9','coktan_secmeli','“23 Nisan''da çocuklar şiir okudu ve bayraklarla törene katıldı.” konusu nedir?','["Alışveriş","23 Nisan kutlaması","Uyku","Kış"]',1,'Metnin ana odağı “23 Nisan kutlaması”dir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-konu-baslik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-konu-10','coktan_secmeli','“Duru arkadaşının fikrini dikkatle dinledi.” konusu nedir?','["Yemek","Trafik","Hava","Saygılı iletişim"]',3,'Metnin ana odağı “Saygılı iletişim”dir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-konu-baslik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-konu-11','coktan_secmeli','“Arılar çiçekten çiçeğe konarak nektar topladı.” en uygun başlık?','["Kayıp Kalem","Çalışkan Arılar","Kışlık Mont","Yeni Masa"]',1,'Metnin ana odağı “Çalışkan Arılar”dir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-konu-baslik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-konu-12','coktan_secmeli','“Bir kitapta bilinmeyen kelimeler sözlükten araştırıldı.” konusu nedir?','["Spor","Sağlık","Ulaşım","Kelime anlamı araştırma"]',3,'Metnin ana odağı “Kelime anlamı araştırma”dir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-konu-baslik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-konu-13','coktan_secmeli','“Çocuklar çöpleri kâğıt, cam ve plastik olarak ayırdı.” en uygun başlık?','["Sınıf Oyunu","Geri Dönüşüm","Uyku Saati","Doğum Günü"]',1,'Metnin ana odağı “Geri Dönüşüm”dir.',2,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-konu-baslik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-konu-14','coktan_secmeli','“Ali oyunda herkesin sırayla oynamasını önerdi.” konusu nedir?','["Hava durumu","Yemek","Sanat","Adalet ve sıra"]',3,'Metnin ana odağı “Adalet ve sıra”dir.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-konu-baslik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-konu-15','coktan_secmeli','“Pelin eski bir halk oyununu büyükannesinden öğrendi.” konusu nedir?','["Teknoloji","Kültürel miras","Trafik","Matematik"]',1,'Metnin ana odağı “Kültürel miras”dir.',2,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-konu-baslik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-konu-16','coktan_secmeli','“Mucit, kırılan kalemleri değerlendiren bir kutu tasarladı.” en uygun başlık?','["Kış Tatili","Uzun Yol","Bahçedeki Kedi","Yeniden Kullanım Fikri"]',3,'Metnin ana odağı “Yeniden Kullanım Fikri”dir.',2,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-konu-baslik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-konu-17','coktan_secmeli','“Sınıfta herkes düşüncesini sırayla anlattı.” konusu nedir?','["Alışveriş","Söz hakkı","Uyku","Yarış"]',1,'Metnin ana odağı “Söz hakkı”dir.',2,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-konu-baslik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-konu-18','coktan_secmeli','“Eylül kitabın kapağına ve başlığına bakıp konusunu tahmin etti.” konusu nedir?','["Spor","Yemek","Sağlık","Okuma öncesi tahmin"]',3,'Metnin ana odağı “Okuma öncesi tahmin”dir.',2,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-konu-baslik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cikarim-1','coktan_secmeli','Mert montunu, atkısını ve eldivenini giydi. Hava nasıl olabilir?','["Çok sıcak","Her zaman yağmurlu","Kesinlikle yaz","Soğuk"]',3,'Verilen ipuçları “Soğuk” sonucunu destekler.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cikarim-2','coktan_secmeli','Duru şemsiyesini açtı. Ne olmuş olabilir?','["Kesin kar yağıyor","Yağmur yağıyor olabilir","Güneş hiç yok","Kitap okuyor"]',1,'Verilen ipuçları “Yağmur yağıyor olabilir” sonucunu destekler.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cikarim-3','coktan_secmeli','Ece kütüphanede fısıltıyla konuştu. Neden?','["Koşmak istediği için","Kitabı yırtmak için","Uyumak için","Sessiz olması gerektiği için"]',3,'Verilen ipuçları “Sessiz olması gerektiği için” sonucunu destekler.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cikarim-4','coktan_secmeli','Can suladığı tohumun filiz verdiğini gördü. Ne çıkarabiliriz?','["Tohum kaybolmuş","Tohum gelişmeye başlamış","Toprak donmuş","Saksı boş"]',1,'Verilen ipuçları “Tohum gelişmeye başlamış” sonucunu destekler.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cikarim-5','coktan_secmeli','Sınıftaki ışıklar gereksiz yere kapatıldı. Amaç ne olabilir?','["Daha çok elektrik harcamak","Sınıfı terk etmek","Oyuncak saklamak","Elektrik tasarrufu"]',3,'Verilen ipuçları “Elektrik tasarrufu” sonucunu destekler.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cikarim-6','coktan_secmeli','Ali arkadaşının düşen kitaplarını topladı. Ali nasıl davranmıştır?','["Duyarsız","Yardımsever","Kırıcı","Hileci"]',1,'Verilen ipuçları “Yardımsever” sonucunu destekler.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cikarim-7','coktan_secmeli','Ece sıradaki arkadaşının önüne geçmedi. Hangi değere uygundur?','["İsraf","Dikkatsizlik","Kabalık","Adalet"]',3,'Verilen ipuçları “Adalet” sonucunu destekler.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cikarim-8','coktan_secmeli','Mert deney sonucunu değiştirmeden yazdı. Hangi davranış?','["Hile","Dürüstlük","İsraf","Sabırsızlık"]',1,'Verilen ipuçları “Dürüstlük” sonucunu destekler.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cikarim-9','coktan_secmeli','Pelin kitabı zamanında kütüphaneye geri verdi. Ne gösterir?','["Kuralsızlık","Unutkanlık","İsraf","Sorumluluk"]',3,'Verilen ipuçları “Sorumluluk” sonucunu destekler.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cikarim-10','coktan_secmeli','Çocuklar farklı fikirlere rağmen birbirini dinledi. Ne gösterir?','["Kavga","Saygı","İsraf","Korku"]',1,'Verilen ipuçları “Saygı” sonucunu destekler.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cikarim-11','coktan_secmeli','Ağaçların yaprakları sararıp dökülüyor. Hangi mevsim olabilir?','["Yaz","İlkbahar","Her zaman kış","Sonbahar"]',3,'Verilen ipuçları “Sonbahar” sonucunu destekler.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cikarim-12','coktan_secmeli','Gökyüzünde koyu bulutlar ve şimşek var. Ne beklenebilir?','["Kesin karne günü","Fırtına veya yağmur","Sınıf gezisi","Yeni kitap"]',1,'Verilen ipuçları “Fırtına veya yağmur” sonucunu destekler.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cikarim-13','coktan_secmeli','Mina bir sorunun cevabını sözlükten kontrol etti. Ne yapmıştır?','["Tahminini gizleme","Kitabı kapatma","Oyunu bozma","Bilgi doğrulama"]',3,'Verilen ipuçları “Bilgi doğrulama” sonucunu destekler.',2,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cikarim-14','coktan_secmeli','Arda iki çözüm yolunu karşılaştırdı. Amaç ne olabilir?','["Soruyu unutmak","Daha uygun yolu seçmek","Cevabı silmek","Kitabı yırtmak"]',1,'Verilen ipuçları “Daha uygun yolu seçmek” sonucunu destekler.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cikarim-15','coktan_secmeli','Bir çocuk herkesin oyuna katılmasını istedi. Hangi düşünce öne çıkar?','["Dışlama","Hile","İsraf","Eşitlik ve katılım"]',3,'Verilen ipuçları “Eşitlik ve katılım” sonucunu destekler.',2,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr2-cikarim-16','coktan_secmeli','Defne geri dönüşüm kutularını etiketledi. Neden?','["Kutuları saklamak için","Atıkları doğru ayırmak için","Daha çok çöp üretmek için","Oyunu bitirmek için"]',1,'Verilen ipuçları “Atıkları doğru ayırmak için” sonucunu destekler.',2,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='tr2-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;
