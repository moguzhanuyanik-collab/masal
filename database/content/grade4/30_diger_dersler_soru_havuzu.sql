SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'traf4-yaya','Yaya Güvenliği','Yaya Güvenliği','Yaya Güvenliği konusunu uygular.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='traf4-kural'
WHERE d.kod='trafik' OR d.ad='Trafik Güvenliği'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'traf4-yolcu','Yolcu ve Bisiklet Güvenliği','Yolcu ve Bisiklet Güvenliği','Yolcu ve Bisiklet Güvenliği konusunu uygular.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='traf4-kural'
WHERE d.kod='trafik' OR d.ad='Trafik Güvenliği'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'traf4-isaret','Trafik İşaretleri ve Kurallar','Trafik İşaretleri ve Kurallar','Trafik İşaretleri ve Kurallar konusunu uygular.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='traf4-kural'
WHERE d.kod='trafik' OR d.ad='Trafik Güvenliği'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'traf4-kaza','Kazaları Önleme','Kazaları Önleme','Kazaları Önleme konusunu uygular.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='traf4-yardim'
WHERE d.kod='trafik' OR d.ad='Trafik Güvenliği'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'traf4-112','Acil Durum ve 112','Acil Durum ve 112','Acil Durum ve 112 konusunu uygular.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='traf4-yardim'
WHERE d.kod='trafik' OR d.ad='Trafik Güvenliği'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'traf4-ilk-yardim','İlk Yardım Bilinci','İlk Yardım Bilinci','İlk Yardım Bilinci konusunu uygular.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='traf4-yardim'
WHERE d.kod='trafik' OR d.ad='Trafik Güvenliği'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'ih4-deger','İnsan Değeri ve Farklılıklar','İnsan Değeri ve Farklılıklar','İnsan Değeri ve Farklılıklar konusunu uygular.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='ih4-insan'
WHERE d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'ih4-temel-hak','Temel Haklar','Temel Haklar','Temel Haklar konusunu uygular.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='ih4-hak'
WHERE d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'ih4-sorum','Sorumluluklar','Sorumluluklar','Sorumluluklar konusunu uygular.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='ih4-hak'
WHERE d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'ih4-adalet-esit','Adalet, Eşitlik ve Hakkaniyet','Adalet, Eşitlik ve Hakkaniyet','Adalet, Eşitlik ve Hakkaniyet konusunu uygular.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='ih4-adalet'
WHERE d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'ih4-sorun','Barışçıl Sorun Çözme','Barışçıl Sorun Çözme','Barışçıl Sorun Çözme konusunu uygular.','',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='ih4-uzlasi'
WHERE d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'ih4-katilim','Kurallar ve Katılım','Kurallar ve Katılım','Kurallar ve Katılım konusunu uygular.','',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='ih4-kural'
WHERE d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'ih4-dayanisma','Dayanışma ve Birlikte Yaşama','Dayanışma ve Birlikte Yaşama','Dayanışma ve Birlikte Yaşama konusunu uygular.','',130,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='ih4-birlikte'
WHERE d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'gs4-cizgi-renk','Çizgi, Renk ve Doku','Çizgi, Renk ve Doku','Çizgi, Renk ve Doku konusunu uygular.','',140,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='gs4-uretme'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'gs4-tasarim','Görsel Tasarım','Görsel Tasarım','Görsel Tasarım konusunu uygular.','',150,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='gs4-uretme'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'gs4-miras','Sanat ve Kültürel Miras','Sanat ve Kültürel Miras','Sanat ve Kültürel Miras konusunu uygular.','',160,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='gs4-kultur'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'gs4-inceleme','Sanat Eserini İnceleme','Sanat Eserini İnceleme','Sanat Eserini İnceleme konusunu uygular.','',170,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='gs4-elestiri'
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'muz4-soyleme','Doğru Söyleme ve Dinleme','Doğru Söyleme ve Dinleme','Doğru Söyleme ve Dinleme konusunu uygular.','',180,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='muz4-dinleme'
WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'muz4-ritim','Ritim, Tempo ve Nota','Ritim, Tempo ve Nota','Ritim, Tempo ve Nota konusunu uygular.','',190,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='muz4-calma'
WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'muz4-uretme','Ritim ve Ezgi Üretme','Ritim ve Ezgi Üretme','Ritim ve Ezgi Üretme konusunu uygular.','',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='muz4-yaratici'
WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'muz4-miras','Müzik Kültürü','Müzik Kültürü','Müzik Kültürü konusunu uygular.','',210,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='muz4-kultur'
WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'be4-beceri','Temel Hareket Becerileri','Temel Hareket Becerileri','Temel Hareket Becerileri konusunu uygular.','',220,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='be4-hareket'
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'be4-aktivite','Fiziksel Aktivite ve Sağlık','Fiziksel Aktivite ve Sağlık','Fiziksel Aktivite ve Sağlık konusunu uygular.','',230,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='be4-saglik'
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'be4-adil','Adil Oyun ve İş Birliği','Adil Oyun ve İş Birliği','Adil Oyun ve İş Birliği konusunu uygular.','',240,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='be4-deger'
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'be4-gelenek','Geleneksel Oyunlar','Geleneksel Oyunlar','Geleneksel Oyunlar konusunu uygular.','',250,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='be4-deger'
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-1','coktan_secmeli','Karşıya geçerken neresi tercih edilir?','["Yaya geçidi","Viraj","Araç yolu ortası","Park yeri"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-yaya' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-2','coktan_secmeli','Kırmızı yaya ışığında ne yapılır?','["Geçilir","Koşulur","Beklenir","Telefonla yürünür"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-yaya' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-3','coktan_secmeli','Kaldırım varsa yaya nereden yürümeli?','["Kaldırımdan","Araç yolundan","Bisiklet şeridinden","Yol ortasından"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-yaya' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-4','coktan_secmeli','Araçta emniyet kemeri?','["Gereksizdir","Sadece sürücü","Kullanılmalıdır.","Sadece uzun yolda"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-yolcu' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-5','coktan_secmeli','Bisiklette kask?','["Güvenliği artırır.","Hızı artırır","Gereksizdir","Sadece yarışta"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-yolcu' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-6','coktan_secmeli','Serviste ayakta yolculuk güvenli midir?','["Evet","Sadece kısa yolda","Hayır","Sadece çocuklara"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-yolcu' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-7','coktan_secmeli','Trafik işaretleri ne sağlar?','["Düzen ve güvenlik bilgisi","Süs","Reklam","Hız artırma"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-isaret' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-8','coktan_secmeli','STOP levhası neyi bildirir?','["Hızlanmayı","Park etmeyi","Durmayı","Sola dönmeyi"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-isaret' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-9','coktan_secmeli','Işık ve levhalara uymak gerekir mi?','["Evet","Hayır","Sadece araçlar","Sadece yayalar"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-isaret' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-10','coktan_secmeli','Kazaları azaltmak için?','["Hız yapmak","Dikkati dağıtmak","Kurallara uymak","Kemer takmamak"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-kaza' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-11','coktan_secmeli','Telefonla araç kullanmak tehlikeli midir?','["Evet","Hayır","Sadece gece","Sadece şehirde"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-kaza' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-12','coktan_secmeli','Yorgun sürüş riskli midir?','["Hayır","Sadece yağmurda","Evet","Sadece gençlerde"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-kaza' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-13','coktan_secmeli','112 ne içindir?','["Acil yardım","Şaka","Saat sorma","Ödev"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-112' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-14','coktan_secmeli','112 arandığında ne yapılmalı?','["Şaka yapılmalı","Adres gizlenmeli","Sakin ve doğru bilgi verilmeli","Telefon kapatılmalı"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-112' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-15','coktan_secmeli','Gereksiz 112 araması doğru mudur?','["Hayır","Evet","Sadece çocuklara","Sadece gece"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-112' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-16','coktan_secmeli','İlk yardımın amacı?','["Tedavi yerine geçmek","İlaç vermek her zaman","Profesyonel yardım gelene kadar yaşamı korumaya destek olmak","Hastaneyi gereksiz kılmak"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-ilk-yardim' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-17','coktan_secmeli','Bilinmeyen yaralıyı gereksiz hareket ettirmek doğru mudur?','["Hayır","Evet","Sadece hızlıca","Her zaman"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-ilk-yardim' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-18','coktan_secmeli','İlk yardımda yetişkin/uzman desteği önemli midir?','["Hayır","Sadece çocuklar yapmalı","Evet","112 gerekmez"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-ilk-yardim' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-19','coktan_secmeli','Her insan değerli midir?','["Evet","Hayır","Sadece başarılılar","Sadece yetişkinler"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-deger' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-20','coktan_secmeli','Farklılıklara saygı gerekli midir?','["Hayır","Sadece benzerlere","Evet","Sadece okulda"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-deger' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-21','coktan_secmeli','Ayrımcılık adil midir?','["Hayır","Evet","Bazen her zaman","Sadece çocuklara"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-deger' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-22','coktan_secmeli','Eğitim hakkı temel hak mıdır?','["Hayır","Ödül","Evet","İstek"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-temel-hak' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-23','coktan_secmeli','Yaşama hakkı var mıdır?','["Evet","Hayır","Sadece yetişkinlerde","Sadece vatandaşlarda"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-temel-hak' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-24','coktan_secmeli','Düşünceyi ifade hakkı başkasına zarar verme özgürlüğü müdür?','["Evet","Her zaman","Hayır","Kural yoktur"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-temel-hak' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-25','coktan_secmeli','Haklarla birlikte ne vardır?','["Sorumluluk","Sadece istek","Sadece ödül","Hile"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-sorum' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-26','coktan_secmeli','Ortak alanı korumak sorumluluk mudur?','["Hayır","Sadece görevlinin","Evet","Kimsenin"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-sorum' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-27','coktan_secmeli','Kendi görevini yapmak?','["Sorumluluktur.","Haktır sadece","İsraftır","Dışlamadır"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,27,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-sorum' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-28','coktan_secmeli','Eşitlik her durumda herkese tamamen aynı şey vermek midir?','["Evet her zaman","Adalet yoktur","Her zaman değil; ihtiyaç ve hakkaniyet de önemlidir.","Sadece okulda"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,28,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-adalet-esit' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-29','coktan_secmeli','Adalet neyi gözetir?','["Hakları ve hakkaniyeti","Kayırmayı","Hileyi","Gücü"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,29,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-adalet-esit' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-30','coktan_secmeli','Haksız ayrım adil midir?','["Evet","Sadece oyunda","Hayır","Sadece evde"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,30,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-adalet-esit' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-31','coktan_secmeli','Uzlaşma ne demektir?','["Ortak çözüm bulmaya çalışma","Kavga","Bağırma","Dışlama"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,31,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-sorun' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-32','coktan_secmeli','Sorunda karşı taraf dinlenmeli mi?','["Hayır","Sadece öğretmen","Evet","Sadece arkadaş"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,32,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-sorun' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-33','coktan_secmeli','Şiddet barışçıl çözüm müdür?','["Hayır","Evet","Bazen her zaman","Sadece oyunda"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,33,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-sorun' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-34','coktan_secmeli','Ortak kararda görüş bildirmek katılım mıdır?','["Hayır","Hile","Evet","İsraf"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,34,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-katilim' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-35','coktan_secmeli','Kurallar değişebilir mi?','["İhtiyaca göre adil süreçle evet","Asla","Sadece gizlice","Sadece bir kişi isterse"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,35,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-katilim' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-36','coktan_secmeli','Oylama bir katılım yöntemi olabilir mi?','["Hayır","Sadece yetişkinlerde","Evet","Sadece sporda"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,36,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-katilim' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-37','coktan_secmeli','Dayanışma ne demektir?','["Birbirine destek olmak","Dışlamak","Kavga etmek","Yarışmak"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,37,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-dayanisma' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-38','coktan_secmeli','Farklı kültürlerle birlikte yaşamak mümkün mü?','["Hayır","Sadece aynı kültür","Evet","Farklılık yasaktır"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,38,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-dayanisma' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-39','coktan_secmeli','Toplumsal sorunlarda iş birliği önemli mi?','["Evet","Hayır","Tek kişi yeter","Sorun yoktur"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,39,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-dayanisma' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-40','coktan_secmeli','Ana renklerden biri?','["Yeşil","Mor","Kırmızı","Turuncu"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,40,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-cizgi-renk' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-41','coktan_secmeli','Doku neyi anlatır?','["Yüzey özelliğini","Sesi","Zamanı","Kütleyi"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-cizgi-renk' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-42','coktan_secmeli','Çizgi farklı kalınlıklarda olabilir mi?','["Hayır","Sadece siyah","Evet","Sadece düz"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-cizgi-renk' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-43','coktan_secmeli','Kompozisyon neyle ilgilidir?','["Görsel ögelerin düzeniyle","Sadece fiyatla","Sadece çerçeveyle","Sadece boyayla"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-tasarim' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-44','coktan_secmeli','Taslak ne işe yarar?','["Silmek için","Kâğıdı atmak için","Planlamaya","Boyayı kurutmak için"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-tasarim' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-45','coktan_secmeli','Vurgu ne sağlar?','["Bir ögeyi öne çıkarmayı","Her şeyi eşit gizlemeyi","Sesi artırmayı","Kütleyi ölçmeyi"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,45,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-tasarim' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-46','coktan_secmeli','Müze kültürel mirası tanımaya yardım eder mi?','["Hayır","Sadece oyun","Evet","Sadece alışveriş"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,46,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-miras' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-47','coktan_secmeli','Tarihî eserler korunmalı mı?','["Evet","Hayır","Üzerine yazılmalı","Kırılmalı"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,47,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-miras' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-48','coktan_secmeli','Geleneksel motifler sanatın parçası olabilir mi?','["Hayır","Sadece matematik","Evet","Sadece spor"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,48,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-miras' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-49','coktan_secmeli','Sanat eseri farklı yorumlanabilir mi?','["Evet","Hayır","Tek yorum zorunlu","Yorum yapılamaz"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,49,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-inceleme' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-50','coktan_secmeli','Eseri incelerken renk ve biçime bakılır mı?','["Hayır","Sadece fiyat","Evet","Sadece çerçeve"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,50,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-inceleme' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-51','coktan_secmeli','Sanatçı aynı konuyu farklı teknikle işleyebilir mi?','["Evet","Hayır","Tek teknik var","Sanatçı seçemez"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,51,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-inceleme' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-52','coktan_secmeli','Birlikte söylerken ne önemlidir?','["Bağırmak","Rastgele başlamak","Uyum ve dinleme","Sözleri değiştirmek"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,52,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-soyleme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-53','coktan_secmeli','Doğru nefes kullanımı şarkı söylemeye yardım eder mi?','["Evet","Hayır","Sadece koşuya","Müzikle ilgisiz"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,53,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-soyleme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-54','coktan_secmeli','İstiklâl Marşı saygıyla söylenmeli mi?','["Hayır","Sadece hızlı","Evet","Sadece sessiz"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,54,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-soyleme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-55','coktan_secmeli','Tempo neyi anlatır?','["Müziğin hızını","Rengini","Kokusunu","Kütlesini"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,55,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-ritim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-56','coktan_secmeli','Ritim neyle ilgilidir?','["Renklerle","Kütleyle","Düzenli vuruş ve sürelerle","Alanla"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,56,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-ritim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-57','coktan_secmeli','Nota müzikte neyi temsil eder?','["Sesleri ve süreleri yazılı göstermeye yardım eder.","Rengi","Kütleyi","Fiyatı"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,57,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-ritim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-58','coktan_secmeli','Kendi ritim kalıbını oluşturmak yaratıcılık mıdır?','["Hayır","Sadece kopya","Evet","Müzik değildir"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,58,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-uretme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-59','coktan_secmeli','Beden perküsyonu kullanılabilir mi?','["Evet","Hayır","Sadece davul","Sadece piyano"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,59,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-uretme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-60','coktan_secmeli','Ritim tekrar edebilir mi?','["Hayır","Sadece sessizlik","Evet","Ritim tekrarsızdır"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,60,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-uretme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-61','coktan_secmeli','Türküler kültürel miras olabilir mi?','["Evet","Hayır","Sadece yeni şarkılar","Müzik kültür değildir"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,61,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-miras' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-62','coktan_secmeli','Farklı yörelerin müzikleri farklı olabilir mi?','["Hayır","Hepsi aynı","Evet","Yöre müziği yoktur"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,62,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-miras' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-63','coktan_secmeli','Çalgılar özenli kullanılmalı mı?','["Evet","Hayır","Fırlatılmalı","Kırılmalı"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,63,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-miras' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-64','coktan_secmeli','Denge becerisi fiziksel etkinlikte önemli mi?','["Hayır","Sadece yazıda","Evet","Sadece müzikte"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,64,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-beceri' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-65','coktan_secmeli','Top atma-yakalama hangi beceridir?','["Nesne kontrolü","Okuma","Yazma","Dinleme"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,65,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-beceri' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-66','coktan_secmeli','Hareket alanında çevreye dikkat edilmeli mi?','["Hayır","Sadece hız","Evet","Gözler kapalı"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,66,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-beceri' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-67','coktan_secmeli','Isınma neden yapılır?','["Bedeni etkinliğe hazırlamak","Daha çok yorulmak","Su içmemek","Uyumak"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,67,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-aktivite' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-68','coktan_secmeli','Su içmek neden önemli?','["Skor için","Ayakkabı için","Sıvı ihtiyacı için","Renk için"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,68,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-aktivite' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-69','coktan_secmeli','Ağrı hissedilirse?','["Durup yetişkine söylemek","Zorlamaya devam","Gizlemek","Hızlanmak"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,69,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-aktivite' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-70','coktan_secmeli','Rakibe saygı sportmenlik midir?','["Hayır","Sadece kazanınca","Evet","Sadece öğretmen varken"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,70,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-adil' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-71','coktan_secmeli','Hile adil oyun mudur?','["Hayır","Evet","Sadece finalde","Sadece küçük hile"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,71,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-adil' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-72','coktan_secmeli','Takım arkadaşını desteklemek?','["Dışlamadır","Hiledir","İş birliğidir.","Kabalıktır"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,72,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-adil' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-73','coktan_secmeli','Mendil kapmaca geleneksel oyun olabilir mi?','["Evet","Hayır","Elektronik cihaz","Müzik aleti"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,73,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-gelenek' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-74','coktan_secmeli','Seksek kültürel oyun örneği olabilir mi?','["Hayır","Sadece dijital","Evet","Sadece yetişkin"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,74,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-gelenek' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-1-75','coktan_secmeli','Geleneksel oyunlar büyüklerden öğrenilebilir mi?','["Evet","Hayır","Sadece internet","Kimse öğretemez"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',1,75,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-gelenek' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-1','coktan_secmeli','Karşıya geçerken neresi tercih edilir? Benzer bir durumu düşün.','["Yaya geçidi","Viraj","Araç yolu ortası","Park yeri"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,201,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-yaya' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-2','coktan_secmeli','Kırmızı yaya ışığında ne yapılır? Benzer bir durumu düşün.','["Geçilir","Koşulur","Beklenir","Telefonla yürünür"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,202,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-yaya' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-3','coktan_secmeli','Kaldırım varsa yaya nereden yürümeli? Benzer bir durumu düşün.','["Kaldırımdan","Araç yolundan","Bisiklet şeridinden","Yol ortasından"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,203,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-yaya' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-4','coktan_secmeli','Araçta emniyet kemeri? Benzer bir durumu düşün.','["Gereksizdir","Sadece sürücü","Kullanılmalıdır.","Sadece uzun yolda"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,204,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-yolcu' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-5','coktan_secmeli','Bisiklette kask? Benzer bir durumu düşün.','["Güvenliği artırır.","Hızı artırır","Gereksizdir","Sadece yarışta"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,205,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-yolcu' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-6','coktan_secmeli','Serviste ayakta yolculuk güvenli midir? Benzer bir durumu düşün.','["Evet","Sadece kısa yolda","Hayır","Sadece çocuklara"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,206,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-yolcu' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-7','coktan_secmeli','Trafik işaretleri ne sağlar? Benzer bir durumu düşün.','["Düzen ve güvenlik bilgisi","Süs","Reklam","Hız artırma"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,207,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-isaret' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-8','coktan_secmeli','STOP levhası neyi bildirir? Benzer bir durumu düşün.','["Hızlanmayı","Park etmeyi","Durmayı","Sola dönmeyi"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,208,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-isaret' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-9','coktan_secmeli','Işık ve levhalara uymak gerekir mi? Benzer bir durumu düşün.','["Evet","Hayır","Sadece araçlar","Sadece yayalar"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,209,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-isaret' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-10','coktan_secmeli','Kazaları azaltmak için? Benzer bir durumu düşün.','["Hız yapmak","Dikkati dağıtmak","Kurallara uymak","Kemer takmamak"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,210,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-kaza' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-11','coktan_secmeli','Telefonla araç kullanmak tehlikeli midir? Benzer bir durumu düşün.','["Evet","Hayır","Sadece gece","Sadece şehirde"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,211,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-kaza' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-12','coktan_secmeli','Yorgun sürüş riskli midir? Benzer bir durumu düşün.','["Hayır","Sadece yağmurda","Evet","Sadece gençlerde"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,212,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-kaza' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-13','coktan_secmeli','112 ne içindir? Benzer bir durumu düşün.','["Acil yardım","Şaka","Saat sorma","Ödev"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,213,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-112' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-14','coktan_secmeli','112 arandığında ne yapılmalı? Benzer bir durumu düşün.','["Şaka yapılmalı","Adres gizlenmeli","Sakin ve doğru bilgi verilmeli","Telefon kapatılmalı"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,214,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-112' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-15','coktan_secmeli','Gereksiz 112 araması doğru mudur? Benzer bir durumu düşün.','["Hayır","Evet","Sadece çocuklara","Sadece gece"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,215,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-112' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-16','coktan_secmeli','İlk yardımın amacı? Benzer bir durumu düşün.','["Tedavi yerine geçmek","İlaç vermek her zaman","Profesyonel yardım gelene kadar yaşamı korumaya destek olmak","Hastaneyi gereksiz kılmak"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,216,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-ilk-yardim' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-17','coktan_secmeli','Bilinmeyen yaralıyı gereksiz hareket ettirmek doğru mudur? Benzer bir durumu düşün.','["Hayır","Evet","Sadece hızlıca","Her zaman"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,217,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-ilk-yardim' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-18','coktan_secmeli','İlk yardımda yetişkin/uzman desteği önemli midir? Benzer bir durumu düşün.','["Hayır","Sadece çocuklar yapmalı","Evet","112 gerekmez"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,218,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-ilk-yardim' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-19','coktan_secmeli','Her insan değerli midir? Benzer bir durumu düşün.','["Evet","Hayır","Sadece başarılılar","Sadece yetişkinler"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,219,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-deger' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-20','coktan_secmeli','Farklılıklara saygı gerekli midir? Benzer bir durumu düşün.','["Hayır","Sadece benzerlere","Evet","Sadece okulda"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,220,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-deger' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-21','coktan_secmeli','Ayrımcılık adil midir? Benzer bir durumu düşün.','["Hayır","Evet","Bazen her zaman","Sadece çocuklara"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,221,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-deger' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-22','coktan_secmeli','Eğitim hakkı temel hak mıdır? Benzer bir durumu düşün.','["Hayır","Ödül","Evet","İstek"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,222,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-temel-hak' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-23','coktan_secmeli','Yaşama hakkı var mıdır? Benzer bir durumu düşün.','["Evet","Hayır","Sadece yetişkinlerde","Sadece vatandaşlarda"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,223,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-temel-hak' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-24','coktan_secmeli','Düşünceyi ifade hakkı başkasına zarar verme özgürlüğü müdür? Benzer bir durumu düşün.','["Evet","Her zaman","Hayır","Kural yoktur"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,224,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-temel-hak' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-25','coktan_secmeli','Haklarla birlikte ne vardır? Benzer bir durumu düşün.','["Sorumluluk","Sadece istek","Sadece ödül","Hile"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,225,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-sorum' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-26','coktan_secmeli','Ortak alanı korumak sorumluluk mudur? Benzer bir durumu düşün.','["Hayır","Sadece görevlinin","Evet","Kimsenin"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,226,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-sorum' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-27','coktan_secmeli','Kendi görevini yapmak? Benzer bir durumu düşün.','["Sorumluluktur.","Haktır sadece","İsraftır","Dışlamadır"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,227,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-sorum' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-28','coktan_secmeli','Eşitlik her durumda herkese tamamen aynı şey vermek midir? Benzer bir durumu düşün.','["Evet her zaman","Adalet yoktur","Her zaman değil; ihtiyaç ve hakkaniyet de önemlidir.","Sadece okulda"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,228,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-adalet-esit' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-29','coktan_secmeli','Adalet neyi gözetir? Benzer bir durumu düşün.','["Hakları ve hakkaniyeti","Kayırmayı","Hileyi","Gücü"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,229,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-adalet-esit' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-30','coktan_secmeli','Haksız ayrım adil midir? Benzer bir durumu düşün.','["Evet","Sadece oyunda","Hayır","Sadece evde"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,230,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-adalet-esit' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-31','coktan_secmeli','Uzlaşma ne demektir? Benzer bir durumu düşün.','["Ortak çözüm bulmaya çalışma","Kavga","Bağırma","Dışlama"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,231,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-sorun' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-32','coktan_secmeli','Sorunda karşı taraf dinlenmeli mi? Benzer bir durumu düşün.','["Hayır","Sadece öğretmen","Evet","Sadece arkadaş"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,232,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-sorun' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-33','coktan_secmeli','Şiddet barışçıl çözüm müdür? Benzer bir durumu düşün.','["Hayır","Evet","Bazen her zaman","Sadece oyunda"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,233,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-sorun' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-34','coktan_secmeli','Ortak kararda görüş bildirmek katılım mıdır? Benzer bir durumu düşün.','["Hayır","Hile","Evet","İsraf"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,234,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-katilim' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-35','coktan_secmeli','Kurallar değişebilir mi? Benzer bir durumu düşün.','["İhtiyaca göre adil süreçle evet","Asla","Sadece gizlice","Sadece bir kişi isterse"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,235,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-katilim' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-36','coktan_secmeli','Oylama bir katılım yöntemi olabilir mi? Benzer bir durumu düşün.','["Hayır","Sadece yetişkinlerde","Evet","Sadece sporda"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,236,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-katilim' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-37','coktan_secmeli','Dayanışma ne demektir? Benzer bir durumu düşün.','["Birbirine destek olmak","Dışlamak","Kavga etmek","Yarışmak"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,237,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-dayanisma' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-38','coktan_secmeli','Farklı kültürlerle birlikte yaşamak mümkün mü? Benzer bir durumu düşün.','["Hayır","Sadece aynı kültür","Evet","Farklılık yasaktır"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,238,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-dayanisma' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-39','coktan_secmeli','Toplumsal sorunlarda iş birliği önemli mi? Benzer bir durumu düşün.','["Evet","Hayır","Tek kişi yeter","Sorun yoktur"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,239,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-dayanisma' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-40','coktan_secmeli','Ana renklerden biri? Benzer bir durumu düşün.','["Yeşil","Mor","Kırmızı","Turuncu"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,240,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-cizgi-renk' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-41','coktan_secmeli','Doku neyi anlatır? Benzer bir durumu düşün.','["Yüzey özelliğini","Sesi","Zamanı","Kütleyi"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,241,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-cizgi-renk' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-42','coktan_secmeli','Çizgi farklı kalınlıklarda olabilir mi? Benzer bir durumu düşün.','["Hayır","Sadece siyah","Evet","Sadece düz"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,242,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-cizgi-renk' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-43','coktan_secmeli','Kompozisyon neyle ilgilidir? Benzer bir durumu düşün.','["Görsel ögelerin düzeniyle","Sadece fiyatla","Sadece çerçeveyle","Sadece boyayla"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,243,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-tasarim' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-44','coktan_secmeli','Taslak ne işe yarar? Benzer bir durumu düşün.','["Silmek için","Kâğıdı atmak için","Planlamaya","Boyayı kurutmak için"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,244,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-tasarim' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-45','coktan_secmeli','Vurgu ne sağlar? Benzer bir durumu düşün.','["Bir ögeyi öne çıkarmayı","Her şeyi eşit gizlemeyi","Sesi artırmayı","Kütleyi ölçmeyi"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,245,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-tasarim' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-46','coktan_secmeli','Müze kültürel mirası tanımaya yardım eder mi? Benzer bir durumu düşün.','["Hayır","Sadece oyun","Evet","Sadece alışveriş"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,246,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-miras' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-47','coktan_secmeli','Tarihî eserler korunmalı mı? Benzer bir durumu düşün.','["Evet","Hayır","Üzerine yazılmalı","Kırılmalı"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,247,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-miras' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-48','coktan_secmeli','Geleneksel motifler sanatın parçası olabilir mi? Benzer bir durumu düşün.','["Hayır","Sadece matematik","Evet","Sadece spor"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,248,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-miras' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-49','coktan_secmeli','Sanat eseri farklı yorumlanabilir mi? Benzer bir durumu düşün.','["Evet","Hayır","Tek yorum zorunlu","Yorum yapılamaz"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,249,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-inceleme' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-50','coktan_secmeli','Eseri incelerken renk ve biçime bakılır mı? Benzer bir durumu düşün.','["Hayır","Sadece fiyat","Evet","Sadece çerçeve"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,250,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-inceleme' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-51','coktan_secmeli','Sanatçı aynı konuyu farklı teknikle işleyebilir mi? Benzer bir durumu düşün.','["Evet","Hayır","Tek teknik var","Sanatçı seçemez"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,251,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-inceleme' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-52','coktan_secmeli','Birlikte söylerken ne önemlidir? Benzer bir durumu düşün.','["Bağırmak","Rastgele başlamak","Uyum ve dinleme","Sözleri değiştirmek"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,252,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-soyleme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-53','coktan_secmeli','Doğru nefes kullanımı şarkı söylemeye yardım eder mi? Benzer bir durumu düşün.','["Evet","Hayır","Sadece koşuya","Müzikle ilgisiz"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,253,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-soyleme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-54','coktan_secmeli','İstiklâl Marşı saygıyla söylenmeli mi? Benzer bir durumu düşün.','["Hayır","Sadece hızlı","Evet","Sadece sessiz"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,254,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-soyleme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-55','coktan_secmeli','Tempo neyi anlatır? Benzer bir durumu düşün.','["Müziğin hızını","Rengini","Kokusunu","Kütlesini"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,255,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-ritim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-56','coktan_secmeli','Ritim neyle ilgilidir? Benzer bir durumu düşün.','["Renklerle","Kütleyle","Düzenli vuruş ve sürelerle","Alanla"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,256,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-ritim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-57','coktan_secmeli','Nota müzikte neyi temsil eder? Benzer bir durumu düşün.','["Sesleri ve süreleri yazılı göstermeye yardım eder.","Rengi","Kütleyi","Fiyatı"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,257,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-ritim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-58','coktan_secmeli','Kendi ritim kalıbını oluşturmak yaratıcılık mıdır? Benzer bir durumu düşün.','["Hayır","Sadece kopya","Evet","Müzik değildir"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,258,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-uretme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-59','coktan_secmeli','Beden perküsyonu kullanılabilir mi? Benzer bir durumu düşün.','["Evet","Hayır","Sadece davul","Sadece piyano"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,259,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-uretme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-60','coktan_secmeli','Ritim tekrar edebilir mi? Benzer bir durumu düşün.','["Hayır","Sadece sessizlik","Evet","Ritim tekrarsızdır"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,260,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-uretme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-61','coktan_secmeli','Türküler kültürel miras olabilir mi? Benzer bir durumu düşün.','["Evet","Hayır","Sadece yeni şarkılar","Müzik kültür değildir"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,261,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-miras' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-62','coktan_secmeli','Farklı yörelerin müzikleri farklı olabilir mi? Benzer bir durumu düşün.','["Hayır","Hepsi aynı","Evet","Yöre müziği yoktur"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,262,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-miras' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-63','coktan_secmeli','Çalgılar özenli kullanılmalı mı? Benzer bir durumu düşün.','["Evet","Hayır","Fırlatılmalı","Kırılmalı"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,263,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-miras' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-64','coktan_secmeli','Denge becerisi fiziksel etkinlikte önemli mi? Benzer bir durumu düşün.','["Hayır","Sadece yazıda","Evet","Sadece müzikte"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,264,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-beceri' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-65','coktan_secmeli','Top atma-yakalama hangi beceridir? Benzer bir durumu düşün.','["Nesne kontrolü","Okuma","Yazma","Dinleme"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,265,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-beceri' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-66','coktan_secmeli','Hareket alanında çevreye dikkat edilmeli mi? Benzer bir durumu düşün.','["Hayır","Sadece hız","Evet","Gözler kapalı"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,266,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-beceri' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-67','coktan_secmeli','Isınma neden yapılır? Benzer bir durumu düşün.','["Bedeni etkinliğe hazırlamak","Daha çok yorulmak","Su içmemek","Uyumak"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,267,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-aktivite' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-68','coktan_secmeli','Su içmek neden önemli? Benzer bir durumu düşün.','["Skor için","Ayakkabı için","Sıvı ihtiyacı için","Renk için"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,268,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-aktivite' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-69','coktan_secmeli','Ağrı hissedilirse? Benzer bir durumu düşün.','["Durup yetişkine söylemek","Zorlamaya devam","Gizlemek","Hızlanmak"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,269,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-aktivite' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-70','coktan_secmeli','Rakibe saygı sportmenlik midir? Benzer bir durumu düşün.','["Hayır","Sadece kazanınca","Evet","Sadece öğretmen varken"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,270,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-adil' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-71','coktan_secmeli','Hile adil oyun mudur? Benzer bir durumu düşün.','["Hayır","Evet","Sadece finalde","Sadece küçük hile"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,271,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-adil' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-72','coktan_secmeli','Takım arkadaşını desteklemek? Benzer bir durumu düşün.','["Dışlamadır","Hiledir","İş birliğidir.","Kabalıktır"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,272,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-adil' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-73','coktan_secmeli','Mendil kapmaca geleneksel oyun olabilir mi? Benzer bir durumu düşün.','["Evet","Hayır","Elektronik cihaz","Müzik aleti"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,273,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-gelenek' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-74','coktan_secmeli','Seksek kültürel oyun örneği olabilir mi? Benzer bir durumu düşün.','["Hayır","Sadece dijital","Evet","Sadece yetişkin"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,274,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-gelenek' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-2-75','coktan_secmeli','Geleneksel oyunlar büyüklerden öğrenilebilir mi? Benzer bir durumu düşün.','["Evet","Hayır","Sadece internet","Kimse öğretemez"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,275,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-gelenek' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-1','coktan_secmeli','Karşıya geçerken neresi tercih edilir? Benzer bir durumu düşün.','["Yaya geçidi","Viraj","Araç yolu ortası","Park yeri"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,401,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-yaya' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-2','coktan_secmeli','Kırmızı yaya ışığında ne yapılır? Benzer bir durumu düşün.','["Geçilir","Koşulur","Beklenir","Telefonla yürünür"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,402,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-yaya' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-3','coktan_secmeli','Kaldırım varsa yaya nereden yürümeli? Benzer bir durumu düşün.','["Kaldırımdan","Araç yolundan","Bisiklet şeridinden","Yol ortasından"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,403,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-yaya' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-4','coktan_secmeli','Araçta emniyet kemeri? Benzer bir durumu düşün.','["Gereksizdir","Sadece sürücü","Kullanılmalıdır.","Sadece uzun yolda"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,404,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-yolcu' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-5','coktan_secmeli','Bisiklette kask? Benzer bir durumu düşün.','["Güvenliği artırır.","Hızı artırır","Gereksizdir","Sadece yarışta"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,405,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-yolcu' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-6','coktan_secmeli','Serviste ayakta yolculuk güvenli midir? Benzer bir durumu düşün.','["Evet","Sadece kısa yolda","Hayır","Sadece çocuklara"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,406,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-yolcu' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-7','coktan_secmeli','Trafik işaretleri ne sağlar? Benzer bir durumu düşün.','["Düzen ve güvenlik bilgisi","Süs","Reklam","Hız artırma"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,407,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-isaret' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-8','coktan_secmeli','STOP levhası neyi bildirir? Benzer bir durumu düşün.','["Hızlanmayı","Park etmeyi","Durmayı","Sola dönmeyi"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,408,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-isaret' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-9','coktan_secmeli','Işık ve levhalara uymak gerekir mi? Benzer bir durumu düşün.','["Evet","Hayır","Sadece araçlar","Sadece yayalar"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,409,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-isaret' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-10','coktan_secmeli','Kazaları azaltmak için? Benzer bir durumu düşün.','["Hız yapmak","Dikkati dağıtmak","Kurallara uymak","Kemer takmamak"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,410,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-kaza' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-11','coktan_secmeli','Telefonla araç kullanmak tehlikeli midir? Benzer bir durumu düşün.','["Evet","Hayır","Sadece gece","Sadece şehirde"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,411,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-kaza' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-12','coktan_secmeli','Yorgun sürüş riskli midir? Benzer bir durumu düşün.','["Hayır","Sadece yağmurda","Evet","Sadece gençlerde"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,412,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-kaza' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-13','coktan_secmeli','112 ne içindir? Benzer bir durumu düşün.','["Acil yardım","Şaka","Saat sorma","Ödev"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,413,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-112' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-14','coktan_secmeli','112 arandığında ne yapılmalı? Benzer bir durumu düşün.','["Şaka yapılmalı","Adres gizlenmeli","Sakin ve doğru bilgi verilmeli","Telefon kapatılmalı"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,414,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-112' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-15','coktan_secmeli','Gereksiz 112 araması doğru mudur? Benzer bir durumu düşün.','["Hayır","Evet","Sadece çocuklara","Sadece gece"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,415,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-112' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-16','coktan_secmeli','İlk yardımın amacı? Benzer bir durumu düşün.','["Tedavi yerine geçmek","İlaç vermek her zaman","Profesyonel yardım gelene kadar yaşamı korumaya destek olmak","Hastaneyi gereksiz kılmak"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,416,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-ilk-yardim' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-17','coktan_secmeli','Bilinmeyen yaralıyı gereksiz hareket ettirmek doğru mudur? Benzer bir durumu düşün.','["Hayır","Evet","Sadece hızlıca","Her zaman"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,417,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-ilk-yardim' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-18','coktan_secmeli','İlk yardımda yetişkin/uzman desteği önemli midir? Benzer bir durumu düşün.','["Hayır","Sadece çocuklar yapmalı","Evet","112 gerekmez"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,418,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='traf4-ilk-yardim' AND (d.kod='trafik' OR d.ad='Trafik Güvenliği')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-19','coktan_secmeli','Her insan değerli midir? Benzer bir durumu düşün.','["Evet","Hayır","Sadece başarılılar","Sadece yetişkinler"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,419,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-deger' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-20','coktan_secmeli','Farklılıklara saygı gerekli midir? Benzer bir durumu düşün.','["Hayır","Sadece benzerlere","Evet","Sadece okulda"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,420,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-deger' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-21','coktan_secmeli','Ayrımcılık adil midir? Benzer bir durumu düşün.','["Hayır","Evet","Bazen her zaman","Sadece çocuklara"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,421,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-deger' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-22','coktan_secmeli','Eğitim hakkı temel hak mıdır? Benzer bir durumu düşün.','["Hayır","Ödül","Evet","İstek"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,422,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-temel-hak' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-23','coktan_secmeli','Yaşama hakkı var mıdır? Benzer bir durumu düşün.','["Evet","Hayır","Sadece yetişkinlerde","Sadece vatandaşlarda"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,423,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-temel-hak' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-24','coktan_secmeli','Düşünceyi ifade hakkı başkasına zarar verme özgürlüğü müdür? Benzer bir durumu düşün.','["Evet","Her zaman","Hayır","Kural yoktur"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,424,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-temel-hak' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-25','coktan_secmeli','Haklarla birlikte ne vardır? Benzer bir durumu düşün.','["Sorumluluk","Sadece istek","Sadece ödül","Hile"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,425,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-sorum' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-26','coktan_secmeli','Ortak alanı korumak sorumluluk mudur? Benzer bir durumu düşün.','["Hayır","Sadece görevlinin","Evet","Kimsenin"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,426,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-sorum' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-27','coktan_secmeli','Kendi görevini yapmak? Benzer bir durumu düşün.','["Sorumluluktur.","Haktır sadece","İsraftır","Dışlamadır"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,427,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-sorum' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-28','coktan_secmeli','Eşitlik her durumda herkese tamamen aynı şey vermek midir? Benzer bir durumu düşün.','["Evet her zaman","Adalet yoktur","Her zaman değil; ihtiyaç ve hakkaniyet de önemlidir.","Sadece okulda"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,428,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-adalet-esit' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-29','coktan_secmeli','Adalet neyi gözetir? Benzer bir durumu düşün.','["Hakları ve hakkaniyeti","Kayırmayı","Hileyi","Gücü"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,429,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-adalet-esit' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-30','coktan_secmeli','Haksız ayrım adil midir? Benzer bir durumu düşün.','["Evet","Sadece oyunda","Hayır","Sadece evde"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,430,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-adalet-esit' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-31','coktan_secmeli','Uzlaşma ne demektir? Benzer bir durumu düşün.','["Ortak çözüm bulmaya çalışma","Kavga","Bağırma","Dışlama"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,431,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-sorun' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-32','coktan_secmeli','Sorunda karşı taraf dinlenmeli mi? Benzer bir durumu düşün.','["Hayır","Sadece öğretmen","Evet","Sadece arkadaş"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,432,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-sorun' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-33','coktan_secmeli','Şiddet barışçıl çözüm müdür? Benzer bir durumu düşün.','["Hayır","Evet","Bazen her zaman","Sadece oyunda"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,433,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-sorun' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-34','coktan_secmeli','Ortak kararda görüş bildirmek katılım mıdır? Benzer bir durumu düşün.','["Hayır","Hile","Evet","İsraf"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,434,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-katilim' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-35','coktan_secmeli','Kurallar değişebilir mi? Benzer bir durumu düşün.','["İhtiyaca göre adil süreçle evet","Asla","Sadece gizlice","Sadece bir kişi isterse"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,435,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-katilim' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-36','coktan_secmeli','Oylama bir katılım yöntemi olabilir mi? Benzer bir durumu düşün.','["Hayır","Sadece yetişkinlerde","Evet","Sadece sporda"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,436,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-katilim' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-37','coktan_secmeli','Dayanışma ne demektir? Benzer bir durumu düşün.','["Birbirine destek olmak","Dışlamak","Kavga etmek","Yarışmak"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,437,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-dayanisma' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-38','coktan_secmeli','Farklı kültürlerle birlikte yaşamak mümkün mü? Benzer bir durumu düşün.','["Hayır","Sadece aynı kültür","Evet","Farklılık yasaktır"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,438,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-dayanisma' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-39','coktan_secmeli','Toplumsal sorunlarda iş birliği önemli mi? Benzer bir durumu düşün.','["Evet","Hayır","Tek kişi yeter","Sorun yoktur"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,439,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='ih4-dayanisma' AND (d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-40','coktan_secmeli','Ana renklerden biri? Benzer bir durumu düşün.','["Yeşil","Mor","Kırmızı","Turuncu"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,440,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-cizgi-renk' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-41','coktan_secmeli','Doku neyi anlatır? Benzer bir durumu düşün.','["Yüzey özelliğini","Sesi","Zamanı","Kütleyi"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,441,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-cizgi-renk' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-42','coktan_secmeli','Çizgi farklı kalınlıklarda olabilir mi? Benzer bir durumu düşün.','["Hayır","Sadece siyah","Evet","Sadece düz"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,442,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-cizgi-renk' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-43','coktan_secmeli','Kompozisyon neyle ilgilidir? Benzer bir durumu düşün.','["Görsel ögelerin düzeniyle","Sadece fiyatla","Sadece çerçeveyle","Sadece boyayla"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,443,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-tasarim' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-44','coktan_secmeli','Taslak ne işe yarar? Benzer bir durumu düşün.','["Silmek için","Kâğıdı atmak için","Planlamaya","Boyayı kurutmak için"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,444,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-tasarim' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-45','coktan_secmeli','Vurgu ne sağlar? Benzer bir durumu düşün.','["Bir ögeyi öne çıkarmayı","Her şeyi eşit gizlemeyi","Sesi artırmayı","Kütleyi ölçmeyi"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,445,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-tasarim' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-46','coktan_secmeli','Müze kültürel mirası tanımaya yardım eder mi? Benzer bir durumu düşün.','["Hayır","Sadece oyun","Evet","Sadece alışveriş"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,446,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-miras' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-47','coktan_secmeli','Tarihî eserler korunmalı mı? Benzer bir durumu düşün.','["Evet","Hayır","Üzerine yazılmalı","Kırılmalı"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,447,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-miras' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-48','coktan_secmeli','Geleneksel motifler sanatın parçası olabilir mi? Benzer bir durumu düşün.','["Hayır","Sadece matematik","Evet","Sadece spor"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,448,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-miras' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-49','coktan_secmeli','Sanat eseri farklı yorumlanabilir mi? Benzer bir durumu düşün.','["Evet","Hayır","Tek yorum zorunlu","Yorum yapılamaz"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,449,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-inceleme' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-50','coktan_secmeli','Eseri incelerken renk ve biçime bakılır mı? Benzer bir durumu düşün.','["Hayır","Sadece fiyat","Evet","Sadece çerçeve"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,450,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-inceleme' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-51','coktan_secmeli','Sanatçı aynı konuyu farklı teknikle işleyebilir mi? Benzer bir durumu düşün.','["Evet","Hayır","Tek teknik var","Sanatçı seçemez"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,451,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='gs4-inceleme' AND (d.kod='gorsel' OR d.ad='Görsel Sanatlar')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-52','coktan_secmeli','Birlikte söylerken ne önemlidir? Benzer bir durumu düşün.','["Bağırmak","Rastgele başlamak","Uyum ve dinleme","Sözleri değiştirmek"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,452,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-soyleme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-53','coktan_secmeli','Doğru nefes kullanımı şarkı söylemeye yardım eder mi? Benzer bir durumu düşün.','["Evet","Hayır","Sadece koşuya","Müzikle ilgisiz"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,453,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-soyleme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-54','coktan_secmeli','İstiklâl Marşı saygıyla söylenmeli mi? Benzer bir durumu düşün.','["Hayır","Sadece hızlı","Evet","Sadece sessiz"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,454,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-soyleme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-55','coktan_secmeli','Tempo neyi anlatır? Benzer bir durumu düşün.','["Müziğin hızını","Rengini","Kokusunu","Kütlesini"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,455,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-ritim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-56','coktan_secmeli','Ritim neyle ilgilidir? Benzer bir durumu düşün.','["Renklerle","Kütleyle","Düzenli vuruş ve sürelerle","Alanla"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,456,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-ritim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-57','coktan_secmeli','Nota müzikte neyi temsil eder? Benzer bir durumu düşün.','["Sesleri ve süreleri yazılı göstermeye yardım eder.","Rengi","Kütleyi","Fiyatı"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,457,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-ritim' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-58','coktan_secmeli','Kendi ritim kalıbını oluşturmak yaratıcılık mıdır? Benzer bir durumu düşün.','["Hayır","Sadece kopya","Evet","Müzik değildir"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,458,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-uretme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-59','coktan_secmeli','Beden perküsyonu kullanılabilir mi? Benzer bir durumu düşün.','["Evet","Hayır","Sadece davul","Sadece piyano"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,459,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-uretme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-60','coktan_secmeli','Ritim tekrar edebilir mi? Benzer bir durumu düşün.','["Hayır","Sadece sessizlik","Evet","Ritim tekrarsızdır"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,460,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-uretme' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-61','coktan_secmeli','Türküler kültürel miras olabilir mi? Benzer bir durumu düşün.','["Evet","Hayır","Sadece yeni şarkılar","Müzik kültür değildir"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,461,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-miras' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-62','coktan_secmeli','Farklı yörelerin müzikleri farklı olabilir mi? Benzer bir durumu düşün.','["Hayır","Hepsi aynı","Evet","Yöre müziği yoktur"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,462,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-miras' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-63','coktan_secmeli','Çalgılar özenli kullanılmalı mı? Benzer bir durumu düşün.','["Evet","Hayır","Fırlatılmalı","Kırılmalı"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,463,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='muz4-miras' AND (d.kod='muzik' OR d.ad='Müzik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-64','coktan_secmeli','Denge becerisi fiziksel etkinlikte önemli mi? Benzer bir durumu düşün.','["Hayır","Sadece yazıda","Evet","Sadece müzikte"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,464,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-beceri' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-65','coktan_secmeli','Top atma-yakalama hangi beceridir? Benzer bir durumu düşün.','["Nesne kontrolü","Okuma","Yazma","Dinleme"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,465,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-beceri' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-66','coktan_secmeli','Hareket alanında çevreye dikkat edilmeli mi? Benzer bir durumu düşün.','["Hayır","Sadece hız","Evet","Gözler kapalı"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,466,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-beceri' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-67','coktan_secmeli','Isınma neden yapılır? Benzer bir durumu düşün.','["Bedeni etkinliğe hazırlamak","Daha çok yorulmak","Su içmemek","Uyumak"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,467,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-aktivite' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-68','coktan_secmeli','Su içmek neden önemli? Benzer bir durumu düşün.','["Skor için","Ayakkabı için","Sıvı ihtiyacı için","Renk için"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,468,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-aktivite' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-69','coktan_secmeli','Ağrı hissedilirse? Benzer bir durumu düşün.','["Durup yetişkine söylemek","Zorlamaya devam","Gizlemek","Hızlanmak"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,469,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-aktivite' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-70','coktan_secmeli','Rakibe saygı sportmenlik midir? Benzer bir durumu düşün.','["Hayır","Sadece kazanınca","Evet","Sadece öğretmen varken"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,470,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-adil' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-71','coktan_secmeli','Hile adil oyun mudur? Benzer bir durumu düşün.','["Hayır","Evet","Sadece finalde","Sadece küçük hile"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,471,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-adil' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-72','coktan_secmeli','Takım arkadaşını desteklemek? Benzer bir durumu düşün.','["Dışlamadır","Hiledir","İş birliğidir.","Kabalıktır"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,472,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-adil' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-73','coktan_secmeli','Mendil kapmaca geleneksel oyun olabilir mi? Benzer bir durumu düşün.','["Evet","Hayır","Elektronik cihaz","Müzik aleti"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,473,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-gelenek' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-74','coktan_secmeli','Seksek kültürel oyun örneği olabilir mi? Benzer bir durumu düşün.','["Hayır","Sadece dijital","Evet","Sadece yetişkin"]',2,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,474,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-gelenek' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4o-3-75','coktan_secmeli','Geleneksel oyunlar büyüklerden öğrenilebilir mi? Benzer bir durumu düşün.','["Evet","Hayır","Sadece internet","Kimse öğretemez"]',0,'Konu bilgisi günlük yaşam bağlamında değerlendirilir.',2,475,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='be4-gelenek' AND (d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

