SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'hb2-okul-konu','Ben ve Okulum','Ben ve Okulum','Bireysel özellikleri, okul yaşamındaki görevleri, iletişim ve sınıf sorumluluğunu geliştirir.','Farklı özelliklere saygı duyar, sınıf görevini yerine getirir.',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='hb2-okul'
WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'hb2-saglik-konu','Sağlığım ve Güvenliğim','Sağlığım ve Güvenliğim','Sağlıklı yaşam alışkanlıklarını, kişisel güvenliği, trafik ve acil durum davranışlarını uygular.','Güvenli geçiş noktalarını kullanır, kişisel bilgilerini korur.',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='hb2-saglik'
WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'hb2-aile-konu','Ailem ve Toplum','Ailem ve Toplum','Aile içi görev, dayanışma, komşuluk, nezaket ve toplumsal sorumlulukları fark eder.','Evde yaşına uygun görevleri paylaşır.',300,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='hb2-aile'
WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'hb2-ulkem-konu','Yaşadığım Yer ve Ülkem','Yaşadığım Yer ve Ülkem','Yakın çevre, yön, ülke, millî semboller, Atatürk ve ortak günleri tanır.','Türkiye''nin başkentinin Ankara olduğunu bilir.',400,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='hb2-ulkem'
WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'hb2-doga-konu','Doğa ve Çevre','Doğa ve Çevre','Canlıların ihtiyaçlarını, doğa olaylarını, kaynak kullanımını, geri dönüşümü ve afet güvenliğini fark eder.','Su, enerji ve doğal kaynakları dikkatli kullanır.',500,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='hb2-doga'
WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'hb2-bilim-konu','Bilim, Teknoloji ve Sanat','Bilim, Teknoloji ve Sanat','Merak eder, araştırır, teknolojiyi güvenli kullanır, tasarım ve sanat üretimlerini fark eder.','Sorular sorar, gözlem yapar ve güvenli çözüm fikirleri geliştirir.',600,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='hb2-bilim'
WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'gs2-hayat-konu','Hayat ve Sanat','Hayat ve Sanat','Çevredeki biçim, renk, doku ve doğal-yapay nesnelerden görsel fikir üretir.','Doğadaki yaprak dokusu resimde kullanılabilir.',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='gs2-hayat'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'gs2-dil-konu','Sanatın Görsel Dili','Sanatın Görsel Dili','Çizgi, şekil, renk, doku, ritim ve düzen ilişkilerini fark eder.','Tekrarlanan şekiller görsel ritim oluşturabilir.',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='gs2-dil'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'gs2-sanatci-konu','Sanatçılar ve Eserleri','Sanatçılar ve Eserleri','Sanatçıların eserlerini konu, malzeme ve duygu yönünden gözlemler.','Bir natürmortta cansız nesneler konu olabilir.',300,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='gs2-sanatci'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'gs2-cizim-konu','Çizim ve Görsel İfade','Çizim ve Görsel İfade','Gözlem ve hayal gücünü çizgi, şekil ve kompozisyonla anlatır.','Doğa manzarası çizilebilir.',400,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='gs2-cizim'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'gs2-renk-konu','Renk ve Estetik','Renk ve Estetik','Ana ve ara renkleri, sıcak-soğuk renk etkilerini temel düzeyde fark eder.','Sarı + mavi = yeşil.',500,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='gs2-renk'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'gs2-milli-konu','Millî Değerler ve Sanat','Millî Değerler ve Sanat','Millî ve kültürel değerleri görsel çalışmalarla ifade eder.','Millî bayram afişi tasarlanabilir.',600,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='gs2-milli'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'gs2-muze-konu','Müze ve Kültür','Müze ve Kültür','Müze, sanat eseri ve kültürel varlıkların korunmasına uygun davranır.','Müzede eserler kurallara uygun incelenir.',700,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='gs2-muze'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'muz2-dil-konu','Müzik Dili','Müzik Dili','Ritim, tempo, gürlük, ses kaynakları ve birlikte söyleme becerilerini geliştirir.','Hızlı-yavaş ve kuvvetli-hafif sesleri ayırt edebiliriz.',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='muz2-dil'
WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'muz2-kultur-konu','Müzik Kültürü','Müzik Kültürü','Müzik dinleme kuralları, çalgılar, ortak repertuvar ve belirli günlere ait müzikleri tanır.','Bir eseri saygıyla dinler, ritim çalgılarını tanır.',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='muz2-kultur'
WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'be2-hareket-konu','Hareketimi Geliştiriyorum','Hareketimi Geliştiriyorum','Koşma, sıçrama, denge, atma-yakalama ve nesne kontrolü becerilerini geliştirir.','Topu kontrollü atıp yakalamak nesne kontrolüdür.',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='be2-hareket'
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'be2-kural-konu','Oyunun Kurallarını Uyguluyorum','Oyunun Kurallarını Uyguluyorum','Oyun kurallarını, basit taktikleri, adil oyun ve takım iş birliğini uygular.','Sıraya uymak ve rakibe saygı göstermek adil oyundur.',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='be2-kural'
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'be2-ritim-konu','Ritimle Hareket Ediyorum','Ritimle Hareket Ediyorum','Farklı tempo ve ritimlere bireysel, eşli ve grup hareketleriyle uyum sağlar.','Hızlı ritimde hareket hızı artabilir.',300,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='be2-ritim'
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',2,'be2-saglik-konu','Sağlığım İçin Fiziksel Aktiviteye Katılıyorum','Sağlığım İçin Fiziksel Aktiviteye Katılıyorum','Fiziksel aktivitenin sağlıkla ilişkisini, ısınma, soğuma, su, uyku ve güvenli ortamı fark eder.','Etkinlik öncesi ısınır, sonrasında su içer.',400,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=2 AND b.kod='be2-saglik'
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-1','coktan_secmeli','Arkadaşının senden farklı bir ilgi alanı varsa ne yapmalısın?','["Onunla alay etmelisin.","İlgisine saygı göstermelisin.","Fikrini değiştirmeye zorlamalısın.","Onu oyundan çıkarmalısın."]',1,'Farklılıklara saygı göstermek birlikte yaşamı kolaylaştırır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-2','coktan_secmeli','Sınıfta görevli olduğun gün ne yapmalısın?','["Görevi başkasına habersiz bırakmalısın.","Hiç yapmamalısın.","Malzemeleri saklamalısın.","Görevini zamanında yerine getirmelisin."]',3,'Sınıf görevi sorumluluk gerektirir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-3','coktan_secmeli','Grup çalışmasında herkesin fikrini dinlemek neyi gösterir?','["Kuralsızlığı","Saygılı iletişimi","İsrafı","Dikkatsizliği"]',1,'Fikirleri dinlemek saygılı iletişimdir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-4','coktan_secmeli','Bir arkadaşın konuşurken sözünü kesmemek hangi davranıştır?','["Hile","İsraf","Tehlike","Dinleme ve saygı"]',3,'Konuşanı dinlemek iletişim kuralıdır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-5','coktan_secmeli','Sınıfta ortak karar alınırken ne yapmak uygundur?','["Sadece kendi fikrini dayatmak","Fikirleri dinleyip birlikte karar vermek","Bağırmak","Oylamayı bozmak"]',1,'Ortak karar katılım ve saygı gerektirir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-6','coktan_secmeli','Sınıf malzemelerini nasıl kullanmalıyız?','["Kırarak","Eve götürerek","Saklayarak","Özenli ve ortak kullanım kurallarına uygun"]',3,'Ortak eşyaları korumak sorumluluktur.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-7','coktan_secmeli','Bir arkadaşın yeni geldiğinde ne yapabilirsin?','["Onu yalnız bırakabilirsin.","Okulu tanımasına yardımcı olabilirsin.","Eşyalarını saklayabilirsin.","Sınıftan çıkmasını isteyebilirsin."]',1,'Yeni arkadaşın uyumuna destek olmak iyi bir davranıştır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-8','coktan_secmeli','Ders sırasında anlamadığın bir konu olursa ne yapmalısın?','["Hiç dinlememelisin.","Arkadaşını rahatsız etmelisin.","Defteri kapatıp bırakmalısın.","Uygun zamanda soru sormalısın."]',3,'Soru sormak öğrenmeye yardımcı olur.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-9','coktan_secmeli','Sınıfta bir sorun yaşandığında en uygun yol hangisidir?','["Bağırmak","Sakin konuşup çözüm aramak","İtmek","Eşyaları fırlatmak"]',1,'Sorunlar konuşarak çözülebilir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-10','coktan_secmeli','Okuldaki kurallar neden vardır?','["Sadece ceza vermek için","Oyunları yasaklamak için","Kimse konuşmasın diye","Güvenli ve düzenli bir ortam için"]',3,'Kurallar ortak yaşamı düzenler.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-11','coktan_secmeli','Kütüphaneden aldığın kitabı ne yapmalısın?','["Sayfalarını koparmalısın.","Zamanında ve özenli biçimde geri vermelisin.","Kaybetmelisin.","Üzerine yazmalısın."]',1,'Ödünç eşya sorumlulukla korunur.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-12','coktan_secmeli','Bir arkadaşın hata yaptığında ne yapmak uygundur?','["Alay etmek","Herkese anlatmak","Onu dışlamak","Nazikçe yardımcı olmak"]',3,'Destekleyici olmak olumlu sınıf ortamı oluşturur.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-13','coktan_secmeli','Sınıfın temiz kalması kimin sorumluluğudur?','["Sadece öğretmenin","Herkesin","Sadece görevlinin","Kimsenin"]',1,'Ortak alanı korumak herkesin sorumluluğudur.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-14','coktan_secmeli','Bir arkadaşının fikrine katılmıyorsan ne yapabilirsin?','["Bağırabilirsin.","Onu küçümseyebilirsin.","Konuşmasını engelleyebilirsin.","Saygılı biçimde kendi fikrini söyleyebilirsin."]',3,'Farklı görüşler saygıyla konuşulabilir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-15','coktan_secmeli','Okula zamanında gelmek neye örnektir?','["İsraf","Sorumluluk","Dikkatsizlik","Kuralsızlık"]',1,'Zamanında gelmek sorumluluk davranışıdır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-16','coktan_secmeli','Bir grup görevinde kendi bölümünü tamamlamak neyi gösterir?','["Hile","Kabalık","İsraf","Sorumluluk"]',3,'Üstlenilen işi tamamlamak sorumluluktur.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-17','coktan_secmeli','Okul eşyasını yanlışlıkla kırarsan ne yapmalısın?','["Saklamalısın.","Bir yetişkine haber verip hatanı açıklamalısın.","Başkasını suçlamalısın.","Kırık parçayı bırakmalısın."]',1,'Hatanın sorumluluğunu almak doğrudur.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-18','coktan_secmeli','Teneffüste oyun alanını paylaşmak neden önemlidir?','["Sadece hızlı koşmak için","Alanı boş bırakmak için","Oyunu bitirmek için","Herkesin güvenle oynayabilmesi için"]',3,'Ortak alanı paylaşmak herkesin hakkına saygıdır.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-19','coktan_secmeli','Bir arkadaşın konuşmak istemiyorsa ne yapmalısın?','["Zorla konuşturmalısın.","Kişisel alanına saygı göstermelisin.","Eşyasını almalısın.","Onu takip etmelisin."]',1,'Kişisel sınırlara saygı önemlidir.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-okul-20','coktan_secmeli','Öğretmen yönerge verirken ne yapmak en doğrudur?','["Arkadaşınla yüksek sesle konuşmak","Sınıfta dolaşmak","Yönergeyi önemsememek","Dikkatle dinlemek"]',3,'Yönergeyi dinlemek görevi doğru yapmayı sağlar.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-1','coktan_secmeli','Dişlerimizi düzenli fırçalamak neye yardımcı olur?','["Daha hızlı koşmaya","Ağız ve diş sağlığını korumaya","Boyumuzu anında uzatmaya","Kitap okumaya"]',1,'Diş temizliği ağız sağlığının parçasıdır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-2','coktan_secmeli','Ellerimizi hangi durumda yıkamak önemlidir?','["Sadece haftada bir","Hiçbir zaman","Sadece oyun bitince","Yemekten önce ve tuvaletten sonra"]',3,'El yıkamak mikropların yayılmasını azaltır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-3','coktan_secmeli','Sağlıklı bir kahvaltıda hangisi bulunabilir?','["Sadece şeker","Dengeli besinler ve su/süt","Sadece cips","Sadece gazlı içecek"]',1,'Dengeli kahvaltı büyüme ve enerji için önemlidir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-4','coktan_secmeli','Yeterli uyku ne sağlar?','["Uyku gereksizdir.","Sadece hafta sonu gerekir.","Yemek yerine geçer.","Dinlenmeye ve öğrenmeye destek olur."]',3,'Uyku beden ve zihnin dinlenmesine yardım eder.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-5','coktan_secmeli','Yaya geçidinde karşıya geçmeden önce ne yapılmalıdır?','["Koşarak yola çıkmak","Trafiği kontrol edip güvenli işareti beklemek","Telefonla ilgilenmek","Gözleri kapatmak"]',1,'Trafiği kontrol etmek güvenli geçişin parçasıdır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-6','coktan_secmeli','Araçta emniyet kemeri neden kullanılır?','["Daha hızlı gitmek için","Camı açmak için","Müzik dinlemek için","Güvenliği artırmak için"]',3,'Emniyet kemeri koruyucu bir güvenlik aracıdır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-7','coktan_secmeli','Bisiklet sürerken hangisi önemlidir?','["Gözleri kapatmak","Kask kullanmak","Trafiğe ters gitmek","Ellerini bırakmak"]',1,'Kask başı korumaya yardımcı olur.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-8','coktan_secmeli','Tanımadığın biri ev adresini sorarsa ne yapmalısın?','["Adresi hemen vermelisin.","Telefon şifreni de söylemelisin.","Onunla gitmelisin.","Bilgiyi paylaşmayıp güvendiğin yetişkine söylemelisin."]',3,'Kişisel bilgiler korunmalıdır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-9','coktan_secmeli','İnternette şifreler kiminle paylaşılmamalıdır?','["Güvenli kullanım için hiç kimseyle rastgele","Tanımadığımız kişilerle","Herkesle","Oyun sohbetindeki kişilerle"]',1,'Şifreler özel bilgiler arasındadır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-10','coktan_secmeli','Acil durumda 112 ne için kullanılır?','["Saat sormak için","Şaka yapmak için","Oyun oynamak için","Gerçek acil yardım gerektiğinde"]',3,'112 acil yardım içindir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-11','coktan_secmeli','Yangın gördüğünde ne yapmalısın?','["Yangına yaklaşmalısın.","Güvenli alana geçip yetişkine/acil birime haber vermelisin.","Saklanmalısın.","Asansöre koşmalısın."]',1,'Yangında güvenli tahliye ve yardım çağrısı önemlidir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-12','coktan_secmeli','Deprem anında öğretmenin yönergesini neden izlemelisin?','["Daha hızlı koşmak için","Dersi bitirmek için","Çantayı almak için","Güvenli hareket etmek için"]',3,'Afet yönergeleri güvenlik içindir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-13','coktan_secmeli','Islak zeminde en uygun davranış hangisidir?','["Koşmak","Yavaş ve dikkatli yürümek","Zıplamak","Birini itmek"]',1,'Islak zemin kaygan olabilir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-14','coktan_secmeli','İlaçları kimlerin yönlendirmesiyle kullanmalıyız?','["Arkadaşların","İnternet oyunlarının","Kendi tahminimizin","Doktor ve sorumlu yetişkinlerin"]',3,'İlaçlar yetişkin ve sağlık uzmanı kontrolünde kullanılmalıdır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-15','coktan_secmeli','Güneşli sıcak günde ne yapmak önemlidir?','["Hiç su içmemek","Su içmek ve uygun korunmak","Uzun süre güneşte kalmak","Kalın kışlık giymek"]',1,'Sıcak havada su ve uygun korunma önemlidir.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-16','coktan_secmeli','Kişisel alanımıza istemediğimiz şekilde yaklaşılırsa ne yapabiliriz?','["Sessiz kalmak zorundayız.","Her şeyi kabul etmeliyiz.","Kimseye söylememeliyiz.","Hayır deyip güvenilir bir yetişkine söyleyebiliriz."]',3,'Kişisel sınırlar korunmalıdır.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-17','coktan_secmeli','Güvenli oyun alanı hangisidir?','["Araç yolu","Trafikten uzak uygun oyun alanı","İnşaat alanı","Kaygan merdiven"]',1,'Oyun güvenli alanlarda oynanmalıdır.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-18','coktan_secmeli','Sağlıklı içecek seçimine örnek hangisidir?','["Sürekli gazlı içecek","Çok şekerli içecek her öğünde","Hiç sıvı tüketmemek","Su"]',3,'Su vücudun sıvı ihtiyacı için temel içecektir.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-19','coktan_secmeli','Uzun süre ekrana bakarken ne yapmak uygundur?','["Saatlerce hiç ara vermemek","Ara verip gözleri ve bedeni dinlendirmek","Karanlıkta çok yakından bakmak","Uyku yerine ekran kullanmak"]',1,'Düzenli ara vermek sağlıklı kullanım alışkanlığıdır.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-saglik-20','coktan_secmeli','Bir kaza gördüğünde önce neyi düşünmelisin?','["Tehlikenin içine girmeyi","Olayı oyun sanmayı","Hiç kimseye söylememeyi","Kendi güvenliğini ve yardım çağırmayı"]',3,'Yardım ederken kendi güvenliğimiz de önemlidir.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-1','coktan_secmeli','Evde yaşına uygun bir sorumluluk hangisidir?','["Tek başına elektrik tamiri yapmak","Odasını/oyuncaklarını düzenlemek","Ağır mobilya taşımak","Ocakta yalnız yemek yapmak"]',1,'Yaşa uygun görevler sorumluluk geliştirir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-2','coktan_secmeli','Ailede görev paylaşımı neden önemlidir?','["Sadece bir kişiyi yormak için","Kimse görev yapmasın diye","Kuralları kaldırmak için","İşlerin birlikte ve düzenli yürütülmesine yardımcı olur."]',3,'Görev paylaşımı dayanışmayı güçlendirir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-3','coktan_secmeli','Bir aile bireyi yorgunsa ne yapılabilir?','["Onu rahatsız edebiliriz.","Yapabileceğimiz bir işte yardımcı olabiliriz.","İşini artırabiliriz.","Eşyasını saklayabiliriz."]',1,'Yardımlaşma aile bağlarını güçlendirir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-4','coktan_secmeli','Komşuya selam vermek hangi davranışa örnektir?','["İsraf","Tehlike","Kuralsızlık","Nezaket"]',3,'Selamlaşmak toplumsal nezakettir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-5','coktan_secmeli','Komşunun rahatsız olacağı kadar yüksek sesle müzik açmak doğru mudur?','["Evet her zaman","Hayır","Sadece gece","Komşu önemli değil"]',1,'Ortak yaşamda başkalarının huzuruna saygı gerekir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-6','coktan_secmeli','Bir büyüğümüz konuşurken ne yapmalıyız?','["Sözünü kesmeliyiz.","Bağırmalıyız.","Telefonla ilgilenmeliyiz.","Dikkatle dinlemeliyiz."]',3,'Dinlemek saygılı iletişimdir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-7','coktan_secmeli','Ailede farklı fikirler olduğunda ne yapılabilir?','["Kavga etmek","Konuşup birbirini dinlemek","Birini susturmak","Eşyaları kırmak"]',1,'Farklı fikirler konuşarak değerlendirilebilir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-8','coktan_secmeli','Evde suyu gereksiz akıtmamak neye örnektir?','["İsraf","Oyun","Gürültü","Tasarruf"]',3,'Kaynakları dikkatli kullanmak tasarruftur.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-9','coktan_secmeli','Elektriği gereksiz yanan odada ne yapabiliriz?','["Daha çok ışık açabiliriz.","Işığı kapatabiliriz.","Kapıyı kilitleyebiliriz.","Suyu açabiliriz."]',1,'Gereksiz elektriği kapatmak tasarruftur.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-10','coktan_secmeli','Aile fotoğrafları ve anıları neyi destekleyebilir?','["Trafik kuralını","Matematik işlemini","Hava durumunu","Aile geçmişini tanımayı"]',3,'Anılar aile geçmişi hakkında bilgi verir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-11','coktan_secmeli','Bayramda büyükleri ziyaret etmek hangi değeri destekleyebilir?','["İsrafı","Aile ve toplumsal bağları","Kuralsızlığı","Dışlamayı"]',1,'Ziyaretler sosyal bağları güçlendirebilir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-12','coktan_secmeli','Bir arkadaşının ailesi seninkinden farklı olabilir mi?','["Hayır, tüm aileler aynıdır.","Sadece aynı evde yaşayanlar ailedir.","Aileler farklı olamaz.","Evet"]',3,'Aile yapıları farklı olabilir ve saygı gösterilmelidir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-13','coktan_secmeli','Evde alınan ortak karara uygun davranmak neyi gösterir?','["İsraf","Sorumluluk ve iş birliği","Korku","Dikkatsizlik"]',1,'Ortak kararlara uymak iş birliğini destekler.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-14','coktan_secmeli','Bir aile bireyinin özel eşyasını kullanmak için ne yapmalıyız?','["İzinsiz almalıyız.","Saklamalıyız.","Kırmalıyız.","İzin istemeliyiz."]',3,'Başkasının eşyasına saygı gösteririz.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-15','coktan_secmeli','Yardım kuruluşlarına uygun biçimde destek olmak hangi değeri gösterir?','["İsraf","Dayanışma","Dışlama","Hile"]',1,'Dayanışma toplumsal yardımlaşmadır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-16','coktan_secmeli','Sofra hazırlanırken yaşına uygun biçimde yardım etmek neye örnektir?','["Kuralsızlığa","Tehlikeye","Dışlamaya","Görev paylaşımına"]',3,'Aile içi işlere uygun biçimde katılmak görev paylaşımıdır.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-17','coktan_secmeli','Bir arkadaşın evine misafir olduğunda nasıl davranmalısın?','["Eşyaları izinsiz karıştırarak","Ev kurallarına ve insanlara saygılı","Yüksek sesle bağırarak","Kuralları önemsemeyerek"]',1,'Misafirlikte nezaket önemlidir.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-18','coktan_secmeli','Aile içinde teşekkür etmek neden önemlidir?','["Kuralları bozar.","İsraf oluşturur.","Kimseye faydası yoktur.","Emek ve yardımı takdir ettiğimizi gösterir."]',3,'Teşekkür olumlu iletişim kurar.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-19','coktan_secmeli','Bir sorun olduğunda aileyle konuşmak ne sağlar?','["Sorunu büyütmeyi","Birlikte çözüm bulmayı","Kimseyi dinlememeyi","Her şeyi saklamayı"]',1,'İletişim çözüm bulmayı kolaylaştırır.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-aile-20','coktan_secmeli','Komşulukta ortak alanları temiz tutmak kimin sorumluluğudur?','["Sadece bir kişinin","Kimsenin","Sadece çocukların","Kullanan herkesin"]',3,'Ortak alanları korumak toplumsal sorumluluktur.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-1','coktan_secmeli','Türkiye''nin başkenti neresidir?','["İstanbul","Ankara","İzmir","Bursa"]',1,'Türkiye''nin başkenti Ankara''dır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-2','coktan_secmeli','Türk bayrağında hangi semboller bulunur?','["Güneş ve bulut","Dağ ve ağaç","Kitap ve kalem","Ay ve yıldız"]',3,'Türk bayrağında beyaz ay ve yıldız bulunur.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-3','coktan_secmeli','İstiklâl Marşı söylenirken nasıl davranılır?','["Koşarak","Saygılı biçimde","Konuşarak","Oyun oynayarak"]',1,'Millî marşa saygı gösterilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-4','coktan_secmeli','Mustafa Kemal Atatürk kimdir?','["Bir masal kahramanıdır.","Bir şehir adıdır.","Bir spor takımıdır.","Türkiye Cumhuriyeti''nin kurucusudur."]',3,'Atatürk Türkiye Cumhuriyeti''nin kurucusudur.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-5','coktan_secmeli','29 Ekim hangi bayramdır?','["23 Nisan","Cumhuriyet Bayramı","19 Mayıs","30 Ağustos"]',1,'29 Ekim Cumhuriyet Bayramı''dır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-6','coktan_secmeli','23 Nisan hangi bayramdır?','["Cumhuriyet Bayramı","Zafer Bayramı","Yılbaşı","Ulusal Egemenlik ve Çocuk Bayramı"]',3,'23 Nisan çocuklara armağan edilmiş millî bayramdır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-7','coktan_secmeli','30 Ağustos hangi bayramdır?','["Cumhuriyet Bayramı","Zafer Bayramı","Çocuk Bayramı","Öğretmenler Günü"]',1,'30 Ağustos Zafer Bayramı''dır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-8','coktan_secmeli','Yaşadığın şehri tanımak için hangisine bakabilirsin?','["Sadece oyuncaklara","Sadece çizgi filme","Hiçbir şeye","Önemli yapılar, doğal alanlar ve çevre özelliklerine"]',3,'Şehrin özellikleri yaşadığımız yeri tanıtır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-9','coktan_secmeli','Adres bilgisi neden önemlidir?','["Yalnız oyun için","Bulunduğumuz yeri tanımlamaya yardım eder.","Renk seçmek için","Saat öğrenmek için"]',1,'Adres konumu belirtir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-10','coktan_secmeli','Evimizin çevresindeki park, okul ve market neyi tanımamıza yardım eder?','["Sadece ülke bayrağını","Sadece matematiği","Sadece müziği","Yakın çevremizi"]',3,'Yakın çevredeki yerleri tanımak yön bulmayı kolaylaştırır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-11','coktan_secmeli','Bir kroki neyi gösterebilir?','["Kütleyi","Yerlerin birbirine göre konumunu","Sıcaklığı","Yemeğin tadını"]',1,'Kroki basit konum bilgisi verir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-12','coktan_secmeli','Millî bayramlarda bayrağa nasıl davranmalıyız?','["Yere atarak","Yırtarak","Üzerine basarak","Saygılı"]',3,'Bayrak millî semboldür.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-13','coktan_secmeli','Ülkemizin adı nedir?','["Ankara","Türkiye","Avrupa","İstanbul"]',1,'Yaşadığımız ülkenin adı Türkiye''dir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-14','coktan_secmeli','Ankara nedir?','["Bir ülke","Bir deniz","Bir kıta","Türkiye''nin başkenti"]',3,'Ankara başkenttir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-15','coktan_secmeli','Farklı şehirlerde yaşayan insanların ortak yönü ne olabilir?','["Aynı evde yaşamaları","Aynı ülkenin vatandaşları olmaları","Aynı okula gitmeleri","Aynı yaşta olmaları"]',1,'Farklı şehirler aynı ülkenin parçalarıdır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-16','coktan_secmeli','Tarihî bir yapıyı korumak neden önemlidir?','["Yıkmak için","Yerine çöp bırakmak için","Sadece fotoğraf çekmek için","Kültürel mirası gelecek kuşaklara taşımak için"]',3,'Tarihî yapılar ortak mirasın parçasıdır.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-17','coktan_secmeli','Bir şehirdeki müze neyi tanımamıza yardım edebilir?','["Sadece trafik ışığını","Kültür ve geçmişi","Sadece alışverişi","Sadece sporu"]',1,'Müzeler kültürel birikimi tanıtır.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-18','coktan_secmeli','Millî günlerde törenlere uygun davranmak neyi gösterir?','["Dikkatsizlik","İsraf","Kuralsızlık","Saygı"]',3,'Ortak değerlere saygı önemlidir.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-19','coktan_secmeli','Yakın çevrede yön bulmak için hangisi kullanılabilir?','["Sadece hava durumu","Kroki ve belirgin yerler","Sadece saat","Sadece renkler"]',1,'Kroki ve işaretler yön bulmayı destekler.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-ulkem-20','coktan_secmeli','Yaşadığımız yerin doğal güzelliklerini korumak kimin sorumluluğudur?','["Kimsenin","Sadece turistlerin","Sadece çocukların","Herkesin"]',3,'Doğal ve kültürel çevre ortak sorumluluktur.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-1','coktan_secmeli','Bitkilerin büyümek için neye ihtiyacı vardır?','["Sadece oyuncak","Su, ışık ve uygun ortam","Sadece karanlık","Hiçbir şeye"]',1,'Bitkiler uygun çevre koşullarına ihtiyaç duyar.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-2','coktan_secmeli','Hayvanların temel ihtiyaçlarından biri hangisidir?','["Kalem","Televizyon","Defter","Su ve besin"]',3,'Canlıların su ve besine ihtiyacı vardır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-3','coktan_secmeli','Hangisi canlıdır?','["Taş","Ağaç","Masa","Bardak"]',1,'Ağaç canlıdır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-4','coktan_secmeli','Hangisi cansızdır?','["Kedi","Çiçek","Kuş","Kaya"]',3,'Kaya cansızdır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-5','coktan_secmeli','Sonbaharda bazı ağaçlarda ne gözlenebilir?','["Her zaman çiçek açması","Yaprakların sararıp dökülmesi","Karın sürekli yağması","Meyvenin anında büyümesi"]',1,'Mevsim değişimleri bitkileri etkileyebilir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-6','coktan_secmeli','Geri dönüşüm neye yardımcı olur?','["Daha çok çöp üretmeye","Suyu kirletmeye","Kaynakları gereksiz harcamaya","Atıkların yeniden değerlendirilmesine"]',3,'Geri dönüşüm kaynak kullanımını azaltabilir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-7','coktan_secmeli','Kâğıt atık hangi kutuya ayrılmalıdır?','["Atık pil kutusuna","Kâğıt geri dönüşüm kutusuna","Yola","Dereye"]',1,'Atıklar türüne göre ayrılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-8','coktan_secmeli','Atık pil nereye bırakılmalıdır?','["Toprağa","Suya","Normal çöpün yanına açıkça","Atık pil toplama noktasına"]',3,'Piller özel toplama noktalarına bırakılmalıdır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-9','coktan_secmeli','Suyu gereksiz akıtmamak neyi korur?','["Sadece elektriği","Su kaynaklarını","Sadece kâğıdı","Oyuncakları"]',1,'Su tasarrufu su kaynaklarını korur.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-10','coktan_secmeli','Elektriği gereksiz kullanmamak ne sağlar?','["Daha çok tüketim","Daha çok atık","Gürültü","Enerji tasarrufu"]',3,'Enerji tasarrufu kaynak kullanımını azaltır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-11','coktan_secmeli','Deprem öncesinde ailece plan yapmak neden önemlidir?','["Daha hızlı koşmak için","Ne yapacağımızı bilmek için","Eşyaları kırmak için","Afeti engellemek için"]',1,'Hazırlık afet anında doğru davranmayı destekler.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-12','coktan_secmeli','Şiddetli yağmurda dere yatağına yaklaşmak güvenli midir?','["Evet her zaman","Sadece gece","Sadece çocuklar için","Hayır"]',3,'Taşkın riski olan alanlardan uzak durmak gerekir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-13','coktan_secmeli','Çevredeki hayvanları gözlemlerken ne yapmalıyız?','["Yuvalarını bozmalıyız.","Onları rahatsız etmeden gözlemlemeliyiz.","Taş atmalıyız.","Yakalayıp eve götürmeliyiz."]',1,'Canlılara saygılı gözlem yapılmalıdır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-14','coktan_secmeli','Bir ağacın dalını gereksiz kırmamak neyi gösterir?','["İsraf","Kuralsızlık","Dikkatsizlik","Doğaya saygı"]',3,'Bitkilere zarar vermemek doğayı korur.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-15','coktan_secmeli','Mevsimler neden çevrede değişiklik oluşturur?','["Takvim boyandığı için","Sıcaklık ve hava koşulları değiştiği için","Saat durduğu için","Kitaplar değiştiği için"]',1,'Mevsimsel hava koşulları canlıları ve çevreyi etkiler.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-16','coktan_secmeli','Güneş''in bize sağladığı şeylerden biri nedir?','["Plastik","Kâğıt","Trafik","Işık ve ısı"]',3,'Güneş doğal ışık ve ısı kaynağıdır.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-17','coktan_secmeli','Gece gökyüzünde sıkça hangi gök cismini görebiliriz?','["Masa","Ay","Araba","Kitap"]',1,'Ay gece gökyüzünde görülebilir.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-18','coktan_secmeli','Cam şişeyi uygun geri dönüşüm kutusuna atmak neyi destekler?','["İsrafı","Çevre kirliliğini","Suyu boşa harcamayı","Geri dönüşümü"]',3,'Cam geri dönüştürülebilir.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-19','coktan_secmeli','Tek kullanımlık ürünleri azaltmak neye yardımcı olabilir?','["Atığı artırmaya","Atık miktarını azaltmaya","Suyu kirletmeye","Enerjiyi gereksiz harcamaya"]',1,'Yeniden kullanım atığı azaltabilir.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-doga-20','coktan_secmeli','Piknikten sonra alanı temiz bırakmak neyi gösterir?','["Dikkatsizlik","İsraf","Kuralsızlık","Çevre sorumluluğu"]',3,'Doğal alanı temiz bırakmak çevreyi korur.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-1','coktan_secmeli','Bir şeyi merak ettiğinde ilk ne yapabilirsin?','["Sonucu uydurabilirsin.","Soru sorabilirsin.","Malzemeyi kırabilirsin.","Hiç düşünmemelisin."]',1,'Soru sormak araştırmanın başlangıcı olabilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-2','coktan_secmeli','Gözlem yaparken ne önemlidir?','["Sonucu değiştirmek","Tahmini gerçek saymak","Gözlerini kapatmak","Dikkatli bakmak ve doğru not almak"]',3,'Gözlem doğru bilgi toplamaya yardım eder.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-3','coktan_secmeli','Bir deney yaparken önce neye dikkat edilir?','["En hızlı olmaya","Güvenlik yönergelerine","Malzemeyi rastgele karıştırmaya","Sonucu tahmin edip yazmaya"]',1,'Deneyde güvenlik önceliklidir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-4','coktan_secmeli','Bir tahmin yanlış çıkarsa ne yapmalıyız?','["Sonucu değiştirmeliyiz.","Deneyi saklamalıyız.","Başkalarını suçlamalıyız.","Sonucu kabul edip nedenini düşünmeliyiz."]',3,'Bilimde sonuçlar dürüstçe değerlendirilir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-5','coktan_secmeli','Teknolojik araçları kullanırken ne yapılmalıdır?','["Kablolarla oynanmalıdır.","Güvenli ve amacına uygun kullanılmalıdır.","Şifreler paylaşılmalıdır.","İzinsiz uygulamalar açılmalıdır."]',1,'Teknoloji güvenli kullanılmalıdır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-6','coktan_secmeli','İnternette gördüğümüz her bilgi kesin doğru mudur?','["Evet, her zaman","Sadece renkliyse","Sadece videoysa","Hayır"]',3,'Bilgiyi güvenilir kaynaklardan kontrol etmek gerekir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-7','coktan_secmeli','Bir çözüm tasarlarken ilk ne yapılabilir?','["Malzemeyi atmak","Sorunu anlamak","Sonucu uydurmak","Çizimi yırtmak"]',1,'Sorunu anlamak çözüm üretmenin temelidir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-8','coktan_secmeli','Bir tasarım işe yaramazsa ne yapılabilir?','["Hemen vazgeçmek gerekir.","Sonuç uydurulur.","Malzeme saklanır.","Geliştirilip yeniden denenebilir."]',3,'Deneme ve geliştirme tasarım sürecinin parçasıdır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-9','coktan_secmeli','Sanat çalışmasında farklı malzemeler kullanılabilir mi?','["Hayır, tek malzeme zorunlu","Evet","Sadece kalem kullanılır","Sanat malzeme kullanmaz"]',1,'Sanat farklı malzemelerle yapılabilir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-10','coktan_secmeli','Bir müzede sanat eserine nasıl davranılmalıdır?','["Dokunup değiştirmeli","Üzerine yazmalı","Yere atmalı","Kurallara uygun ve özenli"]',3,'Eserler korunmalıdır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-11','coktan_secmeli','Bir bilim sorusu hangisi olabilir?','["Kalemim neden mavi? sadece tercih olarak","Bitki ışıkta nasıl büyür?","En güzel renk hangisi?","Ben hangi oyunu severim?"]',1,'Gözlem ve araştırmayla incelenebilen soru bilimsel merak oluşturur.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-12','coktan_secmeli','Verileri kaydetmek neden önemlidir?','["Unutmak için","Rengi değiştirmek için","Tahmini gizlemek için","Sonuçları karşılaştırmak için"]',3,'Kayıtlar gözlemleri karşılaştırmayı sağlar.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-13','coktan_secmeli','Bir problemi çözmek için birden fazla fikir olabilir mi?','["Hayır","Evet","Sadece öğretmenin fikri olur","Tek çözüm her zaman zorunludur"]',1,'Farklı çözüm yolları denenebilir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-14','coktan_secmeli','Bir teknolojik ürün bozulduğunda çocuk ne yapmalıdır?','["Elektrik aksamını kendi açmalıdır.","Su dökmelidir.","Kabloyu çekiştirmelidir.","Güvenilir bir yetişkinden yardım istemelidir."]',3,'Elektronik onarım yetişkin desteği gerektirir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-15','coktan_secmeli','Sanat eserine bakarken herkes aynı şeyi hissetmek zorunda mıdır?','["Evet","Hayır","Sadece sanatçı hisseder","Kimse yorum yapamaz"]',1,'Sanat farklı duygu ve düşünceler oluşturabilir.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-16','coktan_secmeli','Bilim insanlarının önemli özelliklerinden biri hangisidir?','["Sonuç uydurmak","Soru sormamak","Gözlem yapmamak","Meraklı ve dikkatli olmak"]',3,'Merak ve dikkat araştırmayı destekler.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-17','coktan_secmeli','Bir ürün tasarlarken kullanıcıyı düşünmek neden önemlidir?','["Sadece rengini seçmek için","Ürünün ihtiyaca uygun olması için","Daha ağır yapmak için","Sorunu büyütmek için"]',1,'Tasarım bir ihtiyaca çözüm sunmalıdır.',2,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-18','coktan_secmeli','Fotoğraf, çizim ve notlar bir gözlemde ne işe yarayabilir?','["Sonucu değiştirmeye","Deneyi bitirmeden cevap vermeye","Malzemeyi saklamaya","Bilgiyi kaydetmeye"]',3,'Kayıt araçları gözlem verilerini tutar.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-19','coktan_secmeli','Bir sanat malzemesini kullandıktan sonra ne yapılmalıdır?','["Yere bırakılmalıdır.","Düzenli ve güvenli biçimde yerine konmalıdır.","Kırılmalıdır.","Başkalarına fırlatılmalıdır."]',1,'Malzemeyi korumak sorumluluktur.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb2-bilim-20','coktan_secmeli','Bir deney sonucu arkadaşınınkinden farklıysa ne yapılabilir?','["Arkadaşın sonucu silinir.","Kavga edilir.","İki sonuç da uydurulur.","Adımlar karşılaştırılıp neden araştırılabilir."]',3,'Farklı sonuçlar araştırma fırsatı verir.',2,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='hb2-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-hayat-1','coktan_secmeli','Bir yaprağın damarlarını incelemek hangi görsel özelliği fark ettirir?','["Ses","Doku ve çizgi","Koku","Ağırlık"]',1,'Yaprakta çizgi ve doku görülebilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-hayat-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-hayat-2','coktan_secmeli','Hangisi doğal nesnedir?','["Plastik şişe","Metal kaşık","Oyuncak araba","Kozalak"]',3,'Kozalak doğada bulunur.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-hayat-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-hayat-3','coktan_secmeli','Hangisi yapay nesnedir?','["Taş","Plastik sandalye","Dal","Yaprak"]',1,'Plastik sandalye insan yapımıdır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-hayat-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-hayat-4','coktan_secmeli','Çevredeki gölgeler sanat çalışmasına fikir verebilir mi?','["Hayır","Sadece gece","Sadece müzede","Evet"]',3,'Gözlem sanat için kaynak olabilir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-hayat-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-hayat-5','coktan_secmeli','Farklı yüzeylere dokunmak neyi fark ettirebilir?','["Ses yüksekliğini","Doku farklarını","Zamanı","Kütleyi"]',1,'Pürüzlü-düz gibi dokular hissedilebilir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-hayat-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-hayat-6','coktan_secmeli','Doğadan alınan malzemeleri kullanırken ne yapılmalıdır?','["Canlı dalları gereksiz kırmak","Çöpleri doğaya bırakmak","Yuvaları bozmak","Çevreye zarar vermeden toplamak"]',3,'Sanat üretimi çevreye saygılı olmalıdır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-hayat-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-dil-1','coktan_secmeli','Kalın ve ince çizgiler arasında hangi fark vardır?','["Koku","Tat","Ses","Kalınlık"]',3,'Çizgiler kalınlık yönünden değişebilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-dil-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-dil-2','coktan_secmeli','Tekrarlanan şekiller ne oluşturabilir?','["Koku","Görsel ritim","Ses","Ağırlık"]',1,'Tekrar görsel ritim oluşturur.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-dil-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-dil-3','coktan_secmeli','Bir resmi dengeli yerleştirmek neyle ilgilidir?','["Kütle","Saat","Sıcaklık","Kompozisyon"]',3,'Kompozisyon görsel yerleşimdir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-dil-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-dil-4','coktan_secmeli','Zikzak, dalgalı ve düz ne tür ögelerdir?','["Renk türleri","Çizgi türleri","Müzik notaları","Ölçü birimleri"]',1,'Bunlar farklı çizgi türleridir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-dil-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-dil-5','coktan_secmeli','Bir şeklin büyük-küçük kullanılması neyi değiştirir?','["Kokusunu","Sesini","Tadını","Görsel etkiyi"]',3,'Boyut görsel etkiyi değiştirir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-dil-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-dil-6','coktan_secmeli','Resimde boşluk bırakmak da düzenin parçası mıdır?','["Hayır","Evet","Sadece siyah resimde","Sadece yazıda"]',1,'Dolu ve boş alanlar kompozisyonu etkiler.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-dil-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-sanatci-1','coktan_secmeli','Meyve, vazo ve kitap gibi cansız nesnelerin resmi hangi türe örnek olabilir?','["Portre","Natürmort","Manzara","Harita"]',1,'Natürmort cansız nesneleri konu alabilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-sanatci-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-sanatci-2','coktan_secmeli','Bir kişinin yüzünü ve görünüşünü anlatan resim ne olabilir?','["Natürmort","Kroki","Grafik","Portre"]',3,'Portre kişiyi konu alır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-sanatci-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-sanatci-3','coktan_secmeli','Doğa görüntülerini konu alan resim hangisine yakındır?','["Portre","Manzara","Natürmort","Tabela"]',1,'Manzara doğa/çevre görünümünü konu alır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-sanatci-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-sanatci-4','coktan_secmeli','Sanatçı aynı konuyu farklı renklerle anlatabilir mi?','["Hayır","Her eser aynı olmalı","Renk kullanılamaz","Evet"]',3,'Sanatçılar farklı seçimler yapabilir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-sanatci-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-sanatci-5','coktan_secmeli','Bir eseri incelerken hangisine bakabiliriz?','["Sadece fiyatına","Renk, şekil ve konuya","Sadece ağırlığına","Sadece çerçeve vidasına"]',1,'Görsel özellikler eseri anlamaya yardım eder.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-sanatci-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-sanatci-6','coktan_secmeli','Sanat eserleri farklı insanlarda farklı duygular uyandırabilir mi?','["Hayır","Herkes aynı hissetmeli","Kimse hissetmez","Evet"]',3,'Sanat yorumları farklı olabilir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-sanatci-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-cizim-1','coktan_secmeli','Bir doğa manzarası çizmeden önce ne yapmak yararlıdır?','["Kâğıdı yırtmak","Gözleri kapatmak","Malzemeleri saklamak","Gözlem yapmak"]',3,'Gözlem ayrıntıları fark etmeye yardım eder.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-cizim-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-cizim-2','coktan_secmeli','Yakındaki nesneyi büyük, uzaktakini küçük çizmek neyi anlatabilir?','["Sesi","Derinlik hissini","Kokuyu","Kütleyi"]',1,'Boyut farkı uzaklık hissi verebilir.',2,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-cizim-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-cizim-3','coktan_secmeli','Farklı çizgi türleri duyguyu etkileyebilir mi?','["Hayır","Sadece renkle olur","Çizgi önemsizdir","Evet"]',3,'Çizgiler görsel anlatımı etkiler.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-cizim-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-cizim-4','coktan_secmeli','Taslak çizim ne işe yarar?','["Resmi silmeye","Fikri önceden planlamaya","Kâğıdı küçültmeye","Boyayı kurutmaya"]',1,'Taslak kompozisyonu planlamaya yardım eder.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-cizim-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-cizim-5','coktan_secmeli','Bir nesneyi farklı açılardan gözlemlemek ne sağlar?','["Kokusunu değiştirmeyi","Sesini yükseltmeyi","Ağırlığını azaltmayı","Farklı görünüşlerini fark etmeyi"]',3,'Bakış açısı görünüşü değiştirir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-cizim-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-cizim-6','coktan_secmeli','Çizim araçları nasıl kullanılmalıdır?','["Fırlatarak","Güvenli ve özenli","Kırarak","Arkadaşa yönelterek"]',1,'Araç güvenliği önemlidir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-cizim-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-renk-1','coktan_secmeli','Ana renklerden biri hangisidir?','["Yeşil","Kırmızı","Turuncu","Mor"]',1,'Kırmızı ana renktir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-renk-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-renk-2','coktan_secmeli','Ana renklerden biri hangisidir?','["Yeşil","Turuncu","Mor","Sarı"]',3,'Sarı ana renktir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-renk-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-renk-3','coktan_secmeli','Ana renklerden biri hangisidir?','["Yeşil","Mavi","Turuncu","Mor"]',1,'Mavi ana renktir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-renk-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-renk-4','coktan_secmeli','Sarı ile mavi karışınca hangi ara renk oluşur?','["Turuncu","Mor","Kırmızı","Yeşil"]',3,'Sarı+mavi yeşil oluşturur.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-renk-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-renk-5','coktan_secmeli','Kırmızı ile sarı karışınca hangi renk oluşur?','["Yeşil","Turuncu","Mor","Mavi"]',1,'Kırmızı+sarı turuncu oluşturur.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-renk-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-renk-6','coktan_secmeli','Kırmızı ile mavi karışınca hangi renk oluşur?','["Yeşil","Turuncu","Sarı","Mor"]',3,'Kırmızı+mavi mor oluşturur.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-renk-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-renk-7','coktan_secmeli','Hangisi sıcak renk etkisi verebilir?','["Mavi","Turuncu","Mor her zaman","Yeşil her zaman"]',1,'Turuncu sıcak renk grubunda düşünülebilir.',2,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-renk-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-renk-8','coktan_secmeli','Hangisi daha serin bir renk etkisi verebilir?','["Kırmızı","Turuncu","Sarı","Mavi"]',3,'Mavi soğuk renk etkisi verebilir.',2,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-renk-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-milli-1','coktan_secmeli','23 Nisan için afişte hangi sembol kullanılabilir?','["Rastgele trafik levhası","Türk bayrağı","Fiyat etiketi","Yemek menüsü"]',1,'Millî bayram afişinde millî semboller kullanılabilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-milli-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-milli-2','coktan_secmeli','Millî değerleri anlatan sanat çalışmasına nasıl davranmalıyız?','["Yırtarak","Üzerine basarak","Dikkatsiz","Saygılı"]',3,'Millî değerlere saygı gösterilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-milli-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-milli-3','coktan_secmeli','Kültürel bir motif sanat çalışmasında kullanılabilir mi?','["Hayır","Evet","Sadece matematikte","Sadece sporda"]',1,'Kültürel motifler sanatta kullanılabilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-milli-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-milli-4','coktan_secmeli','Bir halk oyunu kıyafetinin desenlerini çizmek neyi tanımaya yardım eder?','["Sadece kütleyi","Sadece saati","Trafiği","Kültürel görsel ögeleri"]',3,'Geleneksel desenler kültürel mirastır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-milli-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-milli-5','coktan_secmeli','Bayrak resmi yaparken hangi renkler temel olarak kullanılır?','["Yeşil ve mavi","Kırmızı ve beyaz","Mor ve turuncu","Siyah ve pembe"]',1,'Türk bayrağında kırmızı ve beyaz vardır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-milli-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-muze-1','coktan_secmeli','Müzede eserlere dokunmadan incelemek neden önemlidir?','["Daha hızlı gezmek için","Ses çıkarmak için","Eserleri korumak için","Fotoğrafı büyütmek için"]',2,'Eserler korunmalıdır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-muze-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-muze-2','coktan_secmeli','Müzede koşmak uygun mudur?','["Hayır","Evet","Sadece kalabalıkta","Sadece çocuklar için"]',0,'Müzede güvenlik ve saygı gerekir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-muze-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-muze-3','coktan_secmeli','Fotoğraf çekme kuralını nereden öğrenebiliriz?','["Tahmin ederek","Eseri elleyerek","Müze görevlisi veya işaretlerden","Bağırarak"]',2,'Müzenin kuralları kontrol edilmelidir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-muze-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-muze-4','coktan_secmeli','Müze neyi tanımamıza yardım edebilir?','["Sanat ve kültür eserlerini","Sadece trafik kurallarını","Sadece yemekleri","Sadece sporu"]',0,'Müzeler kültürel öğrenme alanıdır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-muze-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs2-muze-5','coktan_secmeli','Bir tarihî eserin korunması neden önemlidir?','["Yok olması için","Sadece satılması için","Gelecek kuşakların da görebilmesi için","Rengini değiştirmek için"]',2,'Koruma kültürel mirası sürdürür.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='gs2-muze-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-dil-1','coktan_secmeli','Müziğin hızlı veya yavaş olması hangi kavramla ilgilidir?','["Renk","Kütle","Uzunluk","Tempo"]',3,'Tempo müziğin hızını anlatır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-dil-2','coktan_secmeli','Kuvvetli ve hafif ses arasındaki fark neyle ilgilidir?','["Renk","Gürlük","Şekil","Koku"]',1,'Sesin kuvvetli-hafif oluşu gürlükle ilgilidir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-dil-3','coktan_secmeli','Bir ritmi tekrar etmek için önce ne yapmalıyız?','["Rastgele vurmalıyız.","Çalgıyı saklamalıyız.","Koşmalıyız.","Dikkatle dinlemeliyiz."]',3,'Ritmi doğru tekrar etmek için dinlemek gerekir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-dil-4','coktan_secmeli','Alkışla ritim yapılabilir mi?','["Hayır","Evet","Sadece davulla","Sadece piyanoyla"]',1,'Beden perküsyonu ritim üretir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-dil-5','coktan_secmeli','Hızlı müzikte hareketler nasıl olabilir?','["Her zaman çok yavaş","Müzikten bağımsız","Hareketsiz zorunlu","Ritme uygun daha hızlı"]',3,'Hareket müzik temposuna uyabilir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-dil-6','coktan_secmeli','Yavaş bir ezgide hareket nasıl olabilir?','["Her zaman koşarak","Daha yavaş ve kontrollü","Ritmi önemsemeden","Bağırarak"]',1,'Hareket tempo ile uyumlu olabilir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-dil-7','coktan_secmeli','Birlikte şarkı söylerken ne önemlidir?','["Herkesten daha yüksek bağırmak","Farklı anda başlamak","Sözleri rastgele değiştirmek","Birbirini dinlemek"]',3,'Grup müziğinde uyum önemlidir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-dil-8','coktan_secmeli','Doğadaki kuş sesi ile davul sesi aynı kaynak mıdır?','["Evet","Hayır","İkisi de sessizdir","Davul ses çıkarmaz"]',1,'Biri doğal, biri çalgı kaynağıdır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-dil-9','coktan_secmeli','Ritim düzenli tekrarlarla oluşabilir mi?','["Hayır","Sadece sessizliktir","Ritim tekrar içermez","Evet"]',3,'Tekrar ritmin temel özelliklerindendir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-dil-10','coktan_secmeli','Müzikte duraklama da önemli olabilir mi?','["Hayır","Evet","Sadece ses önemlidir","Duraklama müzik değildir"]',1,'Sessizlik ve duraklamalar müziksel yapının parçası olabilir.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-dil-11','coktan_secmeli','Bir ses çok yüksekse kulağımızı korumak için ne yapmalıyız?','["Daha yakına gitmeliyiz.","Sesi artırmalıyız.","Uzun süre dinlemeliyiz.","Ses kaynağından uzaklaşmalı veya sesi azaltmalıyız."]',3,'Yüksek ses işitmeye zarar verebilir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-dil-12','coktan_secmeli','Müziğe uygun vuruş yapmak neyi takip etmeyi gerektirir?','["Rengi","Ritmi","Kokuyu","Kütleyi"]',1,'Vuruşlar ritmi izler.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-kultur-1','coktan_secmeli','Müzik dinlerken nasıl davranmalıyız?','["Sürekli konuşarak","Çalgıya dokunarak","Koşarak","Dikkatli ve saygılı"]',3,'Dinleme ortamında saygı önemlidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-kultur-2','coktan_secmeli','Hangisi ritim çalgısı olabilir?','["Cetvel ölçü aracı olarak","Tef","Kitap","Kalem kutusu"]',1,'Tef ritim çalgısıdır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-kultur-3','coktan_secmeli','Davul hangi gruba örnek olabilir?','["Yaylı her zaman","Üflemeli","Klavye","Vurmalı çalgı"]',3,'Davul vurmalı çalgıdır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-kultur-4','coktan_secmeli','Bir eserden sonra alkışlamak neyi gösterebilir?','["Eseri bozmayı","Beğeni ve saygı","Kuralsızlığı","Dikkatsizliği"]',1,'Uygun ortamda alkış takdir göstergesidir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-kultur-5','coktan_secmeli','İstiklâl Marşı söylenirken nasıl davranmalıyız?','["Konuşarak","Koşarak","Oyun oynayarak","Saygılı ve uygun biçimde"]',3,'Millî marşa saygı gösterilir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-kultur-6','coktan_secmeli','Belirli gün ve haftalarda uygun şarkılar söylemek neyi destekler?','["İsrafı","Ortak kültür ve katılımı","Dışlamayı","Gürültüyü"]',1,'Ortak repertuvar kültürel paylaşımı destekler.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-kultur-7','coktan_secmeli','Çalgılar nasıl kullanılmalıdır?','["Fırlatarak","Kırarak","İzinsiz saklayarak","Özenli ve kurallara uygun"]',3,'Çalgılar korunmalıdır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-kultur-8','coktan_secmeli','Farklı müzikleri dinlemek ne sağlar?','["Sadece tek ses duymayı","Farklı müzik kültürlerini tanımayı","Müziği unutmayı","Çalgıları bozmayı"]',1,'Farklı eserler müzik kültürünü zenginleştirir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-kultur-9','coktan_secmeli','Bir müzik grubunda herkesin birbirini dinlemesi neden önemlidir?','["Daha çok gürültü için","Kuralları bozmak için","Sadece hız için","Uyum için"]',3,'Birlikte müzikte uyum gerekir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz2-kultur-10','coktan_secmeli','Ritim çalgısını çalmadan önce ne yapılmalıdır?','["Rastgele vurulmalıdır.","Nasıl kullanılacağı öğrenilmelidir.","Yere atılmalıdır.","Parçaları sökülmelidir."]',1,'Doğru kullanım hem güvenlik hem müzik için önemlidir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='muz2-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-hareket-1','coktan_secmeli','Sekerek ilerlemek hangi beceriye örnektir?','["Okuma","Yer değiştirme hareketi","Yazma","Dinleme"]',1,'Sekme bir yer değiştirme hareketidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-hareket-2','coktan_secmeli','Tek ayak üzerinde dengede kalmak hangi beceridir?','["Nesne kontrolü","Okuma","Şarkı söyleme","Denge"]',3,'Tek ayak duruşu denge gerektirir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-hareket-3','coktan_secmeli','Topu hedefe atmak hangi beceriyle ilgilidir?','["Uyku","Nesne kontrolü","Yazma","Resim"]',1,'Atma nesne kontrolü becerisidir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-hareket-4','coktan_secmeli','Gelen topu iki elle yakalamak ne gerektirir?','["Sadece koşu","Yazı yazma","Uyuma","El-göz koordinasyonu"]',3,'Topu izleyip ellerle yakalamak koordinasyon gerektirir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-hareket-5','coktan_secmeli','Koşarken çevredeki diğer kişilere dikkat etmek neden önemlidir?','["Daha yüksek ses çıkarmak için","Çarpışmayı önlemek için","Daha yavaş öğrenmek için","Oyunu bozmak için"]',1,'Alan farkındalığı güvenliği artırır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-hareket-6','coktan_secmeli','Bir engelin üzerinden güvenli biçimde atlamak hangi beceriyi geliştirir?','["Okuma","Yazma","Müzik dinleme","Sıçrama ve denge"]',3,'Atlama hareket ve denge becerisidir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-hareket-7','coktan_secmeli','Topu yerde kontrollü yuvarlamak ne gerektirir?','["Sadece hız","Yön ve kuvvet kontrolü","Gözleri kapatmak","Kuralsızlık"]',1,'Topun yönü ve kuvveti kontrol edilir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-hareket-8','coktan_secmeli','Hareket ederken hızını değiştirmek mümkün müdür?','["Hayır","Sadece koşuda","Sadece yetişkinlerde","Evet"]',3,'Hareket hızı duruma göre değiştirilebilir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-hareket-9','coktan_secmeli','Denge tahtasında güvenli hareket için ne yapılır?','["Koşulur.","Yavaş ve kontrollü ilerlenir.","Arkadaş itilir.","Gözler kapatılır."]',1,'Kontrollü hareket dengeyi korur.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-hareket-10','coktan_secmeli','Bir topu arkadaşına atarken neye dikkat etmelisin?','["Çok sert fırlatmaya","Başına hedeflemeye","Gözleri kapatmaya","Uygun hız ve yönle atmaya"]',3,'Kontrollü atış güvenlidir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-hareket-11','coktan_secmeli','Hareket alanı daraldığında ne yapmalısın?','["Daha hızlı koşmalısın.","Hızını azaltıp çevrene dikkat etmelisin.","İtmelisin.","Alanı önemsememelisin."]',1,'Alan koşullarına göre hareket ayarlanır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-hareket-12','coktan_secmeli','Farklı yönlere hareket etmek neyi geliştirir?','["Sadece sesi","Sadece rengi","Sadece yazıyı","Mekânsal farkındalığı"]',3,'Yön değişimleri alan farkındalığını geliştirir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-hareket-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-kural-1','coktan_secmeli','Oyunda kuralı bilmeden başlamak yerine ne yapmalısın?','["Rastgele oynamalısın.","Kuralı öğrenmelisin.","Kuralı yok saymalısın.","Topu saklamalısın."]',1,'Kuralları bilmek güvenli ve adil oyun sağlar.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-kural-2','coktan_secmeli','Rakibin düştüğünde ne yapmak sportmence olabilir?','["Alay etmek","Oyunu durmadan sürdürmek","İtmek","Yardım etmek"]',3,'Yardım etmek sportmenliktir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-kural-3','coktan_secmeli','Oyunu kaybettiğinde ne yapmalısın?','["Kavga etmelisin.","Sonuca saygı göstermelisin.","Kuralları suçlamalısın.","Eşyaları fırlatmalısın."]',1,'Adil oyun sonucu kabul etmeyi içerir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-kural-4','coktan_secmeli','Takım arkadaşının fikrini dinlemek neyi geliştirir?','["Dışlamayı","Hileyi","Kuralsızlığı","İş birliğini"]',3,'Takım oyunu iletişim gerektirir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-kural-5','coktan_secmeli','Sıranı beklemek hangi davranıştır?','["Hile","Kurala uyma","Kabalık","Dikkatsizlik"]',1,'Sıra kuralına uymak adil davranıştır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-kural-6','coktan_secmeli','Basit oyun taktiği ne olabilir?','["Topu saklamak","Rakibi itmek","Kuralları değiştirmek","Takım arkadaşına uygun zamanda pas vermek"]',3,'Paslaşma basit taktik olabilir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-kural-7','coktan_secmeli','Hakem/öğretmen oyunu durdurduğunda ne yapmalısın?','["Oynamaya devam etmelisin.","Durup yönergeyi dinlemelisin.","Sahadan kaçmalısın.","Topu fırlatmalısın."]',1,'Yönerge güvenlik ve düzen içindir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-kural-8','coktan_secmeli','Hile yapmak adil oyun davranışı mıdır?','["Evet","Sadece kazanırsan","Sadece son turda","Hayır"]',3,'Adil oyun kurallara uymayı gerektirir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-kural-9','coktan_secmeli','Takım oyununda herkesin katılımı neden önemlidir?','["Bir kişiyi yormak için","İş birliği ve adalet için","Oyunu bozmak için","Kimse oynamasın diye"]',1,'Katılım takım ruhunu güçlendirir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-kural-10','coktan_secmeli','Rakip takım iyi oynadığında ne yapılabilir?','["Alay edilir.","İtilir.","Oyun bozulur.","Tebrik edilebilir."]',3,'Rakibe saygı sportmenliktir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-kural-11','coktan_secmeli','Oyunda güvenlik kuralı hangisidir?','["Ekipmanı fırlatmak","Alan ve malzemeyi uygun kullanmak","Arkadaş itmek","Sınır dışına koşmak"]',1,'Malzemeyi doğru kullanmak kazaları azaltır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-kural-12','coktan_secmeli','Takım arkadaşın hata yaptığında ne yapmalısın?','["Bağırmalısın.","Oyundan kovmalısın.","Alay etmelisin.","Destekleyici olmalısın."]',3,'Destek iş birliğini artırır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-ritim-1','coktan_secmeli','Tempo hızlanırsa hareket nasıl değişebilir?','["Her zaman durur.","Ritme uygun hızlanabilir.","Ritimle ilgisi olmaz.","Yavaşlamak zorundadır."]',1,'Hareket tempo ile uyum sağlar.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-ritim-2','coktan_secmeli','Yavaş tempoda hareket nasıl olabilir?','["Çok hızlı","Rastgele","Hareketsiz zorunlu","Daha yavaş ve kontrollü"]',3,'Tempo hareket hızını etkileyebilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-ritim-3','coktan_secmeli','Eşli ritmik harekette ne önemlidir?','["Birbirini itmek","Birbirine uyum","Farklı anda başlamak","Müziği dinlememek"]',1,'Eşli çalışmada uyum gerekir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-ritim-4','coktan_secmeli','Grupla aynı anda alkış yapmak neyi gerektirir?','["Rengi seçmeyi","Kütle ölçmeyi","Saat okumayı","Ritmi takip etmeyi"]',3,'Ritim ortak zamanı belirler.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-ritim-5','coktan_secmeli','Ritim değişirse hareket dizisi değişebilir mi?','["Hayır","Evet","Sadece öğretmen değişir","Ritim önemsizdir"]',1,'Hareket ritme uyarlanabilir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-ritim-6','coktan_secmeli','Beden perküsyonuna örnek hangisidir?','["Kitap okumak","Uyumak","Resim çizmek","Alkışlamak"]',3,'Alkış bedenle ritim üretmektir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-ritim-7','coktan_secmeli','Müzik durduğunda hareketi durdurma oyunu neyi geliştirir?','["Sadece yazı","Ritim ve dikkat","Sadece renk","Sadece kütle"]',1,'Müziği dinleyip tepki vermek dikkat gerektirir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-ritim-8','coktan_secmeli','Ritmik hareketlerde güvenlik için ne yapılmalıdır?','["Birbirine çok yaklaşılmalıdır.","İtme yapılmalıdır.","Gözler kapatılmalıdır.","Çevrede yeterli alan bırakılmalıdır."]',3,'Alan bırakmak çarpışmayı önler.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-ritim-9','coktan_secmeli','Farklı ritimlere farklı hareketler üretmek neyi destekler?','["Kuralsızlığı","Yaratıcılığı","Dışlamayı","Hileyi"]',1,'Yeni hareketler üretmek yaratıcılıktır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-ritim-10','coktan_secmeli','Grup liderinin ritmi açık göstermesi ne sağlar?','["Daha çok karışıklık","Oyunun bitmesini","Müziğin susmasını","Grubun uyumunu"]',3,'Net ritim grup eşliğini kolaylaştırır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-saglik-1','coktan_secmeli','Etkinlikten önce ısınmak neden yapılır?','["Daha çok yorulmak için","Su içmemek için","Uyumak için","Bedeni harekete hazırlamak için"]',3,'Isınma aktiviteye hazırlık sağlar.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-saglik-2','coktan_secmeli','Etkinlik sonrası soğuma ne sağlar?','["Hemen daha hızlı koşmayı","Bedenin sakinleşmesine yardım eder.","Susuz kalmayı","Uyumamayı"]',1,'Soğuma aktivite sonrası geçişi destekler.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-saglik-3','coktan_secmeli','Fiziksel aktivitede su içmek neden önemlidir?','["Daha ağır olmak için","Ayakkabıyı temizlemek için","Oyunu uzatmak için","Sıvı ihtiyacını karşılamak için"]',3,'Su vücudun sıvı ihtiyacını destekler.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-saglik-4','coktan_secmeli','Uygun spor kıyafeti nasıl olmalıdır?','["Hareketi engelleyen","Rahat ve güvenli","Kaygan","Çok uzun ve takılan aksesuarlarla"]',1,'Rahat kıyafet güvenli hareketi destekler.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-saglik-5','coktan_secmeli','Düzenli hareket neyi destekler?','["Kuralsızlığı","Susuzluğu","Uykusuzluğu","Sağlıklı büyüme ve zindeliği"]',3,'Fiziksel aktivite sağlıklı yaşamın parçasıdır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-saglik-6','coktan_secmeli','Yeterli uyku fiziksel aktiviteyi nasıl etkileyebilir?','["Her zaman engeller.","Dinlenmiş hissetmeye yardımcı olabilir.","Gereksizdir.","Sadece yetişkinler için önemlidir."]',1,'Uyku dinlenmeye yardım eder.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-saglik-7','coktan_secmeli','Etkinlik sırasında ağrı hissedersen ne yapmalısın?','["Zorlamaya devam etmelisin.","Gizlemelisin.","Daha hızlı koşmalısın.","Durup yetişkine söylemelisin."]',3,'Ağrı güvenlik işaretidir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-saglik-8','coktan_secmeli','Güneşli sıcak havada etkinlik için ne önemlidir?','["Hiç su içmemek","Su ve uygun korunma","Kalın kışlık giymek","Uzun süre gölgəsiz kalmak"]',1,'Sıcak havada sıvı ve korunma önemlidir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-saglik-9','coktan_secmeli','Güvenli fiziksel aktivite alanı hangisidir?','["Araç yolu","Kaygan merdiven","İnşaat alanı","Engelleri kontrol edilmiş uygun alan"]',3,'Alan güvenliği aktivite öncesi kontrol edilir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-saglik-10','coktan_secmeli','Etkinlikten sonra terli kıyafetle uzun süre kalmak uygun mudur?','["Evet her zaman","Hayır","Sadece kışın","Sadece okulda"]',1,'Temizlik ve kuru kıyafet sağlıklı olabilir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-saglik-11','coktan_secmeli','Kendi fiziksel aktivite hedefi nasıl olmalıdır?','["Çok tehlikeli","Ulaşılamaz","Başkasıyla zorunlu aynı","Yaşa ve beceriye uygun"]',3,'Hedefler kişiye ve yaşa uygun olmalıdır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be2-saglik-12','coktan_secmeli','Aktivite sırasında arkadaşının yorulduğunu görürsen ne yapmalısın?','["Zorlamalısın.","Dinlenmesine fırsat vermeli ve gerekirse yetişkine haber vermelisin.","Alay etmelisin.","Daha hızlı koşturmalısın."]',1,'Beden sinyallerine saygı önemlidir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=2 AND k.konu_kodu='be2-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;
