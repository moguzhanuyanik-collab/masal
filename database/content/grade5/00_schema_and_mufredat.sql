SET NAMES utf8mb4;

-- 5. sınıf 2026-2027 Türkiye Yüzyılı Maarif Modeli hazırlığı.
INSERT INTO dersler (kod,ad,haftalik_saat,emoji,sanat,sanat_sinifi,renk,yazi_renk,aciklama,sira,aktif)
SELECT 'sosyal','Sosyal Bilgiler',3,'🌍','','','#EAF4FF','#173D66','Sosyal Bilgiler',90,1 WHERE NOT EXISTS (SELECT 1 FROM dersler WHERE kod='sosyal' OR ad='Sosyal Bilgiler');
INSERT INTO dersler (kod,ad,haftalik_saat,emoji,sanat,sanat_sinifi,renk,yazi_renk,aciklama,sira,aktif)
SELECT 'din','Din Kültürü ve Ahlak Bilgisi',2,'🕌','','','#F7F0E7','#5B4127','Din Kültürü ve Ahlak Bilgisi',90,1 WHERE NOT EXISTS (SELECT 1 FROM dersler WHERE kod='din' OR ad='Din Kültürü ve Ahlak Bilgisi');
INSERT INTO dersler (kod,ad,haftalik_saat,emoji,sanat,sanat_sinifi,renk,yazi_renk,aciklama,sira,aktif)
SELECT 'beden_spor','Beden Eğitimi ve Spor',2,'🏃','','','#EAF8EF','#185033','Beden Eğitimi ve Spor',90,1 WHERE NOT EXISTS (SELECT 1 FROM dersler WHERE kod='beden_spor' OR ad='Beden Eğitimi ve Spor');
INSERT INTO dersler (kod,ad,haftalik_saat,emoji,sanat,sanat_sinifi,renk,yazi_renk,aciklama,sira,aktif)
SELECT 'bilisim','Bilişim Teknolojileri ve Yazılım',2,'💻','','','#EEF2FF','#293B6B','Bilişim Teknolojileri ve Yazılım',90,1 WHERE NOT EXISTS (SELECT 1 FROM dersler WHERE kod='bilisim' OR ad='Bilişim Teknolojileri ve Yazılım');
INSERT INTO dersler (kod,ad,haftalik_saat,emoji,sanat,sanat_sinifi,renk,yazi_renk,aciklama,sira,aktif)
SELECT 'rehberlik','Rehberlik ve Yönlendirme',1,'🧭','','','#FFF6E8','#5C4318','Rehberlik ve Yönlendirme',90,1 WHERE NOT EXISTS (SELECT 1 FROM dersler WHERE kod='rehberlik' OR ad='Rehberlik ve Yönlendirme');
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',5,d.id,6,10,1 FROM dersler d WHERE d.kod='turkce' OR d.ad='Türkçe' ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',5,d.id,5,20,1 FROM dersler d WHERE d.kod='matematik' OR d.ad='Matematik' ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',5,d.id,4,30,1 FROM dersler d WHERE d.kod='fen' OR d.ad='Fen Bilimleri' ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',5,d.id,3,40,1 FROM dersler d WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler' ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',5,d.id,3,50,1 FROM dersler d WHERE d.kod='ingilizce' OR d.ad='İngilizce' ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',5,d.id,2,60,1 FROM dersler d WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi' ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',5,d.id,1,70,1 FROM dersler d WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar' ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',5,d.id,1,80,1 FROM dersler d WHERE d.kod='muzik' OR d.ad='Müzik' ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',5,d.id,2,90,1 FROM dersler d WHERE d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor' ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',5,d.id,2,100,1 FROM dersler d WHERE d.kod='bilisim' OR d.ad='Bilişim Teknolojileri ve Yazılım' ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;
INSERT INTO sinif_dersleri (kademe_kodu,sinif_seviyesi,ders_id,haftalik_saat,sira,aktif)
SELECT 'temel_egitim',5,d.id,1,110,1 FROM dersler d WHERE d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme' ON DUPLICATE KEY UPDATE haftalik_saat=VALUES(haftalik_saat),sira=VALUES(sira),aktif=1;

