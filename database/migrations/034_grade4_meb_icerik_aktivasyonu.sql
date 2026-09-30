SET NAMES utf8mb4;
-- İlkAdım v1.1.34: 4. sınıf tam içerik aktivasyonu. Tekrarlı hazırlık varyasyonları canlı paketten ayıklanmıştır.


-- SOURCE: database/content/grade4/00_schema_and_mufredat.sql
-- 4. sınıf 2026-2027: hâlihazırdaki öğretim programı.
INSERT INTO dersler (kod,ad,haftalik_saat,emoji,sanat,sanat_sinifi,renk,yazi_renk,aciklama,sira,aktif)
SELECT 'sosyal','Sosyal Bilgiler',3,'🌍','','','#EAF4FF','#173D66','Sosyal Bilgiler',90,1
WHERE NOT EXISTS (SELECT 1 FROM dersler WHERE kod='sosyal' OR ad='Sosyal Bilgiler');

INSERT INTO dersler (kod,ad,haftalik_saat,emoji,sanat,sanat_sinifi,renk,yazi_renk,aciklama,sira,aktif)
SELECT 'din','Din Kültürü ve Ahlak Bilgisi',2,'🕌','','','#F7F0E7','#5B4127','Din Kültürü ve Ahlak Bilgisi',90,1
WHERE NOT EXISTS (SELECT 1 FROM dersler WHERE kod='din' OR ad='Din Kültürü ve Ahlak Bilgisi');

INSERT INTO dersler (kod,ad,haftalik_saat,emoji,sanat,sanat_sinifi,renk,yazi_renk,aciklama,sira,aktif)
SELECT 'trafik','Trafik Güvenliği',1,'🚦','','','#FFF3E5','#6A4215','Trafik Güvenliği',90,1
WHERE NOT EXISTS (SELECT 1 FROM dersler WHERE kod='trafik' OR ad='Trafik Güvenliği');

INSERT INTO dersler (kod,ad,haftalik_saat,emoji,sanat,sanat_sinifi,renk,yazi_renk,aciklama,sira,aktif)
SELECT 'insan_haklari','İnsan Hakları, Vatandaşlık ve Demokrasi',2,'🤝','','','#F1EEFF','#41306A','İnsan Hakları, Vatandaşlık ve Demokrasi',90,1
WHERE NOT EXISTS (SELECT 1 FROM dersler WHERE kod='insan_haklari' OR ad='İnsan Hakları, Vatandaşlık ve Demokrasi');

INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',4,d.id,8,10,1 FROM dersler d WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',4,d.id,5,20,1 FROM dersler d WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',4,d.id,3,30,1 FROM dersler d WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',4,d.id,3,40,1 FROM dersler d WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',4,d.id,2,50,1 FROM dersler d WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',4,d.id,2,60,1 FROM dersler d WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',4,d.id,1,70,1 FROM dersler d WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',4,d.id,1,80,1 FROM dersler d WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',4,d.id,2,90,1 FROM dersler d WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',4,d.id,1,100,1 FROM dersler d WHERE d.kod='trafik' OR d.ad='Trafik Güvenliği'
ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',4,d.id,2,110,1 FROM dersler d WHERE d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi'
ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;

DELETE s FROM ders_sorulari s INNER JOIN ders_konulari k ON k.id=s.konu_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4;
DELETE FROM ders_konulari WHERE kademe_kodu='temel_egitim' AND sinif_seviyesi=4;
DELETE FROM ders_bolumleri WHERE kademe_kodu='temel_egitim' AND sinif_seviyesi=4;

INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'beceri','tr4-okuma','Okuma ve Anlama','4. sınıf Okuma ve Anlama içeriği.',10,1 FROM dersler d
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'beceri','tr4-soz','Söz Varlığı','4. sınıf Söz Varlığı içeriği.',20,1 FROM dersler d
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'beceri','tr4-yazim','Yazım ve Noktalama','4. sınıf Yazım ve Noktalama içeriği.',30,1 FROM dersler d
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'beceri','tr4-dil','Dil Yapıları','4. sınıf Dil Yapıları içeriği.',40,1 FROM dersler d
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'beceri','tr4-metin','Metin Türleri ve Görsel Okuma','4. sınıf Metin Türleri ve Görsel Okuma içeriği.',50,1 FROM dersler d
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'beceri','tr4-anlatim','Dinleme, Konuşma ve Yazma','4. sınıf Dinleme, Konuşma ve Yazma içeriği.',60,1 FROM dersler d
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','mat4-sayilar','Sayılar ve İşlemler','4. sınıf Sayılar ve İşlemler içeriği.',10,1 FROM dersler d
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','mat4-geometri','Geometri','4. sınıf Geometri içeriği.',20,1 FROM dersler d
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','mat4-olcme','Ölçme','4. sınıf Ölçme içeriği.',30,1 FROM dersler d
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','mat4-veri','Veri İşleme','4. sınıf Veri İşleme içeriği.',40,1 FROM dersler d
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','fen4-yer','Yer Kabuğu ve Dünya''mızın Hareketleri','4. sınıf Yer Kabuğu ve Dünya''mızın Hareketleri içeriği.',10,1 FROM dersler d
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','fen4-besin','Besinlerimiz','4. sınıf Besinlerimiz içeriği.',20,1 FROM dersler d
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','fen4-kuvvet','Kuvvetin Etkileri','4. sınıf Kuvvetin Etkileri içeriği.',30,1 FROM dersler d
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','fen4-madde','Maddenin Özellikleri','4. sınıf Maddenin Özellikleri içeriği.',40,1 FROM dersler d
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','fen4-isik-ses','Aydınlatma ve Ses Teknolojileri','4. sınıf Aydınlatma ve Ses Teknolojileri içeriği.',50,1 FROM dersler d
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','fen4-cevre','İnsan ve Çevre','4. sınıf İnsan ve Çevre içeriği.',60,1 FROM dersler d
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','fen4-elektrik','Basit Elektrik Devreleri','4. sınıf Basit Elektrik Devreleri içeriği.',70,1 FROM dersler d
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','sos4-birey','Birey ve Toplum','4. sınıf Birey ve Toplum içeriği.',10,1 FROM dersler d
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','sos4-kultur','Kültür ve Miras','4. sınıf Kültür ve Miras içeriği.',20,1 FROM dersler d
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','sos4-cevre','İnsanlar, Yerler ve Çevreler','4. sınıf İnsanlar, Yerler ve Çevreler içeriği.',30,1 FROM dersler d
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','sos4-bilim','Bilim, Teknoloji ve Toplum','4. sınıf Bilim, Teknoloji ve Toplum içeriği.',40,1 FROM dersler d
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','sos4-ekonomi','Üretim, Dağıtım ve Tüketim','4. sınıf Üretim, Dağıtım ve Tüketim içeriği.',50,1 FROM dersler d
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','sos4-vatandas','Etkin Vatandaşlık','4. sınıf Etkin Vatandaşlık içeriği.',60,1 FROM dersler d
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','sos4-kuresel','Küresel Bağlantılar','4. sınıf Küresel Bağlantılar içeriği.',70,1 FROM dersler d
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','eng4-classroom','Classroom Rules','4. sınıf Classroom Rules içeriği.',10,1 FROM dersler d
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','eng4-nationality','Nationality','4. sınıf Nationality içeriği.',20,1 FROM dersler d
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','eng4-cartoon','Cartoon Characters','4. sınıf Cartoon Characters içeriği.',30,1 FROM dersler d
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','eng4-free-time','Free Time','4. sınıf Free Time içeriği.',40,1 FROM dersler d
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','eng4-my-day','My Day','4. sınıf My Day içeriği.',50,1 FROM dersler d
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','eng4-science','Fun with Science','4. sınıf Fun with Science içeriği.',60,1 FROM dersler d
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','eng4-jobs','Jobs','4. sınıf Jobs içeriği.',70,1 FROM dersler d
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','eng4-clothes','My Clothes','4. sınıf My Clothes içeriği.',80,1 FROM dersler d
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','eng4-friends','My Friends','4. sınıf My Friends içeriği.',90,1 FROM dersler d
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','eng4-food','Food and Drinks','4. sınıf Food and Drinks içeriği.',100,1 FROM dersler d
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','din4-ifadeler','Günlük Hayattaki Dinî İfadeler','4. sınıf Günlük Hayattaki Dinî İfadeler içeriği.',10,1 FROM dersler d
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','din4-islam','İslam''ı Tanıyalım','4. sınıf İslam''ı Tanıyalım içeriği.',20,1 FROM dersler d
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','din4-ahlak','Güzel Ahlak','4. sınıf Güzel Ahlak içeriği.',30,1 FROM dersler d
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','din4-hz-muhammed','Hz. Muhammed''i Tanıyalım','4. sınıf Hz. Muhammed''i Tanıyalım içeriği.',40,1 FROM dersler d
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','din4-temizlik','Din ve Temizlik','4. sınıf Din ve Temizlik içeriği.',50,1 FROM dersler d
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','traf4-kural','Trafikte Güvenli Yaşam','4. sınıf Trafikte Güvenli Yaşam içeriği.',10,1 FROM dersler d
WHERE d.kod='trafik' OR d.ad='Trafik Güvenliği'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','traf4-yardim','Trafik Kazaları ve İlk Yardım Bilinci','4. sınıf Trafik Kazaları ve İlk Yardım Bilinci içeriği.',20,1 FROM dersler d
WHERE d.kod='trafik' OR d.ad='Trafik Güvenliği'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','ih4-insan','İnsan Olmak','4. sınıf İnsan Olmak içeriği.',10,1 FROM dersler d
WHERE d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','ih4-hak','Hak, Özgürlük ve Sorumluluk','4. sınıf Hak, Özgürlük ve Sorumluluk içeriği.',20,1 FROM dersler d
WHERE d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','ih4-adalet','Adalet ve Eşitlik','4. sınıf Adalet ve Eşitlik içeriği.',30,1 FROM dersler d
WHERE d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','ih4-uzlasi','Uzlaşı','4. sınıf Uzlaşı içeriği.',40,1 FROM dersler d
WHERE d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','ih4-kural','Kurallar','4. sınıf Kurallar içeriği.',50,1 FROM dersler d
WHERE d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','ih4-birlikte','Birlikte Yaşama','4. sınıf Birlikte Yaşama içeriği.',60,1 FROM dersler d
WHERE d.kod='insan_haklari' OR d.ad='İnsan Hakları, Vatandaşlık ve Demokrasi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','gs4-uretme','Görsel İletişim ve Biçimlendirme','4. sınıf Görsel İletişim ve Biçimlendirme içeriği.',10,1 FROM dersler d
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','gs4-kultur','Kültürel Miras','4. sınıf Kültürel Miras içeriği.',20,1 FROM dersler d
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','gs4-elestiri','Sanat Eleştirisi ve Estetik','4. sınıf Sanat Eleştirisi ve Estetik içeriği.',30,1 FROM dersler d
WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','muz4-dinleme','Dinleme-Söyleme','4. sınıf Dinleme-Söyleme içeriği.',10,1 FROM dersler d
WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','muz4-calma','Müziksel Algı ve Bilgilenme','4. sınıf Müziksel Algı ve Bilgilenme içeriği.',20,1 FROM dersler d
WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','muz4-yaratici','Müziksel Yaratıcılık','4. sınıf Müziksel Yaratıcılık içeriği.',30,1 FROM dersler d
WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','muz4-kultur','Müzik Kültürü','4. sınıf Müzik Kültürü içeriği.',40,1 FROM dersler d
WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','be4-hareket','Hareket Yetkinliği','4. sınıf Hareket Yetkinliği içeriği.',10,1 FROM dersler d
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','be4-saglik','Aktif ve Sağlıklı Hayat','4. sınıf Aktif ve Sağlıklı Hayat içeriği.',20,1 FROM dersler d
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'ogrenme_alani','be4-deger','Spor Kültürü ve Değerler','4. sınıf Spor Kültürü ve Değerler içeriği.',30,1 FROM dersler d
WHERE d.kod='beden' OR d.ad='Beden Eğitimi ve Oyun'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;


