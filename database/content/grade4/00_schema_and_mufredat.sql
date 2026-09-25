SET NAMES utf8mb4;

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
SELECT d.id,'temel_egitim',4,'unite','fen4-yer','Yer Kabuğu ve Dünya'mızın Hareketleri','4. sınıf Yer Kabuğu ve Dünya'mızın Hareketleri içeriği.',10,1 FROM dersler d
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
SELECT d.id,'temel_egitim',4,'unite','din4-islam','İslam'ı Tanıyalım','4. sınıf İslam'ı Tanıyalım içeriği.',20,1 FROM dersler d
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','din4-ahlak','Güzel Ahlak','4. sınıf Güzel Ahlak içeriği.',30,1 FROM dersler d
WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',4,'unite','din4-hz-muhammed','Hz. Muhammed'i Tanıyalım','4. sınıf Hz. Muhammed'i Tanıyalım içeriği.',40,1 FROM dersler d
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
