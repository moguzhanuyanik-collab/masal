SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'hb3-okul-konu','Ben ve Okulum','Ben ve Okulum','Okul yaşamında demokratik katılım, iletişim, bireysel farklılıklar ve sorumlulukları uygular.','Sınıf kararlarında fikir belirtir ve başkalarını dinler.',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='hb3-okul'
WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'hb3-saglik-konu','Sağlığım ve Güvenliğim','Sağlığım ve Güvenliğim','Sağlıklı yaşam, riskleri değerlendirme, trafik, dijital güvenlik ve acil durum davranışlarını uygular.','Riskli durumda güvenli seçim yapar.',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='hb3-saglik'
WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'hb3-aile-konu','Ailem ve Toplum','Ailem ve Toplum','Aile içi görevler, meslekler, toplumsal dayanışma ve gönüllülük ilişkilerini fark eder.','Toplumsal bir ihtiyaca uygun yardım yolu geliştirir.',300,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='hb3-aile'
WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'hb3-ulkem-konu','Yaşadığım Yer ve Ülkem','Yaşadığım Yer ve Ülkem','Yerel çevre, kültürel miras, vatandaşlık, millî değerler ve yerel yönetim hakkında temel farkındalık geliştirir.','Yaşadığı yerdeki tarihî ve doğal değerleri korur.',400,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='hb3-ulkem'
WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'hb3-doga-konu','Doğa ve Çevre','Doğa ve Çevre','Doğal kaynaklar, afetler, sürdürülebilirlik ve çevre sorunlarına yönelik sorumlu davranır.','Kaynakları tasarruflu kullanır.',500,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='hb3-doga'
WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'hb3-bilim-konu','Bilim, Teknoloji ve Sanat','Bilim, Teknoloji ve Sanat','Bilimsel merak, güvenli dijital yaşam, teknolojik ürünlerin etkileri ve sanatla ilişki kurar.','Bilgiyi güvenilir kaynaktan kontrol eder.',600,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='hb3-bilim'
WHERE d.kod='hayat' OR d.ad='Hayat Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'gs3-hayat-konu','Hayat ve Sanat','Hayat ve Sanat','Günlük yaşam ve çevreden görsel fikir üretir, doğal-yapay çevreyi sanatla ilişkilendirir.','Çevredeki mimari biçimler çizime konu olabilir.',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='gs3-hayat'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'gs3-dil-konu','Sanatın Görsel Dili','Sanatın Görsel Dili','Çizgi, biçim, renk, doku, leke, ritim, denge ve vurgu gibi görsel ilişkileri fark eder.','Tekrar edilen şekiller ritim oluşturabilir.',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='gs3-dil'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'gs3-sanatci-konu','Sanatçılar ve Eserleri','Sanatçılar ve Eserleri','Sanat eserlerini konu, malzeme, teknik ve duygu yönünden inceler.','Aynı konu farklı sanatçılarca farklı yorumlanabilir.',300,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='gs3-sanatci'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'gs3-cizim-konu','Çizim ve Görsel İfade','Çizim ve Görsel İfade','Gözlem, hayal gücü, oran ve mekân ilişkisini çizimle ifade eder.','Yakındaki nesne daha büyük çizilebilir.',400,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='gs3-cizim'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'gs3-renk-konu','Renk ve Estetik','Renk ve Estetik','Ana-ara renkler, sıcak-soğuk renkler ve renk uyumlarını kullanır.','Sarı ve mavi karışınca yeşil elde edilir.',500,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='gs3-renk'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'gs3-milli-konu','Millî Değerler ve Sanat','Millî Değerler ve Sanat','Millî ve kültürel ögeleri görsel tasarımlarda bilinçli kullanır.','Millî bayram afişi tasarlanabilir.',600,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='gs3-milli'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'gs3-muze-konu','Müze ve Kültür','Müze ve Kültür','Müze, sanat galerisi ve kültürel varlıkların korunma nedenlerini açıklar.','Eserler gelecek kuşaklar için korunur.',700,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='gs3-muze'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'muz3-dil-konu','Müzik Dili','Müzik Dili','Ritim, tempo, gürlük, ezgi, ses yüksekliği ve temel müziksel ifadeleri ayırt eder.','Hızlı-yavaş tempo ve kuvvetli-hafif gürlük farklarını duyar.',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='muz3-dil'
WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'muz3-kultur-konu','Müzik Kültürü','Müzik Kültürü','Çalgıları, dinleme kurallarını, millî ve geleneksel müzikleri ve ortak repertuvarı tanır.','Farklı kültürlerin müziklerini saygıyla dinler.',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='muz3-kultur'
WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'be3-isbirligi-konu','İş Birlikli Oyunlarla Hareket Ediyorum','İş Birlikli Oyunlarla Hareket Ediyorum','İş birlikli oyunlarda hareket, iletişim ve takım görevlerini uygular.','Takım arkadaşına uygun zamanda pas verir.',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='be3-isbirligi'
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'be3-kural-konu','Oyunun Kurallarını Yeniden Oluşturuyorum','Oyunun Kurallarını Yeniden Oluşturuyorum','Oyun kurallarını analiz eder, adil ve güvenli olacak şekilde basit değişiklik önerir.','Alan küçülünce kural güvenlik için değiştirilebilir.',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='be3-kural'
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'be3-ritim-konu','Farklı Ritimlerle Hareket Ediyorum','Farklı Ritimlerle Hareket Ediyorum','Değişen tempo ve ritimlere hareket dizileriyle uyum sağlar.','Tempo hızlanınca hareket hızı da uyarlanır.',300,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='be3-ritim'
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'be3-saglik-konu','Sağlığım İçin Fiziksel Aktiviteye Katılıyorum','Sağlığım İçin Fiziksel Aktiviteye Katılıyorum','Isınma-soğuma, su, güvenlik, öz değerlendirme ve düzenli aktivite ilişkisini kurar.','Etkinlik öncesi ısınır, sonrası dinlenir.',400,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='be3-saglik'
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'be3-cevre-konu','Hareket Ederek Çevremi Keşfediyorum','Hareket Ederek Çevremi Keşfediyorum','Açık alanda yön, mesafe, çevre farkındalığı ve güvenli hareket becerilerini uygular.','Parkurda işaretleri takip eder.',500,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='be3-cevre'
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'be3-gelenek-konu','Kültürel Birikimlerimiz ve Geleneksel Oyunlar','Kültürel Birikimlerimiz ve Geleneksel Oyunlar','Geleneksel çocuk oyunlarını kuralları, kültürel değeri ve adil oyun ilkeleriyle uygular.','Mendil kapmaca gibi oyunların kurallarını öğrenir.',600,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='be3-gelenek'
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-1','coktan_secmeli','Sınıfça ortak karar alınırken en doğru yöntem hangisidir?','["Sadece bir kişinin karar vermesi","Herkesin görüşünü dinleyip uygun yöntemle karar vermek","En çok bağıranın seçilmesi","Kimsenin konuşmaması"]',1,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-2','coktan_secmeli','Sınıf temsilcisi seçiminde neye dikkat edilmelidir?','["Arkadaş baskısına","Hile yapmaya","Oyları gizlice değiştirmeye","Adil ve özgür seçim yapılmasına"]',3,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-3','coktan_secmeli','Farklı yetenekleri olan arkadaşlara nasıl davranmalıyız?','["Alay etmeliyiz.","Farklılıklara saygı göstermeliyiz.","Dışlamalıyız.","Aynı olmaya zorlamalıyız."]',1,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-4','coktan_secmeli','Bir grup görevinde kendi bölümünü tamamlamak neyi gösterir?','["İsraf","Kabalık","Dikkatsizlik","Sorumluluk"]',3,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-5','coktan_secmeli','Sınıf kurallarının amacı nedir?','["Sadece ceza vermek","Güvenli ve düzenli ortak yaşam sağlamak","Oyunu yasaklamak","Kimse konuşmasın diye"]',1,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-6','coktan_secmeli','Bir arkadaşın fikrine katılmıyorsan ne yapmalısın?','["Onu susturmalısın.","Alay etmelisin.","Bağırmalısın.","Saygılı biçimde nedenini açıklayabilirsin."]',3,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-7','coktan_secmeli','Okul eşyalarına zarar verilirse ne yapmak uygundur?','["Saklamak","Yetişkine haber verip sorumluluk almak","Başkasını suçlamak","Zarar vermeye devam etmek"]',1,'Doğru davranış ve bilgi kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-8','coktan_secmeli','Sınıfta yeni bir öğrenci varsa ne yapılabilir?','["Yalnız bırakılabilir.","Eşyaları saklanabilir.","Oyuna alınmayabilir.","Okula uyum sağlamasına yardımcı olunabilir."]',3,'Doğru davranış ve bilgi kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-9','coktan_secmeli','Bir sorun için çözüm önerisi sunmak hangi beceriyi gösterir?','["Dışlama","Katılım ve problem çözme","İsraf","Kuralsızlık"]',1,'Doğru davranış ve bilgi kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-10','coktan_secmeli','Kütüphanede sessiz konuşmak neden önemlidir?','["Daha hızlı okumak için","Kitaplar duymasın diye","Sadece öğretmen istediği için","Başkalarının çalışma hakkına saygı için"]',3,'Doğru davranış ve bilgi kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-11','coktan_secmeli','Okula zamanında gelmek hangi sorumluluğa örnektir?','["Kaynak israfına","Zamanı düzenli kullanmaya","Dışlamaya","Hileye"]',1,'Doğru davranış ve bilgi kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-12','coktan_secmeli','Bir grup çalışmasında görevler nasıl dağıtılabilir?','["Tüm iş bir kişiye","Kimseye görev vermeden","Rastgele ve açıklamasız","Uygun ve adil biçimde"]',3,'Doğru davranış ve bilgi kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-13','coktan_secmeli','Bir arkadaşın hata yaptığında nasıl destek olunabilir?','["Alay ederek","Nazikçe yardımcı olarak","Herkese anlatarak","Oyundan çıkararak"]',1,'Doğru davranış ve bilgi kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-14','coktan_secmeli','Okul bahçesini temiz tutmak kimin sorumluluğudur?','["Sadece temizlik görevlisinin","Kimsenin","Sadece öğretmenin","Kullanan herkesin"]',3,'Doğru davranış ve bilgi kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-15','coktan_secmeli','Bir sınıf toplantısında söz hakkı neyi destekler?','["Dışlamayı","Katılımı","Kabalığı","Hileyi"]',1,'Doğru davranış ve bilgi kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-16','coktan_secmeli','Kişisel sınırlar okulda da önemli midir?','["Hayır","Sadece evde","Sadece yetişkinlerde","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-17','coktan_secmeli','Bir arkadaşının eşyasını kullanmadan önce ne yapmalısın?','["Gizlice almalısın.","İzin istemelisin.","Saklamalısın.","Kırmalısın."]',1,'Doğru davranış ve bilgi kullanılır.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-18','coktan_secmeli','Okulda oluşan bir anlaşmazlık nasıl çözülebilir?','["İterek","Bağırarak","Eşyaları fırlatarak","Sakin konuşup ortak çözüm arayarak"]',3,'Doğru davranış ve bilgi kullanılır.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-19','coktan_secmeli','Kendi güçlü yönlerini bilmek ne sağlar?','["Başkalarını küçümsemeyi","Kendini tanımaya yardım eder.","Kuralları bozmayı","Görevden kaçmayı"]',1,'Doğru davranış ve bilgi kullanılır.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-okul-20','coktan_secmeli','Arkadaşının güçlü yönünü fark etmek nasıl bir davranıştır?','["Kırıcı","Dışlayıcı","Hileli","Olumlu ve destekleyici"]',3,'Doğru davranış ve bilgi kullanılır.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-okul-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-1','coktan_secmeli','Dengeli beslenme ne demektir?','["Sadece tatlı yemek","Farklı besin gruplarını uygun miktarda tüketmek","Hiç su içmemek","Tek çeşit beslenmek"]',1,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-2','coktan_secmeli','Düzenli uyku neden önemlidir?','["Uyku gereksizdir.","Sadece hafta sonu gerekir.","Yemek yerine geçer.","Beden ve zihnin dinlenmesine yardım eder."]',3,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-3','coktan_secmeli','Fiziksel aktivite neyi destekler?','["Uykusuzluğu","Sağlıklı büyüme ve zindeliği","Susuzluğu","Hareketsizliği"]',1,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-4','coktan_secmeli','Yaya geçidinde ne yapılmalıdır?','["Koşarak yola çıkılmalıdır.","Telefona bakılmalıdır.","Gözler kapatılmalıdır.","Trafik kontrol edilip güvenli zamanda geçilmelidir."]',3,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-5','coktan_secmeli','Bisiklet sürerken kask neden önemlidir?','["Bisikleti hızlandırır.","Başı korumaya yardım eder.","Yolu kısaltır.","Havayı değiştirir."]',1,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-6','coktan_secmeli','Araçta emniyet kemeri ne sağlar?','["Aracı hızlandırır.","Yakıt üretir.","Müziği açar.","Güvenliği artırır."]',3,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-7','coktan_secmeli','Tanımadığın biri adresini isterse ne yapmalısın?','["Hemen vermelisin.","Paylaşmayıp güvenilir yetişkine söylemelisin.","Şifreni de söylemelisin.","Onunla gitmelisin."]',1,'Doğru davranış ve bilgi kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-8','coktan_secmeli','İnternet şifresi nasıl korunmalıdır?','["Herkese söylenmelidir.","Profilde yazılmalıdır.","Oyun sohbetinde paylaşılmalıdır.","Güvenli tutulup rastgele kişilerle paylaşılmamalıdır."]',3,'Doğru davranış ve bilgi kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-9','coktan_secmeli','Siber zorbalıkla karşılaşırsan ne yapmalısın?','["Tek başına sürdürmelisin.","Güvenilir bir yetişkine bildirmelisin.","Kimseye söylememelisin.","Aynısını yapmalısın."]',1,'Doğru davranış ve bilgi kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-10','coktan_secmeli','112 hangi durumda aranır?','["Saat sormak için","Şaka yapmak için","Ödev sormak için","Gerçek acil yardım gerektiğinde"]',3,'Doğru davranış ve bilgi kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-11','coktan_secmeli','Deprem anında güvenlik yönergesi neden izlenir?','["Daha hızlı dışarı koşmak için her zaman","Yaralanma riskini azaltmak için","Eşyaları toplamak için","Dersi bitirmek için"]',1,'Doğru davranış ve bilgi kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-12','coktan_secmeli','Yangın sırasında asansör kullanmak uygun mudur?','["Evet her zaman","Sadece hızlıysa","Sadece çocuklar için","Genellikle hayır; güvenli tahliye yönergesi izlenir."]',3,'Doğru davranış ve bilgi kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-13','coktan_secmeli','İlaçlar nasıl kullanılmalıdır?','["Arkadaş önerisiyle","Doktor ve sorumlu yetişkin yönlendirmesiyle","Rastgele","Oyun videosuna göre"]',1,'Doğru davranış ve bilgi kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-14','coktan_secmeli','Yüksek sesle uzun süre kulaklık kullanmak sağlıklı mıdır?','["Evet her zaman","Sadece gece","Sadece okulda","Hayır"]',3,'Doğru davranış ve bilgi kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-15','coktan_secmeli','Ekran kullanımında ara vermek neden önemlidir?','["Ekranı hızlandırmak için","Gözleri ve bedeni dinlendirmek için","Şifreyi korumak için","İnterneti kapatmak için"]',1,'Doğru davranış ve bilgi kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-16','coktan_secmeli','Kişisel sınırlarımız ihlal edilirse ne yapabiliriz?','["Sessiz kalmak zorundayız.","Her şeyi kabul etmeliyiz.","Kimseye söylememeliyiz.","Hayır deyip güvenilir yetişkine söyleyebiliriz."]',3,'Doğru davranış ve bilgi kullanılır.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-17','coktan_secmeli','Riskli bir yerde oyun oynamak yerine ne yapılmalıdır?','["Araç yolunda oynanmalıdır.","Güvenli oyun alanı seçilmelidir.","İnşaat alanına girilmelidir.","Kaygan merdiven kullanılmalıdır."]',1,'Doğru davranış ve bilgi kullanılır.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-18','coktan_secmeli','Acil durumda önce ne düşünülmelidir?','["Tehlikeye girmek","Olayı gizlemek","Hiç kimseye haber vermemek","Kendi güvenliğimiz ve uygun yardım çağrısı"]',3,'Doğru davranış ve bilgi kullanılır.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-19','coktan_secmeli','Sağlıklı içecek için en temel seçenek hangisidir?','["Sürekli gazlı içecek","Su","Hiç sıvı almamak","Sadece şekerli içecek"]',1,'Doğru davranış ve bilgi kullanılır.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-saglik-20','coktan_secmeli','Güneşli sıcak havada hangisi uygundur?','["Hiç su içmemek","Uzun süre gölgəsiz kalmak","Kalın kışlık giymek","Su içmek ve uygun korunmak"]',3,'Doğru davranış ve bilgi kullanılır.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-saglik-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-1','coktan_secmeli','Ailede görev paylaşımı neden önemlidir?','["Tüm işi bir kişiye verir.","İş birliği ve sorumluluğu destekler.","Kimsenin görev yapmamasını sağlar.","Kuralları kaldırır."]',1,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-2','coktan_secmeli','Yaşına uygun ev sorumluluğu hangisidir?','["Elektrik tesisatını onarmak","Ağır mobilya taşımak","Tek başına ocak kullanmak","Odasını düzenlemek"]',3,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-3','coktan_secmeli','Aile bireylerinin meslekleri farklı olabilir mi?','["Hayır","Evet","Aynı olmak zorunda","Sadece bir meslek vardır"]',1,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-4','coktan_secmeli','Bir meslek topluma nasıl katkı sağlayabilir?','["Sadece para harcayarak","Kuralları bozarak","Kaynak israfıyla","Bir ihtiyacı karşılayarak"]',3,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-5','coktan_secmeli','Gönüllülük neye örnek olabilir?','["Zorla çalıştırılmak","Toplumsal bir işe isteyerek destek olmak","Görevden kaçmak","Kural bozmak"]',1,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-6','coktan_secmeli','Yaşlı bir komşuya uygun yardım teklif etmek neyi gösterir?','["Dışlama","İsraf","Kabalık","Dayanışma"]',3,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-7','coktan_secmeli','Aile kararlarında çocukların yaşına uygun görüşlerinin dinlenmesi neyi destekler?','["Dışlamayı","Katılımı","Hileyi","Korkuyu"]',1,'Doğru davranış ve bilgi kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-8','coktan_secmeli','Evde su ve elektriği tasarruflu kullanmak neyi gösterir?','["İsraf","Dikkatsizlik","Kuralsızlık","Sorumluluk"]',3,'Doğru davranış ve bilgi kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-9','coktan_secmeli','Aile geçmişini öğrenmek için kimlerden yararlanabiliriz?','["Sadece reklamlardan","Aile büyükleri ve aile kayıtlarından","Rastgele kişilerden","Hiç kimseden"]',1,'Doğru davranış ve bilgi kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-10','coktan_secmeli','Komşulukta ortak alanlara nasıl davranılmalıdır?','["Çöp bırakılmalıdır.","Zarar verilmelidir.","Sadece bir kişi kullanmalıdır.","Temiz ve özenli kullanılmalıdır."]',3,'Doğru davranış ve bilgi kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-11','coktan_secmeli','Bir toplumda farklı mesleklerin olması neden önemlidir?','["Herkes aynı işi yapsın diye","Farklı ihtiyaçları karşılamak için","Sadece okul için","Meslekler gereksizdir"]',1,'Doğru davranış ve bilgi kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-12','coktan_secmeli','Bir yardım kampanyasına katılmadan önce ne yapılmalıdır?','["Her isteğe para göndermek","Kişisel bilgileri paylaşmak","Kaynağı sormamak","Güvenilir ve uygun olduğunu kontrol etmek"]',3,'Doğru davranış ve bilgi kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-13','coktan_secmeli','Ailede bir sorun olduğunda en iyi yol?','["Sorunu gizlemek","Konuşup birlikte çözüm aramak","Bağırmak","Birbirini suçlamak"]',1,'Doğru davranış ve bilgi kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-14','coktan_secmeli','Ev işlerine katkı sağlamak neyi geliştirir?','["Kabalığı","İsrafı","Dışlamayı","Sorumluluk duygusunu"]',3,'Doğru davranış ve bilgi kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-15','coktan_secmeli','Meslek seçimi insanların ilgi ve yetenekleriyle ilişkili olabilir mi?','["Hayır","Evet","Sadece yaşla","Sadece şehirle"]',1,'Doğru davranış ve bilgi kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-16','coktan_secmeli','Toplum için çalışan sağlık görevlileri hangi ihtiyaca katkı sağlar?','["Ulaşım yalnız","Eğlence yalnız","Tarım yalnız","Sağlık hizmetine"]',3,'Doğru davranış ve bilgi kullanılır.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-17','coktan_secmeli','İtfaiyecilerin görevlerinden biri nedir?','["Ders anlatmak","Yangın ve bazı acil durumlara müdahale etmek","Ekmek yapmak","Otobüs sürmek"]',1,'Doğru davranış ve bilgi kullanılır.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-18','coktan_secmeli','Bir aile bireyinin emeğine teşekkür etmek neyi destekler?','["Dışlamayı","Kabalığı","İsrafı","Olumlu iletişimi"]',3,'Doğru davranış ve bilgi kullanılır.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-19','coktan_secmeli','Farklı aile yapıları olabilir mi?','["Hayır","Evet ve hepsine saygı gösterilmelidir.","Sadece tek aile yapısı vardır","Farklı ailelere saygı gerekmez"]',1,'Doğru davranış ve bilgi kullanılır.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-aile-20','coktan_secmeli','Birlikte plan yapmak aile yaşamını nasıl etkileyebilir?','["Her şeyi karıştırır.","Görevleri yok eder.","İletişimi engeller.","İşleri düzenlemeye yardım eder."]',3,'Doğru davranış ve bilgi kullanılır.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-aile-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-1','coktan_secmeli','Türkiye''nin başkenti neresidir?','["İstanbul","Ankara","İzmir","Bursa"]',1,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-2','coktan_secmeli','Türk bayrağında hangi semboller vardır?','["Güneş ve bulut","Dağ ve ağaç","Kitap ve kalem","Ay ve yıldız"]',3,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-3','coktan_secmeli','Atatürk kimdir?','["Bir masal kahramanıdır.","Türkiye Cumhuriyeti''nin kurucusudur.","Bir şehir adıdır.","Bir spor takımıdır."]',1,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-4','coktan_secmeli','29 Ekim hangi bayramdır?','["23 Nisan","30 Ağustos","19 Mayıs","Cumhuriyet Bayramı"]',3,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-5','coktan_secmeli','23 Nisan hangi bayramdır?','["Zafer Bayramı","Ulusal Egemenlik ve Çocuk Bayramı","Cumhuriyet Bayramı","Yılbaşı"]',1,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-6','coktan_secmeli','30 Ağustos hangi bayramdır?','["Cumhuriyet Bayramı","Öğretmenler Günü","Çocuk Bayramı","Zafer Bayramı"]',3,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-7','coktan_secmeli','Yerel yönetim hangi konularla ilgilenebilir?','["Sadece okul notlarıyla","Yaşadığımız çevrede bazı ortak hizmetlerle","Sadece aile işleriyle","Sadece ders kitaplarıyla"]',1,'Doğru davranış ve bilgi kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-8','coktan_secmeli','Belediyenin görevlerinden biri hangisi olabilir?','["Sınıf öğretmenini seçmek","Aile kararlarını vermek","Öğrenci ödevini yapmak","Yerel çevre ve bazı kamu hizmetlerini düzenlemek"]',3,'Doğru davranış ve bilgi kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-9','coktan_secmeli','Tarihî yapıların korunması neden önemlidir?','["Yıkmak için","Kültürel mirası gelecek kuşaklara taşımak için","Rengini değiştirmek için","Sadece satış için"]',1,'Doğru davranış ve bilgi kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-10','coktan_secmeli','Müze neyi tanımaya yardım eder?','["Sadece trafik kurallarını","Sadece matematiği","Sadece hava durumunu","Geçmiş, sanat ve kültürü"]',3,'Doğru davranış ve bilgi kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-11','coktan_secmeli','Yaşadığımız yerdeki doğal güzelliklere nasıl davranmalıyız?','["Kirleterek","Koruyarak","Zarar vererek","Kaynakları israf ederek"]',1,'Doğru davranış ve bilgi kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-12','coktan_secmeli','Kroki ne işe yarar?','["Kütle ölçmeye","Sıcaklık ölçmeye","Zaman tutmaya","Yerlerin birbirine göre konumunu göstermeye"]',3,'Doğru davranış ve bilgi kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-13','coktan_secmeli','Adres bilgisi neden önemlidir?','["Renk seçmeye","Bulunduğumuz yeri tanımlamaya yardım eder.","Yemek yapmaya","Müzik dinlemeye"]',1,'Doğru davranış ve bilgi kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-14','coktan_secmeli','Millî marş söylenirken nasıl davranılmalıdır?','["Konuşarak","Koşarak","Oyun oynayarak","Saygılı biçimde"]',3,'Doğru davranış ve bilgi kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-15','coktan_secmeli','Bir vatandaş ortak alanlara nasıl davranmalıdır?','["Zarar vermelidir.","Kurallara uyup korumalıdır.","Çöp bırakmalıdır.","Kuralları önemsememelidir."]',1,'Doğru davranış ve bilgi kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-16','coktan_secmeli','Kültürel bir etkinliğe katılmak ne sağlar?','["Elektrik üretmeye","Kütle ölçmeye","Suyu artırmaya","Yerel kültürü tanımaya"]',3,'Doğru davranış ve bilgi kullanılır.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-17','coktan_secmeli','Farklı şehirlerin farklı kültürel özellikleri olabilir mi?','["Hayır","Evet","Hepsi tamamen aynıdır","Kültür şehirle ilişkili değildir"]',1,'Doğru davranış ve bilgi kullanılır.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-18','coktan_secmeli','Mahalledeki bir sorun için uygun yol hangisidir?','["Zarar vermek","Söylenti yaymak","Kimseye söylememek","İlgili kurumlara düzgün biçimde bildirmek"]',3,'Doğru davranış ve bilgi kullanılır.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-19','coktan_secmeli','Ortak değerler toplumsal bağları destekleyebilir mi?','["Hayır","Evet","Sadece çocuklarda","Sadece okulda"]',1,'Doğru davranış ve bilgi kullanılır.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-ulkem-20','coktan_secmeli','Yaşadığımız ülkenin doğal ve kültürel varlıklarını korumak kimin sorumluluğudur?','["Kimsenin","Sadece turistlerin","Sadece çocukların","Herkesin"]',3,'Doğru davranış ve bilgi kullanılır.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-ulkem-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-1','coktan_secmeli','Doğal kaynaklara örnek hangisidir?','["Plastik oyuncak","Su","Televizyon","Kalem kutusu"]',1,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-2','coktan_secmeli','Suyu tasarruflu kullanmak neden önemlidir?','["Daha çok israf için","Suyu kirletmek için","Sadece faturayı artırmak için","Sınırlı kaynakları korumaya yardım eder."]',3,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-3','coktan_secmeli','Geri dönüşüm ne sağlar?','["Daha çok çöp üretmeyi","Bazı atıkların yeniden değerlendirilmesini","Kaynakları gereksiz harcamayı","Suyu kirletmeyi"]',1,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-4','coktan_secmeli','Atık pil nereye bırakılmalıdır?','["Toprağa","Dereye","Yola","Uygun atık pil toplama noktasına"]',3,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-5','coktan_secmeli','Erozyon nedir?','["Elektrik üretimi","Toprağın su veya rüzgârla taşınması","Suyun donması","Bitkinin çiçek açması"]',1,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-6','coktan_secmeli','Bitki örtüsü toprağı korumaya yardım eder mi?','["Hayır","Toprağı yok eder","Sadece rengi değiştirir","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-7','coktan_secmeli','Sel riski olan dere yatağına şiddetli yağışta yaklaşmak güvenli midir?','["Evet","Hayır","Sadece gece","Sadece çocuklar için"]',1,'Doğru davranış ve bilgi kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-8','coktan_secmeli','Afet öncesi aile planı yapmak neden önemlidir?','["Afeti engellemek için","Eşyaları taşımak için","Dersi bitirmek için","Acil durumda ne yapılacağını bilmek için"]',3,'Doğru davranış ve bilgi kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-9','coktan_secmeli','Deprem çantasında hangisi bulunabilir?','["Ağır mobilya","Su ve temel ihtiyaç malzemeleri","Büyük televizyon","Cam eşya"]',1,'Doğru davranış ve bilgi kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-10','coktan_secmeli','Orman yangını riskini azaltmak için ne yapılmalıdır?','["Ateşi açık bırakmak","Cam atıkları bırakmak","Kuralları önemsememek","Ateş ve atık konusunda kurallara uymak"]',3,'Doğru davranış ve bilgi kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-11','coktan_secmeli','Tek kullanımlık ürünleri azaltmak neye yardım eder?','["Atığı artırmaya","Atık miktarını azaltmaya","Suyu kirletmeye","Kaynağı tüketmeye"]',1,'Doğru davranış ve bilgi kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-12','coktan_secmeli','Elektrik tasarrufu çevreyi de destekleyebilir mi?','["Hayır","Sadece parayı etkiler","Enerji çevreyle ilişkili değildir","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-13','coktan_secmeli','Doğal alanlarda canlıları rahatsız etmek doğru mudur?','["Evet","Hayır","Sadece küçük canlıları","Sadece bitkileri"]',1,'Doğru davranış ve bilgi kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-14','coktan_secmeli','Bir ağacın gereksiz kesilmesi neyi etkileyebilir?','["Sadece rengini","Sadece saati","Hiçbir şeyi","Yaşam alanını ve çevreyi"]',3,'Doğru davranış ve bilgi kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-15','coktan_secmeli','Sürdürülebilirlik neye yakındır?','["Kaynakları hızla tüketmeye","Kaynakları gelecek için de koruyarak kullanmaya","Atığı artırmaya","Her şeyi tek kullanmaya"]',1,'Doğru davranış ve bilgi kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-16','coktan_secmeli','Çevre sorununa çözüm ararken ne yapılabilir?','["Sorunu büyütmek","Çöp bırakmak","Hiç düşünmemek","Sorunu gözleyip uygun çözüm geliştirmek"]',3,'Doğru davranış ve bilgi kullanılır.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-17','coktan_secmeli','Yağmur suyundan uygun şekilde yararlanmak neyi destekleyebilir?','["İsrafı","Su tasarrufunu","Kirliliği","Elektrik kaçağını"]',1,'Doğru davranış ve bilgi kullanılır.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-18','coktan_secmeli','Yerel çevredeki atık miktarı ölçülebilir mi?','["Hayır","Sadece tahmin edilir","Atık sayılmaz","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-19','coktan_secmeli','Çevreyi koruma sorumluluğu kimlere aittir?','["Sadece bir kişiye","Bireylere ve topluma","Kimseye","Sadece öğrencilere"]',1,'Doğru davranış ve bilgi kullanılır.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-doga-20','coktan_secmeli','Piknik alanından ayrılırken ne yapılmalıdır?','["Çöp bırakılmalıdır.","Ateş açık bırakılmalıdır.","Bitkiler zarar görmelidir.","Atıklar toplanıp alan temiz bırakılmalıdır."]',3,'Doğru davranış ve bilgi kullanılır.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-doga-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-1','coktan_secmeli','Bir şeyi merak ettiğinde ne yapabilirsin?','["Sonucu uydurabilirsin.","Soru sorup araştırabilirsin.","Hiç düşünmeyebilirsin.","Kaynağı saklayabilirsin."]',1,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-2','coktan_secmeli','İnternette gördüğümüz her bilgi doğru mudur?','["Evet her zaman","Sadece videolar doğrudur","Sadece renkli sayfalar doğrudur","Hayır"]',3,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-3','coktan_secmeli','Bir bilginin doğruluğu nasıl kontrol edilebilir?','["İlk gördüğünü kabul ederek","Güvenilir birden fazla kaynaktan karşılaştırılarak","Kaynağı önemsemeyerek","Söylentiye göre"]',1,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-4','coktan_secmeli','Teknolojik ürünler yaşamı kolaylaştırabilir mi?','["Hayır","Sadece okulda","Sadece yetişkinlerde","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-5','coktan_secmeli','Teknolojinin yanlış kullanımı sorun oluşturabilir mi?','["Hayır","Evet","Teknoloji her zaman risksizdir","Sadece eski araçlarda"]',1,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-6','coktan_secmeli','Dijital ortamda kişisel bilgiler nasıl korunmalıdır?','["Herkese gönderilmelidir.","Profilde açık tutulmalıdır.","Şifreyle birlikte paylaşılmalıdır.","Gereksiz paylaşılmamalıdır."]',3,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-7','coktan_secmeli','Bir tasarımın amacı ne olabilir?','["Sorunu büyütmek","Bir ihtiyaca çözüm geliştirmek","Malzemeyi israf etmek","Sonucu gizlemek"]',1,'Doğru davranış ve bilgi kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-8','coktan_secmeli','İlk tasarım işe yaramazsa ne yapılabilir?','["Hemen vazgeçilmelidir.","Sonuç uydurulmalıdır.","Malzeme saklanmalıdır.","Geliştirilip yeniden denenebilir."]',3,'Doğru davranış ve bilgi kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-9','coktan_secmeli','Bilimsel gözlemde not tutmak neden önemlidir?','["Sonucu değiştirmek için","Bilgiyi kaydetmek ve karşılaştırmak için","Soruyu unutmak için","Rengi değiştirmek için"]',1,'Doğru davranış ve bilgi kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-10','coktan_secmeli','Sanat eseri insanlarda farklı duygular oluşturabilir mi?','["Hayır","Herkes aynı hissetmelidir","Sanat duygu oluşturmaz","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-11','coktan_secmeli','Müzede eserlere neden dokunmamalıyız?','["Rengini değiştirmek için","Eserleri korumak için","Sadece kural olduğu için anlamı yok","Daha hızlı gezmek için"]',1,'Doğru davranış ve bilgi kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-12','coktan_secmeli','Bir teknolojik cihaz bozulduğunda çocuk ne yapmalıdır?','["Elektrik aksamını açmalıdır.","Su dökmelidir.","Kabloyu çekiştirmelidir.","Güvenilir yetişkinden yardım istemelidir."]',3,'Doğru davranış ve bilgi kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-13','coktan_secmeli','Yapay zekâ veya arama motorundan alınan bilgi kontrol edilmeli midir?','["Hayır","Evet","Her zaman doğru kabul edilir","Sadece uzun yazıysa"]',1,'Doğru davranış ve bilgi kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-14','coktan_secmeli','Ekran karşısında uzun süre kalmak yerine ne yapılmalıdır?','["Hiç ara verilmemelidir.","Karanlıkta daha yakından bakılmalıdır.","Uyku azaltılmalıdır.","Düzenli ara verilmelidir."]',3,'Doğru davranış ve bilgi kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-15','coktan_secmeli','Teknolojik araçların enerji tüketimi önemli midir?','["Hayır","Evet","Sadece rengi önemli","Elektrik kullanmazlar"]',1,'Doğru davranış ve bilgi kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-16','coktan_secmeli','Bir sanat çalışmasında farklı malzemeler kullanılabilir mi?','["Hayır","Sadece kalem","Sadece boya","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-17','coktan_secmeli','Bilim ve sanat ortak olarak yaratıcılık gerektirebilir mi?','["Hayır","Evet","Sadece bilim","Sadece sanat"]',1,'Doğru davranış ve bilgi kullanılır.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-18','coktan_secmeli','Bir çözüm üretirken kullanıcı ihtiyacını düşünmek neden önemlidir?','["Sadece rengini seçmek için","Sorunu büyütmek için","Malzemeyi artırmak için","Çözümün işe yaraması için"]',3,'Doğru davranış ve bilgi kullanılır.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-19','coktan_secmeli','Bir deneyde güvenlik kuralı önemlidir mi?','["Hayır","Evet","Sadece yetişkinler için","Deneyde kural yoktur"]',1,'Doğru davranış ve bilgi kullanılır.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'hb3-bilim-20','coktan_secmeli','Dijital ortamda saygılı iletişim gerçek hayattaki kadar önemli midir?','["Hayır","İnternette kurallar yoktur","Sadece okulda önemlidir","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='hb3-bilim-konu' AND (d.kod='hayat' OR d.ad='Hayat Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-hayat-1','coktan_secmeli','Bir şehirdeki binaların biçimlerini çizmek neye örnektir?','["Kütle ölçmeye","Çevreden sanat fikri üretmeye","Zaman tutmaya","Ses kaydetmeye"]',1,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-hayat-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-hayat-2','coktan_secmeli','Doğadaki yaprak damarları hangi görsel ögeyi düşündürür?','["Ses","Koku","Ağırlık","Çizgi"]',3,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-hayat-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-hayat-3','coktan_secmeli','Taşın pürüzlü yüzeyi hangi kavramdır?','["Tempo","Doku","Kütle","Zaman"]',1,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-hayat-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-hayat-4','coktan_secmeli','Doğal ve yapay nesneler sanat çalışmasında birlikte kullanılabilir mi?','["Hayır","Sadece doğal","Sadece yapay","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-hayat-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-hayat-5','coktan_secmeli','Çevreden malzeme toplarken ne yapılmalıdır?','["Canlı dalları kırmak","Doğaya zarar vermemek","Yuvaları bozmak","Çöp bırakmak"]',1,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-hayat-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-hayat-6','coktan_secmeli','Bir mahallenin görüntüsü resme konu olabilir mi?','["Hayır","Sadece müze konu olur","Sadece insan çizilir","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-hayat-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-dil-1','coktan_secmeli','Tekrar edilen şekiller ne oluşturabilir?','["Koku","Ses","Kütle","Ritim"]',3,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-dil-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-dil-2','coktan_secmeli','Resimde bir ögenin özellikle dikkat çekmesine ne denebilir?','["Kütle","Vurgu","Zaman","Sıcaklık"]',1,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-dil-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-dil-3','coktan_secmeli','Görsel denge neyle ilgilidir?','["Sadece ağırlık ölçümüyle","Saatle","Sesle","Ögelerin düzenli dağılımıyla"]',3,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-dil-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-dil-4','coktan_secmeli','Kalın ve ince çizgi arasındaki fark nedir?','["Koku","Çizgi kalınlığı","Tat","Ses"]',1,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-dil-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-dil-5','coktan_secmeli','Bir yüzeyin pürüzlü görünmesi neyi anlatabilir?','["Tempo","Zaman","Kütle","Doku"]',3,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-dil-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-dil-6','coktan_secmeli','Boş ve dolu alanlar kompozisyonu etkiler mi?','["Hayır","Evet","Sadece yazıda","Sadece müzikte"]',1,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-dil-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-sanatci-1','coktan_secmeli','Bir kişinin görünüşünü konu alan resme ne denebilir?','["Natürmort","Portre","Manzara","Grafik"]',1,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-sanatci-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-sanatci-2','coktan_secmeli','Meyve ve vazo gibi cansız nesneleri konu alan resim?','["Portre","Harita","Kroki","Natürmort"]',3,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-sanatci-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-sanatci-3','coktan_secmeli','Doğa görüntüsünü konu alan resim?','["Portre","Manzara","Natürmort","Tabela"]',1,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-sanatci-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-sanatci-4','coktan_secmeli','Sanatçılar aynı konuyu farklı biçimde yorumlayabilir mi?','["Hayır","Her eser aynı olmalı","Yorum yapılamaz","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-sanatci-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-sanatci-5','coktan_secmeli','Bir eseri incelerken hangi özellik değerlendirilebilir?','["Sadece fiyat","Renk, teknik ve konu","Sadece çerçeve vidası","Sadece ağırlık"]',1,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-sanatci-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-sanatci-6','coktan_secmeli','Farklı sanat eserleri farklı duygular uyandırabilir mi?','["Hayır","Herkes aynı hissetmeli","Duygu sanatla ilişkili değil","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-sanatci-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-cizim-1','coktan_secmeli','Yakındaki nesneyi büyük, uzaktakini küçük çizmek ne sağlar?','["Ses","Koku","Kütle","Derinlik hissi"]',3,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-cizim-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-cizim-2','coktan_secmeli','Taslak ne işe yarar?','["Kâğıdı küçültmeye","Çalışmayı önceden planlamaya","Boyayı kurutmaya","Resmi silmeye"]',1,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-cizim-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-cizim-3','coktan_secmeli','Bir nesneyi farklı açılardan çizmek ne sağlar?','["Kokusunu değiştirmeyi","Ağırlığını azaltmayı","Sesini artırmayı","Farklı görünüşlerini fark etmeyi"]',3,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-cizim-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-cizim-4','coktan_secmeli','Çizimde oran neyle ilgilidir?','["Sadece renkle","Parçaların birbirine göre büyüklüğüyle","Sesle","Kokuyla"]',1,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-cizim-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-cizim-5','coktan_secmeli','Gözlem çiziminde ne önemlidir?','["Gözleri kapatmak","Nesneyi saklamak","Rastgele çizmek","Ayrıntıları dikkatle incelemek"]',3,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-cizim-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-cizim-6','coktan_secmeli','Çizim araçları nasıl kullanılmalıdır?','["Fırlatarak","Güvenli ve özenli","Kırarak","Arkadaşa yönelterek"]',1,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-cizim-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-renk-1','coktan_secmeli','Ana renklerden biri hangisidir?','["Yeşil","Kırmızı","Mor","Turuncu"]',1,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-renk-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-renk-2','coktan_secmeli','Ana renklerden biri hangisidir?','["Yeşil","Mor","Turuncu","Sarı"]',3,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-renk-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-renk-3','coktan_secmeli','Ana renklerden biri hangisidir?','["Yeşil","Mavi","Mor","Turuncu"]',1,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-renk-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-renk-4','coktan_secmeli','Sarı + mavi hangi rengi oluşturur?','["Turuncu","Mor","Kırmızı","Yeşil"]',3,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-renk-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-renk-5','coktan_secmeli','Kırmızı + sarı hangi rengi oluşturur?','["Yeşil","Turuncu","Mor","Mavi"]',1,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-renk-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-renk-6','coktan_secmeli','Kırmızı + mavi hangi rengi oluşturur?','["Yeşil","Turuncu","Sarı","Mor"]',3,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-renk-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-milli-1','coktan_secmeli','Millî bayram afişinde hangi sembol kullanılabilir?','["Fiyat etiketi","Rastgele reklam","Trafik bileti","Türk bayrağı"]',3,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-milli-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-milli-2','coktan_secmeli','Kültürel motifler sanat çalışmasında kullanılabilir mi?','["Hayır","Evet","Sadece matematikte","Sadece sporda"]',1,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-milli-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-milli-3','coktan_secmeli','Geleneksel desenleri incelemek neyi tanımaya yardım eder?','["Kütleyi","Zamanı","Elektriği","Kültürel mirası"]',3,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-milli-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-milli-4','coktan_secmeli','Millî sembollere nasıl davranılmalıdır?','["Dikkatsiz","Saygılı","Zarar vererek","Alay ederek"]',1,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-milli-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-milli-5','coktan_secmeli','Yerel el sanatları kültürel değer midir?','["Hayır","Sadece eşya","Kültürle ilgisiz","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-milli-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-milli-6','coktan_secmeli','Bir afişte mesajı güçlendirmek için ne kullanılabilir?','["İlgisiz şekiller","Uygun görsel ve yazı","Okunmayan yazı","Rastgele semboller"]',1,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-milli-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-muze-1','coktan_secmeli','Müzede eserlere neden dokunulmamalıdır?','["Daha hızlı gezmek için","Eserleri korumak için","Rengini değiştirmek için","Fotoğraf çekmek için"]',1,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-muze-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-muze-2','coktan_secmeli','Müze kurallarına nereden ulaşılabilir?','["Tahmin ederek","Eseri elleyerek","Bağırarak","Görevliler ve bilgilendirme işaretlerinden"]',3,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-muze-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-muze-3','coktan_secmeli','Tarihî eserleri korumak neden önemlidir?','["Yok etmek için","Gelecek kuşaklara aktarmak için","Satmak için","Rengini değiştirmek için"]',1,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-muze-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-muze-4','coktan_secmeli','Sanat galerisi neyi sergileyebilir?','["Sadece araçları","Sadece yiyecekleri","Sadece spor malzemesini","Sanat eserlerini"]',3,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-muze-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-muze-5','coktan_secmeli','Müzede koşmak uygun mudur?','["Evet","Hayır","Sadece kalabalıkta","Sadece çocuklara"]',1,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-muze-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'gs3-muze-6','coktan_secmeli','Bir eser hakkında bilgi edinmek için ne yapılabilir?','["Eser üzerine yazılır.","Eser değiştirilir.","Eser taşınır.","Eser etiketi veya rehber bilgisi okunabilir."]',3,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='gs3-muze-konu' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-dil-1','coktan_secmeli','Müziğin hızlı-yavaş oluşuna ne denir?','["Renk","Doku","Kütle","Tempo"]',3,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-dil-2','coktan_secmeli','Sesin kuvvetli-hafif oluşu hangi kavramdır?','["Uzunluk","Gürlük","Renk","Koku"]',1,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-dil-3','coktan_secmeli','Düzenli vuruşlar neyi oluşturabilir?','["Kütle","Zaman ölçü birimi","Renk","Ritim"]',3,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-dil-4','coktan_secmeli','Alkış beden perküsyonuna örnek midir?','["Hayır","Evet","Sadece davul ritimdir","Alkış müzik değildir"]',1,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-dil-5','coktan_secmeli','Bir ezginin ince-kalın sesleri olabilir mi?','["Hayır","Sadece gürlük vardır","Sesler aynı olmak zorunda","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-dil-6','coktan_secmeli','Hızlı tempoda hareket nasıl olabilir?','["Her zaman çok yavaş","Ritme uygun daha hızlı","Ritimden bağımsız","Hareketsiz"]',1,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-dil-7','coktan_secmeli','Müzik durduğunda durmak hangi beceriyi geliştirir?','["Kütle ölçmeyi","Yazı yazmayı","Renk seçmeyi","Dinleme ve ritim takibini"]',3,'Doğru davranış ve bilgi kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-dil-8','coktan_secmeli','Birlikte şarkı söylerken ne önemlidir?','["En yüksek sesle bağırmak","Birbirini dinlemek ve uyum","Farklı anda başlamak","Sözleri rastgele değiştirmek"]',1,'Doğru davranış ve bilgi kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-dil-9','coktan_secmeli','Çok yüksek ses işitmeye zarar verebilir mi?','["Hayır","Sadece gece","Sadece yetişkinlere","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-dil-10','coktan_secmeli','Ritim kalıbı tekrar edebilir mi?','["Hayır","Evet","Ritim tekrar içermez","Sadece sessizliktir"]',1,'Doğru davranış ve bilgi kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-dil-11','coktan_secmeli','Bir müzik parçasında sessizlik anı da önemli olabilir mi?','["Hayır","Müzikte sessizlik olmaz","Sadece gürültü önemlidir","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-dil-12','coktan_secmeli','Tempo değişince hareketi değiştirmek mümkün müdür?','["Hayır","Evet","Sadece şarkıcı değişir","Tempo hareketi etkilemez"]',1,'Doğru davranış ve bilgi kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-dil-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-kultur-1','coktan_secmeli','Bağlama hangi tür çalgıdır?','["Vurmalı","Üflemeli","Elektriksiz olmaz","Telli çalgı"]',3,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-kultur-2','coktan_secmeli','Davul hangi tür çalgıdır?','["Telli","Vurmalı çalgı","Yaylı","Klavye"]',1,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-kultur-3','coktan_secmeli','Flüt hangi tür çalgıdır?','["Vurmalı","Telli","Yaylı","Üflemeli çalgı"]',3,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-kultur-4','coktan_secmeli','Müzik dinlerken nasıl davranılmalıdır?','["Sürekli konuşarak","Dikkatli ve saygılı","Koşarak","Çalgıya dokunarak"]',1,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-kultur-5','coktan_secmeli','İstiklâl Marşı söylenirken nasıl davranılır?','["Konuşarak","Oyun oynayarak","Koşarak","Saygılı biçimde"]',3,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-kultur-6','coktan_secmeli','Geleneksel müzikler kültür hakkında bilgi verebilir mi?','["Hayır","Evet","Sadece ses verir","Kültürle ilişkisi yok"]',1,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-kultur-7','coktan_secmeli','Farklı yörelerin farklı müzikleri olabilir mi?','["Hayır","Her yerde aynı","Yöre müziği yoktur","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-kultur-8','coktan_secmeli','Çalgılar nasıl korunmalıdır?','["Fırlatarak","Özenli ve kurallara uygun","Kırarak","İzinsiz sökerek"]',1,'Doğru davranış ve bilgi kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-kultur-9','coktan_secmeli','Bir konser sonunda uygun zamanda alkış neyi gösterebilir?','["Kabalık","İsraf","Dışlama","Takdir ve saygı"]',3,'Doğru davranış ve bilgi kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-kultur-10','coktan_secmeli','Müzik grubu birlikte çalarken ne önemlidir?','["Herkesin rastgele çalması","Uyum ve dinleme","Birbirini duymamak","Kuralsızlık"]',1,'Doğru davranış ve bilgi kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-kultur-11','coktan_secmeli','Bir türküyü öğrenmek neyi tanımaya katkı sağlayabilir?','["Kütleyi","Elektriği","Uzunluğu","Müzik kültürünü"]',3,'Doğru davranış ve bilgi kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'muz3-kultur-12','coktan_secmeli','Müzikte farklı kültürlere saygı göstermek önemli midir?','["Hayır","Evet","Sadece kendi müziğimiz dinlenir","Farklı müzik yasaktır"]',1,'Doğru davranış ve bilgi kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='muz3-kultur-konu' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-isbirligi-1','coktan_secmeli','Takım oyununda en önemli davranışlardan biri?','["Tek başına oynamak","Arkadaşları dışlamak","Kuralları yok saymak","İletişim ve iş birliği"]',3,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-isbirligi-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-isbirligi-2','coktan_secmeli','Takım arkadaşına pas vermek neyi destekler?','["Dışlamayı","İş birliğini","Hileyi","Kabalığı"]',1,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-isbirligi-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-isbirligi-3','coktan_secmeli','Takım arkadaşın hata yaptığında ne yapmalısın?','["Alay etmelisin.","Oyundan kovmalısın.","Bağırmalısın.","Destek olmalısın."]',3,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-isbirligi-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-isbirligi-4','coktan_secmeli','Birlikte hedefe ulaşmak için ne gereklidir?','["Kimsenin görev almaması","Görev paylaşımı","Tüm işi tek kişiye vermek","Kuralsızlık"]',1,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-isbirligi-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-isbirligi-5','coktan_secmeli','Takımda herkesin oyuna katılması neden önemlidir?','["Bir kişiyi yormak için","Oyunu bozmak için","Kimse oynamasın diye","Adalet ve iş birliği için"]',3,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-isbirligi-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-isbirligi-6','coktan_secmeli','Rakip takıma saygı göstermek neyin parçasıdır?','["Hilenin","Sportmenliğin","Dışlamanın","Kuralsızlığın"]',1,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-isbirligi-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-isbirligi-7','coktan_secmeli','İş birlikli oyunda iletişim nasıl olmalıdır?','["Kırıcı","Bağırarak","Gizli ve yanıltıcı","Açık ve saygılı"]',3,'Doğru davranış ve bilgi kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-isbirligi-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-isbirligi-8','coktan_secmeli','Takım stratejisi ne olabilir?','["Kuralları bozmak","Görevleri uygun paylaşmak","Topu saklamak","Rakibi itmek"]',1,'Doğru davranış ve bilgi kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-isbirligi-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-isbirligi-9','coktan_secmeli','Takım arkadaşının güçlü yönünü kullanmak ne sağlar?','["Dışlama","Hile","İsraf","Takım başarısına katkı"]',3,'Doğru davranış ve bilgi kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-isbirligi-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-isbirligi-10','coktan_secmeli','Oyunda kazanmak kadar önemli olan nedir?','["Rakibi küçümsemek","Adil ve güvenli oynamak","Kuralları bozmak","Tartışmak"]',1,'Doğru davranış ve bilgi kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-isbirligi-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-kural-1','coktan_secmeli','Oyun kuralı neden değiştirilmek istenebilir?','["Hile yapmak için","Oyunu daha güvenli veya adil yapmak için","Birini dışlamak için","Kuralsız oynamak için"]',1,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-kural-2','coktan_secmeli','Alan küçülürse hangi kural değişebilir?','["Kimse kural bilmesin","İtmek serbest olsun","Top saklansın","Oyuncu sayısı veya hareket sınırı"]',3,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-kural-3','coktan_secmeli','Yeni kural herkese açıklanmalı mıdır?','["Hayır","Evet","Sadece kazanan bilsin","Sadece öğretmen bilsin"]',1,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-kural-4','coktan_secmeli','Bir kural sadece bir takıma avantaj sağlıyorsa adil midir?','["Evet","Sadece finalde","Sadece hızlı oyunda","Hayır"]',3,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-kural-5','coktan_secmeli','Kural değişikliğinde güvenlik düşünülmeli midir?','["Hayır","Evet","Sadece skor","Sadece süre"]',1,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-kural-6','coktan_secmeli','Oyunu kolaylaştırmak için hedef büyütülebilir mi?','["Asla","Sadece rakip için","Kuralsızca","Evet, amaca uygunsa"]',3,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-kural-7','coktan_secmeli','Bir oyunda herkes çok bekliyorsa ne değiştirilebilir?','["Bekleme artırılabilir","Katılımı artıran sıra veya takım düzeni","Oyuncular çıkarılabilir","Oyun durdurulabilir"]',1,'Doğru davranış ve bilgi kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-kural-8','coktan_secmeli','Kurallar yeniden oluşturulurken kimlerin görüşü alınabilir?','["Kimsenin","Sadece izleyicinin","Sadece bir kişinin","Oyuncuların"]',3,'Doğru davranış ve bilgi kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-kural-9','coktan_secmeli','Yeni kural denendikten sonra ne yapılabilir?','["Hiç değerlendirilmez.","İşe yarayıp yaramadığı değerlendirilebilir.","Kural gizlenir.","Skor silinir."]',1,'Doğru davranış ve bilgi kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-kural-10','coktan_secmeli','Kurala uymayan davranış görülürse ne yapılır?','["Kavga edilir.","Oyuncu itilir.","Hile yapılır.","Sakin biçimde kural hatırlatılır."]',3,'Doğru davranış ve bilgi kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-kural-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-ritim-1','coktan_secmeli','Tempo hızlanırsa hareket nasıl uyarlanabilir?','["Her zaman durur.","Ritim önemsenmez.","Yavaşlamak zorunlu","Hızlandırılabilir."]',3,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-ritim-2','coktan_secmeli','Tempo yavaşlarsa ne yapılabilir?','["Daha hızlı koşulur.","Hareket yavaşlatılabilir.","Ritimden kopulur.","Oyun bırakılır."]',1,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-ritim-3','coktan_secmeli','Eşli ritmik harekette ne önemlidir?','["Birbirini itmek","Farklı anda başlamak","Müziği dinlememek","Birbirine uyum"]',3,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-ritim-4','coktan_secmeli','Beden perküsyonuna örnek?','["Kitap okuma","Alkış ve dizlere ritmik vurma","Uyuma","Resim çizme"]',1,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-ritim-5','coktan_secmeli','Ritim değiştiğinde hareket dizisi değişebilir mi?','["Hayır","Sadece müzik durur","Ritim hareketi etkilemez","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-ritim-6','coktan_secmeli','Müzik durunca hareketi durdurmak neyi geliştirir?','["Kütle ölçmeyi","Dikkat ve ritim takibini","Yazı yazmayı","Renk seçmeyi"]',1,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-ritim-7','coktan_secmeli','Grup aynı ritimde hareket ederse ne oluşur?','["Hile","Dışlama","İsraf","Uyum"]',3,'Doğru davranış ve bilgi kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-ritim-8','coktan_secmeli','Ritmik hareket alanında güvenlik için ne gerekir?','["Birbirine çok yaklaşmak","Yeterli kişisel alan","İtmek","Gözleri kapatmak"]',1,'Doğru davranış ve bilgi kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-ritim-9','coktan_secmeli','Farklı ritimlere yeni hareket üretmek neyi geliştirir?','["Kuralsızlığı","Dışlamayı","Hileyi","Yaratıcılığı"]',3,'Doğru davranış ve bilgi kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-ritim-10','coktan_secmeli','Ritmi doğru takip etmek için ne yapılır?','["Ses önemsenmez.","Dikkatle dinlenir.","Gözler kapatılır zorunlu","Rastgele hareket edilir."]',1,'Doğru davranış ve bilgi kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-ritim-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-saglik-1','coktan_secmeli','Isınmanın amacı nedir?','["Daha çok yorulmak","Bedeni aktiviteye hazırlamak","Susuz kalmak","Uyumak"]',1,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-saglik-2','coktan_secmeli','Soğuma hareketleri neye yardım eder?','["Hemen sprint atmaya","Susuz kalmaya","Uyku azaltmaya","Bedenin aktivite sonrası sakinleşmesine"]',3,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-saglik-3','coktan_secmeli','Fiziksel aktivitede su içmek neden önemlidir?','["Daha ağır olmak için","Sıvı ihtiyacını karşılamak için","Ayakkabıyı temizlemek için","Skoru artırmak için"]',1,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-saglik-4','coktan_secmeli','Düzenli hareket neyi destekler?','["Hareketsizliği","Uykusuzluğu","Susuzluğu","Sağlıklı büyüme ve zindeliği"]',3,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-saglik-5','coktan_secmeli','Ağrı hissedersen ne yapmalısın?','["Zorlamaya devam etmelisin.","Durup yetişkine söylemelisin.","Gizlemelisin.","Daha hızlı koşmalısın."]',1,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-saglik-6','coktan_secmeli','Uygun spor kıyafeti nasıl olmalı?','["Hareketi engelleyen","Kaygan","Tehlikeli aksesuarlarla","Rahat ve güvenli"]',3,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-saglik-7','coktan_secmeli','Kendi aktivite hedefi nasıl olmalıdır?','["Tehlikeli","Yaşa ve beceriye uygun","Ulaşılamaz","Herkesle aynı zorunlu"]',1,'Doğru davranış ve bilgi kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-saglik-8','coktan_secmeli','Yeterli uyku aktiviteye katkı sağlar mı?','["Hayır","Uyku gereksizdir","Sadece yetişkinler için","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-saglik-9','coktan_secmeli','Sıcak havada aktivitede ne önemlidir?','["Hiç su içmemek","Su ve uygun korunma","Kalın kışlık","Uzun süre gölgəsiz kalmak"]',1,'Doğru davranış ve bilgi kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-saglik-10','coktan_secmeli','Aktivite sonrası öz değerlendirme ne sağlar?','["Skoru gizlemeyi","Kuralları bozmayı","Yorgunluğu artırmayı","Gelişimini fark etmeyi"]',3,'Doğru davranış ve bilgi kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-saglik-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-cevre-1','coktan_secmeli','Parkurda yön işaretleri ne işe yarar?','["Kütle ölçmeye","Skor gizlemeye","Rengi değiştirmeye","Rotayı takip etmeye"]',3,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-cevre-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-cevre-2','coktan_secmeli','Açık alanda koşarken neye dikkat edilir?','["Sadece hıza","Zemin ve çevredeki engellere","Gözleri kapamaya","Arkadaş itmeye"]',1,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-cevre-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-cevre-3','coktan_secmeli','Bir kroki hareket rotası için kullanılabilir mi?','["Hayır","Sadece matematikte","Kroki hareketle ilgisiz","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-cevre-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-cevre-4','coktan_secmeli','Doğada hareket ederken çöpler ne yapılmalı?','["Yere bırakılmalı","Toplanıp uygun yere atılmalı","Suya atılmalı","Ağaç dibine gömülmeli"]',1,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-cevre-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-cevre-5','coktan_secmeli','Yön bulmada belirgin çevre noktaları yardımcı olabilir mi?','["Hayır","Sadece pusula olabilir","Çevreye bakılmaz","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-cevre-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-cevre-6','coktan_secmeli','Kaygan zeminde nasıl hareket edilmelidir?','["Hızlı koşarak","Yavaş ve kontrollü","Zıplayarak","Arkadaşı iterek"]',1,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-cevre-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-cevre-7','coktan_secmeli','Açık alan etkinliğinde hava koşulları önemli midir?','["Hayır","Sadece skor önemli","Hava hareketi etkilemez","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-cevre-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-cevre-8','coktan_secmeli','Doğal alanda bitkilere zarar vermeden hareket etmek önemli midir?','["Hayır","Evet","Bitkiler önemsiz","Sadece parkta"]',1,'Doğru davranış ve bilgi kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-cevre-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-cevre-9','coktan_secmeli','Rotada başlangıç ve hedef belirlemek ne sağlar?','["Kuralları kaldırır.","Skoru gizler.","Alanı küçültür.","Hareket planını netleştirir."]',3,'Doğru davranış ve bilgi kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-cevre-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-cevre-10','coktan_secmeli','Çevreyi keşfederken güvenli sınırlar belirlenmeli midir?','["Hayır","Evet","Sınır gereksiz","Sadece yetişkinlere"]',1,'Doğru davranış ve bilgi kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-cevre-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-gelenek-1','coktan_secmeli','Mendil kapmaca neye örnektir?','["Elektronik cihaza","Geleneksel çocuk oyununa","Müzik aletine","Yemek türüne"]',1,'Doğru davranış ve bilgi kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-gelenek-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-gelenek-2','coktan_secmeli','Seksek geleneksel oyun olabilir mi?','["Hayır","Sadece dijital oyundur","Bir spor aletidir","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-gelenek-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-gelenek-3','coktan_secmeli','Geleneksel oyunları kimlerden öğrenebiliriz?','["Sadece reklamlardan","Aile büyükleri ve kültürel kaynaklardan","Kimse öğretemez","Sadece yabancı dilden"]',1,'Doğru davranış ve bilgi kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-gelenek-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-gelenek-4','coktan_secmeli','Geleneksel oyunların kuralları öğrenilmeli midir?','["Hayır","Kuralsız oynanır","Sadece kazanan bilir","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-gelenek-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-gelenek-5','coktan_secmeli','Bu oyunlar neyi tanımaya yardım eder?','["Kütleyi","Kültürel birikimi","Elektriği","Uzunluğu"]',1,'Doğru davranış ve bilgi kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-gelenek-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-gelenek-6','coktan_secmeli','Oyunda rakibe saygı göstermek gerekli midir?','["Hayır","Sadece kazanırken","Sadece öğretmen varken","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-gelenek-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-gelenek-7','coktan_secmeli','Eski oyunları yeni kuşaklara öğretmek ne sağlar?','["Oyunun unutulmasını","Kültürel aktarımı","Dışlamayı","Kirliliği"]',1,'Doğru davranış ve bilgi kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-gelenek-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-gelenek-8','coktan_secmeli','Geleneksel oyunlar hareket becerilerini de geliştirebilir mi?','["Hayır","Sadece oturarak oynanır","Hareketle ilişkisi yok","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-gelenek-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-gelenek-9','coktan_secmeli','Oyun alanı güvenli olmalı mıdır?','["Hayır","Evet","Sadece skor önemli","Alan önemli değil"]',1,'Doğru davranış ve bilgi kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-gelenek-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'be3-gelenek-10','coktan_secmeli','Oyunun yörelere göre farklı kuralları olabilir mi?','["Hayır","Her yerde zorunlu aynı","Kural hiç değişmez","Evet"]',3,'Doğru davranış ve bilgi kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='be3-gelenek-konu' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;