-- SOURCE: database/content/grade4/10_turkce_soru_havuzu.sql
INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-ana-fikir','Konu, Ana Fikir ve Başlık','Konu, Ana Fikir ve Başlık','Konu, Ana Fikir ve Başlık becerilerini uygular.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-okuma'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ana-fikir-1-1','coktan_secmeli','“Düzenli kitap okuyan çocukların kelime dağarcığı gelişir, hayal gücü zenginleşir.” Ana fikir nedir?','["Kitap okumanın birçok yararı vardır.","Sadece uzun kitap okunmalıdır.","Kitaplar ağırdır.","Hayal kurmak gereksizdir."]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ana-fikir-1-2','coktan_secmeli','“Suyu gereksiz akıtmamak gelecekte de temiz suya ulaşmamıza yardım eder.” Ana fikir nedir?','["Musluklar pahalıdır.","Sadece yağmur suyu içilir.","Suyu tasarruflu kullanmalıyız.","Su bitmez."]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ana-fikir-1-3','coktan_secmeli','“Takım üyeleri birbirini dinlediğinde işler daha düzenli yürür.” Ana fikir?','["İş birliği başarıyı kolaylaştırır.","Tek kişi her şeyi yapmalıdır.","Dinlemek gereksizdir.","Takımda konuşulmaz."]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ana-fikir-1-4','coktan_secmeli','Arıların çiçekten çiçeğe polen taşımasını anlatan metne en uygun başlık?','["Kışlık Mont","Yeni Defter","Arıların Doğadaki Görevi","Okul Servisi"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ana-fikir-1-5','coktan_secmeli','Bir metnin konusu neyi gösterir?','["Metinde ne anlatıldığını","Yazarın adresini","Kitabın fiyatını","Sayfa sayısını"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ana-fikir-1-6','coktan_secmeli','“Geri dönüşüm atıkları yeniden değerlendirmeye yardım eder.” En uygun başlık?','["Uzun Yol","Karlı Gün","Atıkları Değerlendiriyoruz","Yeni Oyuncak"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ana-fikir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-cikarim','Çıkarım ve Tahmin','Çıkarım ve Tahmin','Çıkarım ve Tahmin becerilerini uygular.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-okuma'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cikarim-1-1','coktan_secmeli','Mert mont, atkı ve eldiven giydi. Ne çıkarılabilir?','["Hava soğuk olabilir.","Kesin yazdır.","Hava çok sıcaktır.","Okul tatildir."]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cikarim-1-2','coktan_secmeli','Gökyüzü koyu bulutlu, gök gürlüyor. Ne beklenebilir?','["Kesin karne günü","Yeni kitap","Yağmur veya fırtına","Sınıf gezisi"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cikarim-1-3','coktan_secmeli','Ece bitkiyi düzenli suluyor ve güneş alan yere koyuyor. Amacı?','["Bitkinin gelişmesini desteklemek","Bitkiyi kurutmak","Toprağı atmak","Saksıyı kırmak"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cikarim-1-4','coktan_secmeli','Metinde kahraman sürekli başkalarına yardım ediyor. Hangi özellik çıkarılır?','["Bencil","Dikkatsiz","Yardımsever","Kaba"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cikarim-1-5','coktan_secmeli','Bir öğrenci iki kaynaktaki bilgiyi karşılaştırıyor. Ne yapıyor?','["Bilgiyi doğruluyor.","Bilgiyi siliyor.","Ezberliyor.","Uyduruyor."]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cikarim-1-6','coktan_secmeli','Parkta yeni dikilen fidanların çevresine koruyucu çit yapılmış. Neden?','["Parkı kapatmak için","Çimleri boyamak için","Fidanları korumak için","Yağmuru engellemek için"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-ozet','Özetleme ve Olay Sırası','Özetleme ve Olay Sırası','Özetleme ve Olay Sırası becerilerini uygular.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-okuma'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ozet-1-1','coktan_secmeli','Özet nasıl olmalıdır?','["Metnin önemli bilgilerini kısa biçimde vermelidir.","Tüm cümleleri aynen içermelidir.","Metinden uzun olmalıdır.","Sadece son cümleyi içermelidir."]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ozet-1-2','coktan_secmeli','“Tohumu ekti, suladı, filiz çıktı.” İkinci olay?','["Tohumu ekti","Filiz çıktı","Suladı","Meyve topladı"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ozet-1-3','coktan_secmeli','“Kitabı seçti, ödünç aldı, okudu, geri verdi.” Okumadan sonra?','["Geri verdi","Seçti","Ödünç aldı","Kaybetti"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ozet-1-4','coktan_secmeli','Özet yazarken hangi ayrıntı çıkarılabilir?','["Ana olay","Temel kişi","Ana fikri değiştirmeyen gereksiz ayrıntı","Ana fikir"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ozet-1-5','coktan_secmeli','Olay sırasını belirlerken hangi sözcükler yardımcı olabilir?','["önce, sonra, en son","mavi, sarı, yeşil","uzun, kısa, ağır","masa, kitap, kalem"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-ozet-1-6','coktan_secmeli','“Uyandı, kahvaltı yaptı, okula gitti.” İlk olay nedir?','["Kahvaltı yaptı","Okula gitti","Uyandı","Eve döndü"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-ozet' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-baglam','Bağlamdan Sözcük Anlamı','Bağlamdan Sözcük Anlamı','Bağlamdan Sözcük Anlamı becerilerini uygular.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-soz'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-baglam-1-1','coktan_secmeli','“Çocuklar ortak çözüm için iş birliği yaptı.” iş birliği ne demektir?','["Birlikte çalışmak","Tek başına kalmak","Kavga etmek","Görevi bırakmak"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-baglam-1-2','coktan_secmeli','“Ece sonuçları dikkatle inceledi.” inceledi ne demektir?','["Sildi","Boyadı","Ayrıntılı baktı","Sakladı"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-baglam-1-3','coktan_secmeli','“Bu yöntem işi kolaylaştırdı.” yöntem ne demektir?','["İzlenen yol","Sonuç","Renk","Yer"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-baglam-1-4','coktan_secmeli','“Mahalle sakinleri dayanışma gösterdi.” dayanışma ne demektir?','["Dışlama","Yarışma","Birbirine destek olma","Sessizlik"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-baglam-1-5','coktan_secmeli','“Tarihî eser özenle korundu.” özenle ne demektir?','["Dikkat ederek","Rastgele","Hızla","İsteksizce"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-baglam-1-6','coktan_secmeli','“Öğrenci fikrini açıkça ifade etti.” ifade etmek ne demektir?','["Gizlemek","Silmek","Anlatmak","Unutmak"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-anlam-iliski','Eş, Zıt ve Eş Sesli Sözcükler','Eş, Zıt ve Eş Sesli Sözcükler','Eş, Zıt ve Eş Sesli Sözcükler becerilerini uygular.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-soz'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-anlam-iliski-1-1','coktan_secmeli','“cevap” sözcüğünün eş anlamlısı?','["yanıt","soru","işaret","metin"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-anlam-iliski-1-2','coktan_secmeli','“uzak” sözcüğünün zıt anlamlısı?','["ileri","geniş","yakın","yüksek"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-anlam-iliski-1-3','coktan_secmeli','“misafir” sözcüğünün eş anlamlısı?','["konuk","ev sahibi","komşu","öğrenci"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-anlam-iliski-1-4','coktan_secmeli','“yaş” sözcüğü hangi cümlede farklı anlamdadır?','["Ben on yaşındayım.","Yaşını sordu.","Çamaşırlar hâlâ yaş.","Onun yaşı dokuz."]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-anlam-iliski-1-5','coktan_secmeli','“yüz” sözcüğü hangi iki anlamda kullanılabilir?','["Sayı ve insan yüzü","Sadece renk","Sadece sayı","Sadece zaman"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-anlam-iliski-1-6','coktan_secmeli','“hızlı” sözcüğünün zıttı?','["çabuk","seri","yavaş","erken"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-deyim','Deyimler ve Söz Grupları','Deyimler ve Söz Grupları','Deyimler ve Söz Grupları becerilerini uygular.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-soz'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-deyim-1-1','coktan_secmeli','“Kulak vermek” ne demektir?','["Dikkatle dinlemek","Kulağı kapatmak","Bağırmak","Uyumak"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-deyim-1-2','coktan_secmeli','“Etekleri zil çalmak” neyi anlatır?','["Çok üzülmek","Çok yorulmak","Çok sevinmek","Korkmak"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-deyim-1-3','coktan_secmeli','“Gözden geçirmek” ne demektir?','["Yeniden incelemek","Silmek","Uyumak","Ezberlemek"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-deyim-1-4','coktan_secmeli','“El ele vermek” ne demektir?','["Ayrılmak","Kavga etmek","Birlikte çalışmak","İşi bırakmak"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-deyim-1-5','coktan_secmeli','Deyimler genellikle nasıl anlam taşır?','["Kalıplaşmış ve çoğu zaman mecazlı","Her zaman gerçek anlamlı","Sadece sayı bildirir","Sadece isimdir"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-deyim-1-6','coktan_secmeli','“İçi içine sığmamak” ne anlatabilir?','["Uyumak","Kızmak zorunlu","Çok heyecanlanmak","Susamak"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-buyuk-harf','Büyük Harflerin Kullanımı','Büyük Harflerin Kullanımı','Büyük Harflerin Kullanımı becerilerini uygular.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-yazim'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-buyuk-harf-1-1','coktan_secmeli','Hangisi doğru yazılmıştır?','["Ankara Türkiye''nin başkentidir.","ankara Türkiye''nin başkentidir.","Ankara türkiye''nin başkentidir.","ankara türkiye''nin başkentidir."]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-buyuk-harf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-buyuk-harf-1-2','coktan_secmeli','Cümle nasıl başlar?','["Virgülle","Küçük harfle zorunlu","Büyük harfle","Rakamla zorunlu"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-buyuk-harf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-buyuk-harf-1-3','coktan_secmeli','Kişi adları nasıl başlar?','["Büyük harfle","Her zaman küçük harfle","Noktayla","Sayıyla"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-buyuk-harf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-buyuk-harf-1-4','coktan_secmeli','“Atatürk İlkokulu” yazımı neden büyük harfle başlar?','["Uzun olduğu için","Okul olduğu için her kelime zorunlu","Özel ad olduğu için","Sadece başlık olduğu için"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-buyuk-harf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-buyuk-harf-1-5','coktan_secmeli','Bayram adlarında önemli sözcükler nasıl yazılır?','["Büyük harfle","Küçük harfle","Rakamla","Kesmeyle"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-buyuk-harf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-buyuk-harf-1-6','coktan_secmeli','Şehir adları nasıl yazılır?','["Küçük harfle","Sadece kısaltmayla","Büyük harfle başlar.","Rakamla"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-buyuk-harf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-noktalama','Noktalama İşaretleri','Noktalama İşaretleri','Noktalama İşaretleri becerilerini uygular.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-yazim'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-noktalama-1-1','coktan_secmeli','“Bugün hangi kitabı okuyacaksın__” boşluğa?','["?",".",",","!"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-noktalama-1-2','coktan_secmeli','“Eyvah__ kalemim kırıldı.” boşluğa?','["?",".","!",":"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-noktalama-1-3','coktan_secmeli','“Çantamda defter__ kalem ve silgi var.” boşluğa?','[",",".","?","!"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-noktalama-1-4','coktan_secmeli','Açıklama yapılacak cümlenin sonunda hangisi kullanılabilir?','[".","?",":","!"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-noktalama-1-5','coktan_secmeli','Konuşma cümlesini göstermek için hangi işaret kullanılabilir?','["Tırnak işareti","Sadece virgül","Sadece nokta","Sadece kesme"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-noktalama-1-6','coktan_secmeli','Tamamlanmış haber cümlesinin sonunda genellikle?','["Soru işareti","Virgül","Nokta","Kesme"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-yazim-kural','Yazım Kuralları','Yazım Kuralları','Yazım Kuralları becerilerini uygular.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-yazim'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yazim-kural-1-1','coktan_secmeli','Hangisi doğru yazılmıştır?','["Türkiye''nin","Türkiyenin","Türkiye nin","türkiye''nin"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yazim-kural' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yazim-kural-1-2','coktan_secmeli','Sayıya gelen ek nasıl ayrılabilir?','["Virgülle","Noktayla","Kesme işaretiyle: 23''te","Hiç ayrılmaz"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yazim-kural' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yazim-kural-1-3','coktan_secmeli','“birçok” nasıl yazılır?','["Bitişik","Ayrı","Kesmeyle","Tireyle"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yazim-kural' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yazim-kural-1-4','coktan_secmeli','“her şey” nasıl yazılır?','["Bitişik","Kesmeyle","Ayrı","Rakamla"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yazim-kural' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yazim-kural-1-5','coktan_secmeli','Kısaltmaya gelen ek neye göre okunur?','["Kısaltmanın okunuşuna göre","Rengine göre","Uzunluğuna göre","Yazı tipine göre"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yazim-kural' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yazim-kural-1-6','coktan_secmeli','Özel ada gelen ek çoğu durumda nasıl ayrılır?','["Virgülle","Noktayla","Kesme işaretiyle","Tireyle her zaman"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yazim-kural' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-isim-fiil','İsim ve Fiil','İsim ve Fiil','İsim ve Fiil becerilerini uygular.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-dil'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-isim-fiil-1-1','coktan_secmeli','“Koşmak” hangi tür sözcüğe örnektir?','["Fiil","İsim","Sıfat","Bağlaç"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-isim-fiil' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-isim-fiil-1-2','coktan_secmeli','“Masa” hangi tür sözcüktür?','["Fiil","Sıfat","İsim","Eylem cümlesi"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-isim-fiil' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-isim-fiil-1-3','coktan_secmeli','“Çocuklar güldü.” cümlesinde fiil?','["güldü","çocuklar","cümle","-lar"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-isim-fiil' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-isim-fiil-1-4','coktan_secmeli','Varlıkların adını bildiren sözcüklere ne denir?','["Fiil","Noktalama","İsim","Hece"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-isim-fiil' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-isim-fiil-1-5','coktan_secmeli','İş, oluş veya hareket bildiren sözcüklere ne denir?','["Fiil","İsim","Sıfat","Başlık"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-isim-fiil' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-isim-fiil-1-6','coktan_secmeli','“çiçek açtı” sözünde eylem bildiren sözcük?','["çiçek","söz","açtı","bildiren"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-isim-fiil' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-sifat','Varlıkları Niteleyen Sözcükler','Varlıkları Niteleyen Sözcükler','Varlıkları Niteleyen Sözcükler becerilerini uygular.','',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-dil'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-sifat-1-1','coktan_secmeli','“kırmızı kalem” sözünde kalemi niteleyen sözcük?','["kırmızı","kalem","söz","ile"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-sifat' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-sifat-1-2','coktan_secmeli','“uzun yol” sözünde niteleyici sözcük?','["yol","uz","uzun","-un"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-sifat' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-sifat-1-3','coktan_secmeli','Sıfatlar neyi belirtebilir?','["Varlığın özelliğini","Sadece işi","Sadece zamanı","Sadece sayfayı"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-sifat' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-sifat-1-4','coktan_secmeli','“üç kitap” sözünde sayıyı belirten sözcük?','["kitap","söz","üç","belirten"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-sifat' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-sifat-1-5','coktan_secmeli','“bu ev” sözünde varlığı işaret eden sözcük?','["bu","ev","söz","varlık"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-sifat' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-sifat-1-6','coktan_secmeli','“tatlı elma” sözünde niteleyen sözcük?','["elma","söz","tatlı","-lı"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-sifat' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-cumle-anlam','Cümlede Anlam İlişkileri','Cümlede Anlam İlişkileri','Cümlede Anlam İlişkileri becerilerini uygular.','',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-dil'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cumle-anlam-1-1','coktan_secmeli','“Yağmur yağdığı için maç ertelendi.” neden?','["Yağmur yağması","Maçın ertelenmesi","Sahanın rengi","Takımın adı"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cumle-anlam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cumle-anlam-1-2','coktan_secmeli','“Çok çalıştı, bu yüzden başarılı oldu.” sonuç?','["Çok çalışması","Kitap alması","Başarılı olması","Okula gitmesi"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cumle-anlam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cumle-anlam-1-3','coktan_secmeli','“Bu kitap diğerinden daha uzundur.” hangi ilişki?','["Karşılaştırma","Neden-sonuç","Koşul","Soru"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cumle-anlam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cumle-anlam-1-4','coktan_secmeli','“Erken çıkarsak otobüse yetişiriz.” hangi ilişki?','["Karşılaştırma","Sadece neden","Koşul","Tanım"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cumle-anlam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cumle-anlam-1-5','coktan_secmeli','“Hem yüzdü hem koştu.” ne anlatır?','["İki eylemin gerçekleştiğini","Hiç eylem yok","Sadece bir eylem","Neden-sonuç"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cumle-anlam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-cumle-anlam-1-6','coktan_secmeli','“Hava soğuk olmasına rağmen dışarı çıktı.” ne anlatır?','["Sadece neden","Soru","Beklenmeyen karşıt durum","Tanım"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-cumle-anlam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-hikaye','Hikâye Edici Metin','Hikâye Edici Metin','Hikâye Edici Metin becerilerini uygular.','',130,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-metin'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-hikaye-1-1','coktan_secmeli','Hikâye edici metinde genellikle ne bulunur?','["Olay, kişi, yer ve zaman","Sadece tablo","Sadece tarif","Sadece liste"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-hikaye-1-2','coktan_secmeli','Metindeki olayları yaşayan kişiye ne denebilir?','["Başlık","Yazarın adresi","Kahraman/karakter","Dipnot"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-hikaye-1-3','coktan_secmeli','Olayın gerçekleştiği yer neyi gösterir?','["Mekânı","Zamanı","Ana fikri","Noktalamayı"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-hikaye-1-4','coktan_secmeli','Hikâyede sorun ve çözüm bulunabilir mi?','["Hayır","Sadece şiirde","Evet","Sadece grafikte"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-hikaye-1-5','coktan_secmeli','Hikâyede olay sırası neden önemlidir?','["Olayların gelişimini anlamaya yardım eder.","Sayfa sayısını artırır.","Yazarı değiştirir.","Başlığı siler."]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-hikaye-1-6','coktan_secmeli','Hikâyenin zamanı neyi gösterir?','["Nerede geçtiğini","Kimin anlattığını","Olayın ne zaman geçtiğini","Kaç sayfa olduğunu"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-bilgi','Bilgilendirici Metin','Bilgilendirici Metin','Bilgilendirici Metin becerilerini uygular.','',140,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-metin'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-bilgi-1-1','coktan_secmeli','Bilgilendirici metnin amacı genellikle nedir?','["Bilgi vermek ve açıklamak","Sadece hayal ürünü olay anlatmak","Sadece şarkı söylemek","Sadece soru sormak"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-bilgi-1-2','coktan_secmeli','Bilgilendirici metinde başlık ne işe yarar?','["Yazarı gizlemeye","Sayfayı büyütmeye","Konuyu tanıtmaya","Rengi değiştirmeye"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-bilgi-1-3','coktan_secmeli','Kaynak kullanmak neden önemlidir?','["Bilginin dayanağını göstermeye","Metni uzatmaya","Resmi küçültmeye","Soruyu silmeye"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-bilgi-1-4','coktan_secmeli','Bilgilendirici metinde grafik bulunabilir mi?','["Hayır","Sadece şiirde","Evet","Sadece masalda"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-bilgi-1-5','coktan_secmeli','Gerçek bilgi ile kişisel görüş aynı mıdır?','["Hayır","Evet","Sadece kısa cümlede","Sadece internette"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-bilgi-1-6','coktan_secmeli','Bilgi metninde tanım ve örnek kullanılabilir mi?','["Hayır","Sadece hikâyede","Evet","Sadece şiirde"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-siir','Şiir ve Söz Sanatlarıyla Tanışma','Şiir ve Söz Sanatlarıyla Tanışma','Şiir ve Söz Sanatlarıyla Tanışma becerilerini uygular.','',150,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-metin'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-siir-1-1','coktan_secmeli','Şiirde satır kümelerine ne denebilir?','["Dize ve kıta yapısı","Tablo","Grafik","Denklem"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-siir-1-2','coktan_secmeli','Şiirde ses benzerlikleri bulunabilir mi?','["Hayır","Sadece düz yazıda","Evet","Şiirde ses yoktur"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-siir-1-3','coktan_secmeli','“Güneş gülümsedi.” ifadesinde güneşe insan özelliği verilmiştir. Bu neye örnektir?','["Kişileştirme","Gerçek anlam","Tablo","Ölçüm"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-siir-1-4','coktan_secmeli','Şiir duygu ve düşünce aktarabilir mi?','["Hayır","Sadece bilgi verir","Evet","Sadece sayı içerir"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-siir-1-5','coktan_secmeli','Şiir okurken vurgu ve tonlama önemli midir?','["Evet","Hayır","Sadece hızlı okumak gerekir","Ses kullanılmaz"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-siir-1-6','coktan_secmeli','Şiirin başlığı şiirin konusuyla ilişkili olabilir mi?','["Hayır","Başlık rastgele","Evet","Şiirde başlık olmaz"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-gorsel','Görsel, Grafik ve Tablo Okuma','Görsel, Grafik ve Tablo Okuma','Görsel, Grafik ve Tablo Okuma becerilerini uygular.','',160,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-metin'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-gorsel-1-1','coktan_secmeli','Bir sütun grafiğinde en yüksek sütun neyi gösterebilir?','["En yüksek değeri","En düşük değeri","Başlığı","Kaynağı"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-gorsel-1-2','coktan_secmeli','Tablonun başlığı neyi anlatır?','["Rengini","Kâğıt boyunu","Tablonun konusunu","Yazarı"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-gorsel-1-3','coktan_secmeli','Bir görseli yorumlarken neye dikkat edilir?','["Görseldeki ayrıntı ve bağlama","Sadece renge","Sadece büyüklüğe","Hiçbir şeye"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-gorsel-1-4','coktan_secmeli','Haritadaki semboller neyle açıklanabilir?','["Başlıkla yalnız","Sayfa numarasıyla","Lejant/açıklama ile","Kenar boşluğuyla"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-gorsel-1-5','coktan_secmeli','Grafikte değerleri karşılaştırmak ne sağlar?','["Veriler arasındaki farkı görmeyi","Metni silmeyi","Rengi değiştirmeyi","Zamanı durdurmayı"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-gorsel-1-6','coktan_secmeli','Görsel ve metin birlikte kullanılabilir mi?','["Hayır","Sadece resim","Evet","Sadece yazı"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-gorsel' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-paragraf','Paragraf Oluşturma ve Planlı Yazma','Paragraf Oluşturma ve Planlı Yazma','Paragraf Oluşturma ve Planlı Yazma becerilerini uygular.','',170,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-anlatim'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-paragraf-1-1','coktan_secmeli','Paragraf cümleleri nasıl olmalıdır?','["Aynı konu çevresinde bağlantılı","Tamamen ilgisiz","Rastgele","Sadece sorulardan oluşan"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-paragraf-1-2','coktan_secmeli','Yazıya başlamadan önce ne yapılabilir?','["Sonuç yazılıp bırakılır.","Kâğıt yırtılır.","Plan hazırlanabilir.","Başlık gizlenir."]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-paragraf-1-3','coktan_secmeli','Giriş bölümü ne işe yarar?','["Konuyu tanıtmaya","Yazıyı bitirmeye","Kaynağı silmeye","Sadece örnek vermeye"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-paragraf-1-4','coktan_secmeli','Sonuç bölümü ne yapabilir?','["Yeni ilgisiz konu açar.","Başlığı siler.","Düşünceyi tamamlar.","Yazıyı başlatır."]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-paragraf-1-5','coktan_secmeli','Yazı bitince ne yapılmalıdır?','["Gözden geçirilmelidir.","Hemen atılmalıdır.","Hiç okunmamalıdır.","Başlığı silinmelidir."]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-paragraf-1-6','coktan_secmeli','Uygun başlık seçmek yazıyı destekler mi?','["Hayır","Başlık gereksiz","Evet","Sadece şiirde"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'tr4-yonerge','Yönerge, Dinleme ve Sunum','Yönerge, Dinleme ve Sunum','Yönerge, Dinleme ve Sunum becerilerini uygular.','',180,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='tr4-anlatim'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yonerge-1-1','coktan_secmeli','“Önce metni oku, sonra soruları cevapla.” ilk adım?','["Metni okumak","Soruları cevaplamak","Defteri kapatmak","Başlığı silmek"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yonerge-1-2','coktan_secmeli','Dinlerken ne yapılmalıdır?','["Söz sürekli kesilmelidir.","Başka işle ilgilenilmelidir.","Konuşana dikkat verilmelidir.","Yüksek sesle konuşulmalıdır."]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yonerge-1-3','coktan_secmeli','Sunumda ses nasıl olmalıdır?','["Anlaşılır ve uygun yükseklikte","Duyulmayacak kadar kısık","Sürekli bağırarak","Rastgele"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yonerge-1-4','coktan_secmeli','Yönergede sıralama sözcükleri neden önemlidir?','["Rengi seçer.","Sayfayı büyütür.","İşlemleri doğru sırada yapmaya yardım eder.","Başlığı değiştirir."]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yonerge-1-5','coktan_secmeli','Sunumda göz teması ve beden dili yardımcı olabilir mi?','["Evet","Hayır","Sadece yazı önemlidir","Sadece slayt önemlidir"]',0,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4-tr4-yonerge-1-6','coktan_secmeli','Dinlenen metin sonunda not almak yararlı olabilir mi?','["Hayır","Not almak yasaktır","Evet","Sadece matematikte"]',2,'Konu bilgisini kullanarak en uygun seçenek belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='tr4-yonerge' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;



-- SOURCE: database/content/grade4/20_matematik_soru_havuzu.sql
INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-dogal','Doğal Sayılar ve Basamak Değeri','Doğal Sayılar ve Basamak Değeri','Doğal Sayılar ve Basamak Değeri becerilerini uygular.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-yuvarlama','Yuvarlama ve Sıralama','Yuvarlama ve Sıralama','Yuvarlama ve Sıralama becerilerini uygular.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-toplama','Doğal Sayılarla Toplama','Doğal Sayılarla Toplama','Doğal Sayılarla Toplama becerilerini uygular.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-cikarma','Doğal Sayılarla Çıkarma','Doğal Sayılarla Çıkarma','Doğal Sayılarla Çıkarma becerilerini uygular.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-carpma','Doğal Sayılarla Çarpma','Doğal Sayılarla Çarpma','Doğal Sayılarla Çarpma becerilerini uygular.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-bolme','Doğal Sayılarla Bölme','Doğal Sayılarla Bölme','Doğal Sayılarla Bölme becerilerini uygular.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-problem','Dört İşlem Problemleri','Dört İşlem Problemleri','Dört İşlem Problemleri becerilerini uygular.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-kesir','Kesirler','Kesirler','Kesirler becerilerini uygular.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-kesir-islem','Kesirlerle Basit İşlemler','Kesirlerle Basit İşlemler','Kesirlerle Basit İşlemler becerilerini uygular.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-oruntu','Sayı Örüntüleri','Sayı Örüntüleri','Sayı Örüntüleri becerilerini uygular.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-sayilar'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-acilar','Açıları Tanıma ve Ölçme','Açıları Tanıma ve Ölçme','Açıları Tanıma ve Ölçme becerilerini uygular.','',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-geometri'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-sekil','Üçgen, Kare ve Dikdörtgen','Üçgen, Kare ve Dikdörtgen','Üçgen, Kare ve Dikdörtgen becerilerini uygular.','',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-geometri'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-simetri','Simetri','Simetri','Simetri becerilerini uygular.','',130,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-geometri'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-cisim','Geometrik Cisimler','Geometrik Cisimler','Geometrik Cisimler becerilerini uygular.','',140,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-geometri'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-uzunluk','Uzunluk Ölçme','Uzunluk Ölçme','Uzunluk Ölçme becerilerini uygular.','',150,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-olcme'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-cevre','Çevre Uzunluğu','Çevre Uzunluğu','Çevre Uzunluğu becerilerini uygular.','',160,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-olcme'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-alan','Alan Ölçmeye Giriş','Alan Ölçmeye Giriş','Alan Ölçmeye Giriş becerilerini uygular.','',170,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-olcme'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-zaman','Zaman Ölçme','Zaman Ölçme','Zaman Ölçme becerilerini uygular.','',180,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-olcme'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-kutle','Tartma','Tartma','Tartma becerilerini uygular.','',190,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-olcme'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-sivi','Sıvı Ölçme','Sıvı Ölçme','Sıvı Ölçme becerilerini uygular.','',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-olcme'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-para','Paralarımız ve ₺ Problemleri','Paralarımız ve ₺ Problemleri','Paralarımız ve ₺ Problemleri becerilerini uygular.','',210,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-olcme'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'mat4-tablo','Tablo ve Sütun Grafiği','Tablo ve Sütun Grafiği','Tablo ve Sütun Grafiği becerilerini uygular.','',220,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='mat4-veri'
WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-1','coktan_secmeli','1000 sayısında yüzler basamağının değeri kaçtır?','["1000","011","0","021"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-2','coktan_secmeli','1000 sayısında onlar basamağının değeri kaçtır?','["1000","011","021","0"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-3','coktan_secmeli','1211 sayısında yüzler basamağının değeri kaçtır?','["200","2","10","100"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-4','coktan_secmeli','1211 sayısında onlar basamağının değeri kaçtır?','["1","10","200","1211"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-5','coktan_secmeli','1422 sayısında yüzler basamağının değeri kaçtır?','["4","20","400","200"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-6','coktan_secmeli','1422 sayısında onlar basamağının değeri kaçtır?','["2","400","1422","20"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-7','coktan_secmeli','1633 sayısında yüzler basamağının değeri kaçtır?','["600","6","30","300"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-8','coktan_secmeli','1633 sayısında onlar basamağının değeri kaçtır?','["3","30","600","1633"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-9','coktan_secmeli','1844 sayısında yüzler basamağının değeri kaçtır?','["8","40","800","400"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-10','coktan_secmeli','1844 sayısında onlar basamağının değeri kaçtır?','["4","800","1844","40"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-11','coktan_secmeli','2055 sayısında yüzler basamağının değeri kaçtır?','["0","50","500","2055"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-12','coktan_secmeli','2055 sayısında onlar basamağının değeri kaçtır?','["5","50","0","2055"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-13','coktan_secmeli','2266 sayısında yüzler basamağının değeri kaçtır?','["2","60","200","600"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-14','coktan_secmeli','2266 sayısında onlar basamağının değeri kaçtır?','["6","200","2266","60"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-15','coktan_secmeli','2477 sayısında yüzler basamağının değeri kaçtır?','["400","4","70","700"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-16','coktan_secmeli','2477 sayısında onlar basamağının değeri kaçtır?','["7","70","400","2477"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-17','coktan_secmeli','2688 sayısında yüzler basamağının değeri kaçtır?','["6","80","600","800"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-18','coktan_secmeli','2688 sayısında onlar basamağının değeri kaçtır?','["8","600","2688","80"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-19','coktan_secmeli','2899 sayısında yüzler basamağının değeri kaçtır?','["800","8","90","900"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-20','coktan_secmeli','2899 sayısında onlar basamağının değeri kaçtır?','["9","90","800","2899"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-21','coktan_secmeli','3110 sayısında yüzler basamağının değeri kaçtır?','["1","10","100","0"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-22','coktan_secmeli','3110 sayısında onlar basamağının değeri kaçtır?','["1","100","0","10"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-23','coktan_secmeli','3321 sayısında yüzler basamağının değeri kaçtır?','["300","3","20","100"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-24','coktan_secmeli','3321 sayısında onlar basamağının değeri kaçtır?','["2","20","300","10"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-25','coktan_secmeli','3532 sayısında yüzler basamağının değeri kaçtır?','["5","30","500","200"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-26','coktan_secmeli','3532 sayısında onlar basamağının değeri kaçtır?','["3","500","20","30"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-27','coktan_secmeli','3743 sayısında yüzler basamağının değeri kaçtır?','["700","7","40","300"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,27,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-28','coktan_secmeli','3743 sayısında onlar basamağının değeri kaçtır?','["4","40","700","30"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,28,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-29','coktan_secmeli','3954 sayısında yüzler basamağının değeri kaçtır?','["9","50","900","400"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,29,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-30','coktan_secmeli','3954 sayısında onlar basamağının değeri kaçtır?','["5","900","40","50"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,30,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-31','coktan_secmeli','4165 sayısında yüzler basamağının değeri kaçtır?','["100","1","60","500"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,31,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-32','coktan_secmeli','4165 sayısında onlar basamağının değeri kaçtır?','["6","60","100","50"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,32,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-33','coktan_secmeli','4376 sayısında yüzler basamağının değeri kaçtır?','["3","70","300","600"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,33,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-34','coktan_secmeli','4376 sayısında onlar basamağının değeri kaçtır?','["7","300","60","70"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,34,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-35','coktan_secmeli','4587 sayısında yüzler basamağının değeri kaçtır?','["500","5","80","700"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,35,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-36','coktan_secmeli','4587 sayısında onlar basamağının değeri kaçtır?','["8","80","500","70"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,36,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-37','coktan_secmeli','4798 sayısında yüzler basamağının değeri kaçtır?','["7","90","700","800"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,37,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-38','coktan_secmeli','4798 sayısında onlar basamağının değeri kaçtır?','["9","700","80","90"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,38,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-39','coktan_secmeli','5009 sayısında yüzler basamağının değeri kaçtır?','["0","900","5009","021"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,39,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-40','coktan_secmeli','5009 sayısında onlar basamağının değeri kaçtır?','["90","0","5009","021"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,40,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-41','coktan_secmeli','5220 sayısında yüzler basamağının değeri kaçtır?','["2","20","200","0"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-42','coktan_secmeli','5220 sayısında onlar basamağının değeri kaçtır?','["2","200","0","20"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-43','coktan_secmeli','5431 sayısında yüzler basamağının değeri kaçtır?','["400","4","30","100"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-44','coktan_secmeli','5431 sayısında onlar basamağının değeri kaçtır?','["3","30","400","10"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-45','coktan_secmeli','5642 sayısında yüzler basamağının değeri kaçtır?','["6","40","600","200"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,45,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-46','coktan_secmeli','5642 sayısında onlar basamağının değeri kaçtır?','["4","600","20","40"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,46,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-47','coktan_secmeli','5853 sayısında yüzler basamağının değeri kaçtır?','["800","8","50","300"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,47,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-48','coktan_secmeli','5853 sayısında onlar basamağının değeri kaçtır?','["5","50","800","30"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,48,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-49','coktan_secmeli','6064 sayısında yüzler basamağının değeri kaçtır?','["60","400","0","6064"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,49,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-50','coktan_secmeli','6064 sayısında onlar basamağının değeri kaçtır?','["6","0","40","60"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,50,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-51','coktan_secmeli','6275 sayısında yüzler basamağının değeri kaçtır?','["200","2","70","500"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,51,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-52','coktan_secmeli','6275 sayısında onlar basamağının değeri kaçtır?','["7","70","200","50"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,52,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-53','coktan_secmeli','6486 sayısında yüzler basamağının değeri kaçtır?','["4","80","400","600"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,53,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-54','coktan_secmeli','6486 sayısında onlar basamağının değeri kaçtır?','["8","400","60","80"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,54,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-55','coktan_secmeli','6697 sayısında yüzler basamağının değeri kaçtır?','["600","6","90","700"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,55,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-56','coktan_secmeli','6697 sayısında onlar basamağının değeri kaçtır?','["9","90","600","70"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,56,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-57','coktan_secmeli','6908 sayısında yüzler basamağının değeri kaçtır?','["9","0","900","800"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,57,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-58','coktan_secmeli','6908 sayısında onlar basamağının değeri kaçtır?','["900","80","6908","0"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,58,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-59','coktan_secmeli','7119 sayısında yüzler basamağının değeri kaçtır?','["100","1","10","900"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,59,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-60','coktan_secmeli','7119 sayısında onlar basamağının değeri kaçtır?','["1","10","100","90"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,60,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-61','coktan_secmeli','7330 sayısında yüzler basamağının değeri kaçtır?','["3","30","300","0"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,61,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-62','coktan_secmeli','7330 sayısında onlar basamağının değeri kaçtır?','["3","300","0","30"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,62,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-63','coktan_secmeli','7541 sayısında yüzler basamağının değeri kaçtır?','["500","5","40","100"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,63,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-64','coktan_secmeli','7541 sayısında onlar basamağının değeri kaçtır?','["4","40","500","10"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,64,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-65','coktan_secmeli','7752 sayısında yüzler basamağının değeri kaçtır?','["7","50","700","200"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,65,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-66','coktan_secmeli','7752 sayısında onlar basamağının değeri kaçtır?','["5","700","20","50"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,66,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-dogal' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-67','coktan_secmeli','1243 sayısının en yakın onluğu kaçtır?','["1240","1230","1250","1243"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,67,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-68','coktan_secmeli','1243 sayısının en yakın yüzlüğü kaçtır?','["1100","1300","1200","1243"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,68,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-69','coktan_secmeli','1567 sayısının en yakın onluğu kaçtır?','["1560","1580","1570","1567"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,69,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-70','coktan_secmeli','1567 sayısının en yakın yüzlüğü kaçtır?','["1600","1500","1700","1567"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,70,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-71','coktan_secmeli','2488 sayısının en yakın onluğu kaçtır?','["2490","2480","2500","2488"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,71,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-72','coktan_secmeli','2488 sayısının en yakın yüzlüğü kaçtır?','["2400","2600","2500","2488"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,72,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-73','coktan_secmeli','3512 sayısının en yakın onluğu kaçtır?','["3500","3520","3510","3512"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,73,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-74','coktan_secmeli','3512 sayısının en yakın yüzlüğü kaçtır?','["3500","3400","3600","3512"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,74,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-75','coktan_secmeli','4499 sayısının en yakın onluğu kaçtır?','["4500","4490","4510","4499"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,75,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-76','coktan_secmeli','4499 sayısının en yakın yüzlüğü kaçtır?','["4400","4600","4500","4499"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,76,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-77','coktan_secmeli','5501 sayısının en yakın onluğu kaçtır?','["5490","5510","5500","5501"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,77,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-78','coktan_secmeli','5501 sayısının en yakın yüzlüğü kaçtır?','["5500","5400","5600","5501"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,78,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-79','coktan_secmeli','6749 sayısının en yakın onluğu kaçtır?','["6750","6740","6760","6749"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,79,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-80','coktan_secmeli','6749 sayısının en yakın yüzlüğü kaçtır?','["6600","6800","6700","6749"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,80,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-81','coktan_secmeli','7251 sayısının en yakın onluğu kaçtır?','["7240","7260","7250","7251"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,81,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-82','coktan_secmeli','7251 sayısının en yakın yüzlüğü kaçtır?','["7300","7200","7400","7251"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,82,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-83','coktan_secmeli','8499 sayısının en yakın onluğu kaçtır?','["8500","8490","8510","8499"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,83,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-84','coktan_secmeli','8499 sayısının en yakın yüzlüğü kaçtır?','["8400","8600","8500","8499"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,84,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-85','coktan_secmeli','9502 sayısının en yakın onluğu kaçtır?','["9490","9510","9500","9502"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,85,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-86','coktan_secmeli','9502 sayısının en yakın yüzlüğü kaçtır?','["9500","9400","9600","9502"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,86,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-87','coktan_secmeli','9994 sayısının en yakın onluğu kaçtır?','["9990","9980","10000","9994"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,87,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-88','coktan_secmeli','9994 sayısının en yakın yüzlüğü kaçtır?','["9900","10100","10000","9994"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,88,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-89','coktan_secmeli','6055 sayısının en yakın onluğu kaçtır?','["6050","6070","6060","6055"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,89,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-90','coktan_secmeli','6055 sayısının en yakın yüzlüğü kaçtır?','["6100","6000","6200","6055"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,90,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-91','coktan_secmeli','7744 sayısının en yakın onluğu kaçtır?','["7740","7730","7750","7744"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,91,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-92','coktan_secmeli','7744 sayısının en yakın yüzlüğü kaçtır?','["7600","7800","7700","7744"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,92,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-93','coktan_secmeli','3388 sayısının en yakın onluğu kaçtır?','["3380","3400","3390","3388"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,93,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-94','coktan_secmeli','3388 sayısının en yakın yüzlüğü kaçtır?','["3400","3300","3500","3388"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,94,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-95','coktan_secmeli','2216 sayısının en yakın onluğu kaçtır?','["2220","2210","2230","2216"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,95,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-96','coktan_secmeli','2216 sayısının en yakın yüzlüğü kaçtır?','["2100","2300","2200","2216"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,96,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-97','coktan_secmeli','3154, 3514, 1354 sayılarını küçükten büyüğe sıralayan seçenek hangisidir?','["3154, 3514, 1354","3514, 3154, 1354","3154, 1354, 3514","1354, 3154, 3514"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,97,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-98','coktan_secmeli','9080, 8900, 8090 sayılarını küçükten büyüğe sıralayan seçenek hangisidir?','["8090, 8900, 9080","9080, 8900, 8090","9080, 8090, 8900","021"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,98,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-99','coktan_secmeli','4421, 4241, 2441 sayılarını küçükten büyüğe sıralayan seçenek hangisidir?','["4421, 4241, 2441","2441, 4241, 4421","4421, 2441, 4241","021"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,99,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-100','coktan_secmeli','7010, 1700, 7100 sayılarını küçükten büyüğe sıralayan seçenek hangisidir?','["7010, 1700, 7100","7100, 7010, 1700","1700, 7010, 7100","7010, 7100, 1700"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,100,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-101','coktan_secmeli','5602, 5062, 6502 sayılarını küçükten büyüğe sıralayan seçenek hangisidir?','["5602, 5062, 6502","6502, 5602, 5062","5602, 6502, 5062","5062, 5602, 6502"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,101,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-102','coktan_secmeli','9990, 9090, 9900 sayılarını küçükten büyüğe sıralayan seçenek hangisidir?','["9090, 9900, 9990","9990, 9090, 9900","9990, 9900, 9090","021"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,102,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-yuvarlama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-103','coktan_secmeli','1000 + 125 = ?','["1125","1126","1124","1135"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,103,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-104','coktan_secmeli','1000 + 298 = ?','["1299","1298","1297","1308"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,104,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-105','coktan_secmeli','1000 + 471 = ?','["1472","1470","1471","1481"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,105,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-106','coktan_secmeli','1000 + 644 = ?','["1645","1643","1654","1644"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,106,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-107','coktan_secmeli','1000 + 817 = ?','["1817","1818","1816","1827"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,107,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-108','coktan_secmeli','1000 + 990 = ?','["1991","1990","1989","2000"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,108,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-109','coktan_secmeli','1000 + 1163 = ?','["2164","2162","2163","2173"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,109,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-110','coktan_secmeli','1000 + 1336 = ?','["2337","2335","2346","2336"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,110,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-111','coktan_secmeli','1000 + 1509 = ?','["2509","2510","2508","2519"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,111,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-112','coktan_secmeli','1000 + 1682 = ?','["2683","2682","2681","2692"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,112,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-113','coktan_secmeli','1000 + 1855 = ?','["2856","2854","2855","2865"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,113,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-114','coktan_secmeli','1331 + 125 = ?','["1457","1455","1466","1456"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,114,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-115','coktan_secmeli','1331 + 298 = ?','["1629","1630","1628","1639"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,115,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-116','coktan_secmeli','1331 + 471 = ?','["1803","1802","1801","1812"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,116,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-117','coktan_secmeli','1331 + 644 = ?','["1976","1974","1975","1985"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,117,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-118','coktan_secmeli','1331 + 817 = ?','["2149","2147","2158","2148"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,118,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-119','coktan_secmeli','1331 + 990 = ?','["2321","2322","2320","2331"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,119,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-120','coktan_secmeli','1331 + 1163 = ?','["2495","2494","2493","2504"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,120,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-121','coktan_secmeli','1331 + 1336 = ?','["2668","2666","2667","2677"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,121,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-122','coktan_secmeli','1331 + 1509 = ?','["2841","2839","2850","2840"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,122,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-123','coktan_secmeli','1331 + 1682 = ?','["3013","3014","3012","3023"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,123,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-124','coktan_secmeli','1331 + 1855 = ?','["3187","3186","3185","3196"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,124,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-125','coktan_secmeli','1662 + 125 = ?','["1788","1786","1787","1797"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,125,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-126','coktan_secmeli','1662 + 298 = ?','["1961","1959","1970","1960"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,126,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-127','coktan_secmeli','1662 + 471 = ?','["2133","2134","2132","2143"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,127,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-128','coktan_secmeli','1662 + 644 = ?','["2307","2306","2305","2316"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,128,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-129','coktan_secmeli','1662 + 817 = ?','["2480","2478","2479","2489"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,129,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-130','coktan_secmeli','1662 + 990 = ?','["2653","2651","2662","2652"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,130,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-131','coktan_secmeli','1662 + 1163 = ?','["2825","2826","2824","2835"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,131,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-132','coktan_secmeli','1662 + 1336 = ?','["2999","2998","2997","3008"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,132,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-133','coktan_secmeli','1662 + 1509 = ?','["3172","3170","3171","3181"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,133,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-134','coktan_secmeli','1662 + 1682 = ?','["3345","3343","3354","3344"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,134,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-135','coktan_secmeli','1662 + 1855 = ?','["3517","3518","3516","3527"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,135,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-136','coktan_secmeli','1993 + 125 = ?','["2119","2118","2117","2128"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,136,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-137','coktan_secmeli','1993 + 298 = ?','["2292","2290","2291","2301"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,137,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-138','coktan_secmeli','1993 + 471 = ?','["2465","2463","2474","2464"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,138,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-139','coktan_secmeli','1993 + 644 = ?','["2637","2638","2636","2647"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,139,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-140','coktan_secmeli','1993 + 817 = ?','["2811","2810","2809","2820"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,140,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-141','coktan_secmeli','1993 + 990 = ?','["2984","2982","2983","2993"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,141,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-142','coktan_secmeli','1993 + 1163 = ?','["3157","3155","3166","3156"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,142,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-143','coktan_secmeli','1993 + 1336 = ?','["3329","3330","3328","3339"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,143,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-144','coktan_secmeli','1993 + 1509 = ?','["3503","3502","3501","3512"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,144,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-145','coktan_secmeli','1993 + 1682 = ?','["3676","3674","3675","3685"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,145,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-146','coktan_secmeli','1993 + 1855 = ?','["3849","3847","3858","3848"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,146,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-147','coktan_secmeli','2324 + 125 = ?','["2449","2450","2448","2459"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,147,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-148','coktan_secmeli','2324 + 298 = ?','["2623","2622","2621","2632"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,148,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-149','coktan_secmeli','2324 + 471 = ?','["2796","2794","2795","2805"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,149,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-150','coktan_secmeli','2324 + 644 = ?','["2969","2967","2978","2968"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,150,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-151','coktan_secmeli','2324 + 817 = ?','["3141","3142","3140","3151"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,151,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-152','coktan_secmeli','2324 + 990 = ?','["3315","3314","3313","3324"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,152,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-153','coktan_secmeli','2324 + 1163 = ?','["3488","3486","3487","3497"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,153,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-154','coktan_secmeli','2324 + 1336 = ?','["3661","3659","3670","3660"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,154,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-155','coktan_secmeli','2324 + 1509 = ?','["3833","3834","3832","3843"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,155,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-156','coktan_secmeli','2324 + 1682 = ?','["4007","4006","4005","4016"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,156,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-157','coktan_secmeli','2324 + 1855 = ?','["4180","4178","4179","4189"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,157,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-158','coktan_secmeli','2655 + 125 = ?','["2781","2779","2790","2780"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,158,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-159','coktan_secmeli','2655 + 298 = ?','["2953","2954","2952","2963"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,159,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-160','coktan_secmeli','2655 + 471 = ?','["3127","3126","3125","3136"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,160,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-161','coktan_secmeli','2655 + 644 = ?','["3300","3298","3299","3309"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,161,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-162','coktan_secmeli','2655 + 817 = ?','["3473","3471","3482","3472"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,162,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-163','coktan_secmeli','2655 + 990 = ?','["3645","3646","3644","3655"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,163,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-164','coktan_secmeli','2655 + 1163 = ?','["3819","3818","3817","3828"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,164,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-165','coktan_secmeli','2655 + 1336 = ?','["3992","3990","3991","4001"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,165,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-166','coktan_secmeli','2655 + 1509 = ?','["4165","4163","4174","4164"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,166,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-167','coktan_secmeli','2655 + 1682 = ?','["4337","4338","4336","4347"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,167,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-168','coktan_secmeli','2655 + 1855 = ?','["4511","4510","4509","4520"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,168,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-169','coktan_secmeli','2986 + 125 = ?','["3112","3110","3111","3121"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,169,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-170','coktan_secmeli','2986 + 298 = ?','["3285","3283","3294","3284"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,170,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-171','coktan_secmeli','2986 + 471 = ?','["3457","3458","3456","3467"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,171,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-172','coktan_secmeli','2986 + 644 = ?','["3631","3630","3629","3640"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,172,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-toplama' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-173','coktan_secmeli','2500 - 125 = ?','["2376","2374","2375","2385"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,173,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-174','coktan_secmeli','2500 - 306 = ?','["2195","2193","2204","2194"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,174,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-175','coktan_secmeli','2500 - 487 = ?','["2013","2014","2012","2023"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,175,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-176','coktan_secmeli','2500 - 668 = ?','["1833","1832","1831","1842"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,176,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-177','coktan_secmeli','2500 - 849 = ?','["1652","1650","1651","1661"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,177,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-178','coktan_secmeli','2500 - 1030 = ?','["1471","1469","1480","1470"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,178,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-179','coktan_secmeli','2500 - 1211 = ?','["1289","1290","1288","1299"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,179,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-180','coktan_secmeli','2500 - 1392 = ?','["1109","1108","1107","1118"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,180,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-181','coktan_secmeli','2500 - 1573 = ?','["928","926","927","937"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,181,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-182','coktan_secmeli','2500 - 1754 = ?','["747","745","756","746"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,182,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-183','coktan_secmeli','2500 - 1935 = ?','["565","566","564","575"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,183,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-184','coktan_secmeli','2837 - 125 = ?','["2713","2712","2711","2722"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,184,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-185','coktan_secmeli','2837 - 306 = ?','["2532","2530","2531","2541"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,185,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-186','coktan_secmeli','2837 - 487 = ?','["2351","2349","2360","2350"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,186,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-187','coktan_secmeli','2837 - 668 = ?','["2169","2170","2168","2179"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,187,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-188','coktan_secmeli','2837 - 849 = ?','["1989","1988","1987","1998"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,188,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-189','coktan_secmeli','2837 - 1030 = ?','["1808","1806","1807","1817"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,189,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-190','coktan_secmeli','2837 - 1211 = ?','["1627","1625","1636","1626"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,190,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-191','coktan_secmeli','2837 - 1392 = ?','["1445","1446","1444","1455"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,191,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-192','coktan_secmeli','2837 - 1573 = ?','["1265","1264","1263","1274"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,192,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-193','coktan_secmeli','2837 - 1754 = ?','["1084","1082","1083","1093"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,193,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-194','coktan_secmeli','2837 - 1935 = ?','["903","901","912","902"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,194,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-195','coktan_secmeli','3174 - 125 = ?','["3049","3050","3048","3059"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,195,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-196','coktan_secmeli','3174 - 306 = ?','["2869","2868","2867","2878"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,196,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-197','coktan_secmeli','3174 - 487 = ?','["2688","2686","2687","2697"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,197,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-198','coktan_secmeli','3174 - 668 = ?','["2507","2505","2516","2506"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,198,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-199','coktan_secmeli','3174 - 849 = ?','["2325","2326","2324","2335"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,199,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-200','coktan_secmeli','3174 - 1030 = ?','["2145","2144","2143","2154"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,200,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-201','coktan_secmeli','3174 - 1211 = ?','["1964","1962","1963","1973"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,201,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-202','coktan_secmeli','3174 - 1392 = ?','["1783","1781","1792","1782"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,202,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-203','coktan_secmeli','3174 - 1573 = ?','["1601","1602","1600","1611"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,203,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-204','coktan_secmeli','3174 - 1754 = ?','["1421","1420","1419","1430"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,204,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-205','coktan_secmeli','3174 - 1935 = ?','["1240","1238","1239","1249"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,205,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-206','coktan_secmeli','3511 - 125 = ?','["3387","3385","3396","3386"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,206,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-207','coktan_secmeli','3511 - 306 = ?','["3205","3206","3204","3215"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,207,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-208','coktan_secmeli','3511 - 487 = ?','["3025","3024","3023","3034"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,208,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-209','coktan_secmeli','3511 - 668 = ?','["2844","2842","2843","2853"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,209,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-210','coktan_secmeli','3511 - 849 = ?','["2663","2661","2672","2662"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,210,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-211','coktan_secmeli','3511 - 1030 = ?','["2481","2482","2480","2491"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,211,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-212','coktan_secmeli','3511 - 1211 = ?','["2301","2300","2299","2310"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,212,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-213','coktan_secmeli','3511 - 1392 = ?','["2120","2118","2119","2129"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,213,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-214','coktan_secmeli','3511 - 1573 = ?','["1939","1937","1948","1938"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,214,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-215','coktan_secmeli','3511 - 1754 = ?','["1757","1758","1756","1767"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,215,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-216','coktan_secmeli','3511 - 1935 = ?','["1577","1576","1575","1586"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,216,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-217','coktan_secmeli','3848 - 125 = ?','["3724","3722","3723","3733"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,217,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-218','coktan_secmeli','3848 - 306 = ?','["3543","3541","3552","3542"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,218,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-219','coktan_secmeli','3848 - 487 = ?','["3361","3362","3360","3371"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,219,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-220','coktan_secmeli','3848 - 668 = ?','["3181","3180","3179","3190"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,220,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-221','coktan_secmeli','3848 - 849 = ?','["3000","2998","2999","3009"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,221,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-222','coktan_secmeli','3848 - 1030 = ?','["2819","2817","2828","2818"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,222,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-223','coktan_secmeli','3848 - 1211 = ?','["2637","2638","2636","2647"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,223,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-224','coktan_secmeli','3848 - 1392 = ?','["2457","2456","2455","2466"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,224,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-225','coktan_secmeli','3848 - 1573 = ?','["2276","2274","2275","2285"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,225,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-226','coktan_secmeli','3848 - 1754 = ?','["2095","2093","2104","2094"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,226,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-227','coktan_secmeli','3848 - 1935 = ?','["1913","1914","1912","1923"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,227,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-228','coktan_secmeli','4185 - 125 = ?','["4061","4060","4059","4070"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,228,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-229','coktan_secmeli','4185 - 306 = ?','["3880","3878","3879","3889"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,229,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-230','coktan_secmeli','4185 - 487 = ?','["3699","3697","3708","3698"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,230,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-231','coktan_secmeli','4185 - 668 = ?','["3517","3518","3516","3527"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,231,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-232','coktan_secmeli','4185 - 849 = ?','["3337","3336","3335","3346"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,232,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-233','coktan_secmeli','4185 - 1030 = ?','["3156","3154","3155","3165"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,233,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-234','coktan_secmeli','4185 - 1211 = ?','["2975","2973","2984","2974"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,234,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-235','coktan_secmeli','4185 - 1392 = ?','["2793","2794","2792","2803"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,235,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-236','coktan_secmeli','4185 - 1573 = ?','["2613","2612","2611","2622"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,236,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-237','coktan_secmeli','4185 - 1754 = ?','["2432","2430","2431","2441"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,237,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-238','coktan_secmeli','4185 - 1935 = ?','["2251","2249","2260","2250"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,238,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-239','coktan_secmeli','4522 - 125 = ?','["4397","4398","4396","4407"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,239,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-240','coktan_secmeli','4522 - 306 = ?','["4217","4216","4215","4226"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,240,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-241','coktan_secmeli','4522 - 487 = ?','["4036","4034","4035","4045"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,241,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-242','coktan_secmeli','4522 - 668 = ?','["3855","3853","3864","3854"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,242,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cikarma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-243','coktan_secmeli','12 × 2 = ?','["24","36","22","25"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,243,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-244','coktan_secmeli','12 × 3 = ?','["48","36","33","37"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,244,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-245','coktan_secmeli','12 × 4 = ?','["60","44","48","49"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,245,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-246','coktan_secmeli','12 × 5 = ?','["72","55","61","60"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,246,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-247','coktan_secmeli','12 × 6 = ?','["72","84","66","73"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,247,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-248','coktan_secmeli','12 × 7 = ?','["96","84","77","85"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,248,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-249','coktan_secmeli','12 × 8 = ?','["108","88","96","97"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,249,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-250','coktan_secmeli','12 × 9 = ?','["120","99","109","108"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,250,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-251','coktan_secmeli','17 × 2 = ?','["34","51","32","35"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,251,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-252','coktan_secmeli','17 × 3 = ?','["68","51","48","52"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,252,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-253','coktan_secmeli','17 × 4 = ?','["85","64","68","69"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,253,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-254','coktan_secmeli','17 × 5 = ?','["102","80","86","85"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,254,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-255','coktan_secmeli','17 × 6 = ?','["102","119","96","103"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,255,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-256','coktan_secmeli','17 × 7 = ?','["136","119","112","120"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,256,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-257','coktan_secmeli','17 × 8 = ?','["153","128","136","137"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,257,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-258','coktan_secmeli','17 × 9 = ?','["170","144","154","153"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,258,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-259','coktan_secmeli','22 × 2 = ?','["44","66","42","45"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,259,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-260','coktan_secmeli','22 × 3 = ?','["88","66","63","67"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,260,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-261','coktan_secmeli','22 × 4 = ?','["110","84","88","89"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,261,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-262','coktan_secmeli','22 × 5 = ?','["132","105","111","110"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,262,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-263','coktan_secmeli','22 × 6 = ?','["132","154","126","133"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,263,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-264','coktan_secmeli','22 × 7 = ?','["176","154","147","155"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,264,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-265','coktan_secmeli','22 × 8 = ?','["198","168","176","177"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,265,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-266','coktan_secmeli','22 × 9 = ?','["220","189","199","198"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,266,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-267','coktan_secmeli','27 × 2 = ?','["54","81","52","55"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,267,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-268','coktan_secmeli','27 × 3 = ?','["108","81","78","82"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,268,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-269','coktan_secmeli','27 × 4 = ?','["135","104","108","109"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,269,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-270','coktan_secmeli','27 × 5 = ?','["162","130","136","135"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,270,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-271','coktan_secmeli','27 × 6 = ?','["162","189","156","163"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,271,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-272','coktan_secmeli','27 × 7 = ?','["216","189","182","190"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,272,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-273','coktan_secmeli','27 × 8 = ?','["243","208","216","217"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,273,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-274','coktan_secmeli','27 × 9 = ?','["270","234","244","243"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,274,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-275','coktan_secmeli','32 × 2 = ?','["64","96","62","65"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,275,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-276','coktan_secmeli','32 × 3 = ?','["128","96","93","97"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,276,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-277','coktan_secmeli','32 × 4 = ?','["160","124","128","129"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,277,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-278','coktan_secmeli','32 × 5 = ?','["192","155","161","160"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,278,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-279','coktan_secmeli','32 × 6 = ?','["192","224","186","193"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,279,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-280','coktan_secmeli','32 × 7 = ?','["256","224","217","225"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,280,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-281','coktan_secmeli','32 × 8 = ?','["288","248","256","257"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,281,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-282','coktan_secmeli','32 × 9 = ?','["320","279","289","288"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,282,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-283','coktan_secmeli','37 × 2 = ?','["74","111","72","75"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,283,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-284','coktan_secmeli','37 × 3 = ?','["148","111","108","112"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,284,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-285','coktan_secmeli','37 × 4 = ?','["185","144","148","149"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,285,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-286','coktan_secmeli','37 × 5 = ?','["222","180","186","185"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,286,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-287','coktan_secmeli','37 × 6 = ?','["222","259","216","223"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,287,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-288','coktan_secmeli','37 × 7 = ?','["296","259","252","260"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,288,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-289','coktan_secmeli','37 × 8 = ?','["333","288","296","297"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,289,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-290','coktan_secmeli','37 × 9 = ?','["370","324","334","333"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,290,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-291','coktan_secmeli','42 × 2 = ?','["84","126","82","85"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,291,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-292','coktan_secmeli','42 × 3 = ?','["168","126","123","127"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,292,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-293','coktan_secmeli','42 × 4 = ?','["210","164","168","169"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,293,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-294','coktan_secmeli','42 × 5 = ?','["252","205","211","210"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,294,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-295','coktan_secmeli','42 × 6 = ?','["252","294","246","253"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,295,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-296','coktan_secmeli','42 × 7 = ?','["336","294","287","295"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,296,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-297','coktan_secmeli','42 × 8 = ?','["378","328","336","337"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,297,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-298','coktan_secmeli','42 × 9 = ?','["420","369","379","378"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,298,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-299','coktan_secmeli','47 × 2 = ?','["94","141","92","95"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,299,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-300','coktan_secmeli','47 × 3 = ?','["188","141","138","142"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,300,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-301','coktan_secmeli','47 × 4 = ?','["235","184","188","189"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,301,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-302','coktan_secmeli','47 × 5 = ?','["282","230","236","235"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,302,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-303','coktan_secmeli','47 × 6 = ?','["282","329","276","283"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,303,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-304','coktan_secmeli','47 × 7 = ?','["376","329","322","330"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,304,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-305','coktan_secmeli','47 × 8 = ?','["423","368","376","377"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,305,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-306','coktan_secmeli','47 × 9 = ?','["423","470","414","424"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,306,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-307','coktan_secmeli','52 × 2 = ?','["104","156","102","105"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,307,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-308','coktan_secmeli','52 × 3 = ?','["208","156","153","157"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,308,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-309','coktan_secmeli','52 × 4 = ?','["260","204","208","209"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,309,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-310','coktan_secmeli','52 × 5 = ?','["312","255","261","260"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,310,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-311','coktan_secmeli','52 × 6 = ?','["312","364","306","313"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,311,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-312','coktan_secmeli','52 × 7 = ?','["416","364","357","365"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,312,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-carpma' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-313','coktan_secmeli','10 ÷ 2 = ?','["6","4","5","2"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,313,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-314','coktan_secmeli','14 ÷ 2 = ?','["8","6","2","7"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,314,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-315','coktan_secmeli','18 ÷ 2 = ?','["9","10","8","2"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,315,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-316','coktan_secmeli','22 ÷ 2 = ?','["12","11","10","2"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,316,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-317','coktan_secmeli','26 ÷ 2 = ?','["14","12","13","2"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,317,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-318','coktan_secmeli','30 ÷ 2 = ?','["16","14","2","15"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,318,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-319','coktan_secmeli','34 ÷ 2 = ?','["18","17","16","2"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,319,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-320','coktan_secmeli','38 ÷ 2 = ?','["20","18","19","2"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,320,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-321','coktan_secmeli','42 ÷ 2 = ?','["22","20","2","21"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,321,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-322','coktan_secmeli','46 ÷ 2 = ?','["23","24","22","2"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,322,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-323','coktan_secmeli','50 ÷ 2 = ?','["26","25","24","2"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,323,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-324','coktan_secmeli','54 ÷ 2 = ?','["28","26","27","2"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,324,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-325','coktan_secmeli','58 ÷ 2 = ?','["30","28","2","29"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,325,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-326','coktan_secmeli','15 ÷ 3 = ?','["6","4","3","5"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,326,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-327','coktan_secmeli','21 ÷ 3 = ?','["7","8","6","3"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,327,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-328','coktan_secmeli','27 ÷ 3 = ?','["10","9","8","3"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,328,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-329','coktan_secmeli','33 ÷ 3 = ?','["12","10","11","3"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,329,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-330','coktan_secmeli','39 ÷ 3 = ?','["14","12","3","13"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,330,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-331','coktan_secmeli','45 ÷ 3 = ?','["15","16","14","3"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,331,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-332','coktan_secmeli','51 ÷ 3 = ?','["18","16","17","3"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,332,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-333','coktan_secmeli','57 ÷ 3 = ?','["20","18","3","19"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,333,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-334','coktan_secmeli','63 ÷ 3 = ?','["21","22","20","3"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,334,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-335','coktan_secmeli','69 ÷ 3 = ?','["24","23","22","3"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,335,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-336','coktan_secmeli','75 ÷ 3 = ?','["26","24","25","3"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,336,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-337','coktan_secmeli','81 ÷ 3 = ?','["28","26","3","27"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,337,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-338','coktan_secmeli','87 ÷ 3 = ?','["29","30","28","3"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,338,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-339','coktan_secmeli','20 ÷ 4 = ?','["5","6","4","20"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,339,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-340','coktan_secmeli','28 ÷ 4 = ?','["8","7","6","4"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,340,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-341','coktan_secmeli','36 ÷ 4 = ?','["10","8","9","4"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,341,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-342','coktan_secmeli','44 ÷ 4 = ?','["12","10","4","11"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,342,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-343','coktan_secmeli','52 ÷ 4 = ?','["13","14","12","4"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,343,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-344','coktan_secmeli','60 ÷ 4 = ?','["16","15","14","4"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,344,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-345','coktan_secmeli','68 ÷ 4 = ?','["18","16","4","17"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,345,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-346','coktan_secmeli','76 ÷ 4 = ?','["19","20","18","4"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,346,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-347','coktan_secmeli','84 ÷ 4 = ?','["22","21","20","4"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,347,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-348','coktan_secmeli','92 ÷ 4 = ?','["24","22","23","4"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,348,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-349','coktan_secmeli','100 ÷ 4 = ?','["26","24","4","25"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,349,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-350','coktan_secmeli','108 ÷ 4 = ?','["27","28","26","4"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,350,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-351','coktan_secmeli','116 ÷ 4 = ?','["30","29","28","4"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,351,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-352','coktan_secmeli','25 ÷ 5 = ?','["6","5","4","25"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,352,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-353','coktan_secmeli','35 ÷ 5 = ?','["8","6","7","5"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,353,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-354','coktan_secmeli','45 ÷ 5 = ?','["10","8","5","9"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,354,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-355','coktan_secmeli','55 ÷ 5 = ?','["11","12","10","5"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,355,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-356','coktan_secmeli','65 ÷ 5 = ?','["14","13","12","5"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,356,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-357','coktan_secmeli','75 ÷ 5 = ?','["16","14","15","5"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,357,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-358','coktan_secmeli','85 ÷ 5 = ?','["17","18","16","5"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,358,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-359','coktan_secmeli','95 ÷ 5 = ?','["20","19","18","5"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,359,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-360','coktan_secmeli','105 ÷ 5 = ?','["22","20","21","5"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,360,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-361','coktan_secmeli','115 ÷ 5 = ?','["24","22","5","23"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,361,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-362','coktan_secmeli','125 ÷ 5 = ?','["25","26","24","5"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,362,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-363','coktan_secmeli','135 ÷ 5 = ?','["28","27","26","5"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,363,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-364','coktan_secmeli','145 ÷ 5 = ?','["30","28","29","5"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,364,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-365','coktan_secmeli','30 ÷ 6 = ?','["6","4","5","30"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,365,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-366','coktan_secmeli','42 ÷ 6 = ?','["8","6","42","7"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,366,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-367','coktan_secmeli','54 ÷ 6 = ?','["9","10","8","6"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,367,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-368','coktan_secmeli','66 ÷ 6 = ?','["12","11","10","6"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,368,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-369','coktan_secmeli','78 ÷ 6 = ?','["14","12","13","6"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,369,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-370','coktan_secmeli','90 ÷ 6 = ?','["16","14","6","15"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,370,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-371','coktan_secmeli','102 ÷ 6 = ?','["18","17","16","6"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,371,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-372','coktan_secmeli','114 ÷ 6 = ?','["20","18","19","6"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,372,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-373','coktan_secmeli','126 ÷ 6 = ?','["22","20","6","21"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,373,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-374','coktan_secmeli','138 ÷ 6 = ?','["23","24","22","6"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,374,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-375','coktan_secmeli','150 ÷ 6 = ?','["26","25","24","6"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,375,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-376','coktan_secmeli','162 ÷ 6 = ?','["28","26","27","6"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,376,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-377','coktan_secmeli','174 ÷ 6 = ?','["30","28","6","29"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,377,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-378','coktan_secmeli','35 ÷ 7 = ?','["6","4","7","5"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,378,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-379','coktan_secmeli','49 ÷ 7 = ?','["7","8","6","49"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,379,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-380','coktan_secmeli','63 ÷ 7 = ?','["10","9","8","7"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,380,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-381','coktan_secmeli','77 ÷ 7 = ?','["12","10","11","7"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,381,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-382','coktan_secmeli','91 ÷ 7 = ?','["14","12","7","13"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,382,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-bolme' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-383','coktan_secmeli','Bir okulda 1245 öğrenciye 378 öğrenci daha katıldı. Toplam kaç öğrenci oldu?','["1633","1623","1613","1624"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,383,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-384','coktan_secmeli','2450 kitabın 875''i ödünç verildi. Kaç kitap kaldı?','["1585","1565","1575","1576"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,384,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-385','coktan_secmeli','Her kutuda 24 kalem, 7 kutuda toplam kaç kalem vardır?','["178","158","169","168"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,385,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-386','coktan_secmeli','360 şeker 9 gruba eşit paylaştırılırsa grup başına kaç şeker düşer?','["40","50","30","41"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,386,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-387','coktan_secmeli','Bir otobüs 325 km, sonra 248 km gitti. Toplam kaç km?','["583","573","563","574"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,387,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-388','coktan_secmeli','900 ₺ bütçenin 365 ₺''si harcandı. Kaç ₺ kaldı?','["545","525","535","536"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,388,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-389','coktan_secmeli','Bir çiftlikte 8 kümeste 36''şar tavuk vardır. Toplam?','["298","278","289","288"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,389,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-390','coktan_secmeli','840 fidan 7 sıraya eşit dikilirse bir sırada kaç fidan?','["120","130","110","121"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,390,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-391','coktan_secmeli','Bir depoda 1750 kutuya 625 kutu daha geldi. Toplam?','["2385","2375","2365","2376"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,391,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-392','coktan_secmeli','5000 sayfalık arşivin 2385 sayfası tarandı. Kaç sayfa kaldı?','["2625","2605","2615","2616"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,392,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-problem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-393','coktan_secmeli','Bir bütünün dört eş parçasından biri hangi kesirdir?','["1/2","4/1","1/4","2/4"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,393,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-394','coktan_secmeli','3/5 kesrinde pay kaçtır?','["5","2","8","3"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,394,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-395','coktan_secmeli','3/5 kesrinde payda kaçtır?','["5","3","2","8"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,395,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-396','coktan_secmeli','2/4 ile 1/2 aynı bütünde eşit olabilir mi?','["Hayır","Evet","Kesir değildir","Sadece sayı doğrusunda"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,396,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-397','coktan_secmeli','4/4 neyi gösterir?','["Yarımı","Çeyreği","Bir bütünü","İki bütünü"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,397,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-398','coktan_secmeli','1/8 birim kesir midir?','["Hayır","Payı 8 olduğu için","Kesir değildir","Evet"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,398,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-399','coktan_secmeli','Bir bütün 6 eş parçaya ayrılırsa bir parça?','["1/6","6/1","1/3","2/6"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,399,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-400','coktan_secmeli','2/3 kesrinde bütün kaç eş parçaya ayrılmıştır?','["2","3","1","5"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,400,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-401','coktan_secmeli','1/4 + 2/4 = ?','["4/4","3/5","1/4","3/4"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,401,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir-islem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-402','coktan_secmeli','2/5 + 1/5 = ?','["3/5","4/5","3/6","1/5"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,402,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir-islem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-403','coktan_secmeli','3/8 + 2/8 = ?','["6/8","5/8","5/9","1/8"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,403,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir-islem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-404','coktan_secmeli','4/10 + 3/10 = ?','["8/10","7/11","7/10","1/10"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,404,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir-islem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-405','coktan_secmeli','2/7 + 3/7 = ?','["6/7","5/8","1/7","5/7"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,405,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir-islem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-406','coktan_secmeli','1/9 + 4/9 = ?','["5/9","6/9","5/10","3/9"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,406,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir-islem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-407','coktan_secmeli','3/5 - 1/5 = ?','["4/5","2/5","3/5","2/6"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,407,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir-islem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-408','coktan_secmeli','5/8 - 2/8 = ?','["7/8","4/8","3/8","3/9"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,408,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir-islem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-409','coktan_secmeli','7/10 - 3/10 = ?','["10/10","5/10","4/11","4/10"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',2,409,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kesir-islem' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-410','coktan_secmeli','Örüntüyü tamamla: 15, 25, 35, __','["46","44","55","45"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,410,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-411','coktan_secmeli','Örüntüyü tamamla: 120, 140, 160, __','["180","181","179","190"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,411,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-412','coktan_secmeli','Örüntüyü tamamla: 900, 850, 800, __','["751","750","749","760"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,412,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-413','coktan_secmeli','Örüntüyü tamamla: 7, 14, 21, __','["29","27","28","38"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,413,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-414','coktan_secmeli','Örüntüyü tamamla: 240, 250, 260, __','["271","269","280","270"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,414,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-415','coktan_secmeli','Örüntüyü tamamla: 55, 50, 45, __','["40","41","39","50"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,415,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-416','coktan_secmeli','Örüntüyü tamamla: 300, 325, 350, __','["376","375","374","385"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,416,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-417','coktan_secmeli','Örüntüyü tamamla: 12, 24, 36, __','["49","47","48","58"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,417,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-oruntu' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-418','coktan_secmeli','Dik açı kaç derecedir?','["45°","180°","360°","90°"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,418,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-419','coktan_secmeli','90°''den küçük açıya ne denir?','["Dar açı","Geniş açı","Doğru açı","Tam açı"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,419,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-420','coktan_secmeli','90° ile 180° arasındaki açı?','["Dar açı","Geniş açı","Dik açı","Tam açı"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,420,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-421','coktan_secmeli','180° olan açı?','["Dik açı","Dar açı","Doğru açı","Tam açı"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,421,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-422','coktan_secmeli','Açı ölçmek için hangi araç kullanılabilir?','["Terazi","Termometre","Saat","İletki"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,422,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-acilar' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-433','coktan_secmeli','Karenin tüm kenarları nasıldır?','["Farklı","Yoktur","Eşit","Sadece ikisi eşit"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,433,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sekil' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-434','coktan_secmeli','Dikdörtgenin karşılıklı kenarları?','["Her zaman farklı","Yoktur","Üçgen oluşturur","Eşit ve paralel"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,434,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sekil' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-435','coktan_secmeli','Üçgenin kaç kenarı vardır?','["3","4","5","6"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,435,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sekil' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-436','coktan_secmeli','Karenin kaç dik açısı vardır?','["2","4","3","6"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,436,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sekil' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-445','coktan_secmeli','Bir şeklin katlandığında üst üste gelen iki eş parçasını ayıran çizgi?','["Çevre","Kenar","Simetri doğrusu","Köşe"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,445,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-446','coktan_secmeli','Karede birden fazla simetri doğrusu var mıdır?','["Hayır","Sadece dairede","Sadece üçgende","Evet"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,446,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-447','coktan_secmeli','Simetrik noktalar simetri doğrusuna göre nasıl konumlanır?','["Eşit uzaklıkta","Rastgele","Aynı tarafta","Farklı yükseklikte zorunlu"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,447,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-simetri' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-454','coktan_secmeli','Küpün kaç yüzü vardır?','["4","8","12","6"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,454,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cisim' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-455','coktan_secmeli','Küpün kaç köşesi vardır?','["8","6","4","12"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,455,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cisim' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-456','coktan_secmeli','Konserve kutusu hangi cisme benzer?','["Küp","Silindir","Küre","Üçgen"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,456,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cisim' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-457','coktan_secmeli','Futbol topu hangi cisme benzer?','["Küp","Silindir","Küre","Prizma"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,457,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cisim' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-466','coktan_secmeli','1 m kaç cm?','["10 cm","1000 cm","60 cm","100 cm"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,466,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-467','coktan_secmeli','1 km kaç m?','["1000 m","100 m","10 m","60 m"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,467,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-468','coktan_secmeli','350 cm kaç m kaç cm?','["35 m","3 m 50 cm","3 m 5 cm","350 m"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,468,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-469','coktan_secmeli','Bir kalemin boyu için uygun birim?','["km","ton","cm","saat"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,469,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-uzunluk' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-478','coktan_secmeli','Bir kenarı 6 cm karenin çevresi?','["12 cm","18 cm","36 cm","24 cm"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,478,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cevre' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-479','coktan_secmeli','Kenarları 5 ve 8 cm dikdörtgenin çevresi?','["26 cm","13 cm","40 cm","21 cm"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,479,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cevre' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-480','coktan_secmeli','Çevre nasıl bulunur?','["Kenarlar çarpılır her zaman","Kenar uzunlukları toplanır.","Sadece bir kenar ölçülür","Köşeler sayılır"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,480,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-cevre' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-487','coktan_secmeli','Alan ölçerken birim kareler kullanılabilir mi?','["Evet","Hayır","Sadece cetvel adı yeter","Alan ölçülmez"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,487,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-alan' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-488','coktan_secmeli','3 satır ve 4 sütun birim kare kaç kare eder?','["7","12","14","24"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,488,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-alan' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-489','coktan_secmeli','Alan şeklin neresini ölçer?','["Sadece çevresini","Sadece köşesini","Kapladığı yüzeyi","Sadece rengini"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,489,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-alan' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-496','coktan_secmeli','1 saat kaç dakika?','["30","60","100","24"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,496,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-497','coktan_secmeli','2 saat kaç dakika?','["60","90","120","180"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,497,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-498','coktan_secmeli','09.30''dan 10.15''e kaç dakika?','["15","30","60","45"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,498,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-499','coktan_secmeli','1 dakika kaç saniye?','["60","100","30","24"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,499,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-zaman' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-508','coktan_secmeli','1 kg kaç g?','["100 g","1000 g","10 g","60 g"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,508,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-509','coktan_secmeli','2 kg 500 g kaç g?','["2050 g","2005 g","2500 g","500 g"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,509,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-510','coktan_secmeli','1 ton kaç kg?','["100 kg","10 kg","500 kg","1000 kg"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,510,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-511','coktan_secmeli','Elmanın kütlesi için uygun birim?','["gram","ton","km","saat"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,511,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-kutle' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-520','coktan_secmeli','1 litre hangi ölçmedir?','["Uzunluk","Sıvı miktarı","Kütle","Zaman"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,520,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-521','coktan_secmeli','3 L + 2 L = ?','["1 L","6 L","5 L","32 L"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,521,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-522','coktan_secmeli','Sürahi için uygun birim?','["Kilometre","Kilogram","Saat","Litre"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,522,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-sivi' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-529','coktan_secmeli','1 ₺ kaç kuruş?','["10 kuruş","50 kuruş","100 kuruş","1000 kuruş"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,529,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-530','coktan_secmeli','75 ₺ ürüne 100 ₺ verilirse para üstü?','["15 ₺","35 ₺","75 ₺","25 ₺"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,530,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-531','coktan_secmeli','2 ₺ 50 kuruş + 1 ₺ 25 kuruş?','["3 ₺ 75 kuruş","3 ₺ 25 kuruş","4 ₺","2 ₺ 75 kuruş"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,531,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-532','coktan_secmeli','4 tane 25 kuruş kaç ₺ eder?','["25 kuruş","1 ₺","4 ₺","100 ₺"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,532,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-para' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-541','coktan_secmeli','Sütun grafiğinde en yüksek sütun neyi gösterir?','["En küçük değeri","Başlığı","En büyük değeri","Kaynağı"]',2,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,541,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-tablo' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-542','coktan_secmeli','Tabloda pazartesi 12, salı 18 kitap okunmuş. Fark?','["30","12","18","6"]',3,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,542,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-tablo' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-543','coktan_secmeli','Veri toplamadan önce ne belirlenir?','["Araştırma sorusu","Sonuç","Renk","Başlık zorunlu"]',0,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,543,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-tablo' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4m-544','coktan_secmeli','Grafiğin başlığı neyi anlatır?','["Rengini","Grafiğin konusunu","Kağıt boyunu","Kalem markasını"]',1,'İşlem veya konu bilgisini kullanarak doğru sonuç belirlenir.',1,544,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='mat4-tablo' AND (d.kod='matematik' OR d.ad='Matematik')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;



-- SOURCE: database/content/grade4/25_ingilizce_soru_havuzu.sql
INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-instructions','Classroom Instructions','Classroom Instructions','Classroom Instructions ile ilgili temel iletişim kalıpları.','',10,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-classroom'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-instructions-1-1','coktan_secmeli','“Open your book.” ne demektir?','["Kitabını aç.","Kitabını kapat.","Ayağa kalk.","Kalemini ver."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-instructions-1-2','coktan_secmeli','“Stand up.” ne demektir?','["Otur.","Koş.","Ayağa kalk.","Yaz."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-instructions-1-3','coktan_secmeli','“Be quiet, please.” ne demektir?','["Sessiz ol, lütfen.","Bağır.","Koş.","Kapıyı aç."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-instructions-1-4','coktan_secmeli','“Listen to me.” ne demektir?','["Bana bakma.","Yazmayı bırak.","Beni dinle.","Dışarı çık."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-instructions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-permission','Asking for Permission','Asking for Permission','Asking for Permission ile ilgili temel iletişim kalıpları.','',20,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-classroom'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-permission-1-1','coktan_secmeli','“May I come in?” ne için kullanılır?','["İçeri girmek için izin isteme","Yaş sorma","Saat sorma","Yemek isteme"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-permission' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-permission-1-2','coktan_secmeli','“Can I use your pencil?” ne demektir?','["Kalemin nerede?","Kalemi kır.","Kalemini kullanabilir miyim?","Kalemin mavi."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-permission' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-permission-1-3','coktan_secmeli','Uygun cevap: “May I open the window?”','["Yes, you may.","I am ten.","It is rainy.","Blue."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-permission' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-permission-1-4','coktan_secmeli','“Sorry, you can''t.” ne demektir?','["Evet yapabilirsin.","Teşekkürler.","Üzgünüm, yapamazsın.","Hoş geldin."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-permission' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-countries','Countries and Nationalities','Countries and Nationalities','Countries and Nationalities ile ilgili temel iletişim kalıpları.','',30,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-nationality'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-countries-1-1','coktan_secmeli','Turkey → ?','["Turkish","German","French","Japanese"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-countries' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-countries-1-2','coktan_secmeli','Germany → ?','["Turkish","British","German","Spanish"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-countries' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-countries-1-3','coktan_secmeli','Japan → ?','["Japanese","French","Turkish","German"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-countries' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-countries-1-4','coktan_secmeli','France → ?','["German","Japanese","French","Turkish"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-countries' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-language','Languages and Origins','Languages and Origins','Languages and Origins ile ilgili temel iletişim kalıpları.','',40,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-nationality'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-language-1-1','coktan_secmeli','“I am from Türkiye.” ne demektir?','["Türkiye''denim.","Türkiye''yi seviyorum.","Türkçe konuşamıyorum.","Türkiye bir dildir."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-language' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-language-1-2','coktan_secmeli','“Where are you from?” neyi sorar?','["Yaşını","Saatini","Hangi ülkeden olduğunu","Mesleğini"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-language' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-language-1-3','coktan_secmeli','“I speak English.” ne demektir?','["İngilizce konuşurum.","İngiltere''denim.","İngilizceyi sevmem.","İngilizce bir şehir."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-language' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-language-1-4','coktan_secmeli','Country and nationality are exactly the same word every time?','["Yes","Only in Turkish","No","Only in class"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-language' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-abilities','Abilities: can / can''t','Abilities: can / can''t','Abilities: can / can''t ile ilgili temel iletişim kalıpları.','',50,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-cartoon'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-abilities-1-1','coktan_secmeli','“I can swim.” ne demektir?','["Yüzebilirim.","Yüzemem.","Koşarım.","Uyurum."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-abilities-1-2','coktan_secmeli','“He can''t fly.” ne demektir?','["O uçabilir.","O yüzebilir.","O uçamaz.","O koşamaz."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-abilities-1-3','coktan_secmeli','Which asks about ability?','["Can you ride a bike?","How old are you?","Where are you from?","What time is it?"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-abilities-1-4','coktan_secmeli','A: Can she sing? B: Yes, she can. Ne anlatır?','["Söyleyemediğini","Şarkı sevmediğini","Şarkı söyleyebildiğini","Şarkı olmadığını"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-abilities' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-actions','Action Verbs','Action Verbs','Action Verbs ile ilgili temel iletişim kalıpları.','',60,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-cartoon'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-actions-1-1','coktan_secmeli','run','["koşmak","uçmak","yüzmek","okumak"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-actions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-actions-1-2','coktan_secmeli','jump','["yazmak","uyumak","zıplamak","yüzmek"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-actions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-actions-1-3','coktan_secmeli','climb','["tırmanmak","oturmak","yemek","çizmek"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-actions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-actions-1-4','coktan_secmeli','ride a bike','["kitap okumak","şarkı söylemek","bisiklete binmek","uyumak"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-actions' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-hobbies','Hobbies and Free Time','Hobbies and Free Time','Hobbies and Free Time ile ilgili temel iletişim kalıpları.','',70,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-free-time'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-hobbies-1-1','coktan_secmeli','read books','["kitap okumak","yemek yapmak","koşmak","uyumak"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-hobbies' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-hobbies-1-2','coktan_secmeli','play chess','["resim çizmek","yüzmek","satranç oynamak","şarkı söylemek"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-hobbies' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-hobbies-1-3','coktan_secmeli','draw pictures','["resim çizmek","satranç oynamak","koşmak","okumak"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-hobbies' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-hobbies-1-4','coktan_secmeli','play football','["kitap okumak","yemek yapmak","futbol oynamak","uyumak"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-hobbies' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-likes','Likes and Dislikes','Likes and Dislikes','Likes and Dislikes ile ilgili temel iletişim kalıpları.','',80,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-free-time'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-likes-1-1','coktan_secmeli','“I like reading.” ne demektir?','["Okumayı severim.","Okumayı sevmem.","Okuyamam.","Okuyorum zorunlu."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-likes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-likes-1-2','coktan_secmeli','“I don''t like swimming.”','["Yüzmeyi severim.","Yüzemem kesin.","Yüzmeyi sevmem.","Yüzüyorum."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-likes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-likes-1-3','coktan_secmeli','Which sentence is a preference?','["I like chess.","It is Monday.","I am ten.","Open the door."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-likes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-likes-1-4','coktan_secmeli','“My favourite hobby is drawing.”','["Resim çizemem.","Hobim yok.","En sevdiğim hobi resim çizmek.","En sevdiğim ders matematik."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-likes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-routine','Daily Routines','Daily Routines','Daily Routines ile ilgili temel iletişim kalıpları.','',90,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-my-day'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-routine-1-1','coktan_secmeli','get up','["uyanmak/kalkmak","uyumak","yemek","koşmak"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-routine-1-2','coktan_secmeli','have breakfast','["ödev yapmak","uyumak","kahvaltı yapmak","yüzmek"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-routine-1-3','coktan_secmeli','go to school','["okula gitmek","eve dönmek","uyumak","yemek"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-routine-1-4','coktan_secmeli','do homework','["kahvaltı yapmak","oynamak","ödev yapmak","uyumak"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-routine' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-time','Telling the Time','Telling the Time','Telling the Time ile ilgili temel iletişim kalıpları.','',100,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-my-day'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-time-1-1','coktan_secmeli','“It is seven o''clock.”','["Saat yedi.","Saat sekiz.","Yedinci gün.","Yedi yaş."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-time' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-time-1-2','coktan_secmeli','“It is half past eight.”','["Saat sekiz.","Saat dokuz buçuk.","Saat sekiz buçuk.","Saat yedi buçuk."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-time' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-time-1-3','coktan_secmeli','What time is it? neyi sorar?','["Saati","Yaşı","Ülkeyi","Mesleği"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-time' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-time-1-4','coktan_secmeli','“At nine o''clock” neyi anlatır?','["Dokuz yaşında","Dokuz kişi","Saat dokuzda","Dokuz gün"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-time' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-experiment','Simple Experiment Instructions','Simple Experiment Instructions','Simple Experiment Instructions ile ilgili temel iletişim kalıpları.','',110,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-science'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-experiment-1-1','coktan_secmeli','“Mix the water and salt.”','["Su ve tuzu karıştır.","Suyu dök.","Tuzu at.","Kabı kapat."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-experiment' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-experiment-1-2','coktan_secmeli','“Pour the water.”','["Suyu dondur.","Suyu iç.","Suyu dök.","Suyu ölç."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-experiment' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-experiment-1-3','coktan_secmeli','“Cut the paper.”','["Kâğıdı kes.","Kâğıdı boya.","Kâğıdı katla.","Kâğıdı yak."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-experiment' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-experiment-1-4','coktan_secmeli','Safety instructions are important in experiments?','["No","Only at home","Yes","Only for adults"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-experiment' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-location','Location Expressions','Location Expressions','Location Expressions ile ilgili temel iletişim kalıpları.','',120,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-science'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-location-1-1','coktan_secmeli','on','["üstünde","altında","yanında","içinde"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-location' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-location-1-2','coktan_secmeli','under','["üstünde","yanında","altında","içinde"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-location' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-location-1-3','coktan_secmeli','next to','["yanında","arasında","üstünde","arkasında"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-location' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-location-1-4','coktan_secmeli','in','["üstünde","altında","içinde","önünde"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-location' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-jobnames','Jobs','Jobs','Jobs ile ilgili temel iletişim kalıpları.','',130,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-jobs'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-jobnames-1-1','coktan_secmeli','doctor','["doktor","öğretmen","pilot","aşçı"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-jobnames' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-jobnames-1-2','coktan_secmeli','teacher','["doktor","çiftçi","öğretmen","şoför"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-jobnames' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-jobnames-1-3','coktan_secmeli','pilot','["pilot","hemşire","aşçı","öğretmen"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-jobnames' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-jobnames-1-4','coktan_secmeli','farmer','["pilot","doktor","çiftçi","garson"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-jobnames' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-workplaces','Workplaces','Workplaces','Workplaces ile ilgili temel iletişim kalıpları.','',140,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-jobs'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-workplaces-1-1','coktan_secmeli','A doctor works in a __.','["hospital","school","farm","airport"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-workplaces' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-workplaces-1-2','coktan_secmeli','A teacher works in a __.','["hospital","farm","school","restaurant"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-workplaces' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-workplaces-1-3','coktan_secmeli','A farmer works on a __.','["farm","hospital","school","airport"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-workplaces' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-workplaces-1-4','coktan_secmeli','A waiter can work in a __.','["farm","hospital","restaurant","school"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-workplaces' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-clothes-vocab','Clothes','Clothes','Clothes ile ilgili temel iletişim kalıpları.','',150,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-clothes'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-clothes-vocab-1-1','coktan_secmeli','coat','["mont/kaban","şort","şapka","çorap"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-clothes-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-clothes-vocab-1-2','coktan_secmeli','boots','["tişört","şort","botlar","etek"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-clothes-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-clothes-vocab-1-3','coktan_secmeli','T-shirt','["tişört","mont","atkı","bot"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-clothes-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-clothes-vocab-1-4','coktan_secmeli','scarf','["pantolon","şort","atkı","eldiven"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-clothes-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-weather-clothes','Weather and Clothes','Weather and Clothes','Weather and Clothes ile ilgili temel iletişim kalıpları.','',160,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-clothes'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-weather-clothes-1-1','coktan_secmeli','It is cold. Wear a __.','["coat","swimsuit","shorts","sandals"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-weather-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-weather-clothes-1-2','coktan_secmeli','It is rainy. A __ is useful.','["swimsuit","T-shirt only","raincoat","shorts"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-weather-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-weather-clothes-1-3','coktan_secmeli','It is hot. You can wear __.','["shorts","thick coat","winter boots","scarf"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-weather-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-weather-clothes-1-4','coktan_secmeli','Clothes can change with __.','["maths","age only","weather","school subject"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-weather-clothes' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-appearance','Appearance','Appearance','Appearance ile ilgili temel iletişim kalıpları.','',170,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-friends'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-appearance-1-1','coktan_secmeli','tall','["uzun boylu","kısa boylu","utangaç","komik"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-appearance' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-appearance-1-2','coktan_secmeli','short hair','["uzun saç","mavi göz","kısa saç","uzun boy"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-appearance' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-appearance-1-3','coktan_secmeli','blue eyes','["mavi gözler","kıvırcık saç","uzun kol","sarı mont"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-appearance' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-appearance-1-4','coktan_secmeli','curly hair','["düz saç","kısa boy","kıvırcık saç","yeşil göz"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-appearance' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-personality','Personality','Personality','Personality ile ilgili temel iletişim kalıpları.','',180,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-friends'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-personality-1-1','coktan_secmeli','kind','["nazik/iyi kalpli","kaba","aç","yağmurlu"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-personality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-personality-1-2','coktan_secmeli','helpful','["bencil","uykulu","yardımsever","karlı"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-personality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-personality-1-3','coktan_secmeli','funny','["komik","uzun boylu","aç","soğuk"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-personality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-personality-1-4','coktan_secmeli','shy','["yardımsever","uzun boylu","utangaç","güneşli"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-personality' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-food-vocab','Food and Drinks','Food and Drinks','Food and Drinks ile ilgili temel iletişim kalıpları.','',190,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-food'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-vocab-1-1','coktan_secmeli','bread','["ekmek","süt","su","elma"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-vocab-1-2','coktan_secmeli','cheese','["çorba","su","peynir","muz"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-vocab-1-3','coktan_secmeli','milk','["süt","ekmek","pirinç","salata"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-vocab-1-4','coktan_secmeli','water','["peynir","ekmek","su","yumurta"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-vocab' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'eng4-food-pref','Food Preferences','Food Preferences','Food Preferences ile ilgili temel iletişim kalıpları.','',200,1 FROM dersler d
INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='eng4-food'
WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-pref-1-1','coktan_secmeli','“I like apples.”','["Elmayı severim.","Elmayı sevmem.","Elma yok.","Elma pişiririm."]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-pref-1-2','coktan_secmeli','“I don''t like milk.”','["Sütü severim.","Süt içerim zorunlu.","Sütü sevmem.","Süt yok."]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-pref-1-3','coktan_secmeli','Which is a drink?','["water","bread","cheese","rice"]',0,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4e-eng4-food-pref-1-4','coktan_secmeli','Which is food?','["water","juice","bread","tea"]',2,'İngilizce sözcük ve iletişim kalıbı bağlama göre kullanılır.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='eng4-food-pref' AND (d.kod='ingilizce' OR d.ad='İngilizce')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;



-- SOURCE: database/content/grade4/27_fen_bilimleri_soru_havuzu.sql
INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-kayac','Kayaçlar, Madenler ve Fosiller','Kayaçlar, Madenler ve Fosiller','Kayaçlar, Madenler ve Fosiller ile ilgili gözlem ve günlük yaşam bağlantıları.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-yer'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-1-1','coktan_secmeli','Fosiller bize ne hakkında bilgi verir?','["Geçmişte yaşamış canlılar","Yarınki hava","Elektrik tüketimi","Saat"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-1-2','coktan_secmeli','Kayaçlar hangi yapılardan oluşabilir?','["Sadece sudan","Sadece canlılardan","Minerallerden","Sadece gazdan"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-1-3','coktan_secmeli','Madenler sınırsız kaynak mıdır?','["Hayır","Evet","Sadece altın sınırsız","Sadece kömür sınırsız"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-1-4','coktan_secmeli','Fosilleri inceleyen bilim insanı?','["Müzisyen","Mimar","Paleontolog","Astronot"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kayac-1-5','coktan_secmeli','Kayaçların parçalanması neye katkı sağlayabilir?','["Toprak oluşumuna","Elektrik üretimine doğrudan","Saat yapımına","Yağmurun durmasına"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-dunya','Dünya''nın Dönme ve Dolanma Hareketleri','Dünya''nın Dönme ve Dolanma Hareketleri','Dünya''nın Dönme ve Dolanma Hareketleri ile ilgili gözlem ve günlük yaşam bağlantıları.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-yer'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-1-1','coktan_secmeli','Dünya''nın kendi ekseni etrafındaki hareketi?','["Dolanma","Sallanma","Yansıma","Dönme"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-1-2','coktan_secmeli','Dünya''nın Güneş çevresindeki hareketi?','["Dönme","Dolanma","Titreşim","Süzülme"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-1-3','coktan_secmeli','Gece-gündüz oluşumunda temel hareket?','["Ay''ın dönmesi","Bulutların hareketi","Mevsim değişimi","Dünya''nın dönmesi"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-1-4','coktan_secmeli','Bir yıl yaklaşık neyle ilişkilidir?','["Dünya''nın bir kez dönmesi","Dünya''nın Güneş çevresinde dolanması","Ay''ın bir gecesi","Saatin dönmesi"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dunya-1-5','coktan_secmeli','Dünya bir tam dönüşünü yaklaşık ne kadar sürede tamamlar?','["12 saat","7 gün","365 gün","24 saat"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dunya' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-besin-icerik','Besin İçerikleri','Besin İçerikleri','Besin İçerikleri ile ilgili gözlem ve günlük yaşam bağlantıları.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-besin'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-1-1','coktan_secmeli','Proteinler vücutta özellikle neye katkı sağlar?','["Sadece renk görmeye","Elektrik üretmeye","Büyüme ve onarıma","Kemik ölçmeye"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-1-2','coktan_secmeli','Karbonhidratların temel görevlerinden biri?','["Enerji sağlamak","Ses üretmek","Hava ölçmek","Işık vermek"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-1-3','coktan_secmeli','Vitamin ve mineraller neden gereklidir?','["Sadece tat verir.","Sadece renk sağlar.","Düzenli vücut işleyişini destekler.","Elektrik üretir."]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-1-4','coktan_secmeli','Su vücut için gerekli midir?','["Evet","Hayır","Sadece yazın","Sadece sporcuda"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-besin-icerik-1-5','coktan_secmeli','Yağlar enerji kaynağı olabilir mi?','["Hayır","Sadece su verir","Evet","Sadece vitamin üretir"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-besin-icerik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-dengeli','Dengeli Beslenme ve Besin İsrafı','Dengeli Beslenme ve Besin İsrafı','Dengeli Beslenme ve Besin İsrafı ile ilgili gözlem ve günlük yaşam bağlantıları.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-besin'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-1-1','coktan_secmeli','Dengeli beslenme ne demektir?','["Sadece tatlı yemek","Farklı besinleri uygun miktarda tüketmek","Tek çeşit beslenmek","Hiç su içmemek"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-1-2','coktan_secmeli','Besin israfını azaltmak için ne yapılabilir?','["Fazla alıp atmak","Tarihe bakmamak","Yiyeceği açık bırakmak","İhtiyaç kadar almak"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-1-3','coktan_secmeli','Son kullanma/tavsiye edilen tüketim bilgisi neden önemlidir?','["Rengi seçmek için","Güvenli tüketim için","Fiyatı artırmak için","Ambalajı büyütmek için"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-1-4','coktan_secmeli','Kahvaltı dengeli beslenmenin parçası olabilir mi?','["Hayır","Sadece hafta sonu","Çocuklar için gereksiz","Evet"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-dengeli-1-5','coktan_secmeli','Besinleri uygun koşullarda saklamak önemli midir?','["Hayır","Evet","Sadece görünüş için","Saklama gerekmez"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-dengeli' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-kuvvet-etki','Kuvvetin Hareket Üzerindeki Etkileri','Kuvvetin Hareket Üzerindeki Etkileri','Kuvvetin Hareket Üzerindeki Etkileri ile ilgili gözlem ve günlük yaşam bağlantıları.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-kuvvet'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-1-1','coktan_secmeli','Kuvvet duran cismi hareket ettirebilir mi?','["Evet","Hayır","Sadece canlıyı","Sadece gazı"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-1-2','coktan_secmeli','Fren kuvveti bisikleti nasıl etkiler?','["Hızlandırır","Eritir","Yavaşlatabilir veya durdurabilir.","Rengini değiştirir"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-1-3','coktan_secmeli','Kuvvet cismin yönünü değiştirebilir mi?','["Evet","Hayır","Sadece sıcaklığı","Sadece kütleyi"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-1-4','coktan_secmeli','İtme ve çekme nedir?','["Madde hâli","Besin türü","Kuvvet uygulama biçimleri","Işık kaynağı"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kuvvet-etki-1-5','coktan_secmeli','Kuvvet bir cismin şeklini değiştirebilir mi?','["Evet","Hayır","Sadece rengini","Sadece kütlesini"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kuvvet-etki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-miknatis','Mıknatıs ve Etkileşim','Mıknatıs ve Etkileşim','Mıknatıs ve Etkileşim ile ilgili gözlem ve günlük yaşam bağlantıları.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-kuvvet'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-1-1','coktan_secmeli','Mıknatıs demiri çekebilir mi?','["Hayır","Sadece plastiği","Sadece camı","Evet"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-1-2','coktan_secmeli','Mıknatısın iki ucu ne olarak adlandırılır?','["Kenar","Kutup","Yüz","Düğüm"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-1-3','coktan_secmeli','Aynı kutuplar birbirini nasıl etkiler?','["Çeker","Eritir","Isıtır","İter"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-1-4','coktan_secmeli','Zıt kutuplar birbirini nasıl etkiler?','["İter","Çeker","Dondurur","Boyar"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-miknatis-1-5','coktan_secmeli','Mıknatıs pusulada kullanılabilir mi?','["Hayır","Sadece mutfakta","Sadece oyuncakta","Evet"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-miknatis' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-madde-oz','Maddenin Ölçülebilir ve Gözlenebilir Özellikleri','Maddenin Ölçülebilir ve Gözlenebilir Özellikleri','Maddenin Ölçülebilir ve Gözlenebilir Özellikleri ile ilgili gözlem ve günlük yaşam bağlantıları.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-madde'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-1-1','coktan_secmeli','Kütle hangi araçla ölçülebilir?','["Termometre","Cetvel","Terazi","Saat"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-1-2','coktan_secmeli','Hacim neyi ifade eder?','["Maddenin uzayda kapladığı yeri","Sadece ağırlığı","Sıcaklığı","Rengi"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-1-3','coktan_secmeli','Maddenin rengi gözlenebilir özellik midir?','["Hayır","Sadece ölçülebilir","Evet","Maddeyle ilgisiz"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-1-4','coktan_secmeli','Suda yüzme-batma maddeleri ayırt etmede kullanılabilir mi?','["Evet","Hayır","Sadece gazda","Sadece ışıkta"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-madde-oz-1-5','coktan_secmeli','Sıcaklık termometre ile ölçülebilir mi?','["Hayır","Terazi ile","Evet","Cetvelle"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-madde-oz' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-hal','Maddenin Hâlleri ve Değişimleri','Maddenin Hâlleri ve Değişimleri','Maddenin Hâlleri ve Değişimleri ile ilgili gözlem ve günlük yaşam bağlantıları.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-madde'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-1-1','coktan_secmeli','Buzun erimesi hangi değişimdir?','["Sıvıdan katıya","Katıdan sıvıya","Gazdan katıya","Sıvıdan gaza"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-1-2','coktan_secmeli','Suyun donması?','["Katıdan sıvıya","Gazdan sıvıya","Katıdan gaza","Sıvıdan katıya"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-1-3','coktan_secmeli','Buharlaşma hangi yönde gerçekleşir?','["Gazdan sıvıya","Sıvıdan gaza","Katıdan sıvıya","Katıdan katıya"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-1-4','coktan_secmeli','Yoğuşma?','["Sıvıdan gaza","Katıdan sıvıya","Sıvıdan katıya","Gazdan sıvıya"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-hal-1-5','coktan_secmeli','Isı alan buz eriyebilir mi?','["Hayır","Evet","Sadece donar","Taşa dönüşür"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-hal' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-aydinlatma','Doğru Aydınlatma ve Işık Kirliliği','Doğru Aydınlatma ve Işık Kirliliği','Doğru Aydınlatma ve Işık Kirliliği ile ilgili gözlem ve günlük yaşam bağlantıları.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-isik-ses'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-1-1','coktan_secmeli','Doğru aydınlatmada ışık nereye yöneltilmelidir?','["İhtiyaç olan bölgeye uygun biçimde","Göze doğrudan","Gökyüzüne gereksiz","Her yere en güçlü"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-1-2','coktan_secmeli','Işık kirliliği neye yol açabilir?','["Suyu çoğaltır","Toprağı ağırlaştırır","Enerji israfına ve çevresel etkilere","Sesi azaltır"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-1-3','coktan_secmeli','Gereksiz yanan lambayı kapatmak ne sağlar?','["Enerji tasarrufu","Daha çok tüketim","Daha çok ışık kirliliği","Suyu azaltma"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-1-4','coktan_secmeli','Çalışma masasında uygun ışık önemli midir?','["Hayır","Sadece gece","Evet","Sadece yetişkinlere"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-aydinlatma-1-5','coktan_secmeli','Işığın göze doğrudan gelmesi uygun mudur?','["Hayır","Evet","Her zaman","Sadece gündüz"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-aydinlatma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-ses','Ses Teknolojileri ve Ses Kirliliği','Ses Teknolojileri ve Ses Kirliliği','Ses Teknolojileri ve Ses Kirliliği ile ilgili gözlem ve günlük yaşam bağlantıları.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-isik-ses'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-1-1','coktan_secmeli','Ses kirliliği nedir?','["Işık fazlalığı","Su kirliliği","Toprak rengi","Rahatsız edici ve sağlığı olumsuz etkileyebilen aşırı ses"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-1-2','coktan_secmeli','Uzun süre yüksek sese maruz kalmak neyi etkileyebilir?','["Boyu","İşitmeyi","Saç rengini","Kütleyi"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-1-3','coktan_secmeli','Ses teknolojisine örnek?','["Cetvel","Terazi","Termometre","Mikrofon"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-1-4','coktan_secmeli','Gürültüyü azaltmak için ne yapılabilir?','["Kornayı gereksiz kullanmak","Ses düzeyini uygun tutmak","Müziği artırmak","Bağırmak"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-ses-1-5','coktan_secmeli','Hoparlör sesi güçlendirmede kullanılabilir mi?','["Hayır","Sadece ışık verir","Sadece görüntü verir","Evet"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-ses' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-kaynak','Kaynakların Tasarruflu Kullanımı','Kaynakların Tasarruflu Kullanımı','Kaynakların Tasarruflu Kullanımı ile ilgili gözlem ve günlük yaşam bağlantıları.','',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-cevre'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-1-1','coktan_secmeli','Suyu tasarruflu kullanmak neden önemlidir?','["İsrafı artırır.","Su sınırsızdır.","Doğal kaynakları korur.","Sadece faturayı etkiler."]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-1-2','coktan_secmeli','Elektrik tasarrufu için?','["Kullanılmayan cihazı kapatmak","Tüm ışıkları açık bırakmak","Cihazları gereksiz çalıştırmak","Şarjı sürekli bağlı tutmak"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-1-3','coktan_secmeli','Kâğıdı iki yüzlü kullanmak ne sağlar?','["İsrafı","Kirliliği","Kaynak tasarrufu","Daha çok kesim"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-1-4','coktan_secmeli','Kaynakların bilinçli kullanımı geleceği etkiler mi?','["Evet","Hayır","Sadece bugünü","Sadece okulu"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-kaynak-1-5','coktan_secmeli','Yeniden kullanılabilir ürünler atığı azaltabilir mi?','["Hayır","Sadece artırır","Evet","İlgisizdir"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-kaynak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-geri','Geri Dönüşüm ve Çevre','Geri Dönüşüm ve Çevre','Geri Dönüşüm ve Çevre ile ilgili gözlem ve günlük yaşam bağlantıları.','',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-cevre'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-1-1','coktan_secmeli','Geri dönüşüm ne sağlar?','["Atığın artmasını","Bazı atıkların yeniden değerlendirilmesini","Kaynağın yok olmasını","Suyun kirlenmesini"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-1-2','coktan_secmeli','Atık pil nereye bırakılmalı?','["Toprağa","Dereye","Yola","Özel toplama noktasına"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-1-3','coktan_secmeli','Cam, kâğıt, plastik ayrıştırılabilir mi?','["Hayır","Evet","Sadece kâğıt","Sadece cam"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-1-4','coktan_secmeli','Atığı azaltmanın yolu?','["Daha çok tek kullanımlık ürün","Gereksiz alışveriş","Çöpü doğaya bırakmak","Tekrar kullanım ve ihtiyaç kadar tüketim"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-geri-1-5','coktan_secmeli','Kompost bazı organik atıklar için değerlendirme yolu olabilir mi?','["Hayır","Evet","Sadece metal için","Sadece cam için"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-geri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-devre','Devre Elemanları','Devre Elemanları','Devre Elemanları ile ilgili gözlem ve günlük yaşam bağlantıları.','',130,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-elektrik'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-1-1','coktan_secmeli','Basit devrede enerji kaynağı?','["Pil","Anahtar","Ampul","Kablo"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-1-2','coktan_secmeli','Ampulün görevi?','["Akımı kesmek","Kabloyu uzatmak","Elektrik enerjisini ışığa dönüştürmek","Pili şarj etmek"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-1-3','coktan_secmeli','Anahtar ne işe yarar?','["Devreyi açıp kapatmaya","Işık üretmeye","Enerji üretmeye","Kabloyu eritmeye"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-1-4','coktan_secmeli','Bağlantı kablosu ne sağlar?','["Işık kaynağı","Ses kaynağı","Devre elemanları arasında iletken yol","Kütle ölçümü"]',2,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-1-5','coktan_secmeli','Duy ne işe yarar?','["Ampulü devreye bağlamaya","Pili ölçmeye","Anahtarı kapatmaya","Kabloyu kesmeye"]',0,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'fen4-devre-kurma','Basit Devre Kurma','Basit Devre Kurma','Basit Devre Kurma ile ilgili gözlem ve günlük yaşam bağlantıları.','',140,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='fen4-elektrik'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-1-1','coktan_secmeli','Ampulün yanması için devre nasıl olmalı?','["Açık","Eksik kablolu","Pil olmadan","Kapalı ve doğru bağlı"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,1,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-1-2','coktan_secmeli','Devrede bağlantı koparsa ne olur?','["Daha parlak yanar","Ampul yanmayabilir.","Pil büyür","Anahtar kaybolur"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,2,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-1-3','coktan_secmeli','İki pil kullanmak ampul parlaklığını etkileyebilir mi?','["Asla","Sadece rengi değişir","Ampul küçülür","Evet, bağlantıya göre artırabilir."]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,3,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-1-4','coktan_secmeli','Devre kurarken güvenli düşük gerilimli kaynak kullanmak önemli midir?','["Hayır","Evet","Priz kullanılmalı","Islak elle çalışılmalı"]',1,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,4,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4f-fen4-devre-kurma-1-5','coktan_secmeli','Anahtar açık konumdaysa devre tamamlanmış mıdır?','["Evet","Her zaman","Pil varsa fark etmez","Hayır"]',3,'Fen bilimleri konu bilgisini kullanarak en uygun seçenek belirlenir.',1,5,1 FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='fen4-devre-kurma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;



-- SOURCE: database/content/grade4/28_sosyal_bilgiler_soru_havuzu.sql
INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-kimlik','Resmî Kimlik ve Bireysel Özellikler','Resmî Kimlik ve Bireysel Özellikler','Resmî Kimlik ve Bireysel Özellikler ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-birey'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-1-1','coktan_secmeli','Resmî kimlik belgesinde hangisi bulunabilir?','["Ad-soyad ve doğum bilgisi","Sınav notu","En sevdiği renk","Hobisi zorunlu"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-1-2','coktan_secmeli','Bireysel farklılıklar saygıyla karşılanmalı mı?','["Hayır","Sadece okulda","Evet","Sadece yetişkinlerde"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-1-3','coktan_secmeli','İlgi ve yetenek aynı şey midir?','["Her zaman değil","Her zaman aynıdır","İkisi de kimlik numarasıdır","İkisi de adres"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-1-4','coktan_secmeli','Empati ne demektir?','["Başkalarını dışlamak","Sadece kendi fikrini düşünmek","Kendini başkasının yerine koymaya çalışmak","Kural bozmak"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-3-1','coktan_secmeli','Resmî kimlik belgesinde hangisi bulunabilir? En uygun açıklamayı seç.','["Sınav notu","En sevdiği renk","Ad-soyad ve doğum bilgisi","Hobisi zorunlu"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-3-2','coktan_secmeli','Bireysel farklılıklar saygıyla karşılanmalı mı? En uygun açıklamayı seç.','["Evet","Hayır","Sadece okulda","Sadece yetişkinlerde"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-3-3','coktan_secmeli','İlgi ve yetenek aynı şey midir? En uygun açıklamayı seç.','["Her zaman aynıdır","İkisi de kimlik numarasıdır","Her zaman değil","İkisi de adres"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kimlik-3-4','coktan_secmeli','Empati ne demektir? En uygun açıklamayı seç.','["Kendini başkasının yerine koymaya çalışmak","Başkalarını dışlamak","Sadece kendi fikrini düşünmek","Kural bozmak"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kimlik' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-kronoloji','Kendi Yaşamımda Kronoloji','Kendi Yaşamımda Kronoloji','Kendi Yaşamımda Kronoloji ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-birey'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-1-1','coktan_secmeli','Kronoloji neyi anlatır?','["Olayların zaman sırasını","Yerini","Rengini","Fiyatını"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-1-2','coktan_secmeli','Doğum ve okula başlama olayları nasıl sıralanır?','["Renge göre","Boyuta göre","Zamana göre","Rastgele"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-1-3','coktan_secmeli','Zaman şeridi ne işe yarar?','["Olayları sırayla göstermeye","Kütle ölçmeye","Yön bulmaya","Para saymaya"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-1-4','coktan_secmeli','Tarih bilgisi kronolojide önemli midir?','["Hayır","Sadece haritada","Evet","Sadece grafikte"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-3-1','coktan_secmeli','Kronoloji neyi anlatır? En uygun açıklamayı seç.','["Yerini","Rengini","Olayların zaman sırasını","Fiyatını"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-3-2','coktan_secmeli','Doğum ve okula başlama olayları nasıl sıralanır? En uygun açıklamayı seç.','["Zamana göre","Renge göre","Boyuta göre","Rastgele"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-3-3','coktan_secmeli','Zaman şeridi ne işe yarar? En uygun açıklamayı seç.','["Kütle ölçmeye","Yön bulmaya","Olayları sırayla göstermeye","Para saymaya"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kronoloji-3-4','coktan_secmeli','Tarih bilgisi kronolojide önemli midir? En uygun açıklamayı seç.','["Evet","Hayır","Sadece haritada","Sadece grafikte"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kronoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-aile-tarih','Aile Tarihi ve Kültür','Aile Tarihi ve Kültür','Aile Tarihi ve Kültür ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-kultur'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-1-1','coktan_secmeli','Aile geçmişini öğrenmede hangi kaynak yardımcı olabilir?','["Aile büyükleri ve eski fotoğraflar","Sadece reklamlar","Rastgele söylentiler","Oyun puanı"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-1-2','coktan_secmeli','Sözlü tarih çalışması neyi kullanabilir?','["Sadece cetvel","Terazi","Görüşme","Hesap makinesi"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-1-3','coktan_secmeli','Kültürel ögeye örnek?','["Geleneksel yemek","Şifre","Trafik ışığı","Pilin kutbu"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-1-4','coktan_secmeli','Aile yadigârları geçmiş hakkında bilgi verebilir mi?','["Hayır","Sadece para değeri vardır","Evet","Sadece yeniyse"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-3-1','coktan_secmeli','Aile geçmişini öğrenmede hangi kaynak yardımcı olabilir? En uygun açıklamayı seç.','["Sadece reklamlar","Rastgele söylentiler","Aile büyükleri ve eski fotoğraflar","Oyun puanı"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-3-2','coktan_secmeli','Sözlü tarih çalışması neyi kullanabilir? En uygun açıklamayı seç.','["Görüşme","Sadece cetvel","Terazi","Hesap makinesi"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-3-3','coktan_secmeli','Kültürel ögeye örnek? En uygun açıklamayı seç.','["Şifre","Trafik ışığı","Geleneksel yemek","Pilin kutbu"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-aile-tarih-3-4','coktan_secmeli','Aile yadigârları geçmiş hakkında bilgi verebilir mi? En uygun açıklamayı seç.','["Evet","Hayır","Sadece para değeri vardır","Sadece yeniyse"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-aile-tarih' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-mucadele','Millî Mücadele ve Kahramanlar','Millî Mücadele ve Kahramanlar','Millî Mücadele ve Kahramanlar ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-kultur'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-1-1','coktan_secmeli','Mustafa Kemal Atatürk Millî Mücadele''nin lideridir. Doğru mu?','["Evet","Hayır","Sadece bir yazar","Bir şehir adı"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-1-2','coktan_secmeli','Millî Mücadele''nin amacı neydi?','["Yeni oyuncak üretmek","Ticaret yapmak","Bağımsızlığı ve vatanı savunmak","Sadece eğitim gezisi"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-1-3','coktan_secmeli','Kahramanlık hikâyeleri neyi anlamaya yardım eder?','["Dönemin mücadele ve fedakârlıklarını","Hava durumunu","Matematik işlemini","Elektrik devresini"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-1-4','coktan_secmeli','Tarihî olaylar kaynaklarla incelenmeli midir?','["Hayır","Sadece söylenti yeter","Evet","Kaynak gerekmez"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-3-1','coktan_secmeli','Mustafa Kemal Atatürk Millî Mücadele''nin lideridir. Doğru mu? En uygun açıklamayı seç.','["Hayır","Sadece bir yazar","Evet","Bir şehir adı"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-3-2','coktan_secmeli','Millî Mücadele''nin amacı neydi? En uygun açıklamayı seç.','["Bağımsızlığı ve vatanı savunmak","Yeni oyuncak üretmek","Ticaret yapmak","Sadece eğitim gezisi"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-3-3','coktan_secmeli','Kahramanlık hikâyeleri neyi anlamaya yardım eder? En uygun açıklamayı seç.','["Hava durumunu","Matematik işlemini","Dönemin mücadele ve fedakârlıklarını","Elektrik devresini"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-mucadele-3-4','coktan_secmeli','Tarihî olaylar kaynaklarla incelenmeli midir? En uygun açıklamayı seç.','["Evet","Hayır","Sadece söylenti yeter","Kaynak gerekmez"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-mucadele' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-yon','Yön, Kroki ve Konum','Yön, Kroki ve Konum','Yön, Kroki ve Konum ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-cevre'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-1-1','coktan_secmeli','Ana yönlerden biri?','["Kuzey","Yukarı","Sağ","Ön"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-1-2','coktan_secmeli','Güneş genel olarak hangi yönden doğar?','["Batı","Kuzey","Doğu","Güney"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-1-3','coktan_secmeli','Kroki neyi gösterir?','["Yerlerin birbirine göre konumunu","Kütleyi","Sıcaklığı","Yaşı"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-1-4','coktan_secmeli','Pusula ne için kullanılabilir?','["Kütle ölçmek","Ses ölçmek","Yön bulmak","Para saymak"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-3-1','coktan_secmeli','Ana yönlerden biri? En uygun açıklamayı seç.','["Yukarı","Sağ","Kuzey","Ön"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-3-2','coktan_secmeli','Güneş genel olarak hangi yönden doğar? En uygun açıklamayı seç.','["Doğu","Batı","Kuzey","Güney"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-3-3','coktan_secmeli','Kroki neyi gösterir? En uygun açıklamayı seç.','["Kütleyi","Sıcaklığı","Yerlerin birbirine göre konumunu","Yaşı"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-yon-3-4','coktan_secmeli','Pusula ne için kullanılabilir? En uygun açıklamayı seç.','["Yön bulmak","Kütle ölçmek","Ses ölçmek","Para saymak"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-yon' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-dogal-beseri','Doğal ve Beşerî Unsurlar','Doğal ve Beşerî Unsurlar','Doğal ve Beşerî Unsurlar ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-cevre'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-1-1','coktan_secmeli','Dağ doğal unsur mudur?','["Evet","Hayır","Sadece beşerî","Teknolojik"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-1-2','coktan_secmeli','Köprü beşerî unsur mudur?','["Hayır","Doğal dağdır","Evet","Canlıdır"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-1-3','coktan_secmeli','İklim insanların yaşamını etkileyebilir mi?','["Evet","Hayır","Sadece hayvanları","Sadece bitkileri"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-1-4','coktan_secmeli','Doğal afetlere karşı hazırlık önemli midir?','["Hayır","Afet engellenir her zaman","Evet","Sadece yetişkinlere"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-3-1','coktan_secmeli','Dağ doğal unsur mudur? En uygun açıklamayı seç.','["Hayır","Sadece beşerî","Evet","Teknolojik"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-3-2','coktan_secmeli','Köprü beşerî unsur mudur? En uygun açıklamayı seç.','["Evet","Hayır","Doğal dağdır","Canlıdır"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-3-3','coktan_secmeli','İklim insanların yaşamını etkileyebilir mi? En uygun açıklamayı seç.','["Hayır","Sadece hayvanları","Evet","Sadece bitkileri"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-dogal-beseri-3-4','coktan_secmeli','Doğal afetlere karşı hazırlık önemli midir? En uygun açıklamayı seç.','["Evet","Hayır","Afet engellenir her zaman","Sadece yetişkinlere"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-dogal-beseri' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-teknoloji','Teknolojik Ürünlerin Değişimi','Teknolojik Ürünlerin Değişimi','Teknolojik Ürünlerin Değişimi ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-bilim'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-1-1','coktan_secmeli','Teknolojik ürünler zamanla değişebilir mi?','["Evet","Hayır","Her zaman aynı","Sadece renk değişir"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-1-2','coktan_secmeli','İcat nedir?','["Sadece keşfedilmiş doğa olayı","Tarih yazma","Yeni bir araç veya yöntem geliştirme","Harita çizme"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-1-3','coktan_secmeli','Telefonların geçmişten bugüne değişimi neyi gösterir?','["Teknolojik gelişimi","Kültürün yok olduğunu","Doğanın değişmediğini","Matematik kuralını"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-1-4','coktan_secmeli','Teknoloji ihtiyaçlardan etkilenebilir mi?','["Hayır","Sadece tesadüf","Evet","İhtiyaçla ilgisiz"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-3-1','coktan_secmeli','Teknolojik ürünler zamanla değişebilir mi? En uygun açıklamayı seç.','["Hayır","Her zaman aynı","Evet","Sadece renk değişir"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-3-2','coktan_secmeli','İcat nedir? En uygun açıklamayı seç.','["Yeni bir araç veya yöntem geliştirme","Sadece keşfedilmiş doğa olayı","Tarih yazma","Harita çizme"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-3-3','coktan_secmeli','Telefonların geçmişten bugüne değişimi neyi gösterir? En uygun açıklamayı seç.','["Kültürün yok olduğunu","Doğanın değişmediğini","Teknolojik gelişimi","Matematik kuralını"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-teknoloji-3-4','coktan_secmeli','Teknoloji ihtiyaçlardan etkilenebilir mi? En uygun açıklamayı seç.','["Evet","Hayır","Sadece tesadüf","İhtiyaçla ilgisiz"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-guvenli-teknoloji','Güvenli ve Sorumlu Teknoloji Kullanımı','Güvenli ve Sorumlu Teknoloji Kullanımı','Güvenli ve Sorumlu Teknoloji Kullanımı ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-bilim'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-1-1','coktan_secmeli','Kişisel şifre paylaşılmalı mı?','["Hayır","Evet herkesle","Sosyal medyada","Tanımadıklarla"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-1-2','coktan_secmeli','İnternette bilgi doğrulanmalı mı?','["Hayır","Her şey doğrudur","Evet","Sadece resimler"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-1-3','coktan_secmeli','Ekran süresinde denge önemli midir?','["Evet","Hayır","Sınırsız olmalı","Uyku yerine geçer"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-1-4','coktan_secmeli','Siber zorbalıkta ne yapılmalı?','["Aynısını yapmak","Gizlemek","Güvenilir yetişkine bildirmek","Şifre paylaşmak"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-3-1','coktan_secmeli','Kişisel şifre paylaşılmalı mı? En uygun açıklamayı seç.','["Evet herkesle","Sosyal medyada","Hayır","Tanımadıklarla"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-3-2','coktan_secmeli','İnternette bilgi doğrulanmalı mı? En uygun açıklamayı seç.','["Evet","Hayır","Her şey doğrudur","Sadece resimler"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-3-3','coktan_secmeli','Ekran süresinde denge önemli midir? En uygun açıklamayı seç.','["Hayır","Sınırsız olmalı","Evet","Uyku yerine geçer"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-guvenli-teknoloji-3-4','coktan_secmeli','Siber zorbalıkta ne yapılmalı? En uygun açıklamayı seç.','["Güvenilir yetişkine bildirmek","Aynısını yapmak","Gizlemek","Şifre paylaşmak"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-guvenli-teknoloji' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-ihtiyac','İstek, İhtiyaç ve Bilinçli Tüketim','İstek, İhtiyaç ve Bilinçli Tüketim','İstek, İhtiyaç ve Bilinçli Tüketim ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-ekonomi'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-1-1','coktan_secmeli','Su temel ihtiyaç mıdır?','["Evet","Hayır","Sadece istek","Lüks"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-1-2','coktan_secmeli','Yeni bir oyuncak her zaman ihtiyaç mıdır?','["Evet","Su gibidir","Hayır","Besin gibidir"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-1-3','coktan_secmeli','Bilinçli tüketici ne yapar?','["İhtiyacını ve bütçesini değerlendirir.","Rastgele alır","Etikete bakmaz","Fiyat karşılaştırmaz"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-1-4','coktan_secmeli','Ürün etiketi neden okunur?','["Renk seçmek için","Reklam için","İçerik, tarih ve kullanım bilgisi için","Boyut büyütmek için"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-3-1','coktan_secmeli','Su temel ihtiyaç mıdır? En uygun açıklamayı seç.','["Hayır","Sadece istek","Evet","Lüks"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-3-2','coktan_secmeli','Yeni bir oyuncak her zaman ihtiyaç mıdır? En uygun açıklamayı seç.','["Hayır","Evet","Su gibidir","Besin gibidir"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-3-3','coktan_secmeli','Bilinçli tüketici ne yapar? En uygun açıklamayı seç.','["Rastgele alır","Etikete bakmaz","İhtiyacını ve bütçesini değerlendirir.","Fiyat karşılaştırmaz"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ihtiyac-3-4','coktan_secmeli','Ürün etiketi neden okunur? En uygun açıklamayı seç.','["İçerik, tarih ve kullanım bilgisi için","Renk seçmek için","Reklam için","Boyut büyütmek için"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ihtiyac' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-butce','Aile Bütçesi ve Tasarruf','Aile Bütçesi ve Tasarruf','Aile Bütçesi ve Tasarruf ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-ekonomi'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-1-1','coktan_secmeli','Bütçe neyi düzenler?','["Gelir ve gider planını","Hava durumunu","Ders saatini","Yönleri"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-1-2','coktan_secmeli','Tasarruf ne demektir?','["Hiç kullanmamak","İsraf etmek","Kaynakları gereksiz harcamamak","Borçlanmak"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-1-3','coktan_secmeli','Gelirden fazla gider sürdürülebilir midir?','["Genellikle hayır","Her zaman evet","Bütçeyi güçlendirir","Gider önemli değildir"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-1-4','coktan_secmeli','Harcamaları kaydetmek ne sağlar?','["Parayı otomatik çoğaltır","Fiyatı değiştirir","Bütçeyi takip etmeyi","Ürünü büyütür"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-3-1','coktan_secmeli','Bütçe neyi düzenler? En uygun açıklamayı seç.','["Hava durumunu","Ders saatini","Gelir ve gider planını","Yönleri"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-3-2','coktan_secmeli','Tasarruf ne demektir? En uygun açıklamayı seç.','["Kaynakları gereksiz harcamamak","Hiç kullanmamak","İsraf etmek","Borçlanmak"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-3-3','coktan_secmeli','Gelirden fazla gider sürdürülebilir midir? En uygun açıklamayı seç.','["Her zaman evet","Bütçeyi güçlendirir","Genellikle hayır","Gider önemli değildir"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-butce-3-4','coktan_secmeli','Harcamaları kaydetmek ne sağlar? En uygun açıklamayı seç.','["Bütçeyi takip etmeyi","Parayı otomatik çoğaltır","Fiyatı değiştirir","Ürünü büyütür"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-butce' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-hak','Çocuk Hakları ve Sorumluluklar','Çocuk Hakları ve Sorumluluklar','Çocuk Hakları ve Sorumluluklar ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-vatandas'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-1-1','coktan_secmeli','Eğitim çocuk hakkı mıdır?','["Evet","Hayır","Sadece ödül","Sadece yetişkin hakkı"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-1-2','coktan_secmeli','Haklarla birlikte ne bulunur?','["Sadece istekler","Hile","Sorumluluklar","İsraf"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-1-3','coktan_secmeli','Çocukların güvenli yaşama hakkı var mıdır?','["Evet","Hayır","Sadece okulda","Sadece evde"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-1-4','coktan_secmeli','Başkalarının haklarına saygı gerekli midir?','["Hayır","Sadece kendi hakkımız önemli","Evet","Kurallar gereksiz"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-3-1','coktan_secmeli','Eğitim çocuk hakkı mıdır? En uygun açıklamayı seç.','["Hayır","Sadece ödül","Evet","Sadece yetişkin hakkı"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-3-2','coktan_secmeli','Haklarla birlikte ne bulunur? En uygun açıklamayı seç.','["Sorumluluklar","Sadece istekler","Hile","İsraf"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-3-3','coktan_secmeli','Çocukların güvenli yaşama hakkı var mıdır? En uygun açıklamayı seç.','["Hayır","Sadece okulda","Evet","Sadece evde"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-hak-3-4','coktan_secmeli','Başkalarının haklarına saygı gerekli midir? En uygun açıklamayı seç.','["Evet","Hayır","Sadece kendi hakkımız önemli","Kurallar gereksiz"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-hak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-kurum','Kurumlar ve Katılım','Kurumlar ve Katılım','Kurumlar ve Katılım ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-vatandas'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-1-1','coktan_secmeli','Belediye yerel hizmetlerle ilgilenebilir mi?','["Evet","Hayır","Sadece okul notları","Sadece aile kararları"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-1-2','coktan_secmeli','Muhtarlık yerel yönetim birimi midir?','["Hayır","Bir spor kulübü","Evet","Bir bilim laboratuvarı"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-1-3','coktan_secmeli','Sorunları ilgili kuruma bildirmek katılım mıdır?','["Evet","Hayır","Sadece şikâyet","Kuralsızlık"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-1-4','coktan_secmeli','Kamu kurumları ne için çalışır?','["Sadece satış için","Sadece oyun için","Toplumsal ihtiyaç ve hizmetler için","Sadece reklam için"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-3-1','coktan_secmeli','Belediye yerel hizmetlerle ilgilenebilir mi? En uygun açıklamayı seç.','["Hayır","Sadece okul notları","Evet","Sadece aile kararları"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-3-2','coktan_secmeli','Muhtarlık yerel yönetim birimi midir? En uygun açıklamayı seç.','["Evet","Hayır","Bir spor kulübü","Bir bilim laboratuvarı"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-3-3','coktan_secmeli','Sorunları ilgili kuruma bildirmek katılım mıdır? En uygun açıklamayı seç.','["Hayır","Sadece şikâyet","Evet","Kuralsızlık"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-kurum-3-4','coktan_secmeli','Kamu kurumları ne için çalışır? En uygun açıklamayı seç.','["Toplumsal ihtiyaç ve hizmetler için","Sadece satış için","Sadece oyun için","Sadece reklam için"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-kurum' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-ulkeler','Dünya''daki Ülkeler ve Kültürler','Dünya''daki Ülkeler ve Kültürler','Dünya''daki Ülkeler ve Kültürler ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',130,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-kuresel'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-1-1','coktan_secmeli','Farklı ülkelerin farklı kültürleri olabilir mi?','["Evet","Hayır","Hepsi aynıdır","Kültür yoktur"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-1-2','coktan_secmeli','Bir ülkenin bayrağı millî sembol müdür?','["Hayır","Sadece süs","Evet","Sadece reklam"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-1-3','coktan_secmeli','Kültürel farklılıklara nasıl yaklaşılmalı?','["Saygıyla","Alayla","Dışlayarak","Yasaklayarak"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-1-4','coktan_secmeli','Komşu ülkeleri haritada görmek ne sağlar?','["Kütleyi ölçmeye","Saati öğrenmeye","Coğrafi konumu anlamaya","Elektrik üretmeye"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-3-1','coktan_secmeli','Farklı ülkelerin farklı kültürleri olabilir mi? En uygun açıklamayı seç.','["Hayır","Hepsi aynıdır","Evet","Kültür yoktur"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-3-2','coktan_secmeli','Bir ülkenin bayrağı millî sembol müdür? En uygun açıklamayı seç.','["Evet","Hayır","Sadece süs","Sadece reklam"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-3-3','coktan_secmeli','Kültürel farklılıklara nasıl yaklaşılmalı? En uygun açıklamayı seç.','["Alayla","Dışlayarak","Saygıyla","Yasaklayarak"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ulkeler-3-4','coktan_secmeli','Komşu ülkeleri haritada görmek ne sağlar? En uygun açıklamayı seç.','["Coğrafi konumu anlamaya","Kütleyi ölçmeye","Saati öğrenmeye","Elektrik üretmeye"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ulkeler' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'sos4-ortak','Küresel Sorunlar ve Dayanışma','Küresel Sorunlar ve Dayanışma','Küresel Sorunlar ve Dayanışma ile ilgili temel bilgi, yorumlama ve günlük yaşam bağlantıları.','',140,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='sos4-kuresel'
WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-1-1','coktan_secmeli','Çevre kirliliği sınırları aşan sorun olabilir mi?','["Evet","Hayır","Sadece tek evde","Sadece okulda"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-1-2','coktan_secmeli','Afetlerde ülkeler birbirine yardım edebilir mi?','["Hayır","Yardım yasaktır","Evet","Sadece ticaret olur"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-1-3','coktan_secmeli','Dünya çocuklarının ortak ihtiyaçlarından biri?','["Güvenlik ve eğitim","Aynı oyuncak","Aynı dil","Aynı kıyafet"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-1-4','coktan_secmeli','Küresel sorunlarda iş birliği önemli midir?','["Hayır","Tek kişi yeter","Evet","Sorunlar ortak değildir"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-3-1','coktan_secmeli','Çevre kirliliği sınırları aşan sorun olabilir mi? En uygun açıklamayı seç.','["Hayır","Sadece tek evde","Evet","Sadece okulda"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,41,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-3-2','coktan_secmeli','Afetlerde ülkeler birbirine yardım edebilir mi? En uygun açıklamayı seç.','["Evet","Hayır","Yardım yasaktır","Sadece ticaret olur"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,42,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-3-3','coktan_secmeli','Dünya çocuklarının ortak ihtiyaçlarından biri? En uygun açıklamayı seç.','["Aynı oyuncak","Aynı dil","Güvenlik ve eğitim","Aynı kıyafet"]',2,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,43,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4s-sos4-ortak-3-4','coktan_secmeli','Küresel sorunlarda iş birliği önemli midir? En uygun açıklamayı seç.','["Evet","Hayır","Tek kişi yeter","Sorunlar ortak değildir"]',0,'Sosyal Bilgiler konu bilgisini kullanarak uygun seçenek belirlenir.',2,44,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='sos4-ortak' AND (d.kod='sosyal' OR d.ad='Sosyal Bilgiler')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;



-- SOURCE: database/content/grade4/29_dkab_soru_havuzu.sql
INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-selam','Selamlaşma, Dua ve Dinî İfadeler','Selamlaşma, Dua ve Dinî İfadeler','Selamlaşma, Dua ve Dinî İfadeler konusunu temel kavram ve değerlerle açıklar.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-ifadeler'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-sukur','Şükür, Sabır ve Güzel Söz','Şükür, Sabır ve Güzel Söz','Şükür, Sabır ve Güzel Söz konusunu temel kavram ve değerlerle açıklar.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-ifadeler'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-esas','İslam''ın Temel Esasları','İslam''ın Temel Esasları','İslam''ın Temel Esasları konusunu temel kavram ve değerlerle açıklar.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-islam'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-kuran','Kur''an-ı Kerim ve İbadet','Kur''an-ı Kerim ve İbadet','Kur''an-ı Kerim ve İbadet konusunu temel kavram ve değerlerle açıklar.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-islam'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-deger','Sevgi, Saygı, Doğruluk ve Yardımlaşma','Sevgi, Saygı, Doğruluk ve Yardımlaşma','Sevgi, Saygı, Doğruluk ve Yardımlaşma konusunu temel kavram ve değerlerle açıklar.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-ahlak'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-sorumluluk','Sorumluluk ve Kul Hakkı Bilinci','Sorumluluk ve Kul Hakkı Bilinci','Sorumluluk ve Kul Hakkı Bilinci konusunu temel kavram ve değerlerle açıklar.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-ahlak'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-hayat','Hz. Muhammed''in Hayatı','Hz. Muhammed''in Hayatı','Hz. Muhammed''in Hayatı konusunu temel kavram ve değerlerle açıklar.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-hz-muhammed'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-ornek','Hz. Muhammed''in Örnek Davranışları','Hz. Muhammed''in Örnek Davranışları','Hz. Muhammed''in Örnek Davranışları konusunu temel kavram ve değerlerle açıklar.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-hz-muhammed'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-beden','Beden ve Çevre Temizliği','Beden ve Çevre Temizliği','Beden ve Çevre Temizliği konusunu temel kavram ve değerlerle açıklar.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-temizlik'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',4,'din4-ibadet-temiz','İbadet ve Temizlik İlişkisi','İbadet ve Temizlik İlişkisi','İbadet ve Temizlik İlişkisi konusunu temel kavram ve değerlerle açıklar.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=4 AND b.kod='din4-temizlik'
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-1','coktan_secmeli','“Selamün aleyküm” ifadesi ne amaçla kullanılır?','["Selamlaşma","Vedalaşma zorunlu","Alışveriş","Saat sorma"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-selam' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-2','coktan_secmeli','Dua neyi ifade eder?','["Sadece şarkıyı","Alışverişi","İnsanın Allah''a yönelmesini","Oyun kuralını"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-selam' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-3','coktan_secmeli','“İnşallah” hangi anlamla kullanılır?','["Allah dilerse","Teşekkür","Hoş geldin","Güle güle"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-selam' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-4','coktan_secmeli','“Maşallah” güzel bir durum karşısında kullanılabilir mi?','["Hayır","Sadece vedada","Evet","Sadece yemekte"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-selam' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-5','coktan_secmeli','Şükür ne demektir?','["Nimetlerin kıymetini bilip teşekkür etmek","İsraf etmek","Kaba davranmak","Şikâyet etmek"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sukur' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-6','coktan_secmeli','Sabır neyi gerektirir?','["Hemen vazgeçmek","Kırıcı olmak","Zorluklarda direnç ve ölçülü davranış","Hile yapmak"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sukur' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-7','coktan_secmeli','Güzel söz söylemek neden önemlidir?','["İyi iletişim ve saygıyı destekler.","Kavgayı artırır.","İsraf oluşturur.","Kuralları bozar."]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sukur' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-8','coktan_secmeli','Nimetleri israf etmemek şükürle ilişkilendirilebilir mi?','["Hayır","Sadece para için","Evet","İsraf iyidir"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sukur' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-9','coktan_secmeli','İslam dininin kutsal kitabı?','["Kur''an-ı Kerim","Tevrat","İncil","Zebur"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-esas' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-10','coktan_secmeli','Müslümanların inandığı tek ilah?','["Bir insan","Bir yıldız","Allah","Bir nesne"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-esas' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-11','coktan_secmeli','Peygamberler ne için gönderilmiştir?','["İnsanlara doğru yolu bildirmek için","Sadece ticaret için","Sadece savaş için","Sadece bilim deneyi için"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-esas' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-12','coktan_secmeli','İbadet neyi ifade eder?','["Sadece oyun","Sadece alışveriş","Allah''a kulluk ve bağlılık davranışlarını","Sadece spor"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-esas' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-13','coktan_secmeli','Kur''an-ı Kerim kime vahyedilmiştir?','["Hz. Muhammed''e","Hz. Musa''ya","Hz. İsa''ya","Hz. Nuh''a"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-kuran' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-14','coktan_secmeli','Kur''an surelerden oluşur mu?','["Hayır","Sadece tek cümle","Evet","Sadece şiir"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-kuran' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-15','coktan_secmeli','Kur''an''a saygılı davranmak önemli midir?','["Evet","Hayır","Sadece yetişkinler için","Sadece camide"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-kuran' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-16','coktan_secmeli','İbadetlerde niyet önemli midir?','["Hayır","Sadece şekil önemlidir","Evet","Niyet yoktur"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-kuran' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-17','coktan_secmeli','Doğruluk güzel ahlak mıdır?','["Evet","Hayır","Sadece okul kuralı","Sadece yetişkinlere"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-18','coktan_secmeli','Yardımlaşma neyi güçlendirir?','["Dışlamayı","Kabalığı","Toplumsal dayanışmayı","İsrafı"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-19','coktan_secmeli','Saygı kimlere gösterilmelidir?','["İnsanlara ve haklara","Sadece tanıdıklara","Sadece büyüklere","Kimseye"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-20','coktan_secmeli','Emaneti korumak hangi değerle ilişkilidir?','["İsraf","Kabalık","Güvenilirlik","Tembellik"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-deger' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-21','coktan_secmeli','Başkasının hakkını gözetmek önemli midir?','["Evet","Hayır","Sadece kendi hakkımız","Hak yoktur"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sorumluluk' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-22','coktan_secmeli','Verilen görevi yapmak neyi gösterir?','["İsraf","Hile","Sorumluluk","Kabalık"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sorumluluk' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-23','coktan_secmeli','Hata yaptığında özür dilemek güzel davranış mıdır?','["Evet","Hayır","Sadece çocuklar","Özür gereksiz"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sorumluluk' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-24','coktan_secmeli','Adil olmak neyi gerektirir?','["Kayırmayı","Hileyi","Hakkaniyetli davranmayı","Dışlamayı"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-sorumluluk' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-25','coktan_secmeli','Hz. Muhammed nerede doğmuştur?','["Mekke''de","Medine''de","Kudüs''te","İstanbul''da"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-hayat' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-26','coktan_secmeli','Hz. Muhammed''in annesinin adı?','["Hatice","Fatma","Âmine","Meryem"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-hayat' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-27','coktan_secmeli','Hz. Muhammed''in babasının adı?','["Abdullah","Ali","Ömer","Bilal"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,27,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-hayat' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-28','coktan_secmeli','Hz. Muhammed hangi şehirden Medine''ye hicret etmiştir?','["Taif''ten","Kudüs''ten","Mekke''den","Şam''dan"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,28,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-hayat' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-29','coktan_secmeli','Hz. Muhammed''in güvenilirliğini anlatan sıfat?','["el-Emin","el-Kebir","el-Malik","el-Katip"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,29,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ornek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-30','coktan_secmeli','Merhametli davranmak onun örnek davranışlarından mıdır?','["Hayır","Sadece savaşta","Evet","Merhamet önemsiz"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,30,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ornek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-31','coktan_secmeli','İstişare etmek ne demektir?','["Danışmak","Tek başına karar dayatmak","Kavga etmek","Susmak"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,31,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ornek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-32','coktan_secmeli','Doğruluk Hz. Muhammed''in örnekliğinde önemli midir?','["Hayır","Sadece ticarette","Evet","Sadece ailede"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,32,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ornek' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-33','coktan_secmeli','Temizlik sağlık için önemli midir?','["Evet","Hayır","Sadece görüntü için","Sadece okulda"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,33,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-beden' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-34','coktan_secmeli','Elleri yıkamak hangi temizliğe örnektir?','["Çevre kirliliği","İsraf","Beden temizliği","Trafik"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,34,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-beden' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-35','coktan_secmeli','Çevreyi temiz tutmak dinî ve ahlaki sorumlulukla ilişkilendirilebilir mi?','["Evet","Hayır","Sadece belediyenin işi","Çevre önemli değil"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,35,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-beden' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-36','coktan_secmeli','İsraf etmemek çevre temizliğini destekler mi?','["Hayır","İsraf iyidir","Evet","Sadece su için"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,36,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-beden' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-37','coktan_secmeli','Abdest neyle ilişkilidir?','["İbadet öncesi temizlik","Alışveriş","Trafik","Spor"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,37,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ibadet-temiz' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-38','coktan_secmeli','Namazda temizliğe önem verilir mi?','["Hayır","Sadece kıyafet rengi","Evet","Temizlik gerekmez"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,38,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ibadet-temiz' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-39','coktan_secmeli','Temiz elbise ibadet adabıyla ilişkilidir mi?','["Evet","Hayır","Sadece bayramda","Sadece okulda"]',0,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,39,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ibadet-temiz' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g4d-1-40','coktan_secmeli','Manevi temizlik hangi davranışlarla desteklenebilir?','["Yalan söylemekle","Haksızlıkla","Kötü davranışlardan kaçınmakla","Kabalıkla"]',2,'Din kültürü ve ahlak bilgisi kavramı doğru bağlamda değerlendirilir.',1,40,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=4 AND k.konu_kodu='din4-ibadet-temiz' AND (d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;



-- SOURCE: database/content/grade4/30_diger_dersler_soru_havuzu.sql
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


