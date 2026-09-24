SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'tr3-baglam','Bağlamdan Kelime Anlamı','Bağlamdan Kelime Anlamı','Bir kelimenin anlamını cümledeki ipuçlarından çıkarır.','Cümlenin bütününe bakarak bilinmeyen sözcüğün anlamını tahmin ederiz.',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='tr3-degerler'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'tr3-nezaket','İletişim, Nezaket ve Değerler','İletişim, Nezaket ve Değerler','Konuşma ve dinleme sırasında saygılı iletişim kurar.','Söz kesmeden dinlemek ve uygun ifadeler kullanmak.',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='tr3-degerler'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'tr3-yazim','Yazım ve Noktalama','Yazım ve Noktalama','Büyük harf, kesme, nokta, virgül, soru ve ünlem gibi temel kuralları uygular.','Ankara''ya yarın gideceğiz.',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='tr3-degerler'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'tr3-ataturk','Atatürk ve Kahramanlarımız Metinleri','Atatürk ve Kahramanlarımız Metinleri','Millî temalı metinlerde kişi, olay, ana fikir ve çıkarımı belirler.','Metindeki açık bilgi ile çıkarımı birbirinden ayırır.',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='tr3-ataturk'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'tr3-olay','Olay Sırası ve Zaman','Olay Sırası ve Zaman','Olayları oluş sırasına göre düzenler, önce-sonra ilişkisini kurar.','Önce hazırlık, sonra uygulama, en son sonuç.',300,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='tr3-doga'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'tr3-neden-sonuc','Neden ve Sonuç','Neden ve Sonuç','Metindeki sebep-sonuç ilişkilerini belirler.','Yağmur yağdığı için şemsiyesini açtı.',310,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='tr3-doga'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'tr3-tahmin','Tahmin ve Çıkarım','Tahmin ve Çıkarım','Metindeki ipuçlarından olayın devamını veya sonucu hakkında çıkarım yapar.','Koyu bulutlar yağmur ihtimalini düşündürür.',320,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='tr3-doga'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'tr3-ana-fikir','Konu, Ana Fikir ve Başlık','Konu, Ana Fikir ve Başlık','Metnin konusunu ve ana fikrini belirler, uygun başlık seçer.','Konu ne anlatıldığını, ana fikir temel mesajı açıklar.',400,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='tr3-bilgi'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'tr3-ozet','Özetleme','Özetleme','Metindeki önemli bilgileri ayırarak kısa ve anlamlı özet oluşturur.','Özet ayrıntıların tümünü değil ana bilgileri içerir.',410,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='tr3-bilgi'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'tr3-kaynak','Bilgi Kaynaklarını Kullanıyorum','Bilgi Kaynaklarını Kullanıyorum','Sözlük, ansiklopedi, içindekiler, dizin ve güvenilir dijital kaynakların görevini ayırt eder.','Bilinmeyen sözcük için sözlükten yararlanılabilir.',420,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='tr3-bilgi'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'tr3-cumle','Cümle ve Paragraf Yapısı','Cümle ve Paragraf Yapısı','Anlamlı cümle kurar, cümleleri mantıklı paragraf sırasına getirir.','Cümleler aynı konu çevresinde anlamlı bir bütün oluşturur.',500,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='tr3-yetenek'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'tr3-karsilastirma','Karşılaştırma ve Benzerlik','Karşılaştırma ve Benzerlik','İki varlık, durum veya düşüncenin benzer ve farklı yönlerini belirler.','Kedi ve kuş canlıdır ancak hareket biçimleri farklıdır.',510,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='tr3-yetenek'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'tr3-yonerge','Yönergeleri İzliyorum','Yönergeleri İzliyorum','Çok adımlı basit yönergeleri doğru sırayla uygular ve yorumlar.','Önce oku, sonra uygula, en son kontrol et.',600,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='tr3-bilim'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'tr3-bilgi-cikarim','Bilgiden Sonuç Çıkarıyorum','Bilgiden Sonuç Çıkarıyorum','Birden fazla bilgiyi birleştirerek mantıklı sonuç çıkarır.','Gözlem verilerinden desteklenen sonuca ulaşır.',610,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='tr3-bilim'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'tr3-kultur','Millî Kültürümüz Metinleri','Millî Kültürümüz Metinleri','Kültürel miras, gelenek ve ortak değerleri anlatan metinleri çözümler.','Gelenek, sanat ve yerel değerleri metinden ayırt eder.',700,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='tr3-kultur'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'tr3-sozcuk-iliski','Sözcükler Arası İlişkiler','Sözcükler Arası İlişkiler','Zıt, yakın anlam ve aynı kavram alanındaki sözcükleri ilişkilendirir.','Cesur-korkak zıt anlamlıdır.',710,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='tr3-kultur'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'tr3-haklar','Hak ve Sorumluluk Metinleri','Hak ve Sorumluluk Metinleri','Hak, özgürlük, sorumluluk ve adalet temalı metinleri anlar.','Haklarımızı kullanırken başkalarının haklarına saygı gösteririz.',800,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='tr3-haklar'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'tr3-derin-anlama','Metni Derinlemesine Anlıyorum','Metni Derinlemesine Anlıyorum','Karakter, olay, yer, zaman, ana fikir, neden-sonuç ve çıkarımı birlikte kullanır.','Metnin farklı ayrıntılarını birleştirerek cevap verir.',810,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='tr3-haklar'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-1','coktan_secmeli','“Ece, bitkinin gelişimini her gün gözlemledi.” cümlesinde “gözlemledi” ne demektir?','["suladı","dikkatle inceledi","kesti","sakladı"]',1,'Cümlenin anlamına göre doğru karşılık “dikkatle inceledi”dir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-2','coktan_secmeli','“Mert, düşüncesini kanıtlarla destekledi.” cümlesinde “kanıt” neyi anlatır?','["rastgele tahmin","oyun kuralı","renk seçimi","bir düşünceyi doğrulamaya yarayan bilgi"]',3,'Cümlenin anlamına göre doğru karşılık “bir düşünceyi doğrulamaya yarayan bilgi”dir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-3','coktan_secmeli','“Çocuklar ortak bir çözüm üretmek için iş birliği yaptı.” “iş birliği” ne demektir?','["tek başına kalmak","birlikte çalışmak","yarışmayı bırakmak","eşyayı saklamak"]',1,'Cümlenin anlamına göre doğru karşılık “birlikte çalışmak”dir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-4','coktan_secmeli','“Defne, sonuçları karşılaştırarak farklılıkları belirledi.” “belirledi” ne demektir?','["unuttu","sildi","boyadı","tespit etti"]',3,'Cümlenin anlamına göre doğru karşılık “tespit etti”dir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-5','coktan_secmeli','“Bilim insanı merak ettiği sorunun peşine düştü.” “merak” neyi anlatır?','["uyku","öğrenme isteği","korku","öfke"]',1,'Cümlenin anlamına göre doğru karşılık “öğrenme isteği”dir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-6','coktan_secmeli','“Köydeki tarihî yapı özenle korundu.” “özenle” ne demektir?','["aceleyle","rastgele","isteksizce","dikkat ve önem göstererek"]',3,'Cümlenin anlamına göre doğru karşılık “dikkat ve önem göstererek”dir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-7','coktan_secmeli','“Mina, iki görüşü değerlendirip karar verdi.” “değerlendirmek” ne demektir?','["ezberlemek","üzerinde düşünüp incelemek","saklamak","silmek"]',1,'Cümlenin anlamına göre doğru karşılık “üzerinde düşünüp incelemek”dir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-8','coktan_secmeli','“Çocuklar çevre sorununa yaratıcı bir çözüm tasarladı.” “yaratıcı” neyi anlatır?','["aynısını tekrarlayan","dikkatsiz","sessiz","yeni ve özgün fikir üreten"]',3,'Cümlenin anlamına göre doğru karşılık “yeni ve özgün fikir üreten”dir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-9','coktan_secmeli','“Arda, arkadaşının önerisini dikkate aldı.” “dikkate almak” ne demektir?','["duymamak","önemseyip değerlendirmek","reddetmek","unutmak"]',1,'Cümlenin anlamına göre doğru karşılık “önemseyip değerlendirmek”dir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-10','coktan_secmeli','“Yağışlar azalınca göldeki su seviyesi düştü.” “seviye” neyi anlatır?','["renk","ses","koku","yükseklik veya miktar düzeyi"]',3,'Cümlenin anlamına göre doğru karşılık “yükseklik veya miktar düzeyi”dir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-11','coktan_secmeli','“Öğrenciler bilgileri sınıflandırdı.” “sınıflandırmak” ne demektir?','["karıştırmak","benzer özelliklerine göre gruplamak","saklamak","dağıtmak"]',1,'Cümlenin anlamına göre doğru karşılık “benzer özelliklerine göre gruplamak”dir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-12','coktan_secmeli','“Eski fotoğraflar geçmişe ışık tutuyor.” bu ifade ne anlatır?','["gerçekten ışık yakıyor","fotoğraflar yanıyor","gece oluyor","geçmiş hakkında bilgi veriyor"]',3,'Cümlenin anlamına göre doğru karşılık “geçmiş hakkında bilgi veriyor”dir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-13','coktan_secmeli','“Mert, arkadaşının sözünü dikkatle dinledi.” “dikkatle” ne demektir?','["gürültüyle","özen göstererek","aceleyle","rastgele"]',1,'Cümlenin anlamına göre doğru karşılık “özen göstererek”dir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-14','coktan_secmeli','“Bu yöntem işi kolaylaştırdı.” “yöntem” ne demektir?','["sonuç","araç adı","renk","izlenen yol"]',3,'Cümlenin anlamına göre doğru karşılık “izlenen yol”dir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-15','coktan_secmeli','“Çevreyi korumak hepimizin ortak sorumluluğudur.” “ortak” ne demektir?','["gizli","birlikte paylaşılan","tek kişiye ait","geçici"]',1,'Cümlenin anlamına göre doğru karşılık “birlikte paylaşılan”dir.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-16','coktan_secmeli','“Araştırmacı güvenilir kaynaklara başvurdu.” “başvurmak” burada ne demektir?','["kapıyı çalmak","yolculuk yapmak","oynamak","yararlanmak"]',3,'Cümlenin anlamına göre doğru karşılık “yararlanmak”dir.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-17','coktan_secmeli','“Ece, yazısını gözden geçirip hatalarını düzeltti.” “gözden geçirmek” ne demektir?','["silmek","yeniden kontrol etmek","saklamak","ezberlemek"]',1,'Cümlenin anlamına göre doğru karşılık “yeniden kontrol etmek”dir.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-18','coktan_secmeli','“Kuşların göçü mevsimsel bir olaydır.” “mevsimsel” ne demektir?','["günlük","saatlik","rastgele","mevsimlerle ilgili"]',3,'Cümlenin anlamına göre doğru karşılık “mevsimlerle ilgili”dir.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-19','coktan_secmeli','“Müzedeki eserler kültürel mirasımızın parçasıdır.” “miras” neyi anlatır?','["oyuncak","geçmişten bize kalan değer","alışveriş","hava durumu"]',1,'Cümlenin anlamına göre doğru karşılık “geçmişten bize kalan değer”dir.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-20','coktan_secmeli','“Ali çözümünü arkadaşına açıkladı.” “açıkladı” ne demektir?','["gizledi","unuttu","sildi","anlaşılır biçimde anlattı"]',3,'Cümlenin anlamına göre doğru karşılık “anlaşılır biçimde anlattı”dir.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-21','coktan_secmeli','“Bitkinin yaprakları solgun görünüyordu.” “solgun” neye yakındır?','["çok parlak","canlılığını yitirmiş gibi","çok hızlı","çok sesli"]',1,'Cümlenin anlamına göre doğru karşılık “canlılığını yitirmiş gibi”dir.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-22','coktan_secmeli','“Toplantıda herkes sırayla görüşünü belirtti.” “görüş” ne demektir?','["göz","görüntü","renk","düşünce"]',3,'Cümlenin anlamına göre doğru karşılık “düşünce”dir.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-23','coktan_secmeli','“Çalışmanın sonucunu tabloyla sundu.” “sunmak” burada ne demektir?','["saklamak","göstermek ve anlatmak","silmek","yırtmak"]',1,'Cümlenin anlamına göre doğru karşılık “göstermek ve anlatmak”dir.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-24','coktan_secmeli','“Öğrenciler kurala uygun davrandı.” “uygun” ne demektir?','["tehlikeli","rastgele","yasak","doğru ve yerinde"]',3,'Cümlenin anlamına göre doğru karşılık “doğru ve yerinde”dir.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-25','coktan_secmeli','“Kısa süre sonra yağmur dindi.” “dindi” ne demektir?','["arttı","azalıp sona erdi","başladı","dondu"]',1,'Cümlenin anlamına göre doğru karşılık “azalıp sona erdi”dir.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-26','coktan_secmeli','“Bu bilgi metnin ana düşüncesini destekliyor.” “desteklemek” ne demektir?','["bozmak","saklamak","azaltmak","güçlendirmek"]',3,'Cümlenin anlamına göre doğru karşılık “güçlendirmek”dir.',2,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-27','coktan_secmeli','“Çocuklar farklı seçenekleri tartıştı.” “tartışmak” burada ne demektir?','["kavga etmek","fikirleri konuşup değerlendirmek","koşmak","susmak"]',1,'Cümlenin anlamına göre doğru karşılık “fikirleri konuşup değerlendirmek”dir.',2,27,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-28','coktan_secmeli','“Mert görevini zamanında tamamladı.” “tamamlamak” ne demektir?','["başlamak","erteleme","unutmak","bitirmek"]',3,'Cümlenin anlamına göre doğru karşılık “bitirmek”dir.',2,28,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-29','coktan_secmeli','“Yeni bilgiler eski bilgilerle ilişkilendirildi.” “ilişkilendirmek” ne demektir?','["ayırmak","bağlantı kurmak","silmek","saklamak"]',1,'Cümlenin anlamına göre doğru karşılık “bağlantı kurmak”dir.',2,29,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-baglam-30','coktan_secmeli','“Sınıfça alınan karar herkes için geçerliydi.” “geçerli” ne demektir?','["unutulmuş","yasak","gizli","uygulanması gereken"]',3,'Cümlenin anlamına göre doğru karşılık “uygulanması gereken”dir.',2,30,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-nezaket-1','coktan_secmeli','Arkadaşın konuşurken ne yapman en uygundur?','["Araya girmek","Daha yüksek sesle konuşmak","Arkanı dönmek","Sözünü bitirmesini dinlemek"]',3,'Uygun iletişim davranışı “Sözünü bitirmesini dinlemek” seçeneğidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-nezaket-2','coktan_secmeli','Bir grup çalışmasında farklı fikirler olduğunda ne yapılmalıdır?','["Sadece en yüksek sesli kişi seçilmelidir.","Fikirler saygıyla değerlendirilmelidir.","Diğerleri susturulmalıdır.","Çalışma bırakılmalıdır."]',1,'Uygun iletişim davranışı “Fikirler saygıyla değerlendirilmelidir.” seçeneğidir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-nezaket-3','coktan_secmeli','Birinden yardım isterken hangi ifade uygundur?','["Hemen yap!","Bunu sen yapacaksın.","Çekil.","Yardım eder misin, lütfen?"]',3,'Uygun iletişim davranışı “Yardım eder misin, lütfen?” seçeneğidir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-nezaket-4','coktan_secmeli','Bir hata yaptığında nasıl davranmalısın?','["Başkasını suçlamalısın.","Hatanı kabul edip düzeltmeye çalışmalısın.","Saklamalısın.","Aynı hatayı bilerek sürdürmelisin."]',1,'Uygun iletişim davranışı “Hatanı kabul edip düzeltmeye çalışmalısın.” seçeneğidir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-nezaket-5','coktan_secmeli','Arkadaşının başarısını nasıl karşılayabilirsin?','["Küçümseyerek","Alay ederek","Görmezden gelerek","Tebrik ederek"]',3,'Uygun iletişim davranışı “Tebrik ederek” seçeneğidir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-nezaket-6','coktan_secmeli','Bir karar seni etkileyecekse düşünceni nasıl söylemelisin?','["Bağırarak","Saygılı ve açık biçimde","Hakaret ederek","Kimseyi dinlemeden"]',1,'Uygun iletişim davranışı “Saygılı ve açık biçimde” seçeneğidir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-nezaket-7','coktan_secmeli','Bir arkadaşın üzgün olduğunda ne yapabilirsin?','["Alay edebilirsin.","Eşyasını alabilirsin.","Onu zorlayabilirsin.","Nasıl olduğunu sorup dinleyebilirsin."]',3,'Uygun iletişim davranışı “Nasıl olduğunu sorup dinleyebilirsin.” seçeneğidir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-nezaket-8','coktan_secmeli','Tartışmada amaç ne olmalıdır?','["Karşıdakini susturmak","Fikirleri anlayıp çözüm bulmak","Kavga etmek","En çok bağırmak"]',1,'Uygun iletişim davranışı “Fikirleri anlayıp çözüm bulmak” seçeneğidir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-nezaket-9','coktan_secmeli','Birinin özel eşyasını kullanmadan önce ne yapmalısın?','["Gizlice almalısın.","Saklamalısın.","Kırmalısın.","İzin istemelisin."]',3,'Uygun iletişim davranışı “İzin istemelisin.” seçeneğidir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-nezaket-10','coktan_secmeli','Sınıfta ortak kullanılan malzemeye nasıl davranmalısın?','["Zarar vermelisin.","Özenli kullanmalısın.","Eve götürmelisin.","Saklamalısın."]',1,'Uygun iletişim davranışı “Özenli kullanmalısın.” seçeneğidir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-nezaket-11','coktan_secmeli','Bir arkadaşın senden farklı düşünüyorsa ne yapmalısın?','["Onu dışlamalısın.","Konuşmasını engellemelisin.","Alay etmelisin.","Farklı görüşe saygı göstermelisin."]',3,'Uygun iletişim davranışı “Farklı görüşe saygı göstermelisin.” seçeneğidir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-nezaket-12','coktan_secmeli','Bir yetişkin sana yardım ettiğinde ne diyebilirsin?','["Bana ne.","Teşekkür ederim.","Çekil.","Yapmak zorundaydın."]',1,'Uygun iletişim davranışı “Teşekkür ederim.” seçeneğidir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-nezaket-13','coktan_secmeli','Yanlış anlaşılma olduğunda ilk ne yapmak uygundur?','["Bağırmak","Kavga etmek","Oradan kaçmak","Sakin biçimde açıklama yapmak"]',3,'Uygun iletişim davranışı “Sakin biçimde açıklama yapmak” seçeneğidir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-nezaket-14','coktan_secmeli','Toplantıda söz almak için ne yapmalısın?','["Hemen araya girmelisin.","Sıranı beklemelisin.","Bağırmalısın.","Masaya vurmalısın."]',1,'Uygun iletişim davranışı “Sıranı beklemelisin.” seçeneğidir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-nezaket-15','coktan_secmeli','Bir arkadaşın sırrını izinsiz paylaşmak doğru mudur?','["Evet her zaman","Sadece kalabalıkta","Sadece internette","Hayır"]',3,'Uygun iletişim davranışı “Hayır” seçeneğidir.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-nezaket-16','coktan_secmeli','Bir grupta görev dağılımı yapılırken ne önemlidir?','["Bir kişiye tüm işi vermek","Adil ve uygun paylaşım","Kimseye görev vermemek","Görevleri gizlemek"]',1,'Uygun iletişim davranışı “Adil ve uygun paylaşım” seçeneğidir.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-nezaket' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-1','coktan_secmeli','Hangisi doğru yazılmıştır?','["ayşe yarın Konyaya gidecek.","Ayşe yarın konya''ya gidecek.","Ayşe yarın Konya ya gidecek.","Ayşe yarın Konya''ya gidecek."]',3,'Yazım ve noktalama kuralına uygun seçenek budur.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-2','coktan_secmeli','“Bugün hangi kitabı okuyacaksın__” boşluğa ne gelmelidir?','[".","?",",","!"]',1,'Yazım ve noktalama kuralına uygun seçenek budur.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-3','coktan_secmeli','“Eyvah__ kalemim kırıldı.” boşluğa ne gelmelidir?','["?",".",":","!"]',3,'Yazım ve noktalama kuralına uygun seçenek budur.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-4','coktan_secmeli','“Çantamda defter__ kalem ve silgi var.” boşluğa ne gelmelidir?','[".",",","?","!"]',1,'Yazım ve noktalama kuralına uygun seçenek budur.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-5','coktan_secmeli','Hangisinde kesme işareti doğru kullanılmıştır?','["Türkiyenin başkenti Ankara''dır.","Türkiye nin başkenti Ankara''dır.","türkiye''nin başkenti Ankara''dır.","Türkiye''nin başkenti Ankara''dır."]',3,'Yazım ve noktalama kuralına uygun seçenek budur.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-6','coktan_secmeli','“Öğretmen şöyle dedi__ Defterlerinizi açın.” boşluğa ne gelmelidir?','[".",":",",","?"]',1,'Yazım ve noktalama kuralına uygun seçenek budur.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-7','coktan_secmeli','Hangisi doğru cümle başlangıcıdır?','["sabah erkenden uyandım.","saBah erkenden uyandım.","SABAH erkenden uyandım.","Sabah erkenden uyandım."]',3,'Yazım ve noktalama kuralına uygun seçenek budur.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-8','coktan_secmeli','Hangisinde özel ad doğru yazılmıştır?','["mevlâna Müzesi","Mevlâna Müzesi","Mevlâna müzesi","mevlâna müzesi"]',1,'Yazım ve noktalama kuralına uygun seçenek budur.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-9','coktan_secmeli','“Mert__in kitabı masada.” boşluğa ne gelmelidir?','[".",",","-","''"]',3,'Yazım ve noktalama kuralına uygun seçenek budur.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-10','coktan_secmeli','Hangisi bir soru cümlesidir?','["Deney tamamlandı.","Bu deneyin sonucu nedir?","Sonucu yazdım.","Malzemeleri topladım."]',1,'Yazım ve noktalama kuralına uygun seçenek budur.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-11','coktan_secmeli','Hangisi ünlemle bitmeye en uygundur?','["Kitap masada","Saat üç oldu","Ders başladı","Aman, dikkat et"]',3,'Yazım ve noktalama kuralına uygun seçenek budur.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-12','coktan_secmeli','Hangisinde virgül doğru kullanılmıştır?','["Elma armut muz, ve portakal aldık.","Elma, armut, muz ve portakal aldık.","Elma? armut? muz?","Elma. armut. muz."]',1,'Yazım ve noktalama kuralına uygun seçenek budur.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-13','coktan_secmeli','“23 Nisan__da törene katıldık.” boşluğa ne gelmelidir?','["-",",",":","''"]',3,'Yazım ve noktalama kuralına uygun seçenek budur.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-14','coktan_secmeli','Başlık yazarken hangisi önemlidir?','["Her zaman çok uzun olması","Metne uygun olması","Metinle ilgisiz olması","Sadece rakamlardan oluşması"]',1,'Yazım ve noktalama kuralına uygun seçenek budur.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-15','coktan_secmeli','Paragrafın ilk cümlesi nasıl başlamalıdır?','["Küçük harfle","Virgülle","Rakamla zorunlu","Büyük harfle"]',3,'Yazım ve noktalama kuralına uygun seçenek budur.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-16','coktan_secmeli','Bir cümlenin sonunda ne bulunmalıdır?','["Her zaman virgül","Uygun noktalama işareti","Hiçbir işaret","Her zaman iki nokta"]',1,'Yazım ve noktalama kuralına uygun seçenek budur.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-17','coktan_secmeli','“Ankara__ Türkiye''nin başkentidir.” boşluğa hangisi daha uygundur?','["?","!","''",","]',3,'Yazım ve noktalama kuralına uygun seçenek budur.',2,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-18','coktan_secmeli','Hangisi doğru yazılmıştır?','["atatürk 1881de doğdu.","Atatürk 1881''de doğdu.","Atatürk 1881 de doğdu.","Atatürk 1881''de Doğdu."]',1,'Yazım ve noktalama kuralına uygun seçenek budur.',2,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-19','coktan_secmeli','“Ne güzel bir gün__” boşluğa ne gelmelidir?','["?",".",",","!"]',3,'Yazım ve noktalama kuralına uygun seçenek budur.',2,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-20','coktan_secmeli','“Saat kaç__” boşluğa ne gelmelidir?','["!","?",".",","]',1,'Yazım ve noktalama kuralına uygun seçenek budur.',2,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-21','coktan_secmeli','Hangisinde iki nokta doğru kullanılmıştır?','["Çantamda: üç şey var kitap.","Çantamda üç şey? kitap.","Çantamda üç şey var, : kitap.","Çantamda üç şey var: kitap, kalem, silgi."]',3,'Yazım ve noktalama kuralına uygun seçenek budur.',2,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-22','coktan_secmeli','Hangisinde tırnak işareti doğru kullanılmıştır?','["Ece Bugün geliyorum dedi.","Ece, “Bugün geliyorum.” dedi.","Ece: Bugün geliyorum? dedi.","Ece, Bugün geliyorum! dedi."]',1,'Yazım ve noktalama kuralına uygun seçenek budur.',2,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-23','coktan_secmeli','Özel ada gelen ek nasıl ayrılır?','["Virgülle","Noktayla","Soru işaretiyle","Kesme işaretiyle"]',3,'Yazım ve noktalama kuralına uygun seçenek budur.',2,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yazim-24','coktan_secmeli','Hangisi doğru yazılmış bir cümledir?','["mert eceye yeni kitabı verdi.","Mert, Ece''ye yeni kitabı verdi.","Mert Ece''ye yeni kitabı verdi","Mert, ece''ye yeni kitabı verdi."]',1,'Yazım ve noktalama kuralına uygun seçenek budur.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-olay-1','coktan_secmeli','Tohumu ekti → suladı → filiz çıktı. İkinci olay hangisidir?','["Tohumu ekti","Filiz çıktı","Meyve topladı","Suladı"]',3,'Olayların zaman sırasına göre doğru cevap seçilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-olay' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-olay-2','coktan_secmeli','Araştırma sorusunu belirledi → bilgi topladı → sonucunu yazdı. İlk adım nedir?','["Bilgi toplamak","Araştırma sorusunu belirlemek","Sonucu yazmak","Sunum yapmak"]',1,'Olayların zaman sırasına göre doğru cevap seçilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-olay' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-olay-3','coktan_secmeli','Kâğıdı katladı → şekli çizdi → kesti. Son adım nedir?','["Katladı","Çizdi","Boyadı","Kesti"]',3,'Olayların zaman sırasına göre doğru cevap seçilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-olay' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-olay-4','coktan_secmeli','Mert uyandı → kahvaltı yaptı → okula gitti. Kahvaltıdan sonra ne yaptı?','["Uyandı","Okula gitti","Uyudu","Eve döndü"]',1,'Olayların zaman sırasına göre doğru cevap seçilir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-olay' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-olay-5','coktan_secmeli','Kitabı seçti → ödünç aldı → okudu → geri verdi. Okumadan sonra ne yaptı?','["Seçti","Ödünç aldı","Kaybetti","Geri verdi"]',3,'Olayların zaman sırasına göre doğru cevap seçilir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-olay' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-olay-6','coktan_secmeli','Yağmur başladı → şemsiyesini açtı → eve ulaştı. Şemsiyeyi ne zaman açtı?','["Eve ulaştıktan sonra","Yağmur başladıktan sonra","Yağmurdan önce iki gün","Hiç açmadı"]',1,'Olayların zaman sırasına göre doğru cevap seçilir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-olay' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-olay-7','coktan_secmeli','Deney malzemelerini hazırladı → deneyi yaptı → gözlemini yazdı. Gözlemden önce ne yaptı?','["Sonucu sildi","Eve gitti","Kitabı kapattı","Deneyi yaptı"]',3,'Olayların zaman sırasına göre doğru cevap seçilir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-olay' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-olay-8','coktan_secmeli','Çantasını hazırladı → montunu giydi → evden çıktı. Evden çıkmadan hemen önce ne yaptı?','["Çantasını hazırladı","Montunu giydi","Uyudu","Eve döndü"]',1,'Olayların zaman sırasına göre doğru cevap seçilir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-olay' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-olay-9','coktan_secmeli','Metni okudu → önemli yerleri belirledi → özet yazdı. Özetten önce ne yaptı?','["Metni kapattı","Başlığı sildi","Resim çizdi","Önemli yerleri belirledi"]',3,'Olayların zaman sırasına göre doğru cevap seçilir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-olay' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-olay-10','coktan_secmeli','Toprağı hazırladı → fideyi dikti → suladı. İlk iş nedir?','["Sulamak","Toprağı hazırlamak","Fideyi dikmek","Meyve toplamak"]',1,'Olayların zaman sırasına göre doğru cevap seçilir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-olay' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-olay-11','coktan_secmeli','Soruyu okudu → işlemi seçti → sonucu kontrol etti. İkinci adım hangisidir?','["Soruyu okumak","Sonucu kontrol etmek","Cevabı silmek","İşlemi seçmek"]',3,'Olayların zaman sırasına göre doğru cevap seçilir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-olay' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-olay-12','coktan_secmeli','Bisiklet sürmeden önce kask taktı → bisiklete bindi → yola çıktı. En güvenli ilk adım nedir?','["Yola çıkmak","Kask takmak","Hızlanmak","Ellerini bırakmak"]',1,'Olayların zaman sırasına göre doğru cevap seçilir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-olay' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-olay-13','coktan_secmeli','Önce fikirlerini yazdı, sonra düzenledi, en son temize çekti. İkinci iş nedir?','["Fikirleri yazmak","Temize çekmek","Kâğıdı atmak","Yazıyı düzenlemek"]',3,'Olayların zaman sırasına göre doğru cevap seçilir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-olay' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-olay-14','coktan_secmeli','Kütüphaneye girdi → kitabı aradı → buldu → ödünç aldı. Bulduktan sonra ne yaptı?','["Kütüphaneye girdi","Ödünç aldı","Aradı","Eve gitmedi"]',1,'Olayların zaman sırasına göre doğru cevap seçilir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-olay' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-olay-15','coktan_secmeli','Hava bulutlandı → rüzgâr arttı → yağmur başladı. Yağmurdan hemen önce ne oldu?','["Hava açtı","Güneş doğdu","Kar eridi","Rüzgâr arttı"]',3,'Olayların zaman sırasına göre doğru cevap seçilir.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-olay' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-olay-16','coktan_secmeli','Arkadaşından özür diledi → hatasını düzeltti → birlikte oyuna devam ettiler. Özürden sonra ne yaptı?','["Oyunu bıraktı","Hatasını düzeltti","Eve gitti","Kavga etti"]',1,'Olayların zaman sırasına göre doğru cevap seçilir.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-olay' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-neden-1','coktan_secmeli','“Yağmur yağdığı için maç ertelendi.” Maç neden ertelendi?','["Takım kazandığı için","Hava açtığı için","Saha boş olduğu için","Yağmur yağdığı için"]',3,'Cümlede neden ve sonuç ilişkisi belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-neden-sonuc' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-neden-2','coktan_secmeli','“Mert çok çalıştı, bu yüzden sınavda başarılı oldu.” Sonuç nedir?','["Çok çalışması","Sınavda başarılı olması","Okula gitmesi","Kitap alması"]',1,'Cümlede neden ve sonuç ilişkisi belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-neden-sonuc' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-neden-3','coktan_secmeli','“Elektrikler kesildiği için oda karardı.” Odanın kararmasının nedeni nedir?','["Güneşin doğması","Pencerenin açılması","Kitabın kapanması","Elektriklerin kesilmesi"]',3,'Cümlede neden ve sonuç ilişkisi belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-neden-sonuc' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-neden-4','coktan_secmeli','“Bitki susuz kaldığı için yaprakları soldu.” Yapraklar neden soldu?','["Çok kitap okunduğu için","Bitki susuz kaldığı için","Hava aydınlık olduğu için","Toprak taş olduğu için"]',1,'Cümlede neden ve sonuç ilişkisi belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-neden-sonuc' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-neden-5','coktan_secmeli','“Otobüsü kaçırdığı için okula geç kaldı.” Sonuç nedir?','["Otobüsü kaçırması","Erken kalkması","Ders çalışması","Okula geç kalması"]',3,'Cümlede neden ve sonuç ilişkisi belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-neden-sonuc' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-neden-6','coktan_secmeli','“Kask taktığı için başını daha iyi korudu.” Kask takmanın sonucu nedir?','["Bisikletin hızlanması","Başın korunmasına yardımcı olması","Yolun uzaması","Havanın değişmesi"]',1,'Cümlede neden ve sonuç ilişkisi belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-neden-sonuc' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-neden-7','coktan_secmeli','“Suyu kapattı, böylece israfı azalttı.” Sonuç nedir?','["Musluğun büyümesi","Suyun çoğalması","Evin taşınması","Su israfının azalması"]',3,'Cümlede neden ve sonuç ilişkisi belirlenir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-neden-sonuc' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-neden-8','coktan_secmeli','“Düzenli uyuduğu için sabah dinç uyandı.” Neden nedir?','["Sabah olması","Düzenli uyuması","Okula gitmesi","Kahvaltı yapması"]',1,'Cümlede neden ve sonuç ilişkisi belirlenir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-neden-sonuc' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-neden-9','coktan_secmeli','“Kitabı dikkatle okuduğu için soruları kolayca cevapladı.” Sonuç nedir?','["Kitabı açması","Sınıfta olması","Kalemi olması","Soruları kolayca cevaplaması"]',3,'Cümlede neden ve sonuç ilişkisi belirlenir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-neden-sonuc' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-neden-10','coktan_secmeli','“Yol buzlu olduğu için araçlar yavaş ilerledi.” Araçlar neden yavaşladı?','["Trafik ışığı yeşil olduğu için","Yol buzlu olduğu için","Hava sıcak olduğu için","Yol geniş olduğu için"]',1,'Cümlede neden ve sonuç ilişkisi belirlenir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-neden-sonuc' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-neden-11','coktan_secmeli','“Çöpleri ayırdıkları için geri dönüşüm kolaylaştı.” Sonuç nedir?','["Çöpün çoğalması","Kutuların kaybolması","Suyun kirlenmesi","Geri dönüşümün kolaylaşması"]',3,'Cümlede neden ve sonuç ilişkisi belirlenir.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-neden-sonuc' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-neden-12','coktan_secmeli','“Ece sesini alçalttı çünkü kütüphanedeydi.” Ece neden sesini alçalttı?','["Bahçede olduğu için","Kütüphanede olduğu için","Maç izlediği için","Otobüse bindiği için"]',1,'Cümlede neden ve sonuç ilişkisi belirlenir.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-neden-sonuc' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-neden-13','coktan_secmeli','“Fidan güneş aldığı için daha iyi gelişti.” Neden nedir?','["Saksının rengi","Etiketin şekli","Masanın yüksekliği","Güneş alması"]',3,'Cümlede neden ve sonuç ilişkisi belirlenir.',2,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-neden-sonuc' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-neden-14','coktan_secmeli','“Sınıf kurallarına uyulduğu için ortam daha düzenliydi.” Sonuç nedir?','["Kuralların silinmesi","Ortamın daha düzenli olması","Sınıfın küçülmesi","Dersin bitmesi"]',1,'Cümlede neden ve sonuç ilişkisi belirlenir.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-neden-sonuc' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-neden-15','coktan_secmeli','“Hava çok sıcak olduğu için daha fazla su içti.” Neden nedir?','["Suyun soğuk olması","Bardağın büyük olması","Saatin geç olması","Havanın çok sıcak olması"]',3,'Cümlede neden ve sonuç ilişkisi belirlenir.',2,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-neden-sonuc' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-neden-16','coktan_secmeli','“Soruyu yanlış anladığı için farklı işlem yaptı.” Sonuç nedir?','["Soruyu okuması","Farklı işlem yapması","Kalem kullanması","Defter açması"]',1,'Cümlede neden ve sonuç ilişkisi belirlenir.',2,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-neden-sonuc' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-tahmin-1','coktan_secmeli','Mert mont, atkı ve eldiven giydi. Hava için ne çıkarabiliriz?','["Çok sıcak kesin.","Yağmur hiç yağmaz.","Yaz mevsimidir kesin.","Soğuk olabilir."]',3,'İpuçlarının desteklediği en mantıklı çıkarım seçilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-tahmin-2','coktan_secmeli','Ece şemsiyesini açıp yürüdü. Ne olmuş olabilir?','["Kesin kar yağıyor.","Yağmur yağıyor olabilir.","Güneş hiç yok.","Okul kapandı."]',1,'İpuçlarının desteklediği en mantıklı çıkarım seçilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-tahmin-3','coktan_secmeli','Kütüphanedeki herkes sessiz konuşuyor. Neden olabilir?','["Yarış başladığı için","Müzik açıldığı için","Bahçede oldukları için","Başkalarını rahatsız etmemek için"]',3,'İpuçlarının desteklediği en mantıklı çıkarım seçilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-tahmin-4','coktan_secmeli','Fidanın yaprakları dik ve yeşil, toprağı nemli. Ne söylenebilir?','["Kesin kurumuştur.","Bakımı uygun olabilir.","Hiç su almamıştır.","Canlı değildir."]',1,'İpuçlarının desteklediği en mantıklı çıkarım seçilir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-tahmin-5','coktan_secmeli','Sınıftaki ışıklar boş odada kapatıldı. Amaç ne olabilir?','["Daha çok enerji harcamak","Odayı büyütmek","Kitabı korumak","Enerji tasarrufu"]',3,'İpuçlarının desteklediği en mantıklı çıkarım seçilir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-tahmin-6','coktan_secmeli','Ali düşen arkadaşına elini uzattı. Ali için ne söylenebilir?','["Duyarsızdır.","Yardımsever davranmıştır.","Kural bozmuştur.","İsraf yapmıştır."]',1,'İpuçlarının desteklediği en mantıklı çıkarım seçilir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-tahmin-7','coktan_secmeli','Bir öğrenci kaynaklarını karşılaştırıp aynı bilgiyi doğruladı. Ne yapmıştır?','["Bilgiyi uydurmuştur.","Kitabı saklamıştır.","Soruyu silmiştir.","Bilgiyi kontrol etmiştir."]',3,'İpuçlarının desteklediği en mantıklı çıkarım seçilir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-tahmin-8','coktan_secmeli','Ağaçların yaprakları sararıp dökülüyor. Hangi mevsim olabilir?','["İlkbahar kesin","Sonbahar","Yaz kesin","Her zaman kış"]',1,'İpuçlarının desteklediği en mantıklı çıkarım seçilir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-tahmin-9','coktan_secmeli','Gökyüzü koyu bulutlu ve gök gürlüyor. Ne beklenebilir?','["Kesin karne günü","Yeni kitap","Sınıf gezisi","Yağış veya fırtına"]',3,'İpuçlarının desteklediği en mantıklı çıkarım seçilir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-tahmin-10','coktan_secmeli','Bir çocuk bütün arkadaşlarının oyuna katılmasını istiyor. Hangi değer öne çıkar?','["Dışlama","Adalet ve katılım","Hile","İsraf"]',1,'İpuçlarının desteklediği en mantıklı çıkarım seçilir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-tahmin-11','coktan_secmeli','Mina deney sonucunu değiştirmeden yazdı. Hangi değer öne çıkar?','["Hile","Kabalık","İsraf","Dürüstlük"]',3,'İpuçlarının desteklediği en mantıklı çıkarım seçilir.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-tahmin-12','coktan_secmeli','Arda iki çözüm yolunu karşılaştırdı. Bunu neden yapmış olabilir?','["Soruyu unutmak için","Daha uygun çözümü seçmek için","Cevabı silmek için","Kitabı kapatmak için"]',1,'İpuçlarının desteklediği en mantıklı çıkarım seçilir.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-tahmin-13','coktan_secmeli','Bir metinde kahraman sürekli paylaşım yapıyor. Hangi özellik çıkarılabilir?','["Bencil olduğu kesin","Korkak olduğu","Uykulu olduğu","Paylaşımcı olduğu"]',3,'İpuçlarının desteklediği en mantıklı çıkarım seçilir.',2,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-tahmin-14','coktan_secmeli','Ece, dönüşüm kutularını kâğıt-cam-plastik diye etiketledi. Amaç nedir?','["Daha çok çöp üretmek","Atıkları doğru ayırmak","Kutuları saklamak","Rengi değiştirmek"]',1,'İpuçlarının desteklediği en mantıklı çıkarım seçilir.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-tahmin-15','coktan_secmeli','Mert çalışma planına her gün uyuyor. Hangi özellik çıkarılabilir?','["Her zaman geç kalır.","Kuralsızdır.","Hiç çalışmaz.","Düzenli ve sorumlu olabilir."]',3,'İpuçlarının desteklediği en mantıklı çıkarım seçilir.',2,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-tahmin-16','coktan_secmeli','Parkta yeni dikilen fidanların çevresine koruyucu çit yapılmış. Neden olabilir?','["Parkı kapatmak için","Fidanları korumak için","Çimleri boyamak için","Yağmuru engellemek için"]',1,'İpuçlarının desteklediği en mantıklı çıkarım seçilir.',2,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-tahmin' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ana-1','coktan_secmeli','“Her gün birkaç sayfa kitap okumak kelime dağarcığımızı geliştirir ve düşüncelerimizi daha iyi anlatmamıza yardım eder.” Ana fikir nedir?','["Kitaplar ağırdır.","Her kitap aynı konudadır.","Sadece okulda okunur.","Düzenli kitap okumanın yararları vardır."]',3,'Metnin genel mesajı veya en uygun başlığı belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ana-2','coktan_secmeli','“Su, yaşam için gereklidir. Musluğu gereksiz açık bırakmamak ve kısa duş almak suyu korumamıza yardım eder.” Ana fikir nedir?','["Musluklar pahalıdır.","Suyu tasarruflu kullanmalıyız.","Sadece yağmur suyu kullanılır.","Duş almak gereksizdir."]',1,'Metnin genel mesajı veya en uygun başlığı belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ana-3','coktan_secmeli','“Takım üyeleri birbirini dinlediğinde ve görevleri paylaştığında çalışmalar daha düzenli ilerler.” Ana fikir nedir?','["Tek başına çalışmak her zaman iyidir.","Görev paylaşımı gereksizdir.","Takımda konuşulmamalıdır.","İş birliği başarıyı kolaylaştırır."]',3,'Metnin genel mesajı veya en uygun başlığı belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ana-4','coktan_secmeli','“Arılar çiçeklerden nektar toplar. Bu sırada polenleri farklı çiçeklere taşıyarak bitkilerin çoğalmasına katkı sağlar.” En uygun başlık?','["Kışlık Mont","Arıların Doğadaki Görevi","Yeni Kitap","Okul Servisi"]',1,'Metnin genel mesajı veya en uygun başlığı belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ana-5','coktan_secmeli','“Müzelere gittiğimizde geçmişten kalan eserleri görür, kültürümüz hakkında bilgi ediniriz.” Ana fikir?','["Müzelerde sadece oyun oynanır.","Eserler gereksizdir.","Müzeler yalnız turistler içindir.","Müzeler kültürel geçmişimizi tanımaya yardım eder."]',3,'Metnin genel mesajı veya en uygun başlığı belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ana-6','coktan_secmeli','“Bitki düzenli sulandı, güneş aldı ve büyüdü.” En uygun başlık?','["Kayıp Kalem","Bir Bitkinin Gelişimi","Trafik Kuralları","Kış Sporları"]',1,'Metnin genel mesajı veya en uygun başlığı belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ana-7','coktan_secmeli','“İnternette gördüğümüz her bilgi doğru olmayabilir. Kaynağı kontrol etmek gerekir.” Ana fikir?','["İnternette her bilgi doğrudur.","Kaynaklar önemsizdir.","Sadece resimlere bakmalıyız.","Dijital bilgiyi doğrulamak önemlidir."]',3,'Metnin genel mesajı veya en uygun başlığı belirlenir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ana-8','coktan_secmeli','“Çocuklar parkı temizledi, çöpleri ayırdı ve geri dönüşüm kutularına koydu.” En uygun başlık?','["Yeni Oyuncak","Parkımızı Koruyoruz","Uzun Yol","Kış Günü"]',1,'Metnin genel mesajı veya en uygun başlığı belirlenir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ana-9','coktan_secmeli','“Bir işi zamanında yapmak için önce plan hazırlamak, sonra plana uymak gerekir.” Ana fikir?','["Plan yapmak gereksizdir.","İşler hep ertelenmelidir.","Saat kullanmamalıyız.","Planlı çalışmak zamanı iyi kullanmayı sağlar."]',3,'Metnin genel mesajı veya en uygun başlığı belirlenir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ana-10','coktan_secmeli','“Farklı düşünceleri dinlemek yeni fikirler öğrenmemizi sağlar.” Ana fikir?','["Sadece kendi fikrimiz doğrudur.","Farklı görüşlere açık olmak yararlıdır.","Kimseyi dinlememeliyiz.","Konuşmak gereksizdir."]',1,'Metnin genel mesajı veya en uygun başlığı belirlenir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ana-11','coktan_secmeli','“Atatürk, çocukların eğitimine büyük önem vermiş ve geleceğin eğitimli nesillerle kurulacağını vurgulamıştır.” En uygun başlık?','["Bahçe Oyunları","Yağmurlu Gün","Kayıp Defter","Atatürk ve Eğitim"]',3,'Metnin genel mesajı veya en uygun başlığı belirlenir.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ana-12','coktan_secmeli','“Kış gelmeden bazı hayvanlar göç eder, bazıları kış uykusuna hazırlanır.” Konu nedir?','["Okul kuralları","Hayvanların kışa hazırlanması","Para kullanımı","Müzik aletleri"]',1,'Metnin genel mesajı veya en uygun başlığı belirlenir.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ana-13','coktan_secmeli','“Kırmızı ışıkta durmak ve yaya geçidini kullanmak güvenliğimizi artırır.” Ana fikir?','["Yollar çok uzundur.","Araçlar hep hızlıdır.","Sadece çocuklar kurala uyar.","Trafik kurallarına uymak güvenlik sağlar."]',3,'Metnin genel mesajı veya en uygun başlığı belirlenir.',2,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ana-14','coktan_secmeli','“Düzenli uyku, dengeli beslenme ve hareket etmek sağlığımızı destekler.” En uygun başlık?','["Mutfaktaki Masa","Sağlıklı Yaşam Alışkanlıkları","Yeni Çanta","Kış Tatili"]',1,'Metnin genel mesajı veya en uygun başlığı belirlenir.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ana-15','coktan_secmeli','“Eski oyunları büyüklerimizden öğrenmek kültürel birikimin kuşaktan kuşağa aktarılmasını sağlar.” Ana fikir?','["Eski oyunlar unutulmalıdır.","Sadece dijital oyun oynanır.","Büyüklerden bilgi alınmaz.","Geleneksel oyunlar kültürümüzü taşır."]',3,'Metnin genel mesajı veya en uygun başlığı belirlenir.',2,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ana-16','coktan_secmeli','“Bir hakkımızı kullanırken başkalarının haklarını da gözetmeliyiz.” Ana fikir?','["Sadece kendi hakkımız önemlidir.","Haklar saygı ve sorumlulukla kullanılmalıdır.","Kurallar gereksizdir.","Başkalarını dinlememeliyiz."]',1,'Metnin genel mesajı veya en uygun başlığı belirlenir.',2,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ozet-1','coktan_secmeli','Metin: “Ece sabah erkenden kalktı. Çantasını hazırladı, kahvaltı yaptı ve okula zamanında ulaştı.” En uygun özet?','["Ece sadece kahvaltı yaptı.","Ece bütün gün uyudu.","Ece çantasını kaybetti.","Ece hazırlanıp okula zamanında gitti."]',3,'Özet, metnin temel bilgisini kısa biçimde vermelidir.',2,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ozet-2','coktan_secmeli','Metin: “Çocuklar fidan dikti, suladı ve çevresini temizledi.” En uygun özet?','["Çocuklar sadece su içti.","Çocuklar çevre için fidan dikim çalışması yaptı.","Fidanlar kesildi.","Park kapatıldı."]',1,'Özet, metnin temel bilgisini kısa biçimde vermelidir.',2,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ozet-3','coktan_secmeli','Metin: “Mert kütüphaneden bilim kitabı aldı, okudu ve önemli bilgileri not etti.” Özet?','["Mert kitabı kaybetti.","Mert hiç okumadı.","Kütüphane kapandı.","Mert bilim kitabından bilgi edinip not aldı."]',3,'Özet, metnin temel bilgisini kısa biçimde vermelidir.',2,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ozet-4','coktan_secmeli','Metin: “Yağmur başlayınca insanlar şemsiyelerini açtı ve trafik yavaşladı.” Özet?','["Hava hep güneşliydi.","Yağmur günlük yaşamı etkiledi.","Trafik hızlandı.","Şemsiyeler kayboldu."]',1,'Özet, metnin temel bilgisini kısa biçimde vermelidir.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ozet-5','coktan_secmeli','Metin: “Sınıf, enerji tasarrufu için gereksiz ışıkları kapatma kararı aldı.” Özet?','["Sınıf daha çok ışık açtı.","Elektrikler bozuldu.","Ders yapılmadı.","Sınıf enerji tasarrufu için önlem aldı."]',3,'Özet, metnin temel bilgisini kısa biçimde vermelidir.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ozet-6','coktan_secmeli','Metin: “Deniz, araştırma için iki kaynak kullandı ve bilgilerin aynı olduğunu kontrol etti.” Özet?','["Deniz tek kaynağı ezberledi.","Deniz bilgiyi farklı kaynaklardan doğruladı.","Kaynakları attı.","Bilgiyi değiştirdi."]',1,'Özet, metnin temel bilgisini kısa biçimde vermelidir.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ozet-7','coktan_secmeli','Metin: “Köyde geleneksel oyun günü düzenlendi; çocuklar büyüklerinden oyunları öğrendi.” Özet?','["Çocuklar oyun oynamadı.","Büyükler eve gitti.","Sadece müzik dinlendi.","Çocuklar geleneksel oyunları büyüklerinden öğrendi."]',3,'Özet, metnin temel bilgisini kısa biçimde vermelidir.',2,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ozet-8','coktan_secmeli','Metin: “Arda hatasını fark etti, özür diledi ve bozduğu oyuncağı onarmaya yardım etti.” Özet?','["Arda oyuncağı sakladı.","Arda hatasının sorumluluğunu aldı.","Arda arkadaşını suçladı.","Arda hiçbir şey yapmadı."]',1,'Özet, metnin temel bilgisini kısa biçimde vermelidir.',2,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ozet-9','coktan_secmeli','Metin: “Bitki üç hafta boyunca aynı saatte sulandı ve gelişimi ölçüldü.” Özet?','["Bitki hiç sulanmadı.","Bitki hemen meyve verdi.","Ölçüm yapılmadı.","Bitkinin gelişimi düzenli gözlendi."]',3,'Özet, metnin temel bilgisini kısa biçimde vermelidir.',2,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ozet-10','coktan_secmeli','Metin: “Mahalle sakinleri park için toplantı yaptı, ihtiyaçları belirledi ve belediyeye öneri sundu.” Özet?','["Park yıkıldı.","Mahalle sakinleri park için ortak öneri geliştirdi.","Kimse konuşmadı.","Toplantı iptal edildi."]',1,'Özet, metnin temel bilgisini kısa biçimde vermelidir.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ozet-11','coktan_secmeli','Metin: “Ece eski fotoğrafları inceledi ve ailesinin geçmişi hakkında büyükannesinden bilgi aldı.” Özet?','["Ece fotoğrafları attı.","Büyükanne uyudu.","Aile taşındı.","Ece aile geçmişini araştırdı."]',3,'Özet, metnin temel bilgisini kısa biçimde vermelidir.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-ozet-12','coktan_secmeli','Metin: “Öğrenciler deneyde önce tahmin yaptı, sonra uyguladı ve sonucu kaydetti.” Özet?','["Öğrenciler deney yapmadı.","Öğrenciler tahminlerini deneyle test etti.","Sonuçları sildi.","Sadece tahmin yaptılar."]',1,'Özet, metnin temel bilgisini kısa biçimde vermelidir.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kaynak-1','coktan_secmeli','Bilinmeyen bir sözcüğün anlamı için en uygun kaynak hangisidir?','["Takvim","Cetvel","Saat","Sözlük"]',3,'Bilgi kaynaklarının işlevleri doğru kullanılmalıdır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kaynak-2','coktan_secmeli','Bir kitabın hangi sayfasında belirli bölümün başladığını bulmak için neye bakılır?','["Kapak resmi","İçindekiler","Fiyat etiketi","Boş sayfa"]',1,'Bilgi kaynaklarının işlevleri doğru kullanılmalıdır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kaynak-3','coktan_secmeli','Bir konu hakkında genel bilgi edinmek için hangisi kullanılabilir?','["Silgi","Cetvel","Kalem kutusu","Ansiklopedi"]',3,'Bilgi kaynaklarının işlevleri doğru kullanılmalıdır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kaynak-4','coktan_secmeli','Kitabın sonunda belirli kavramın geçtiği sayfaları gösteren bölüm hangisidir?','["Kapak","Dizin","Önsöz her zaman","Başlık"]',1,'Bilgi kaynaklarının işlevleri doğru kullanılmalıdır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kaynak-5','coktan_secmeli','İnternetten bilgi alırken en önemli davranış hangisidir?','["İlk gördüğünü doğru kabul etmek","Kaynağı önemsememek","Sadece reklama bakmak","Kaynağın güvenilirliğini kontrol etmek"]',3,'Bilgi kaynaklarının işlevleri doğru kullanılmalıdır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kaynak-6','coktan_secmeli','İki kaynak farklı bilgi veriyorsa ne yapılmalıdır?','["Rastgele birini seçmek","Başka güvenilir kaynaklarla doğrulamak","İkisini de silmek","Bilgiyi uydurmak"]',1,'Bilgi kaynaklarının işlevleri doğru kullanılmalıdır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kaynak-7','coktan_secmeli','Bir kitabın yazarını nerede görebiliriz?','["Sadece son paragrafta","Her zaman dizinde","Sadece resimde","Kapakta veya künye bölümünde"]',3,'Bilgi kaynaklarının işlevleri doğru kullanılmalıdır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kaynak-8','coktan_secmeli','Kaynakça neyi gösterir?','["Kitabın ağırlığını","Yararlanılan kaynakları","Sayfa rengini","Okul adresini"]',1,'Bilgi kaynaklarının işlevleri doğru kullanılmalıdır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kaynak-9','coktan_secmeli','Sözlükte sözcükler genellikle nasıl sıralanır?','["Boylarına göre","Renklerine göre","Rastgele","Alfabetik"]',3,'Bilgi kaynaklarının işlevleri doğru kullanılmalıdır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kaynak-10','coktan_secmeli','Araştırmada not almak ne sağlar?','["Kaynağı değiştirmeyi","Önemli bilgileri unutmamayı","Bilgiyi gizlemeyi","Soruyu silmeyi"]',1,'Bilgi kaynaklarının işlevleri doğru kullanılmalıdır.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kaynak-11','coktan_secmeli','Bir haberin tarihine bakmak neden önemlidir?','["Yazı rengini seçmek için","Sayfayı büyütmek için","Başlığı silmek için","Bilginin güncelliğini anlamaya yardım eder."]',3,'Bilgi kaynaklarının işlevleri doğru kullanılmalıdır.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kaynak-12','coktan_secmeli','Güvenilir dijital kaynakta hangisi aranabilir?','["Sadece parlak renk","Yazar/kurum ve yayın bilgisi","Çok reklam","Anonim söylenti"]',1,'Bilgi kaynaklarının işlevleri doğru kullanılmalıdır.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kaynak-13','coktan_secmeli','Bir bilgiyi kendi cümlelerimizle not etmek neye yardım eder?','["Kopyalamaya","Unutmaya","Kaynağı gizlemeye","Anlamaya ve özetlemeye"]',3,'Bilgi kaynaklarının işlevleri doğru kullanılmalıdır.',2,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kaynak-14','coktan_secmeli','Bir konuyu araştırırken tek kaynak yeterli olmayabilir. Neden?','["Daha az öğrenmek için","Bilgiyi karşılaştırmak ve doğrulamak için","Kaynakları karıştırmak için","Zaman kaybetmek için"]',1,'Bilgi kaynaklarının işlevleri doğru kullanılmalıdır.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kaynak' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-cumle-1','coktan_secmeli','Kelimeleri doğru sıraya koy: “bugün / müzeye / sınıfımız / gitti”','["Bugün gitti müzeye sınıfımız.","Sınıfımız bugün müzeye gitti.","Müzeye sınıfımız bugün mu.","Gitti sınıfımız müzeye."]',1,'Cümlenin anlam ve yapı özelliklerine göre doğru seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-cumle-2','coktan_secmeli','Hangisi anlamlı ve kurallı cümledir?','["Dikkatli bilim yapar insanları.","Gözlem bilim insanları dikkatli.","Yapar dikkatli gözlem.","Bilim insanları dikkatli gözlem yapar."]',3,'Cümlenin anlam ve yapı özelliklerine göre doğru seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-cumle-3','coktan_secmeli','“Bitkiler gelişmek için __.” boşluğa hangisi uygundur?','["kitap okur","su ve ışığa ihtiyaç duyar","otobüse biner","müzik çalar"]',1,'Cümlenin anlam ve yapı özelliklerine göre doğru seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-cumle-4','coktan_secmeli','Hangisi paragrafın giriş cümlesi olmaya uygundur?','["Bu nedenle kutuya attık.","Sonra eve döndü.","Böylece işimiz bitti.","Geri dönüşüm, atıkları yeniden değerlendirmemizi sağlar."]',3,'Cümlenin anlam ve yapı özelliklerine göre doğru seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-cumle-5','coktan_secmeli','“Önce toprağı hazırladık. __. Son olarak fidanı suladık.” boşluğa hangisi uygundur?','["Fidan hiç yoktu","Daha sonra fidanı diktik","Gece uyuduk","Kitabı kapattık"]',1,'Cümlenin anlam ve yapı özelliklerine göre doğru seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-cumle-6','coktan_secmeli','Hangisi olumsuz cümledir?','["Bugün müzeye gittik.","Müze açıktı.","Eserleri inceledik.","Bugün müzeye gitmedik."]',3,'Cümlenin anlam ve yapı özelliklerine göre doğru seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-cumle-7','coktan_secmeli','Hangisi soru cümlesidir?','["Deney tamamlandı.","Deneyin sonucu ne oldu?","Sonucu yazdık.","Malzemeleri topladık."]',1,'Cümlenin anlam ve yapı özelliklerine göre doğru seçenek belirlenir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-cumle-8','coktan_secmeli','“Mert plan yaptı ve görevlerini zamanında bitirdi.” cümlesinde kaç iş vardır?','["Bir","Üç","Dört","İki"]',3,'Cümlenin anlam ve yapı özelliklerine göre doğru seçenek belirlenir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-cumle-9','coktan_secmeli','Hangisi karşılaştırma cümlesidir?','["Kitap masada.","Bu kitap diğerinden daha uzundur.","Kitabı aldım.","Kitap mavi."]',1,'Cümlenin anlam ve yapı özelliklerine göre doğru seçenek belirlenir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-cumle-10','coktan_secmeli','“Yağmur yağmasına rağmen gezi devam etti.” cümlesinde hangi iki durum vardır?','["Sadece güneş","Sadece uyku","Sadece yemek","Yağmur ve gezinin devam etmesi"]',3,'Cümlenin anlam ve yapı özelliklerine göre doğru seçenek belirlenir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-cumle-11','coktan_secmeli','Bir paragraftaki cümleler nasıl olmalıdır?','["Birbiriyle ilgisiz","Aynı konu çevresinde anlamlı bağlantılı","Rastgele","Sadece sorulardan oluşan"]',1,'Cümlenin anlam ve yapı özelliklerine göre doğru seçenek belirlenir.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-cumle-12','coktan_secmeli','“Kuşlar göç etti çünkü hava soğudu.” cümlesinde neden hangisidir?','["Kuşların göç etmesi","Kuşların uçması","Gökyüzünün mavi olması","Havanın soğuması"]',3,'Cümlenin anlam ve yapı özelliklerine göre doğru seçenek belirlenir.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-cumle-13','coktan_secmeli','“Mina kitabı bitirdi ve arkadaşına önerdi.” sonuç olarak ne yaptı?','["Kitabı başlattı","Arkadaşına önerdi","Uyudu","Kitabı kaybetti"]',1,'Cümlenin anlam ve yapı özelliklerine göre doğru seçenek belirlenir.',2,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-cumle-14','coktan_secmeli','Hangisi emir/yönerge cümlesidir?','["Defter mavidir.","Ben defter aldım.","Başlık güzeldi.","Defterini aç ve başlığı yaz."]',3,'Cümlenin anlam ve yapı özelliklerine göre doğru seçenek belirlenir.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-cumle-15','coktan_secmeli','“Çocuklar hem oyun oynadı hem de yeni kurallar öğrendi.” ne anlatır?','["Hiç oyun olmadığını","İki etkinliğin birlikte gerçekleştiğini","Kuralların kaldırıldığını","Çocukların eve gittiğini"]',1,'Cümlenin anlam ve yapı özelliklerine göre doğru seçenek belirlenir.',2,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-cumle-16','coktan_secmeli','Hangisi duygu bildiren cümledir?','["Masa sınıfta.","Saat üç oldu.","Kitap raftadır.","Bu habere çok sevindim."]',3,'Cümlenin anlam ve yapı özelliklerine göre doğru seçenek belirlenir.',2,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-cumle' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kars-1','coktan_secmeli','Kedi ve köpeğin ortak özelliği hangisidir?','["İkisinin de uçması","İkisinin de canlı olması","İkisinin de suda yaşaması","İkisinin de bitki olması"]',1,'Benzerlik ve farklılık özellikleri karşılaştırılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-karsilastirma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kars-2','coktan_secmeli','Kitap ile derginin ortak yönü nedir?','["İkisinin de yiyecek olması","İkisinin de oyuncak olması","İkisinin de araç olması","Okuma materyali olmaları"]',3,'Benzerlik ve farklılık özellikleri karşılaştırılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-karsilastirma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kars-3','coktan_secmeli','Bisiklet ile otomobil arasındaki farklardan biri nedir?','["İkisi de taşıttır.","Bisiklet insan gücüyle hareket edebilir.","İkisinin de tekerleği olabilir.","İkisi de yolda kullanılabilir."]',1,'Benzerlik ve farklılık özellikleri karşılaştırılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-karsilastirma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kars-4','coktan_secmeli','Yaz ve kış hangi yönden farklıdır?','["İkisi de mevsimdir.","İkisinde de gün vardır.","İkisi de yılın parçasıdır.","Hava sıcaklıkları genellikle farklıdır."]',3,'Benzerlik ve farklılık özellikleri karşılaştırılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-karsilastirma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kars-5','coktan_secmeli','Sözlük ve ansiklopedinin ortak amacı nedir?','["Sadece hikâye anlatmak","Bilgiye ulaşmaya yardım etmek","Oyun oynatmak","Resim boyatmak"]',1,'Benzerlik ve farklılık özellikleri karşılaştırılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-karsilastirma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kars-6','coktan_secmeli','Daire ve üçgen arasındaki fark nedir?','["İkisi de aynı şekildir.","Dairenin üç köşesi vardır.","Üçgen yuvarlaktır.","Üçgenin üç kenarı vardır, dairenin kenarı yoktur."]',3,'Benzerlik ve farklılık özellikleri karşılaştırılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-karsilastirma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kars-7','coktan_secmeli','Şehir ve köyün ortak yönü nedir?','["İkisinde de aynı nüfus vardır.","İnsanların yaşadığı yerleşim alanları olmaları","İkisinde de gökdelen zorunludur.","İkisi de ülke adıdır."]',1,'Benzerlik ve farklılık özellikleri karşılaştırılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-karsilastirma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kars-8','coktan_secmeli','Güneş ve lamba ortak olarak ne sağlayabilir?','["Toprak","Kitap","Yağmur","Işık"]',3,'Benzerlik ve farklılık özellikleri karşılaştırılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-karsilastirma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kars-9','coktan_secmeli','Kütüphane ve müzenin ortak yönü nedir?','["Yalnız spor yapılması","Öğrenme ve kültür alanı olmaları","Sadece yemek yenmesi","Araç tamir edilmesi"]',1,'Benzerlik ve farklılık özellikleri karşılaştırılır.',2,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-karsilastirma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kars-10','coktan_secmeli','Toplama ve çıkarma işlemlerinin farkı nedir?','["İkisi tamamen aynıdır.","İkisi de sadece şekildir.","Hiçbiri sayı kullanmaz.","Biri miktarı birleştirebilir, diğeri azaltma/fark bulmada kullanılabilir."]',3,'Benzerlik ve farklılık özellikleri karşılaştırılır.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-karsilastirma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kars-11','coktan_secmeli','Yağmur ve karın ortak özelliği nedir?','["İkisinin de sıcak olması","Yağış türü olmaları","İkisinin de toprak olması","İkisinin de canlı olması"]',1,'Benzerlik ve farklılık özellikleri karşılaştırılır.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-karsilastirma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kars-12','coktan_secmeli','Masal ve bilgilendirici metnin farkı ne olabilir?','["İkisi de her zaman aynı türdür.","Masalda bilgi olmaz.","Bilgilendirici metin hiç cümle içermez.","Masalda hayal ürünü ögeler bulunabilir, bilgilendirici metin gerçek bilgi verir."]',3,'Benzerlik ve farklılık özellikleri karşılaştırılır.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-karsilastirma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yonerge-1','coktan_secmeli','“Önce başlığı yaz, sonra metni oku, en son üç önemli sözcüğü işaretle.” İlk adım nedir?','["Metni okumak","Başlığı yazmak","Üç sözcüğü işaretlemek","Defteri kapatmak"]',1,'Yönergenin sırası ve amacı dikkatle izlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yonerge-2','coktan_secmeli','“İki adım ileri git, sağa dön, bir adım ilerle.” İkinci işlem nedir?','["İki adım ileri gitmek","Bir adım ilerlemek","Geri dönmek","Sağa dönmek"]',3,'Yönergenin sırası ve amacı dikkatle izlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yonerge-3','coktan_secmeli','“Deney kabına önce suyu, sonra kumu ekle ve karıştır.” Kum ne zaman eklenir?','["Sudan önce","Sudan sonra","Karıştırmadan çok sonra","Hiç eklenmez"]',1,'Yönergenin sırası ve amacı dikkatle izlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yonerge-4','coktan_secmeli','“Metni oku, ana fikri belirle, uygun başlığı seç.” Son adım nedir?','["Metni okumak","Ana fikri belirlemek","Metni silmek","Uygun başlığı seçmek"]',3,'Yönergenin sırası ve amacı dikkatle izlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yonerge-5','coktan_secmeli','“Cetvelle 5 cm çizgi çiz ve uçlarını işaretle.” Hangi araç gereklidir?','["Terazi","Cetvel","Saat","Bardak"]',1,'Yönergenin sırası ve amacı dikkatle izlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yonerge-6','coktan_secmeli','“Kırmızı kartı sol kutuya, mavi kartı sağ kutuya koy.” Mavi kart nereye konur?','["Sol kutuya","Masaya","Çantaya","Sağ kutuya"]',3,'Yönergenin sırası ve amacı dikkatle izlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yonerge-7','coktan_secmeli','“Önce tahmin et, sonra say, en son tahmininle karşılaştır.” Tahmin nasıl kontrol edilir?','["Renge bakılarak","Sayma sonucu ile karşılaştırılarak","Kâğıt katlanarak","Tahmin silinerek"]',1,'Yönergenin sırası ve amacı dikkatle izlenir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yonerge-8','coktan_secmeli','“Soruyu iki kez oku, işlemi seç, sonucu kontrol et.” Cevaplamadan önce ne yapılır?','["Sonuç silinir","Kitap kapanır","Kâğıt yırtılır","Soru okunup işlem seçilir"]',3,'Yönergenin sırası ve amacı dikkatle izlenir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yonerge-9','coktan_secmeli','“Üç farklı kaynaktan bilgi bul ve ortak bilgileri not et.” Kaç kaynak kullanılmalıdır?','["Bir","Üç","İki","Dört"]',1,'Yönergenin sırası ve amacı dikkatle izlenir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yonerge-10','coktan_secmeli','“Bitkiyi aynı saatte sulayıp her gün boyunu ölç.” Hangi iki işlem yapılır?','["Boyama ve kesme","Okuma ve yazma","Koşma ve zıplama","Sulama ve ölçme"]',3,'Yönergenin sırası ve amacı dikkatle izlenir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yonerge-11','coktan_secmeli','“Çöpleri kâğıt, cam ve plastik olarak ayır.” Bu yönergenin amacı nedir?','["Atıkları karıştırmak","Atıkları türlerine göre sınıflandırmak","Çöpleri saklamak","Kutuları boş bırakmak"]',1,'Yönergenin sırası ve amacı dikkatle izlenir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-yonerge-12','coktan_secmeli','“Önce güvenlik gözlüğünü tak, sonra deneye başla.” Deneyden önce ne yapılır?','["Deney bitirilir","Masa terk edilir","Malzemeler atılır","Gözlük takılır"]',3,'Yönergenin sırası ve amacı dikkatle izlenir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-bilgi-1','coktan_secmeli','Bir bitki A grubunda her gün sulanmış, B grubunda hiç sulanmamıştır. A grubu daha iyi gelişmiştir. Hangi sonuç desteklenir?','["Su bitkilere zarar verir.","Su bitki gelişimi için önemlidir.","Bitkiler suya ihtiyaç duymaz.","Sadece saksı rengi önemlidir."]',1,'Verilen bilgilerden desteklenen sonuç seçilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-bilgi-2','coktan_secmeli','Bir sınıfta 18 öğrenci kitap, 7 öğrenci dergi seçmiştir. Ne çıkarabiliriz?','["Dergi daha çok seçilmiştir.","Tercihler eşittir.","Kimse okumamıştır.","Kitap daha çok tercih edilmiştir."]',3,'Verilen bilgilerden desteklenen sonuç seçilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-bilgi-3','coktan_secmeli','İki kaynak da Ankara''nın Türkiye''nin başkenti olduğunu söylüyor. Ne yapılmıştır?','["Bilgi uydurulmuştur.","Bilgi birden fazla kaynakla doğrulanmıştır.","Kaynaklar silinmiştir.","Bilgi değiştirilmiştir."]',1,'Verilen bilgilerden desteklenen sonuç seçilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-bilgi-4','coktan_secmeli','Sabah 8°C, öğlen 17°C ölçülmüş. Ne söylenebilir?','["Sıcaklık azalmıştır.","İki ölçüm eşittir.","Sıcaklık ölçülmemiştir.","Öğlen sıcaklık artmıştır."]',3,'Verilen bilgilerden desteklenen sonuç seçilir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-bilgi-5','coktan_secmeli','Bir deneyde mıknatıs demir ataşı çekmiş, plastik düğmeyi çekmemiştir. Hangi sonuç çıkar?','["Mıknatıs her şeyi çeker.","Mıknatıs bazı maddeleri çeker, bazılarını çekmez.","Plastik demirdir.","Ataş plastikten yapılmıştır."]',1,'Verilen bilgilerden desteklenen sonuç seçilir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-bilgi-6','coktan_secmeli','Üç gün boyunca parkta en çok kuş sabah görülmüş. Hangi çıkarım yapılabilir?','["Kuşlar sadece sabah yaşar.","Akşam hiç kuş olmaz.","Parkta başka canlı yoktur.","Bu gözlemde kuşlar sabah daha fazla görülmüştür."]',3,'Verilen bilgilerden desteklenen sonuç seçilir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-bilgi-7','coktan_secmeli','Bir öğrencinin tüm ödevleri zamanında. Ne söylenebilir?','["Hiç çalışmıyor.","Planlı çalışıyor olabilir.","Her zaman geç kalıyor.","Kuralları bilmiyor."]',1,'Verilen bilgilerden desteklenen sonuç seçilir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-bilgi-8','coktan_secmeli','Geri dönüşüm kutusunda kâğıt miktarı bir haftada arttı. Ne çıkarılabilir?','["Hiç kâğıt kullanılmamıştır.","Kutular kaldırılmıştır.","Cam sayısı kesin artmıştır.","Daha fazla kâğıt geri dönüşüme ayrılmış olabilir."]',3,'Verilen bilgilerden desteklenen sonuç seçilir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-bilgi-9','coktan_secmeli','Bir metinde kahraman sürekli başkalarına yardım ediyor. Hangi özellik desteklenir?','["Bencillik","Yardımseverlik","Kabalık","Dikkatsizlik"]',1,'Verilen bilgilerden desteklenen sonuç seçilir.',2,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-bilgi-10','coktan_secmeli','Bir grafikte pazartesi 12, salı 20 kitap okunmuş. Ne çıkarılır?','["Pazartesi daha fazladır.","Sayılar eşittir.","Hiç kitap okunmamıştır.","Salı daha fazla kitap okunmuştur."]',3,'Verilen bilgilerden desteklenen sonuç seçilir.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-bilgi-11','coktan_secmeli','İki yolun biri 3 km, diğeri 5 km. Hangisi daha kısadır?','["5 km olan yol","3 km olan yol","Eşit","Bilinemez"]',1,'Verilen bilgilerden desteklenen sonuç seçilir.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-bilgi-12','coktan_secmeli','Bir kap 4 bardak, diğeri 7 bardak su alıyor. Ne çıkarılır?','["4 bardak alan daha çoktur.","İkisi eşittir.","Bardak sayısı önemli değildir.","7 bardak alan kap daha çok sıvı alır."]',3,'Verilen bilgilerden desteklenen sonuç seçilir.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-bilgi-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-sozcuk-1','coktan_secmeli','“cesur” sözcüğünün zıt anlamlısı hangisidir?','["yiğit","korkak","güçlü","hızlı"]',1,'Sözcüklerin anlam ilişkisi belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-sozcuk-2','coktan_secmeli','“yanıt” sözcüğüne yakın anlamlı hangisidir?','["soru","işaret","metin","cevap"]',3,'Sözcüklerin anlam ilişkisi belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-sozcuk-3','coktan_secmeli','“misafir” sözcüğüne yakın anlamlı hangisidir?','["ev sahibi","konuk","komşu","öğrenci"]',1,'Sözcüklerin anlam ilişkisi belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-sozcuk-4','coktan_secmeli','“uzak” sözcüğünün zıt anlamlısı hangisidir?','["ileri","geniş","yüksek","yakın"]',3,'Sözcüklerin anlam ilişkisi belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-sozcuk-5','coktan_secmeli','“yarar” sözcüğüne yakın anlamlı hangisidir?','["zarar","fayda","engel","sorun"]',1,'Sözcüklerin anlam ilişkisi belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-sozcuk-6','coktan_secmeli','“zor” sözcüğünün zıt anlamlısı hangisidir?','["güçlü","uzun","yavaş","kolay"]',3,'Sözcüklerin anlam ilişkisi belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-sozcuk-7','coktan_secmeli','“kirli” sözcüğünün zıt anlamlısı hangisidir?','["parlak","temiz","yeni","hafif"]',1,'Sözcüklerin anlam ilişkisi belirlenir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-sozcuk-8','coktan_secmeli','“öykü” sözcüğüne yakın anlamlı hangisidir?','["şiir","haber","soru","hikâye"]',3,'Sözcüklerin anlam ilişkisi belirlenir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-sozcuk-9','coktan_secmeli','Hangisi aynı kavram alanındadır: kitap, dergi, gazete, __','["çatal","ansiklopedi","top","ayakkabı"]',1,'Sözcüklerin anlam ilişkisi belirlenir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-sozcuk-10','coktan_secmeli','Hangisi aynı kavram alanındadır: yağmur, kar, dolu, __','["masa","kalem","oyuncak","yağış"]',3,'Sözcüklerin anlam ilişkisi belirlenir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-sozcuk-11','coktan_secmeli','Hangisi diğerlerinden farklıdır?','["elma","cetvel","armut","muz"]',1,'Sözcüklerin anlam ilişkisi belirlenir.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-sozcuk-12','coktan_secmeli','Hangisi aynı gruptadır: doktor, öğretmen, mühendis, __','["mevsim","renk","oyun","meslek"]',3,'Sözcüklerin anlam ilişkisi belirlenir.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-sozcuk-13','coktan_secmeli','“özgür” sözcüğünün karşıt anlamına en yakın hangisidir?','["bağımsız","kısıtlı","serbest","rahat"]',1,'Sözcüklerin anlam ilişkisi belirlenir.',2,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-sozcuk-14','coktan_secmeli','“hızlı” sözcüğünün zıttı hangisidir?','["çabuk","seri","erken","yavaş"]',3,'Sözcüklerin anlam ilişkisi belirlenir.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-sozcuk-15','coktan_secmeli','“doğa” ile aynı konu alanında hangisi vardır?','["cetvel","orman","klavye","telefon şarjı"]',1,'Sözcüklerin anlam ilişkisi belirlenir.',2,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-sozcuk-16','coktan_secmeli','“kültür” ile ilişkili olan hangisidir?','["kilogram","cetvel","voltaj","gelenek"]',3,'Sözcüklerin anlam ilişkisi belirlenir.',2,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-sozcuk-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-1','coktan_secmeli','Cumhuriyet Bayramı: Hazırlık hangi gün içindi?','["23 Nisan","29 Ekim","19 Mayıs","30 Ağustos"]',1,'Okulda 29 Ekim için tören hazırlığı vardı. Ece arkadaşlarıyla sınıf panosuna Cumhuriyet''in kuruluşunu anlatan kısa bilgiler yerleştirdi. Öğretmeni, Atatürk''ün bağımsızlık ve eğitim konusundaki çalışmalarından söz etti. Törende öğrenciler şiirler okudu ve bayraklarla yürüdü. Cevap metindeki bilgi ve çıkarıma dayanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ataturk' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-2','coktan_secmeli','Cumhuriyet Bayramı: Ece panoya ne yerleştirdi?','["Yemek tarifleri","Spor sonuçları","Hava raporu","Cumhuriyet''in kuruluşunu anlatan bilgiler"]',3,'Okulda 29 Ekim için tören hazırlığı vardı. Ece arkadaşlarıyla sınıf panosuna Cumhuriyet''in kuruluşunu anlatan kısa bilgiler yerleştirdi. Öğretmeni, Atatürk''ün bağımsızlık ve eğitim konusundaki çalışmalarından söz etti. Törende öğrenciler şiirler okudu ve bayraklarla yürüdü. Cevap metindeki bilgi ve çıkarıma dayanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ataturk' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-3','coktan_secmeli','Cumhuriyet Bayramı: Öğretmen hangi konulardan söz etti?','["Yemek ve alışverişten","Atatürk''ün bağımsızlık ve eğitim çalışmalarından","Kış sporlarından","Müzik aletlerinden"]',1,'Okulda 29 Ekim için tören hazırlığı vardı. Ece arkadaşlarıyla sınıf panosuna Cumhuriyet''in kuruluşunu anlatan kısa bilgiler yerleştirdi. Öğretmeni, Atatürk''ün bağımsızlık ve eğitim konusundaki çalışmalarından söz etti. Törende öğrenciler şiirler okudu ve bayraklarla yürüdü. Cevap metindeki bilgi ve çıkarıma dayanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ataturk' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-4','coktan_secmeli','Cumhuriyet Bayramı: Törende öğrenciler ne yaptı?','["Dersi iptal etti","Müzeyi kapattı","Sadece oyun oynadı","Şiir okudu ve bayraklarla yürüdü"]',3,'Okulda 29 Ekim için tören hazırlığı vardı. Ece arkadaşlarıyla sınıf panosuna Cumhuriyet''in kuruluşunu anlatan kısa bilgiler yerleştirdi. Öğretmeni, Atatürk''ün bağımsızlık ve eğitim konusundaki çalışmalarından söz etti. Törende öğrenciler şiirler okudu ve bayraklarla yürüdü. Cevap metindeki bilgi ve çıkarıma dayanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ataturk' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-5','coktan_secmeli','Cumhuriyet Bayramı: Metnin ana konusu nedir?','["Bir gezi","Cumhuriyet Bayramı hazırlığı ve Atatürk","Bir alışveriş","Bir sağlık sorunu"]',1,'Okulda 29 Ekim için tören hazırlığı vardı. Ece arkadaşlarıyla sınıf panosuna Cumhuriyet''in kuruluşunu anlatan kısa bilgiler yerleştirdi. Öğretmeni, Atatürk''ün bağımsızlık ve eğitim konusundaki çalışmalarından söz etti. Törende öğrenciler şiirler okudu ve bayraklarla yürüdü. Cevap metindeki bilgi ve çıkarıma dayanır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ataturk' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-6','coktan_secmeli','Cumhuriyet Bayramı: Ece''nin davranışı neyi gösterir?','["Okula gelmediğini","Panoyu bozduğunu","Dersi bıraktığını","Tören hazırlığına katıldığını"]',3,'Okulda 29 Ekim için tören hazırlığı vardı. Ece arkadaşlarıyla sınıf panosuna Cumhuriyet''in kuruluşunu anlatan kısa bilgiler yerleştirdi. Öğretmeni, Atatürk''ün bağımsızlık ve eğitim konusundaki çalışmalarından söz etti. Törende öğrenciler şiirler okudu ve bayraklarla yürüdü. Cevap metindeki bilgi ve çıkarıma dayanır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ataturk' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-7','coktan_secmeli','Cumhuriyet Bayramı: En uygun başlık hangisidir?','["Kayıp Kalem","Cumhuriyet Bayramı Hazırlığı","Yağmurlu Gün","Yeni Bisiklet"]',1,'Okulda 29 Ekim için tören hazırlığı vardı. Ece arkadaşlarıyla sınıf panosuna Cumhuriyet''in kuruluşunu anlatan kısa bilgiler yerleştirdi. Öğretmeni, Atatürk''ün bağımsızlık ve eğitim konusundaki çalışmalarından söz etti. Törende öğrenciler şiirler okudu ve bayraklarla yürüdü. Cevap metindeki bilgi ve çıkarıma dayanır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ataturk' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-8','coktan_secmeli','Cumhuriyet Bayramı: Metinden hangi değer çıkarılabilir?','["İsraf","Dışlama","Kabalık","Vatanseverlik ve sorumluluk"]',3,'Okulda 29 Ekim için tören hazırlığı vardı. Ece arkadaşlarıyla sınıf panosuna Cumhuriyet''in kuruluşunu anlatan kısa bilgiler yerleştirdi. Öğretmeni, Atatürk''ün bağımsızlık ve eğitim konusundaki çalışmalarından söz etti. Törende öğrenciler şiirler okudu ve bayraklarla yürüdü. Cevap metindeki bilgi ve çıkarıma dayanır.',2,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-ataturk' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-9','coktan_secmeli','Geleneksel Oyun Günü: Etkinlik nerede yapıldı?','["Hastanede","Mahallede","Markette","Otobüste"]',1,'Mahallede geleneksel oyun günü düzenlendi. Büyükler çocuklara mendil kapmaca ve seksek gibi oyunları anlattı. Çocuklar önce kuralları öğrendi, sonra takımlar kurup oynadı. Günün sonunda herkes en sevdiği oyunun adını ve nedenini küçük kartlara yazdı. Cevap metindeki bilgi ve çıkarıma dayanır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kultur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-10','coktan_secmeli','Geleneksel Oyun Günü: Büyükler ne anlattı?','["Matematik işlemlerini","Yemek tarifini","Hava durumunu","Geleneksel oyunları"]',3,'Mahallede geleneksel oyun günü düzenlendi. Büyükler çocuklara mendil kapmaca ve seksek gibi oyunları anlattı. Çocuklar önce kuralları öğrendi, sonra takımlar kurup oynadı. Günün sonunda herkes en sevdiği oyunun adını ve nedenini küçük kartlara yazdı. Cevap metindeki bilgi ve çıkarıma dayanır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kultur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-11','coktan_secmeli','Geleneksel Oyun Günü: Çocuklar oynamadan önce ne yaptı?','["Eve gitti","Kuralları öğrendi","Kartları yırttı","Oyunu bıraktı"]',1,'Mahallede geleneksel oyun günü düzenlendi. Büyükler çocuklara mendil kapmaca ve seksek gibi oyunları anlattı. Çocuklar önce kuralları öğrendi, sonra takımlar kurup oynadı. Günün sonunda herkes en sevdiği oyunun adını ve nedenini küçük kartlara yazdı. Cevap metindeki bilgi ve çıkarıma dayanır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kultur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-12','coktan_secmeli','Geleneksel Oyun Günü: Günün sonunda ne yazdılar?','["Adreslerini","Şifrelerini","Alışveriş listesini","Sevdikleri oyunu ve nedenini"]',3,'Mahallede geleneksel oyun günü düzenlendi. Büyükler çocuklara mendil kapmaca ve seksek gibi oyunları anlattı. Çocuklar önce kuralları öğrendi, sonra takımlar kurup oynadı. Günün sonunda herkes en sevdiği oyunun adını ve nedenini küçük kartlara yazdı. Cevap metindeki bilgi ve çıkarıma dayanır.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kultur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-13','coktan_secmeli','Geleneksel Oyun Günü: Metnin konusu nedir?','["Trafik güvenliği","Geleneksel oyunların öğrenilmesi","Bir bilim deneyi","Bir alışveriş"]',1,'Mahallede geleneksel oyun günü düzenlendi. Büyükler çocuklara mendil kapmaca ve seksek gibi oyunları anlattı. Çocuklar önce kuralları öğrendi, sonra takımlar kurup oynadı. Günün sonunda herkes en sevdiği oyunun adını ve nedenini küçük kartlara yazdı. Cevap metindeki bilgi ve çıkarıma dayanır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kultur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-14','coktan_secmeli','Geleneksel Oyun Günü: Büyüklerin katkısı nedir?','["Oyunu yasaklamaları","Çocukları eve göndermeleri","Kartları saklamaları","Kültürel bilgiyi aktarmaları"]',3,'Mahallede geleneksel oyun günü düzenlendi. Büyükler çocuklara mendil kapmaca ve seksek gibi oyunları anlattı. Çocuklar önce kuralları öğrendi, sonra takımlar kurup oynadı. Günün sonunda herkes en sevdiği oyunun adını ve nedenini küçük kartlara yazdı. Cevap metindeki bilgi ve çıkarıma dayanır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kultur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-15','coktan_secmeli','Geleneksel Oyun Günü: En uygun başlık hangisidir?','["Sessiz Kütüphane","Oyunlarla Kültürümüz","Uzun Yol","Karlı Tepe"]',1,'Mahallede geleneksel oyun günü düzenlendi. Büyükler çocuklara mendil kapmaca ve seksek gibi oyunları anlattı. Çocuklar önce kuralları öğrendi, sonra takımlar kurup oynadı. Günün sonunda herkes en sevdiği oyunun adını ve nedenini küçük kartlara yazdı. Cevap metindeki bilgi ve çıkarıma dayanır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kultur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-16','coktan_secmeli','Geleneksel Oyun Günü: Bu etkinlik hangi değeri destekler?','["İsrafı","Dışlamayı","Kuralsızlığı","Kültürel mirası tanımayı"]',3,'Mahallede geleneksel oyun günü düzenlendi. Büyükler çocuklara mendil kapmaca ve seksek gibi oyunları anlattı. Çocuklar önce kuralları öğrendi, sonra takımlar kurup oynadı. Günün sonunda herkes en sevdiği oyunun adını ve nedenini küçük kartlara yazdı. Cevap metindeki bilgi ve çıkarıma dayanır.',2,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kultur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-17','coktan_secmeli','Sınıf Meclisi: Toplantının konusu neydi?','["Yemek menüsü","Teneffüs alanının kullanımı","Ev ödevi","Otobüs saati"]',1,'Sınıf, teneffüs alanının kullanımıyla ilgili sorunları konuşmak için toplantı yaptı. Her öğrenci sırayla fikrini söyledi. Bazıları sessiz oyun alanı, bazıları top oyunları için ayrı bölüm önerdi. Oylama sonunda iki alanın da oluşturulmasına karar verildi. Cevap metindeki bilgi ve çıkarıma dayanır.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-haklar' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-18','coktan_secmeli','Sınıf Meclisi: Öğrenciler fikirlerini nasıl söyledi?','["Bağırarak","Gizlice","Hiç konuşmadan","Sırayla"]',3,'Sınıf, teneffüs alanının kullanımıyla ilgili sorunları konuşmak için toplantı yaptı. Her öğrenci sırayla fikrini söyledi. Bazıları sessiz oyun alanı, bazıları top oyunları için ayrı bölüm önerdi. Oylama sonunda iki alanın da oluşturulmasına karar verildi. Cevap metindeki bilgi ve çıkarıma dayanır.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-haklar' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-19','coktan_secmeli','Sınıf Meclisi: Bir öneri neydi?','["Okulu kapatmak","Sessiz oyun alanı oluşturmak","Tüm oyunları yasaklamak","Dersleri kaldırmak"]',1,'Sınıf, teneffüs alanının kullanımıyla ilgili sorunları konuşmak için toplantı yaptı. Her öğrenci sırayla fikrini söyledi. Bazıları sessiz oyun alanı, bazıları top oyunları için ayrı bölüm önerdi. Oylama sonunda iki alanın da oluşturulmasına karar verildi. Cevap metindeki bilgi ve çıkarıma dayanır.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-haklar' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-20','coktan_secmeli','Sınıf Meclisi: Karar nasıl alındı?','["Rastgele","Tek kişinin kararıyla","Hiç karar alınmadı","Oylamayla"]',3,'Sınıf, teneffüs alanının kullanımıyla ilgili sorunları konuşmak için toplantı yaptı. Her öğrenci sırayla fikrini söyledi. Bazıları sessiz oyun alanı, bazıları top oyunları için ayrı bölüm önerdi. Oylama sonunda iki alanın da oluşturulmasına karar verildi. Cevap metindeki bilgi ve çıkarıma dayanır.',2,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-haklar' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-21','coktan_secmeli','Sınıf Meclisi: Metnin ana fikri nedir?','["Sadece bir kişi karar vermelidir.","Ortak sorunlar katılımla çözülebilir.","Kurallar gereksizdir.","Toplantı yapılmamalıdır."]',1,'Sınıf, teneffüs alanının kullanımıyla ilgili sorunları konuşmak için toplantı yaptı. Her öğrenci sırayla fikrini söyledi. Bazıları sessiz oyun alanı, bazıları top oyunları için ayrı bölüm önerdi. Oylama sonunda iki alanın da oluşturulmasına karar verildi. Cevap metindeki bilgi ve çıkarıma dayanır.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-haklar' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-22','coktan_secmeli','Sınıf Meclisi: Hangi hak kullanılmıştır?','["Başkasını susturma","Eşyayı izinsiz alma","Kuralları bozma","Görüşünü ifade etme"]',3,'Sınıf, teneffüs alanının kullanımıyla ilgili sorunları konuşmak için toplantı yaptı. Her öğrenci sırayla fikrini söyledi. Bazıları sessiz oyun alanı, bazıları top oyunları için ayrı bölüm önerdi. Oylama sonunda iki alanın da oluşturulmasına karar verildi. Cevap metindeki bilgi ve çıkarıma dayanır.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-haklar' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-23','coktan_secmeli','Sınıf Meclisi: Hangi sorumluluk öne çıkar?','["Bağırmak","Başkalarının görüşünü dinlemek","Sırayı bozmak","Oylamayı engellemek"]',1,'Sınıf, teneffüs alanının kullanımıyla ilgili sorunları konuşmak için toplantı yaptı. Her öğrenci sırayla fikrini söyledi. Bazıları sessiz oyun alanı, bazıları top oyunları için ayrı bölüm önerdi. Oylama sonunda iki alanın da oluşturulmasına karar verildi. Cevap metindeki bilgi ve çıkarıma dayanır.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-haklar' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-24','coktan_secmeli','Sınıf Meclisi: En uygun başlık hangisidir?','["Kayıp Defter","Mutfakta Pasta","Uzun Yol","Sınıf Meclisinde Ortak Karar"]',3,'Sınıf, teneffüs alanının kullanımıyla ilgili sorunları konuşmak için toplantı yaptı. Her öğrenci sırayla fikrini söyledi. Bazıları sessiz oyun alanı, bazıları top oyunları için ayrı bölüm önerdi. Oylama sonunda iki alanın da oluşturulmasına karar verildi. Cevap metindeki bilgi ve çıkarıma dayanır.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-haklar' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-25','coktan_secmeli','Yağmur Suyu Projesi: Kulübün amacı neydi?','["Çatıyı boyamak","Yağmur suyunu bitki sulamada kullanmak","Bahçeyi kapatmak","Dersi iptal etmek"]',1,'Okulun bilim kulübü, bahçedeki bitkileri sulamak için yağmur suyundan yararlanmayı düşündü. Öğrenciler önce çatının yağmur alan bölümünü gözlemledi. Sonra öğretmenleriyle güvenli bir toplama kabı planladı. Birkaç yağıştan sonra toplanan suyu bitkilerde kullandılar ve çeşme suyundan daha az yararlandıklarını fark ettiler. Cevap metindeki bilgi ve çıkarıma dayanır.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-derin-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-26','coktan_secmeli','Yağmur Suyu Projesi: Öğrenciler ilk ne yaptı?','["Suyu döktü","Bitkileri kesti","Kabı attı","Çatıyı gözlemledi"]',3,'Okulun bilim kulübü, bahçedeki bitkileri sulamak için yağmur suyundan yararlanmayı düşündü. Öğrenciler önce çatının yağmur alan bölümünü gözlemledi. Sonra öğretmenleriyle güvenli bir toplama kabı planladı. Birkaç yağıştan sonra toplanan suyu bitkilerde kullandılar ve çeşme suyundan daha az yararlandıklarını fark ettiler. Cevap metindeki bilgi ve çıkarıma dayanır.',1,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-derin-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-27','coktan_secmeli','Yağmur Suyu Projesi: Toplama kabını kiminle planladılar?','["Şoförle","Öğretmenleriyle","Komşuyla","Satıcıyla"]',1,'Okulun bilim kulübü, bahçedeki bitkileri sulamak için yağmur suyundan yararlanmayı düşündü. Öğrenciler önce çatının yağmur alan bölümünü gözlemledi. Sonra öğretmenleriyle güvenli bir toplama kabı planladı. Birkaç yağıştan sonra toplanan suyu bitkilerde kullandılar ve çeşme suyundan daha az yararlandıklarını fark ettiler. Cevap metindeki bilgi ve çıkarıma dayanır.',1,27,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-derin-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-28','coktan_secmeli','Yağmur Suyu Projesi: Toplanan su nerede kullanıldı?','["İçme suyu olarak","Elektrik üretiminde","Kitap temizlemede","Bitkileri sulamada"]',3,'Okulun bilim kulübü, bahçedeki bitkileri sulamak için yağmur suyundan yararlanmayı düşündü. Öğrenciler önce çatının yağmur alan bölümünü gözlemledi. Sonra öğretmenleriyle güvenli bir toplama kabı planladı. Birkaç yağıştan sonra toplanan suyu bitkilerde kullandılar ve çeşme suyundan daha az yararlandıklarını fark ettiler. Cevap metindeki bilgi ve çıkarıma dayanır.',2,28,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-derin-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-29','coktan_secmeli','Yağmur Suyu Projesi: Projenin sonucu ne oldu?','["Daha çok çeşme suyu kullanıldı","Çeşme suyu kullanımı azaldı","Bitkiler kaldırıldı","Yağmur durdu"]',1,'Okulun bilim kulübü, bahçedeki bitkileri sulamak için yağmur suyundan yararlanmayı düşündü. Öğrenciler önce çatının yağmur alan bölümünü gözlemledi. Sonra öğretmenleriyle güvenli bir toplama kabı planladı. Birkaç yağıştan sonra toplanan suyu bitkilerde kullandılar ve çeşme suyundan daha az yararlandıklarını fark ettiler. Cevap metindeki bilgi ve çıkarıma dayanır.',1,29,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-derin-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-30','coktan_secmeli','Yağmur Suyu Projesi: Bu proje hangi değeri destekler?','["İsraf","Dışlama","Kabalık","Tasarruf ve çevre sorumluluğu"]',3,'Okulun bilim kulübü, bahçedeki bitkileri sulamak için yağmur suyundan yararlanmayı düşündü. Öğrenciler önce çatının yağmur alan bölümünü gözlemledi. Sonra öğretmenleriyle güvenli bir toplama kabı planladı. Birkaç yağıştan sonra toplanan suyu bitkilerde kullandılar ve çeşme suyundan daha az yararlandıklarını fark ettiler. Cevap metindeki bilgi ve çıkarıma dayanır.',1,30,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-derin-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-31','coktan_secmeli','Yağmur Suyu Projesi: Metinde hangi süreç vardır?','["Sadece tahmin","Gözlem, planlama, uygulama ve sonuç","Sadece oyun","Sadece alışveriş"]',1,'Okulun bilim kulübü, bahçedeki bitkileri sulamak için yağmur suyundan yararlanmayı düşündü. Öğrenciler önce çatının yağmur alan bölümünü gözlemledi. Sonra öğretmenleriyle güvenli bir toplama kabı planladı. Birkaç yağıştan sonra toplanan suyu bitkilerde kullandılar ve çeşme suyundan daha az yararlandıklarını fark ettiler. Cevap metindeki bilgi ve çıkarıma dayanır.',1,31,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-derin-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-metin-32','coktan_secmeli','Yağmur Suyu Projesi: En uygun başlık hangisidir?','["Yeni Kalem","Kış Tatili","Otobüs Yolculuğu","Yağmur Suyunu Değerlendiriyoruz"]',3,'Okulun bilim kulübü, bahçedeki bitkileri sulamak için yağmur suyundan yararlanmayı düşündü. Öğrenciler önce çatının yağmur alan bölümünü gözlemledi. Sonra öğretmenleriyle güvenli bir toplama kabı planladı. Birkaç yağıştan sonra toplanan suyu bitkilerde kullandılar ve çeşme suyundan daha az yararlandıklarını fark ettiler. Cevap metindeki bilgi ve çıkarıma dayanır.',2,32,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-derin-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kultur-1','coktan_secmeli','Kültürel mirasa örnek hangisidir?','["Tarihî yapılar ve geleneksel sanatlar","Tek kullanımlık ambalaj","Trafik ışığı","Hesap makinesi"]',0,'Kültürel miras ve farklılıklara saygı önemlidir.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kultur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kultur-2','coktan_secmeli','Bir halk oyunu öğrenmek neye katkı sağlayabilir?','["Suyu artırmaya","Elektriği ölçmeye","Kültürü tanımaya","Hava tahminine"]',2,'Kültürel miras ve farklılıklara saygı önemlidir.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kultur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kultur-3','coktan_secmeli','Müzede tarihî esere nasıl davranılmalıdır?','["Koruma kurallarına uygun","Dokunup değiştirmek","Üzerine yazmak","Yere bırakmak"]',0,'Kültürel miras ve farklılıklara saygı önemlidir.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kultur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kultur-4','coktan_secmeli','Aile büyüklerinden eski bayramları dinlemek ne sağlar?','["Matematik işlemi öğrenmeyi","Hava ölçmeyi","Geçmiş kültürü tanımayı","Elektrik üretmeyi"]',2,'Kültürel miras ve farklılıklara saygı önemlidir.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kultur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kultur-5','coktan_secmeli','Yerel yemekler, oyunlar ve el sanatları neyin parçasıdır?','["Kültürün","Kütlenin","Uzunluğun","Sıcaklığın"]',0,'Kültürel miras ve farklılıklara saygı önemlidir.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kultur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-kultur-6','coktan_secmeli','Kültürel farklılıklara nasıl yaklaşmalıyız?','["Alayla","Dışlayarak","Saygıyla","Yasaklayarak"]',2,'Kültürel miras ve farklılıklara saygı önemlidir.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-kultur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-hak-1','coktan_secmeli','Eğitim almak çocuklar için nedir?','["Bir ceza","Bir oyuncak","Bir hak","Bir yasak"]',2,'Hak ve sorumluluklar birlikte düşünülür.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-haklar' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-hak-2','coktan_secmeli','Sınıf eşyalarını korumak nedir?','["Bir sorumluluk","Bir hak değildir","Bir oyun","Bir ödül"]',0,'Hak ve sorumluluklar birlikte düşünülür.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-haklar' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-hak-3','coktan_secmeli','Başkalarının söz hakkına saygı göstermek neyi destekler?','["Dışlamayı","Kabalığı","Adil katılımı","Hileyi"]',2,'Hak ve sorumluluklar birlikte düşünülür.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-haklar' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-hak-4','coktan_secmeli','Kendi özel bilgilerimizi kimlerle paylaşmalıyız?','["Güvenilir yetişkinlerle gerektiğinde","İnternette herkesle","Tanımadığımız kişilerle","Oyun sohbetinde herkesle"]',0,'Hak ve sorumluluklar birlikte düşünülür.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-haklar' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-hak-5','coktan_secmeli','Haklarımızı kullanırken neye dikkat etmeliyiz?','["Sadece kendi isteğimize","Kuralları bozmaya","Başkalarının haklarına da","Kimseyi dinlememeye"]',2,'Hak ve sorumluluklar birlikte düşünülür.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-haklar' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-hak-6','coktan_secmeli','Ortak alanda sıra beklemek neyi gösterir?','["Adalet ve saygı","Hile","İsraf","Kabalık"]',0,'Hak ve sorumluluklar birlikte düşünülür.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-haklar' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-hak-7','coktan_secmeli','Bir karar tüm sınıfı etkiliyorsa ne yapmak yararlıdır?','["Sadece bir kişiyi dinlemek","Kimseye sormamak","Farklı görüşleri dinlemek","Kararı gizlemek"]',2,'Hak ve sorumluluklar birlikte düşünülür.',1,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-haklar' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr3-hak-8','coktan_secmeli','Sorumluluk yerine getirilmezse ne yapılmalıdır?','["Eksikliği fark edip düzeltmeye çalışmak","Başkasını suçlamak","Görevi saklamak","Kuralları kaldırmak"]',0,'Hak ve sorumluluklar birlikte düşünülür.',1,27,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='tr3-haklar' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;