DELETE s FROM ders_sorulari s INNER JOIN ders_konulari k ON k.id=s.konu_id WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5;
DELETE FROM ders_konulari WHERE kademe_kodu='temel_egitim' AND sinif_seviyesi=5;
DELETE FROM ders_bolumleri WHERE kademe_kodu='temel_egitim' AND sinif_seviyesi=5;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','tr5-oyun','Oyun Dünyası','5. sınıf Oyun Dünyası içeriği.',10,1 FROM dersler d WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','tr5-ataturk','Atatürk''ü Tanımak','5. sınıf Atatürk''ü Tanımak içeriği.',20,1 FROM dersler d WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','tr5-duygu','Duygularımı Tanıyorum','5. sınıf Duygularımı Tanıyorum içeriği.',30,1 FROM dersler d WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','tr5-gelenek','Geleneklerimiz','5. sınıf Geleneklerimiz içeriği.',40,1 FROM dersler d WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','tr5-iletisim','İletişim ve Sosyal İlişkiler','5. sınıf İletişim ve Sosyal İlişkiler içeriği.',50,1 FROM dersler d WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','tr5-saglik','Sağlıklı Yaşıyorum','5. sınıf Sağlıklı Yaşıyorum içeriği.',60,1 FROM dersler d WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','mat5-sayilar1','Sayılar ve Nicelikler (1)','5. sınıf Sayılar ve Nicelikler (1) içeriği.',10,1 FROM dersler d WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','mat5-sayilar2','Sayılar ve Nicelikler (2)','5. sınıf Sayılar ve Nicelikler (2) içeriği.',20,1 FROM dersler d WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','mat5-cebir','İşlemlerle Cebirsel Düşünme','5. sınıf İşlemlerle Cebirsel Düşünme içeriği.',30,1 FROM dersler d WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','mat5-sekiller','Geometrik Şekiller','5. sınıf Geometrik Şekiller içeriği.',40,1 FROM dersler d WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','mat5-nicelik','Geometrik Nicelikler','5. sınıf Geometrik Nicelikler içeriği.',50,1 FROM dersler d WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','mat5-istatistik','İstatistiksel Araştırma Süreci','5. sınıf İstatistiksel Araştırma Süreci içeriği.',60,1 FROM dersler d WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','mat5-olasilik','Veriden Olasılığa','5. sınıf Veriden Olasılığa içeriği.',70,1 FROM dersler d WHERE d.kod='matematik' OR d.ad='Matematik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'unite','fen5-gok','Gökyüzündeki Komşularımız ve Biz','5. sınıf Gökyüzündeki Komşularımız ve Biz içeriği.',10,1 FROM dersler d WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'unite','fen5-kuvvet','Kuvveti Tanıyalım','5. sınıf Kuvveti Tanıyalım içeriği.',20,1 FROM dersler d WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'unite','fen5-canli','Canlıların Yapısına Yolculuk','5. sınıf Canlıların Yapısına Yolculuk içeriği.',30,1 FROM dersler d WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'unite','fen5-isik','Işığın Dünyası','5. sınıf Işığın Dünyası içeriği.',40,1 FROM dersler d WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'unite','fen5-madde','Maddenin Doğası','5. sınıf Maddenin Doğası içeriği.',50,1 FROM dersler d WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'unite','fen5-elektrik','Yaşamımızdaki Elektrik','5. sınıf Yaşamımızdaki Elektrik içeriği.',60,1 FROM dersler d WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'unite','fen5-surdur','Sürdürülebilir Yaşam ve Geri Dönüşüm','5. sınıf Sürdürülebilir Yaşam ve Geri Dönüşüm içeriği.',70,1 FROM dersler d WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'ogrenme_alani','sos5-birlikte','Birlikte Yaşamak','5. sınıf Birlikte Yaşamak içeriği.',10,1 FROM dersler d WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'ogrenme_alani','sos5-dunya','Evimiz Dünya','5. sınıf Evimiz Dünya içeriği.',20,1 FROM dersler d WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'ogrenme_alani','sos5-miras','Ortak Mirasımız','5. sınıf Ortak Mirasımız içeriği.',30,1 FROM dersler d WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'ogrenme_alani','sos5-demokrasi','Yaşayan Demokrasimiz','5. sınıf Yaşayan Demokrasimiz içeriği.',40,1 FROM dersler d WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'ogrenme_alani','sos5-ekonomi','Hayatımızdaki Ekonomi','5. sınıf Hayatımızdaki Ekonomi içeriği.',50,1 FROM dersler d WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'ogrenme_alani','sos5-teknoloji','Teknoloji ve Sosyal Bilimler','5. sınıf Teknoloji ve Sosyal Bilimler içeriği.',60,1 FROM dersler d WHERE d.kod='sosyal' OR d.ad='Sosyal Bilgiler'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'theme','eng5-classroom','Classroom Life','5. sınıf Classroom Life içeriği.',10,1 FROM dersler d WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'theme','eng5-family','Family Life','5. sınıf Family Life içeriği.',20,1 FROM dersler d WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'theme','eng5-nature','Life in Nature','5. sınıf Life in Nature içeriği.',30,1 FROM dersler d WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'theme','eng5-city','Life in the Neighbourhood & City','5. sınıf Life in the Neighbourhood & City içeriği.',40,1 FROM dersler d WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'theme','eng5-future','Life in the Universe & Future','5. sınıf Life in the Universe & Future içeriği.',50,1 FROM dersler d WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'theme','eng5-world','Life in the World','5. sınıf Life in the World içeriği.',60,1 FROM dersler d WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'theme','eng5-personal','Personal Life','5. sınıf Personal Life içeriği.',70,1 FROM dersler d WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'theme','eng5-school','School Life','5. sınıf School Life içeriği.',80,1 FROM dersler d WHERE d.kod='ingilizce' OR d.ad='İngilizce'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'unite','din5-allah','Allah İnancı','5. sınıf Allah İnancı içeriği.',10,1 FROM dersler d WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'unite','din5-namaz','Namaz','5. sınıf Namaz içeriği.',20,1 FROM dersler d WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'unite','din5-kuran','Kur''an-ı Kerim','5. sınıf Kur''an-ı Kerim içeriği.',30,1 FROM dersler d WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'unite','din5-kissa','Peygamber Kıssaları','5. sınıf Peygamber Kıssaları içeriği.',40,1 FROM dersler d WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'unite','din5-mimari','Mimarimizde Dinî Motifler','5. sınıf Mimarimizde Dinî Motifler içeriği.',50,1 FROM dersler d WHERE d.kod='din' OR d.ad='Din Kültürü ve Ahlak Bilgisi'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','bt5-hayat','Bilişim Teknolojilerinin Hayatımızdaki Yeri','5. sınıf Bilişim Teknolojilerinin Hayatımızdaki Yeri içeriği.',10,1 FROM dersler d WHERE d.kod='bilisim' OR d.ad='Bilişim Teknolojileri ve Yazılım'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','bt5-urun','Dijital Ürün Tasarımı ve Geliştirme','5. sınıf Dijital Ürün Tasarımı ve Geliştirme içeriği.',20,1 FROM dersler d WHERE d.kod='bilisim' OR d.ad='Bilişim Teknolojileri ve Yazılım'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','bt5-ag','Bilgisayar Ağları ve İletişim','5. sınıf Bilgisayar Ağları ve İletişim içeriği.',30,1 FROM dersler d WHERE d.kod='bilisim' OR d.ad='Bilişim Teknolojileri ve Yazılım'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','bt5-etik','Bilişim Etiği ve Siber Güvenlik','5. sınıf Bilişim Etiği ve Siber Güvenlik içeriği.',40,1 FROM dersler d WHERE d.kod='bilisim' OR d.ad='Bilişim Teknolojileri ve Yazılım'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','bt5-ai','Yapay Zekâ','5. sınıf Yapay Zekâ içeriği.',50,1 FROM dersler d WHERE d.kod='bilisim' OR d.ad='Bilişim Teknolojileri ve Yazılım'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','bt5-kod','Yazılım Tasarımı ve Programlama','5. sınıf Yazılım Tasarımı ve Programlama içeriği.',60,1 FROM dersler d WHERE d.kod='bilisim' OR d.ad='Bilişim Teknolojileri ve Yazılım'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'beceri','gs5-uretme','Görsel Üretim ve Tasarım','5. sınıf Görsel Üretim ve Tasarım içeriği.',10,1 FROM dersler d WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'beceri','gs5-miras','Sanat ve Kültürel Miras','5. sınıf Sanat ve Kültürel Miras içeriği.',20,1 FROM dersler d WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'beceri','gs5-estetik','Sanat Eleştirisi ve Estetik','5. sınıf Sanat Eleştirisi ve Estetik içeriği.',30,1 FROM dersler d WHERE d.kod='gorsel' OR d.ad='Görsel Sanatlar'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'beceri','muz5-dinleme','Dinleme ve Söyleme','5. sınıf Dinleme ve Söyleme içeriği.',10,1 FROM dersler d WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'beceri','muz5-ritim','Müzik Dili ve Ritim','5. sınıf Müzik Dili ve Ritim içeriği.',20,1 FROM dersler d WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'beceri','muz5-yaratici','Müziksel Yaratıcılık','5. sınıf Müziksel Yaratıcılık içeriği.',30,1 FROM dersler d WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'beceri','muz5-kultur','Müzik Kültürü','5. sınıf Müzik Kültürü içeriği.',40,1 FROM dersler d WHERE d.kod='muzik' OR d.ad='Müzik'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','bes5-zindelik','Hareket ve Zindelik','5. sınıf Hareket ve Zindelik içeriği.',10,1 FROM dersler d WHERE d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','bes5-isbirligi','İş Birlikli Oyunlar','5. sınıf İş Birlikli Oyunlar içeriği.',20,1 FROM dersler d WHERE d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','bes5-oyun','Hayalimdeki Oyun','5. sınıf Hayalimdeki Oyun içeriği.',30,1 FROM dersler d WHERE d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','bes5-ritim','Hareketin Estetiği ve Ritmi','5. sınıf Hareketin Estetiği ve Ritmi içeriği.',40,1 FROM dersler d WHERE d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'tema','bes5-atletizm','Daha Hızlı, Daha Yükseğe, Daha Güçlü ve Birlikte','5. sınıf Daha Hızlı, Daha Yükseğe, Daha Güçlü ve Birlikte içeriği.',50,1 FROM dersler d WHERE d.kod='beden_spor' OR d.ad='Beden Eğitimi ve Spor'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'beceri','reh5-kendim','Kendimi Tanıyorum','5. sınıf Kendimi Tanıyorum içeriği.',10,1 FROM dersler d WHERE d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'beceri','reh5-hedef','Hedef ve Çalışma Becerileri','5. sınıf Hedef ve Çalışma Becerileri içeriği.',20,1 FROM dersler d WHERE d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'beceri','reh5-iliski','İletişim ve Akran İlişkileri','5. sınıf İletişim ve Akran İlişkileri içeriği.',30,1 FROM dersler d WHERE d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'beceri','reh5-guven','Güvenli ve Dengeli Yaşam','5. sınıf Güvenli ve Dengeli Yaşam içeriği.',40,1 FROM dersler d WHERE d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO ders_bolumleri (ders_id,kademe_kodu,sinif_seviyesi,tur,kod,ad,aciklama,sira,aktif)
SELECT d.id,'temel_egitim',5,'beceri','reh5-meslek','Meslek ve Gelecek Farkındalığı','5. sınıf Meslek ve Gelecek Farkındalığı içeriği.',50,1 FROM dersler d WHERE d.kod='rehberlik' OR d.ad='Rehberlik ve Yönlendirme'
ON DUPLICATE KEY UPDATE ad=VALUES(ad),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
