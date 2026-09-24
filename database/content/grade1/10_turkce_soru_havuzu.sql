SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-a','A Sesini Tanıyorum','A Sesini Tanıyorum','A sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Arı, Araba ve Ayna kelimelerini birlikte söyle.',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-guzel-davranislarimiz'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-n','N Sesini Tanıyorum','N Sesini Tanıyorum','N sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Nar, Nane ve Nine kelimelerini birlikte söyle.',101,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-guzel-davranislarimiz'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-e','E Sesini Tanıyorum','E Sesini Tanıyorum','E sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Elma, Ev ve Ekmek kelimelerini birlikte söyle.',102,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-guzel-davranislarimiz'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-t','T Sesini Tanıyorum','T Sesini Tanıyorum','T sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Top, Tavşan ve Tarak kelimelerini birlikte söyle.',103,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-guzel-davranislarimiz'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-i','İ Sesini Tanıyorum','İ Sesini Tanıyorum','İ sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','İp, İnek ve İncir kelimelerini birlikte söyle.',104,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-ataturk'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-l','L Sesini Tanıyorum','L Sesini Tanıyorum','L sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Limon, Lale ve Leylek kelimelerini birlikte söyle.',105,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-ataturk'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-o','O Sesini Tanıyorum','O Sesini Tanıyorum','O sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Okul, Orman ve Ocak kelimelerini birlikte söyle.',106,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-ataturk'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-k','K Sesini Tanıyorum','K Sesini Tanıyorum','K sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Kalem, Kedi ve Kitap kelimelerini birlikte söyle.',107,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-ataturk'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-u','U Sesini Tanıyorum','U Sesini Tanıyorum','U sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Uçak, Uzay ve Uyku kelimelerini birlikte söyle.',108,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-ataturk'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-r','R Sesini Tanıyorum','R Sesini Tanıyorum','R sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Resim, Renk ve Radyo kelimelerini birlikte söyle.',109,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-cevremizdeki-yasam'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-ı','I Sesini Tanıyorum','I Sesini Tanıyorum','I sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Irmak, Ispanak ve Ilık kelimelerini birlikte söyle.',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-cevremizdeki-yasam'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-m','M Sesini Tanıyorum','M Sesini Tanıyorum','M sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Masa, Muz ve Makas kelimelerini birlikte söyle.',111,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-cevremizdeki-yasam'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-ü','Ü Sesini Tanıyorum','Ü Sesini Tanıyorum','Ü sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Üzüm, Ütü ve Ülke kelimelerini birlikte söyle.',112,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-cevremizdeki-yasam'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-s','S Sesini Tanıyorum','S Sesini Tanıyorum','S sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Saat, Simit ve Sandalye kelimelerini birlikte söyle.',113,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-cevremizdeki-yasam'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-ö','Ö Sesini Tanıyorum','Ö Sesini Tanıyorum','Ö sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Ördek, Öğretmen ve Önlük kelimelerini birlikte söyle.',114,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-cevremizdeki-yasam'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-y','Y Sesini Tanıyorum','Y Sesini Tanıyorum','Y sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Yıldız, Yumurta ve Yaprak kelimelerini birlikte söyle.',115,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-cevremizdeki-yasam'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-d','D Sesini Tanıyorum','D Sesini Tanıyorum','D sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Dolap, Deniz ve Dondurma kelimelerini birlikte söyle.',116,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-cevremizdeki-yasam'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-z','Z Sesini Tanıyorum','Z Sesini Tanıyorum','Z sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Zil, Zeytin ve Zebra kelimelerini birlikte söyle.',117,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-cevremizdeki-yasam'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-ç','Ç Sesini Tanıyorum','Ç Sesini Tanıyorum','Ç sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Çanta, Çilek ve Çiçek kelimelerini birlikte söyle.',118,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-kitaplar'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-b','B Sesini Tanıyorum','B Sesini Tanıyorum','B sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Balık, Bebek ve Bardak kelimelerini birlikte söyle.',119,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-kitaplar'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-g','G Sesini Tanıyorum','G Sesini Tanıyorum','G sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Gemi, Güneş ve Gözlük kelimelerini birlikte söyle.',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-kitaplar'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-c','C Sesini Tanıyorum','C Sesini Tanıyorum','C sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Cam, Ceviz ve Ceket kelimelerini birlikte söyle.',121,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-kitaplar'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-ş','Ş Sesini Tanıyorum','Ş Sesini Tanıyorum','Ş sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Şapka, Şeker ve Şemsiye kelimelerini birlikte söyle.',122,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-kitaplar'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-p','P Sesini Tanıyorum','P Sesini Tanıyorum','P sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Patates, Pencere ve Portakal kelimelerini birlikte söyle.',123,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-kitaplar'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-h','H Sesini Tanıyorum','H Sesini Tanıyorum','H sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Havuç, Horoz ve Halı kelimelerini birlikte söyle.',124,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-kitaplar'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-v','V Sesini Tanıyorum','V Sesini Tanıyorum','V sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Vapur, Vişne ve Vazo kelimelerini birlikte söyle.',125,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-kitaplar'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-ğ','Ğ Sesini Tanıyorum','Ğ Sesini Tanıyorum','Ğ sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Dağ, Yağmur ve Soğuk kelimelerini birlikte söyle.',126,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-kitaplar'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-f','F Sesini Tanıyorum','F Sesini Tanıyorum','F sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Fil, Fırça ve Fare kelimelerini birlikte söyle.',127,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-kitaplar'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-harf-j','J Sesini Tanıyorum','J Sesini Tanıyorum','J sesini dinleyelim, harfini tanıyalım ve kelimelerde bulalım.','Jet, Jilet ve Jandarma kelimelerini birlikte söyle.',128,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-kitaplar'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-heceler','Heceleri Fark Ediyorum','Heceleri Fark Ediyorum','Kelimeleri söylerken oluşan ses gruplarına hece denir.','Kalem: ka-lem.',300,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-yetenekler'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-kelime-olusturma','Hecelerden Kelime Oluşturuyorum','Hecelerden Kelime Oluşturuyorum','Heceleri doğru sırada birleştirerek anlamlı kelimeler oluşturabiliriz.','ki + tap = kitap',310,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-yetenekler'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-cumle-noktalama','Cümleyi Anlıyor ve Noktalıyorum','Cümleyi Anlıyor ve Noktalıyorum','Cümleler anlamlı bir düşünce anlatır; uygun noktalama işaretiyle tamamlanır.','Bugün okula gittim.',320,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-minik-kasifler'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',1,'tr-okudugunu-anlama','Kısa Metni Anlıyorum','Kısa Metni Anlıyorum','Kısa metni dikkatle okuyup metindeki açık bilgileri ve ana düşünceyi buluruz.','Önce metni oku, sonra soruyu cevapla.',330,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=1 AND b.kod='tr-sorumluluklar'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-a-01','coktan_secmeli','“Arı” kelimesi hangi sesle başlar?','["A","L","M","Z"]',0,'Arı kelimesinin ilk sesi A sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-a' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-a-02','coktan_secmeli','“Araba” kelimesinin ilk sesi hangisidir?','["M","A","Z","L"]',1,'Araba kelimesini yavaşça söylediğimizde önce A sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-a' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-a-03','coktan_secmeli','Hangisi A sesiyle başlar?','["limon","masa","ayna","zil"]',2,'Ayna kelimesi A sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-a' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-a-04','coktan_secmeli','Büyük “A” harfinin küçük yazılışı hangisidir?','["l","m","z","a"]',3,'A harfinin küçük yazılışı “a” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-a' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-a-05','coktan_secmeli','“_rı” kelimesinin başına hangi harf gelirse “arı” olur?','["l","a","m","z"]',1,'Kelimenin başına a gelince “arı” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-a' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-a-06','coktan_secmeli','Hangisi A sesiyle başlamaz?','["arı","araba","limon","ayna"]',2,'Limon farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-a' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-n-01','coktan_secmeli','“Nar” kelimesi hangi sesle başlar?','["O","N","Ü","Ç"]',1,'Nar kelimesinin ilk sesi N sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-n' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-n-02','coktan_secmeli','“Nane” kelimesinin ilk sesi hangisidir?','["Ü","Ç","N","O"]',2,'Nane kelimesini yavaşça söylediğimizde önce N sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-n' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-n-03','coktan_secmeli','Hangisi N sesiyle başlar?','["okul","üzüm","çanta","nine"]',3,'Nine kelimesi N sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-n' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-n-04','coktan_secmeli','Büyük “N” harfinin küçük yazılışı hangisidir?','["n","o","ü","ç"]',0,'N harfinin küçük yazılışı “n” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-n' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-n-05','coktan_secmeli','“_ar” kelimesinin başına hangi harf gelirse “nar” olur?','["o","ü","n","ç"]',2,'Kelimenin başına n gelince “nar” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-n' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-n-06','coktan_secmeli','Hangisi N sesiyle başlamaz?','["nar","nane","nine","okul"]',3,'Okul farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-n' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-e-01','coktan_secmeli','“Elma” kelimesi hangi sesle başlar?','["K","S","E","B"]',2,'Elma kelimesinin ilk sesi E sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-e' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-e-02','coktan_secmeli','“Ev” kelimesinin ilk sesi hangisidir?','["S","B","K","E"]',3,'Ev kelimesini yavaşça söylediğimizde önce E sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-e' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-e-03','coktan_secmeli','Hangisi E sesiyle başlar?','["ekmek","kalem","saat","balık"]',0,'Ekmek kelimesi E sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-e' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-e-04','coktan_secmeli','Büyük “E” harfinin küçük yazılışı hangisidir?','["k","e","s","b"]',1,'E harfinin küçük yazılışı “e” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-e' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-e-05','coktan_secmeli','“_lma” kelimesinin başına hangi harf gelirse “elma” olur?','["k","s","b","e"]',3,'Kelimenin başına e gelince “elma” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-e' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-e-06','coktan_secmeli','Hangisi E sesiyle başlamaz?','["kalem","elma","ev","ekmek"]',0,'Kalem farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-e' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-t-01','coktan_secmeli','“Top” kelimesi hangi sesle başlar?','["U","Ö","G","T"]',3,'Top kelimesinin ilk sesi T sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-t' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-t-02','coktan_secmeli','“Tavşan” kelimesinin ilk sesi hangisidir?','["T","Ö","G","U"]',0,'Tavşan kelimesini yavaşça söylediğimizde önce T sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-t' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-t-03','coktan_secmeli','Hangisi T sesiyle başlar?','["uçak","tarak","ördek","gemi"]',1,'Tarak kelimesi T sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-t' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-t-04','coktan_secmeli','Büyük “T” harfinin küçük yazılışı hangisidir?','["u","ö","t","g"]',2,'T harfinin küçük yazılışı “t” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-t' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-t-05','coktan_secmeli','“_op” kelimesinin başına hangi harf gelirse “top” olur?','["t","u","ö","g"]',0,'Kelimenin başına t gelince “top” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-t' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-t-06','coktan_secmeli','Hangisi T sesiyle başlamaz?','["top","uçak","tavşan","tarak"]',1,'Uçak farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-t' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-i-01','coktan_secmeli','“İp” kelimesi hangi sesle başlar?','["İ","R","Y","C"]',0,'İp kelimesinin ilk sesi İ sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-i' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-i-02','coktan_secmeli','“İnek” kelimesinin ilk sesi hangisidir?','["Y","İ","C","R"]',1,'İnek kelimesini yavaşça söylediğimizde önce İ sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-i' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-i-03','coktan_secmeli','Hangisi İ sesiyle başlar?','["resim","yıldız","incir","cam"]',2,'İncir kelimesi İ sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-i' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-i-04','coktan_secmeli','Büyük “İ” harfinin küçük yazılışı hangisidir?','["r","y","c","i"]',3,'İ harfinin küçük yazılışı “i” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-i' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-i-05','coktan_secmeli','“_p” kelimesinin başına hangi harf gelirse “ip” olur?','["r","i","y","c"]',1,'Kelimenin başına i gelince “ip” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-i' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-i-06','coktan_secmeli','Hangisi İ sesiyle başlamaz?','["ip","inek","resim","incir"]',2,'Resim farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-i' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-l-01','coktan_secmeli','“Limon” kelimesi hangi sesle başlar?','["I","L","D","Ş"]',1,'Limon kelimesinin ilk sesi L sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-l' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-l-02','coktan_secmeli','“Lale” kelimesinin ilk sesi hangisidir?','["D","Ş","L","I"]',2,'Lale kelimesini yavaşça söylediğimizde önce L sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-l' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-l-03','coktan_secmeli','Hangisi L sesiyle başlar?','["ırmak","dolap","şapka","leylek"]',3,'Leylek kelimesi L sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-l' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-l-04','coktan_secmeli','Büyük “L” harfinin küçük yazılışı hangisidir?','["l","ı","d","ş"]',0,'L harfinin küçük yazılışı “l” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-l' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-l-05','coktan_secmeli','“_imon” kelimesinin başına hangi harf gelirse “limon” olur?','["ı","d","l","ş"]',2,'Kelimenin başına l gelince “limon” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-l' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-l-06','coktan_secmeli','Hangisi L sesiyle başlamaz?','["limon","lale","leylek","ırmak"]',3,'Irmak farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-l' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-o-01','coktan_secmeli','“Okul” kelimesi hangi sesle başlar?','["M","Z","O","P"]',2,'Okul kelimesinin ilk sesi O sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-o' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-o-02','coktan_secmeli','“Orman” kelimesinin ilk sesi hangisidir?','["Z","P","M","O"]',3,'Orman kelimesini yavaşça söylediğimizde önce O sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-o' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-o-03','coktan_secmeli','Hangisi O sesiyle başlar?','["ocak","masa","zil","patates"]',0,'Ocak kelimesi O sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-o' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-o-04','coktan_secmeli','Büyük “O” harfinin küçük yazılışı hangisidir?','["m","o","z","p"]',1,'O harfinin küçük yazılışı “o” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-o' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-o-05','coktan_secmeli','“_kul” kelimesinin başına hangi harf gelirse “okul” olur?','["m","z","p","o"]',3,'Kelimenin başına o gelince “okul” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-o' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-o-06','coktan_secmeli','Hangisi O sesiyle başlamaz?','["masa","okul","orman","ocak"]',0,'Masa farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-o' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-k-01','coktan_secmeli','“Kalem” kelimesi hangi sesle başlar?','["Ü","Ç","H","K"]',3,'Kalem kelimesinin ilk sesi K sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-k' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-k-02','coktan_secmeli','“Kedi” kelimesinin ilk sesi hangisidir?','["K","Ç","H","Ü"]',0,'Kedi kelimesini yavaşça söylediğimizde önce K sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-k' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-k-03','coktan_secmeli','Hangisi K sesiyle başlar?','["üzüm","kitap","çanta","havuç"]',1,'Kitap kelimesi K sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-k' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-k-04','coktan_secmeli','Büyük “K” harfinin küçük yazılışı hangisidir?','["ü","ç","k","h"]',2,'K harfinin küçük yazılışı “k” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-k' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-k-05','coktan_secmeli','“_alem” kelimesinin başına hangi harf gelirse “kalem” olur?','["k","ü","ç","h"]',0,'Kelimenin başına k gelince “kalem” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-k' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-k-06','coktan_secmeli','Hangisi K sesiyle başlamaz?','["kalem","üzüm","kedi","kitap"]',1,'Üzüm farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-k' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-u-01','coktan_secmeli','“Uçak” kelimesi hangi sesle başlar?','["U","S","B","V"]',0,'Uçak kelimesinin ilk sesi U sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-u' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-u-02','coktan_secmeli','“Uzay” kelimesinin ilk sesi hangisidir?','["B","U","V","S"]',1,'Uzay kelimesini yavaşça söylediğimizde önce U sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-u' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-u-03','coktan_secmeli','Hangisi U sesiyle başlar?','["saat","balık","uyku","vapur"]',2,'Uyku kelimesi U sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-u' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-u-04','coktan_secmeli','Büyük “U” harfinin küçük yazılışı hangisidir?','["s","b","v","u"]',3,'U harfinin küçük yazılışı “u” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-u' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-u-05','coktan_secmeli','“_çak” kelimesinin başına hangi harf gelirse “uçak” olur?','["s","u","b","v"]',1,'Kelimenin başına u gelince “uçak” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-u' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-u-06','coktan_secmeli','Hangisi U sesiyle başlamaz?','["uçak","uzay","saat","uyku"]',2,'Saat farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-u' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-r-01','coktan_secmeli','“Resim” kelimesi hangi sesle başlar?','["Ö","R","G","Ğ"]',1,'Resim kelimesinin ilk sesi R sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-r' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-r-02','coktan_secmeli','“Renk” kelimesinin ilk sesi hangisidir?','["G","Ğ","R","Ö"]',2,'Renk kelimesini yavaşça söylediğimizde önce R sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-r' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-r-03','coktan_secmeli','Hangisi R sesiyle başlar?','["ördek","gemi","dağ","radyo"]',3,'Radyo kelimesi R sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-r' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-r-04','coktan_secmeli','Büyük “R” harfinin küçük yazılışı hangisidir?','["r","ö","g","ğ"]',0,'R harfinin küçük yazılışı “r” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-r' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-r-05','coktan_secmeli','“_esim” kelimesinin başına hangi harf gelirse “resim” olur?','["ö","g","r","ğ"]',2,'Kelimenin başına r gelince “resim” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-r' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-r-06','coktan_secmeli','Hangisi R sesiyle başlamaz?','["resim","renk","radyo","ördek"]',3,'Ördek farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-r' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ı-01','coktan_secmeli','“Irmak” kelimesi hangi sesle başlar?','["Y","C","I","F"]',2,'Irmak kelimesinin ilk sesi I sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ı' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ı-02','coktan_secmeli','“Ispanak” kelimesinin ilk sesi hangisidir?','["C","F","Y","I"]',3,'Ispanak kelimesini yavaşça söylediğimizde önce I sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ı' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ı-03','coktan_secmeli','Hangisi I sesiyle başlar?','["ılık","yıldız","cam","fil"]',0,'Ilık kelimesi I sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ı' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ı-04','coktan_secmeli','Büyük “I” harfinin küçük yazılışı hangisidir?','["y","ı","c","f"]',1,'I harfinin küçük yazılışı “ı” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ı' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ı-05','coktan_secmeli','“_rmak” kelimesinin başına hangi harf gelirse “ırmak” olur?','["y","c","f","ı"]',3,'Kelimenin başına ı gelince “ırmak” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ı' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ı-06','coktan_secmeli','Hangisi I sesiyle başlamaz?','["yıldız","ırmak","ıspanak","ılık"]',0,'Yıldız farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ı' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-m-01','coktan_secmeli','“Masa” kelimesi hangi sesle başlar?','["D","Ş","J","M"]',3,'Masa kelimesinin ilk sesi M sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-m' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-m-02','coktan_secmeli','“Muz” kelimesinin ilk sesi hangisidir?','["M","Ş","J","D"]',0,'Muz kelimesini yavaşça söylediğimizde önce M sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-m' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-m-03','coktan_secmeli','Hangisi M sesiyle başlar?','["dolap","makas","şapka","jet"]',1,'Makas kelimesi M sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-m' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-m-04','coktan_secmeli','Büyük “M” harfinin küçük yazılışı hangisidir?','["d","ş","m","j"]',2,'M harfinin küçük yazılışı “m” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-m' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-m-05','coktan_secmeli','“_asa” kelimesinin başına hangi harf gelirse “masa” olur?','["m","d","ş","j"]',0,'Kelimenin başına m gelince “masa” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-m' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-m-06','coktan_secmeli','Hangisi M sesiyle başlamaz?','["masa","dolap","muz","makas"]',1,'Dolap farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-m' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ü-01','coktan_secmeli','“Üzüm” kelimesi hangi sesle başlar?','["Ü","Z","P","A"]',0,'Üzüm kelimesinin ilk sesi Ü sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ü' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ü-02','coktan_secmeli','“Ütü” kelimesinin ilk sesi hangisidir?','["P","Ü","A","Z"]',1,'Ütü kelimesini yavaşça söylediğimizde önce Ü sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ü' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ü-03','coktan_secmeli','Hangisi Ü sesiyle başlar?','["zil","patates","ülke","arı"]',2,'Ülke kelimesi Ü sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ü' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ü-04','coktan_secmeli','Büyük “Ü” harfinin küçük yazılışı hangisidir?','["z","p","a","ü"]',3,'Ü harfinin küçük yazılışı “ü” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ü' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ü-05','coktan_secmeli','“_züm” kelimesinin başına hangi harf gelirse “üzüm” olur?','["z","ü","p","a"]',1,'Kelimenin başına ü gelince “üzüm” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ü' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ü-06','coktan_secmeli','Hangisi Ü sesiyle başlamaz?','["üzüm","ütü","zil","ülke"]',2,'Zil farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ü' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-s-01','coktan_secmeli','“Saat” kelimesi hangi sesle başlar?','["Ç","S","H","N"]',1,'Saat kelimesinin ilk sesi S sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-s' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-s-02','coktan_secmeli','“Simit” kelimesinin ilk sesi hangisidir?','["H","N","S","Ç"]',2,'Simit kelimesini yavaşça söylediğimizde önce S sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-s' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-s-03','coktan_secmeli','Hangisi S sesiyle başlar?','["çanta","havuç","nar","sandalye"]',3,'Sandalye kelimesi S sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-s' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-s-04','coktan_secmeli','Büyük “S” harfinin küçük yazılışı hangisidir?','["s","ç","h","n"]',0,'S harfinin küçük yazılışı “s” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-s' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-s-05','coktan_secmeli','“_aat” kelimesinin başına hangi harf gelirse “saat” olur?','["ç","h","s","n"]',2,'Kelimenin başına s gelince “saat” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-s' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-s-06','coktan_secmeli','Hangisi S sesiyle başlamaz?','["saat","simit","sandalye","çanta"]',3,'Çanta farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-s' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ö-01','coktan_secmeli','“Ördek” kelimesi hangi sesle başlar?','["B","V","Ö","E"]',2,'Ördek kelimesinin ilk sesi Ö sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ö' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ö-02','coktan_secmeli','“Öğretmen” kelimesinin ilk sesi hangisidir?','["V","E","B","Ö"]',3,'Öğretmen kelimesini yavaşça söylediğimizde önce Ö sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ö' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ö-03','coktan_secmeli','Hangisi Ö sesiyle başlar?','["önlük","balık","vapur","elma"]',0,'Önlük kelimesi Ö sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ö' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ö-04','coktan_secmeli','Büyük “Ö” harfinin küçük yazılışı hangisidir?','["b","ö","v","e"]',1,'Ö harfinin küçük yazılışı “ö” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ö' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ö-05','coktan_secmeli','“_rdek” kelimesinin başına hangi harf gelirse “ördek” olur?','["b","v","e","ö"]',3,'Kelimenin başına ö gelince “ördek” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ö' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ö-06','coktan_secmeli','Hangisi Ö sesiyle başlamaz?','["balık","ördek","öğretmen","önlük"]',0,'Balık farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ö' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-y-01','coktan_secmeli','“Yıldız” kelimesi hangi sesle başlar?','["G","Ğ","T","Y"]',3,'Yıldız kelimesinin ilk sesi Y sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-y' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-y-02','coktan_secmeli','“Yumurta” kelimesinin ilk sesi hangisidir?','["Y","Ğ","T","G"]',0,'Yumurta kelimesini yavaşça söylediğimizde önce Y sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-y' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-y-03','coktan_secmeli','Hangisi Y sesiyle başlar?','["gemi","yaprak","dağ","top"]',1,'Yaprak kelimesi Y sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-y' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-y-04','coktan_secmeli','Büyük “Y” harfinin küçük yazılışı hangisidir?','["g","ğ","y","t"]',2,'Y harfinin küçük yazılışı “y” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-y' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-y-05','coktan_secmeli','“_ıldız” kelimesinin başına hangi harf gelirse “yıldız” olur?','["y","g","ğ","t"]',0,'Kelimenin başına y gelince “yıldız” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-y' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-y-06','coktan_secmeli','Hangisi Y sesiyle başlamaz?','["yıldız","gemi","yumurta","yaprak"]',1,'Gemi farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-y' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-d-01','coktan_secmeli','“Dolap” kelimesi hangi sesle başlar?','["D","C","F","İ"]',0,'Dolap kelimesinin ilk sesi D sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-d' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-d-02','coktan_secmeli','“Deniz” kelimesinin ilk sesi hangisidir?','["F","D","İ","C"]',1,'Deniz kelimesini yavaşça söylediğimizde önce D sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-d' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-d-03','coktan_secmeli','Hangisi D sesiyle başlar?','["cam","fil","dondurma","ip"]',2,'Dondurma kelimesi D sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-d' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-d-04','coktan_secmeli','Büyük “D” harfinin küçük yazılışı hangisidir?','["c","f","i","d"]',3,'D harfinin küçük yazılışı “d” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-d' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-d-05','coktan_secmeli','“_olap” kelimesinin başına hangi harf gelirse “dolap” olur?','["c","d","f","i"]',1,'Kelimenin başına d gelince “dolap” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-d' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-d-06','coktan_secmeli','Hangisi D sesiyle başlamaz?','["dolap","deniz","cam","dondurma"]',2,'Cam farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-d' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-z-01','coktan_secmeli','“Zil” kelimesi hangi sesle başlar?','["Ş","Z","J","L"]',1,'Zil kelimesinin ilk sesi Z sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-z' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-z-02','coktan_secmeli','“Zeytin” kelimesinin ilk sesi hangisidir?','["J","L","Z","Ş"]',2,'Zeytin kelimesini yavaşça söylediğimizde önce Z sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-z' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-z-03','coktan_secmeli','Hangisi Z sesiyle başlar?','["şapka","jet","limon","zebra"]',3,'Zebra kelimesi Z sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-z' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-z-04','coktan_secmeli','Büyük “Z” harfinin küçük yazılışı hangisidir?','["z","ş","j","l"]',0,'Z harfinin küçük yazılışı “z” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-z' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-z-05','coktan_secmeli','“_il” kelimesinin başına hangi harf gelirse “zil” olur?','["ş","j","z","l"]',2,'Kelimenin başına z gelince “zil” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-z' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-z-06','coktan_secmeli','Hangisi Z sesiyle başlamaz?','["zil","zeytin","zebra","şapka"]',3,'Şapka farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-z' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ç-01','coktan_secmeli','“Çanta” kelimesi hangi sesle başlar?','["P","A","Ç","O"]',2,'Çanta kelimesinin ilk sesi Ç sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ç' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ç-02','coktan_secmeli','“Çilek” kelimesinin ilk sesi hangisidir?','["A","O","P","Ç"]',3,'Çilek kelimesini yavaşça söylediğimizde önce Ç sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ç' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ç-03','coktan_secmeli','Hangisi Ç sesiyle başlar?','["çiçek","patates","arı","okul"]',0,'Çiçek kelimesi Ç sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ç' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ç-04','coktan_secmeli','Büyük “Ç” harfinin küçük yazılışı hangisidir?','["p","ç","a","o"]',1,'Ç harfinin küçük yazılışı “ç” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ç' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ç-05','coktan_secmeli','“_anta” kelimesinin başına hangi harf gelirse “çanta” olur?','["p","a","o","ç"]',3,'Kelimenin başına ç gelince “çanta” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ç' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ç-06','coktan_secmeli','Hangisi Ç sesiyle başlamaz?','["patates","çanta","çilek","çiçek"]',0,'Patates farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ç' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-b-01','coktan_secmeli','“Balık” kelimesi hangi sesle başlar?','["H","N","K","B"]',3,'Balık kelimesinin ilk sesi B sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-b' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-b-02','coktan_secmeli','“Bebek” kelimesinin ilk sesi hangisidir?','["B","N","K","H"]',0,'Bebek kelimesini yavaşça söylediğimizde önce B sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-b' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-b-03','coktan_secmeli','Hangisi B sesiyle başlar?','["havuç","bardak","nar","kalem"]',1,'Bardak kelimesi B sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-b' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-b-04','coktan_secmeli','Büyük “B” harfinin küçük yazılışı hangisidir?','["h","n","b","k"]',2,'B harfinin küçük yazılışı “b” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-b' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-b-05','coktan_secmeli','“_alık” kelimesinin başına hangi harf gelirse “balık” olur?','["b","h","n","k"]',0,'Kelimenin başına b gelince “balık” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-b' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-b-06','coktan_secmeli','Hangisi B sesiyle başlamaz?','["balık","havuç","bebek","bardak"]',1,'Havuç farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-b' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-g-01','coktan_secmeli','“Gemi” kelimesi hangi sesle başlar?','["G","V","E","U"]',0,'Gemi kelimesinin ilk sesi G sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-g' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-g-02','coktan_secmeli','“Güneş” kelimesinin ilk sesi hangisidir?','["E","G","U","V"]',1,'Güneş kelimesini yavaşça söylediğimizde önce G sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-g' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-g-03','coktan_secmeli','Hangisi G sesiyle başlar?','["vapur","elma","gözlük","uçak"]',2,'Gözlük kelimesi G sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-g' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-g-04','coktan_secmeli','Büyük “G” harfinin küçük yazılışı hangisidir?','["v","e","u","g"]',3,'G harfinin küçük yazılışı “g” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-g' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-g-05','coktan_secmeli','“_emi” kelimesinin başına hangi harf gelirse “gemi” olur?','["v","g","e","u"]',1,'Kelimenin başına g gelince “gemi” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-g' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-g-06','coktan_secmeli','Hangisi G sesiyle başlamaz?','["gemi","güneş","vapur","gözlük"]',2,'Vapur farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-g' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-c-01','coktan_secmeli','“Cam” kelimesi hangi sesle başlar?','["Ğ","C","T","R"]',1,'Cam kelimesinin ilk sesi C sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-c' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-c-02','coktan_secmeli','“Ceviz” kelimesinin ilk sesi hangisidir?','["T","R","C","Ğ"]',2,'Ceviz kelimesini yavaşça söylediğimizde önce C sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-c' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-c-03','coktan_secmeli','Hangisi C sesiyle başlar?','["dağ","top","resim","ceket"]',3,'Ceket kelimesi C sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-c' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-c-04','coktan_secmeli','Büyük “C” harfinin küçük yazılışı hangisidir?','["c","ğ","t","r"]',0,'C harfinin küçük yazılışı “c” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-c' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-c-05','coktan_secmeli','“_am” kelimesinin başına hangi harf gelirse “cam” olur?','["ğ","t","c","r"]',2,'Kelimenin başına c gelince “cam” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-c' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-c-06','coktan_secmeli','Hangisi C sesiyle başlamaz?','["cam","ceviz","ceket","dağ"]',3,'Dağ farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-c' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ş-01','coktan_secmeli','“Şapka” kelimesi hangi sesle başlar?','["F","İ","Ş","I"]',2,'Şapka kelimesinin ilk sesi Ş sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ş' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ş-02','coktan_secmeli','“Şeker” kelimesinin ilk sesi hangisidir?','["İ","I","F","Ş"]',3,'Şeker kelimesini yavaşça söylediğimizde önce Ş sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ş' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ş-03','coktan_secmeli','Hangisi Ş sesiyle başlar?','["şemsiye","fil","ip","ırmak"]',0,'Şemsiye kelimesi Ş sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ş' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ş-04','coktan_secmeli','Büyük “Ş” harfinin küçük yazılışı hangisidir?','["f","ş","i","ı"]',1,'Ş harfinin küçük yazılışı “ş” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ş' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ş-05','coktan_secmeli','“_apka” kelimesinin başına hangi harf gelirse “şapka” olur?','["f","i","ı","ş"]',3,'Kelimenin başına ş gelince “şapka” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ş' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ş-06','coktan_secmeli','Hangisi Ş sesiyle başlamaz?','["fil","şapka","şeker","şemsiye"]',0,'Fil farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ş' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-p-01','coktan_secmeli','“Patates” kelimesi hangi sesle başlar?','["J","L","M","P"]',3,'Patates kelimesinin ilk sesi P sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-p' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-p-02','coktan_secmeli','“Pencere” kelimesinin ilk sesi hangisidir?','["P","L","M","J"]',0,'Pencere kelimesini yavaşça söylediğimizde önce P sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-p' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-p-03','coktan_secmeli','Hangisi P sesiyle başlar?','["jet","portakal","limon","masa"]',1,'Portakal kelimesi P sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-p' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-p-04','coktan_secmeli','Büyük “P” harfinin küçük yazılışı hangisidir?','["j","l","p","m"]',2,'P harfinin küçük yazılışı “p” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-p' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-p-05','coktan_secmeli','“_atates” kelimesinin başına hangi harf gelirse “patates” olur?','["p","j","l","m"]',0,'Kelimenin başına p gelince “patates” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-p' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-p-06','coktan_secmeli','Hangisi P sesiyle başlamaz?','["patates","jet","pencere","portakal"]',1,'Jet farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-p' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-h-01','coktan_secmeli','“Havuç” kelimesi hangi sesle başlar?','["H","A","O","Ü"]',0,'Havuç kelimesinin ilk sesi H sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-h' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-h-02','coktan_secmeli','“Horoz” kelimesinin ilk sesi hangisidir?','["O","H","Ü","A"]',1,'Horoz kelimesini yavaşça söylediğimizde önce H sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-h' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-h-03','coktan_secmeli','Hangisi H sesiyle başlar?','["arı","okul","halı","üzüm"]',2,'Halı kelimesi H sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-h' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-h-04','coktan_secmeli','Büyük “H” harfinin küçük yazılışı hangisidir?','["a","o","ü","h"]',3,'H harfinin küçük yazılışı “h” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-h' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-h-05','coktan_secmeli','“_avuç” kelimesinin başına hangi harf gelirse “havuç” olur?','["a","h","o","ü"]',1,'Kelimenin başına h gelince “havuç” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-h' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-h-06','coktan_secmeli','Hangisi H sesiyle başlamaz?','["havuç","horoz","arı","halı"]',2,'Arı farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-h' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-v-01','coktan_secmeli','“Vapur” kelimesi hangi sesle başlar?','["N","V","K","S"]',1,'Vapur kelimesinin ilk sesi V sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-v' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-v-02','coktan_secmeli','“Vişne” kelimesinin ilk sesi hangisidir?','["K","S","V","N"]',2,'Vişne kelimesini yavaşça söylediğimizde önce V sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-v' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-v-03','coktan_secmeli','Hangisi V sesiyle başlar?','["nar","kalem","saat","vazo"]',3,'Vazo kelimesi V sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-v' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-v-04','coktan_secmeli','Büyük “V” harfinin küçük yazılışı hangisidir?','["v","n","k","s"]',0,'V harfinin küçük yazılışı “v” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-v' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-v-05','coktan_secmeli','“_apur” kelimesinin başına hangi harf gelirse “vapur” olur?','["n","k","v","s"]',2,'Kelimenin başına v gelince “vapur” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-v' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-v-06','coktan_secmeli','Hangisi V sesiyle başlamaz?','["vapur","vişne","vazo","nar"]',3,'Nar farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-v' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ğ-01','coktan_secmeli','Hangisinde “ğ” harfi vardır?','["dağ","masa","top","elma"]',0,'Dağ kelimesinde ğ harfi vardır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ğ' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ğ-02','coktan_secmeli','“ya_mur” kelimesindeki boşluğa hangi harf gelmelidir?','["ğ","g","y","m"]',0,'Yağmur kelimesinde a ile m arasında ğ bulunur.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ğ' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ğ-03','coktan_secmeli','Hangisinde “ğ” sesi kelimenin içinde bulunur?','["soğuk","simit","kalem","çanta"]',0,'Soğuk kelimesinde ğ harfi vardır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ğ' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ğ-04','coktan_secmeli','Büyük “Ğ” harfinin küçük yazılışı hangisidir?','["g","ğ","y","h"]',1,'Ğ harfinin küçük yazılışı ğ''dir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ğ' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ğ-05','coktan_secmeli','“da_” kelimesini tamamlayan harf hangisidir?','["g","y","ğ","k"]',2,'Dağ kelimesinin sonunda ğ harfi vardır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ğ' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-ğ-06','coktan_secmeli','Hangisinde “ğ” harfi yoktur?','["yağmur","dağ","soğuk","masa"]',3,'Masa kelimesinde ğ harfi yoktur.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-ğ' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-f-01','coktan_secmeli','“Fil” kelimesi hangi sesle başlar?','["T","R","Y","F"]',3,'Fil kelimesinin ilk sesi F sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-f' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-f-02','coktan_secmeli','“Fırça” kelimesinin ilk sesi hangisidir?','["F","R","Y","T"]',0,'Fırça kelimesini yavaşça söylediğimizde önce F sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-f' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-f-03','coktan_secmeli','Hangisi F sesiyle başlar?','["top","fare","resim","yıldız"]',1,'Fare kelimesi F sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-f' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-f-04','coktan_secmeli','Büyük “F” harfinin küçük yazılışı hangisidir?','["t","r","f","y"]',2,'F harfinin küçük yazılışı “f” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-f' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-f-05','coktan_secmeli','“_il” kelimesinin başına hangi harf gelirse “fil” olur?','["f","t","r","y"]',0,'Kelimenin başına f gelince “fil” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-f' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-f-06','coktan_secmeli','Hangisi F sesiyle başlamaz?','["fil","top","fırça","fare"]',1,'Top farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-f' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-j-01','coktan_secmeli','“Jet” kelimesi hangi sesle başlar?','["J","İ","I","D"]',0,'Jet kelimesinin ilk sesi J sesidir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-j' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-j-02','coktan_secmeli','“Jilet” kelimesinin ilk sesi hangisidir?','["I","J","D","İ"]',1,'Jilet kelimesini yavaşça söylediğimizde önce J sesini duyarız.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-j' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-j-03','coktan_secmeli','Hangisi J sesiyle başlar?','["ip","ırmak","jandarma","dolap"]',2,'Jandarma kelimesi J sesiyle başlar.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-j' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-j-04','coktan_secmeli','Büyük “J” harfinin küçük yazılışı hangisidir?','["i","ı","d","j"]',3,'J harfinin küçük yazılışı “j” şeklindedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-j' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-j-05','coktan_secmeli','“_et” kelimesinin başına hangi harf gelirse “jet” olur?','["i","j","ı","d"]',1,'Kelimenin başına j gelince “jet” oluşur.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-j' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-harf-j-06','coktan_secmeli','Hangisi J sesiyle başlamaz?','["jet","jilet","ip","jandarma"]',2,'İp farklı bir sesle başlar.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-harf-j' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-1','coktan_secmeli','“Kalem” kelimesi kaç hecedir?','["2","1","3","4"]',0,'Kalem kelimesini ka-lem diye ayırırız; 2 hecedir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-2','coktan_secmeli','“Masa” kelimesi kaç hecedir?','["1","2","3","4"]',1,'Masa kelimesini ma-sa diye ayırırız; 2 hecedir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-3','coktan_secmeli','“Araba” kelimesi kaç hecedir?','["1","2","3","4"]',2,'Araba kelimesini a-ra-ba diye ayırırız; 3 hecedir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-4','coktan_secmeli','“Kitap” kelimesi kaç hecedir?','["1","3","4","2"]',3,'Kitap kelimesini ki-tap diye ayırırız; 2 hecedir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-5','coktan_secmeli','“Okul” kelimesi kaç hecedir?','["2","1","3","4"]',0,'Okul kelimesini o-kul diye ayırırız; 2 hecedir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-6','coktan_secmeli','“Papatya” kelimesi kaç hecedir?','["1","3","2","4"]',1,'Papatya kelimesini pa-pat-ya diye ayırırız; 3 hecedir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-7','coktan_secmeli','“Elma” kelimesi kaç hecedir?','["1","3","2","4"]',2,'Elma kelimesini el-ma diye ayırırız; 2 hecedir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-8','coktan_secmeli','“Kelebek” kelimesi kaç hecedir?','["1","2","4","3"]',3,'Kelebek kelimesini ke-le-bek diye ayırırız; 3 hecedir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-9','coktan_secmeli','“Çilek” kelimesi kaç hecedir?','["2","1","3","4"]',0,'Çilek kelimesini çi-lek diye ayırırız; 2 hecedir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-10','coktan_secmeli','“Yumurta” kelimesi kaç hecedir?','["1","3","2","4"]',1,'Yumurta kelimesini yu-mur-ta diye ayırırız; 3 hecedir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-11','coktan_secmeli','“Telefon” kelimesi kaç hecedir?','["1","2","3","4"]',2,'Telefon kelimesini te-le-fon diye ayırırız; 3 hecedir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-12','coktan_secmeli','“Bardak” kelimesi kaç hecedir?','["1","3","4","2"]',3,'Bardak kelimesini bar-dak diye ayırırız; 2 hecedir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-13','coktan_secmeli','“Oyuncak” kelimesi kaç hecedir?','["3","1","2","4"]',0,'Oyuncak kelimesini o-yun-cak diye ayırırız; 3 hecedir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-14','coktan_secmeli','“Öğrenci” kelimesi kaç hecedir?','["1","3","2","4"]',1,'Öğrenci kelimesini öğ-ren-ci diye ayırırız; 3 hecedir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-15','coktan_secmeli','“Portakal” kelimesi kaç hecedir?','["1","2","3","4"]',2,'Portakal kelimesini por-ta-kal diye ayırırız; 3 hecedir.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-16','coktan_secmeli','“Su” kelimesi kaç hecedir?','["2","3","4","1"]',3,'Su kelimesini su diye ayırırız; 1 hecedir.',2,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-17','coktan_secmeli','“At” kelimesi kaç hecedir?','["1","2","3","4"]',0,'At kelimesini at diye ayırırız; 1 hecedir.',2,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-18','coktan_secmeli','“Bilgisayar” kelimesi kaç hecedir?','["1","4","2","3"]',1,'Bilgisayar kelimesini bil-gi-sa-yar diye ayırırız; 4 hecedir.',2,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-19','coktan_secmeli','“Karpuz” kelimesi kaç hecedir?','["1","3","2","4"]',2,'Karpuz kelimesini kar-puz diye ayırırız; 2 hecedir.',2,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-hece-20','coktan_secmeli','“Domates” kelimesi kaç hecedir?','["1","2","4","3"]',3,'Domates kelimesini do-ma-tes diye ayırırız; 3 hecedir.',2,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-heceler' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-birlestir-1','coktan_secmeli','“ki + tap” birleşince hangi kelime oluşur?','["kapı","kitap","takip","kita"]',1,'ki ve tap heceleri birleşince “kitap” kelimesi oluşur.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-kelime-olusturma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-birlestir-2','coktan_secmeli','“ka + lem” birleşince hangi kelime oluşur?','["kale","alem","kalem","kelam"]',2,'ka ve lem heceleri birleşince “kalem” kelimesi oluşur.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-kelime-olusturma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-birlestir-3','coktan_secmeli','“o + kul” birleşince hangi kelime oluşur?','["oluk","okur","koku","okul"]',3,'o ve kul heceleri birleşince “okul” kelimesi oluşur.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-kelime-olusturma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-birlestir-4','coktan_secmeli','“el + ma” birleşince hangi kelime oluşur?','["elma","alem","lale","masa"]',0,'el ve ma heceleri birleşince “elma” kelimesi oluşur.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-kelime-olusturma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-birlestir-5','coktan_secmeli','“ba + lık” birleşince hangi kelime oluşur?','["bal","balık","ılık","kalıp"]',1,'ba ve lık heceleri birleşince “balık” kelimesi oluşur.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-kelime-olusturma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-birlestir-6','coktan_secmeli','“çi + lek” birleşince hangi kelime oluşur?','["çiçek","leke","çilek","çelik"]',2,'çi ve lek heceleri birleşince “çilek” kelimesi oluşur.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-kelime-olusturma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-birlestir-7','coktan_secmeli','“yağ + mur” birleşince hangi kelime oluşur?','["yağ","umur","murya","yağmur"]',3,'yağ ve mur heceleri birleşince “yağmur” kelimesi oluşur.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-kelime-olusturma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-birlestir-8','coktan_secmeli','“pa + sta” birleşince hangi kelime oluşur?','["pasta","masa","pata","sapta"]',0,'pa ve sta heceleri birleşince “pasta” kelimesi oluşur.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-kelime-olusturma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-birlestir-9','coktan_secmeli','“por + ta” birleşince hangi kelime oluşur?','["port","porta","orta","pota"]',1,'por ve ta heceleri birleşince “porta” kelimesi oluşur.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-kelime-olusturma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-birlestir-10','coktan_secmeli','“de + niz” birleşince hangi kelime oluşur?','["dizi","izne","deniz","nizde"]',2,'de ve niz heceleri birleşince “deniz” kelimesi oluşur.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-kelime-olusturma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-birlestir-11','coktan_secmeli','“o + yun” birleşince hangi kelime oluşur?','["uyun","yon","oy","oyun"]',3,'o ve yun heceleri birleşince “oyun” kelimesi oluşur.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-kelime-olusturma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-birlestir-12','coktan_secmeli','“ka + pı” birleşince hangi kelime oluşur?','["kapı","kapi","pakı","kıpı"]',0,'ka ve pı heceleri birleşince “kapı” kelimesi oluşur.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-kelime-olusturma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-birlestir-13','coktan_secmeli','“sa + at” birleşince hangi kelime oluşur?','["sat","saat","asa","taas"]',1,'sa ve at heceleri birleşince “saat” kelimesi oluşur.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-kelime-olusturma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-birlestir-14','coktan_secmeli','“ba + lon” birleşince hangi kelime oluşur?','["balo","lonba","balon","bolan"]',2,'ba ve lon heceleri birleşince “balon” kelimesi oluşur.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-kelime-olusturma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-birlestir-15','coktan_secmeli','“çi + çek” birleşince hangi kelime oluşur?','["çeki","çekçi","çiçe","çiçek"]',3,'çi ve çek heceleri birleşince “çiçek” kelimesi oluşur.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-kelime-olusturma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-birlestir-16','coktan_secmeli','“yu + va” birleşince hangi kelime oluşur?','["yuva","yuvaç","vayu","yav"]',0,'yu ve va heceleri birleşince “yuva” kelimesi oluşur.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-kelime-olusturma' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-1','coktan_secmeli','Hangisi anlamlı bir cümledir?','["Ali top oynadı.","Top Ali kırmızı.","Oynadı top Ali.","Ali topun."]',0,'“Ali top oynadı.” anlamlı ve doğru sıralanmış bir cümledir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-2','coktan_secmeli','“Bugün okula gittim__” sonuna hangisi gelmelidir?','[".",",","?","!"]',0,'Bilgi veren cümlenin sonuna nokta gelir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-3','coktan_secmeli','“Senin adın ne__” sonuna hangisi gelmelidir?','[".","?",",","!"]',1,'Soru cümlesinin sonuna soru işareti gelir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-4','coktan_secmeli','Hangisi doğru yazılmıştır?','["ece parka gitti.","Ece parka gitti.","ece Parka gitti.","ECE parka gitti."]',1,'Kişi adı ve cümlenin ilk harfi büyük yazılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-5','coktan_secmeli','“Kedi süt içti.” cümlesinde kim süt içti?','["Kedi","Süt","İçti","Bardak"]',0,'Süt içen varlık kedidir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-6','coktan_secmeli','“Mert bahçede koşuyor.” Mert nerede?','["Evde","Bahçede","Okulda","Markette"]',1,'Cümlede Mert''in bahçede olduğu söyleniyor.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-7','coktan_secmeli','“Ela kırmızı kalemi aldı.” Kalem hangi renktir?','["Mavi","Yeşil","Kırmızı","Sarı"]',2,'Kalemin kırmızı olduğu belirtiliyor.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-8','coktan_secmeli','Hangisi soru cümlesidir?','["Bugün hava güzel.","Saat kaç?","Ece kitap okudu.","Top kırmızıdır."]',1,'“Saat kaç?” bir soru sorar.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-9','coktan_secmeli','Hangisinin sonuna nokta gelir?','["Nereye gidiyorsun","Bugün ders çalıştım","Kaç yaşındasın","Bu kimin kalemi"]',1,'“Bugün ders çalıştım.” bilgi veren bir cümledir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-10','coktan_secmeli','Hangisi kişi adıdır?','["masa","Deniz","kalem","okul"]',1,'Deniz bir kişi adı olarak kullanılmıştır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-11','coktan_secmeli','“Ayşe elma yedi.” Ayşe ne yedi?','["Armut","Elma","Ekmek","Muz"]',1,'Cümlede Ayşe''nin elma yediği söyleniyor.',2,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-12','coktan_secmeli','“Can sabah okula yürüdü.” Can ne zaman yürüdü?','["Sabah","Akşam","Gece","Öğlen"]',0,'Cümlede zaman olarak sabah belirtiliyor.',2,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-13','coktan_secmeli','Hangisi büyük harfle başlamalıdır?','["ankara","masa","kalem","sandalye"]',0,'Şehir adı olan Ankara büyük harfle başlar.',2,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-14','coktan_secmeli','“Bugün yağmur yağıyor__” uygun işaret hangisidir?','["?","!",".",","]',2,'Bilgi veren cümle nokta ile biter.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-15','coktan_secmeli','“Ne güzel bir resim__” uygun işaret hangisidir?','["!","?",".",","]',0,'Duygu bildiren bu cümlede ünlem kullanılabilir.',2,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-16','coktan_secmeli','Hangisi kelimeleri doğru sıraya koyar?','["okudu Ece kitap","Ece kitap okudu","kitap okudu Ece mi","okudu kitap"]',1,'“Ece kitap okudu.” doğru sıralanmıştır.',2,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-17','coktan_secmeli','“Ali mavi çantasını aldı.” Çanta hangi renktir?','["Sarı","Yeşil","Mavi","Kırmızı"]',2,'Cümlede çantanın mavi olduğu yazıyor.',2,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-18','coktan_secmeli','“Kuş ağacın dalında ötüyor.” Kuş nerede?','["Yerde","Dalda","Suda","Evde"]',1,'Kuş ağacın dalındadır.',2,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-19','coktan_secmeli','Hangisi bir cümledir?','["Kırmızı top","Bahçedeki","Mert güldü.","Çok güzel"]',2,'“Mert güldü.” bir düşünceyi tamamlar.',2,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-cumle-20','coktan_secmeli','“Öğretmen sınıfa girdi.” Kim sınıfa girdi?','["Öğretmen","Öğrenci","Veli","Müdür"]',0,'Cümlede sınıfa giren kişi öğretmendir.',2,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-cumle-noktalama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-1','coktan_secmeli','Mert''in Bahçesi: Mert ne renk top aldı?','["Mavi","Kırmızı","Sarı","Yeşil"]',1,'Mert sabah kırmızı topunu aldı. Bahçeye çıktı. Arkadaşı Can ile top oynadı. Sonra birlikte su içtiler. Metinde kırmızı top deniyor.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-2','coktan_secmeli','Mert''in Bahçesi: Mert nereye çıktı?','["Okula","Markete","Kütüphaneye","Bahçeye"]',3,'Mert sabah kırmızı topunu aldı. Bahçeye çıktı. Arkadaşı Can ile top oynadı. Sonra birlikte su içtiler. Mert bahçeye çıktı.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-3','coktan_secmeli','Mert''in Bahçesi: Mert kiminle oynadı?','["Ece","Can","Ali","Ayşe"]',1,'Mert sabah kırmızı topunu aldı. Bahçeye çıktı. Arkadaşı Can ile top oynadı. Sonra birlikte su içtiler. Arkadaşı Can ile oynadı.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-4','coktan_secmeli','Mert''in Bahçesi: Çocuklar ne oynadı?','["Satranç","Seksek","Saklambaç","Top"]',3,'Mert sabah kırmızı topunu aldı. Bahçeye çıktı. Arkadaşı Can ile top oynadı. Sonra birlikte su içtiler. Metinde top oynadıkları yazıyor.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-5','coktan_secmeli','Mert''in Bahçesi: Oyundan sonra ne yaptılar?','["Uyudular","Su içtiler","Kitap okudular","Eve koştular"]',1,'Mert sabah kırmızı topunu aldı. Bahçeye çıktı. Arkadaşı Can ile top oynadı. Sonra birlikte su içtiler. Oyundan sonra su içtiler.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-6','coktan_secmeli','Ece''nin Görevi: Ece''nin görevi neydi?','["Bahçe görevlisi","Sınıf başkanı","Kitaplık görevlisi","Servis görevlisi"]',2,'Ece sınıfta kitaplık görevlisiydi. Dağılan kitapları topladı. Kitapları boylarına göre düzenledi. İşini bitirince öğretmenine haber verdi. Ece kitaplık görevlisiydi.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-7','coktan_secmeli','Ece''nin Görevi: Ece neyi topladı?','["Kitapları","Topları","Kalemleri","Oyuncakları"]',0,'Ece sınıfta kitaplık görevlisiydi. Dağılan kitapları topladı. Kitapları boylarına göre düzenledi. İşini bitirince öğretmenine haber verdi. Dağılan kitapları topladı.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-8','coktan_secmeli','Ece''nin Görevi: Kitapları nasıl düzenledi?','["Fiyatlarına göre","Sahiplerine göre","Boylarına göre","Renklerine göre"]',2,'Ece sınıfta kitaplık görevlisiydi. Dağılan kitapları topladı. Kitapları boylarına göre düzenledi. İşini bitirince öğretmenine haber verdi. Kitapları boylarına göre düzenledi.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-9','coktan_secmeli','Ece''nin Görevi: İşi bitince kime haber verdi?','["Öğretmenine","Komşusuna","Doktora","Şoföre"]',0,'Ece sınıfta kitaplık görevlisiydi. Dağılan kitapları topladı. Kitapları boylarına göre düzenledi. İşini bitirince öğretmenine haber verdi. Öğretmenine haber verdi.',2,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-10','coktan_secmeli','Ece''nin Görevi: Ece''nin davranışı hangisine örnektir?','["İsraf","Dikkatsizlik","Sorumluluk","Sabırsızlık"]',2,'Ece sınıfta kitaplık görevlisiydi. Dağılan kitapları topladı. Kitapları boylarına göre düzenledi. İşini bitirince öğretmenine haber verdi. Görevini tamamlamak sorumluluktur.',2,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-11','coktan_secmeli','Küçük Tohum: Ada ne ekti?','["Elma ağacı","Çiçek soğanı","Çim","Fasulye tohumu"]',3,'Ada bir fasulye tohumu ekti. Saksıyı pencerenin yanına koydu. Her gün az miktarda su verdi. Birkaç gün sonra küçük bir filiz çıktı. Ada fasulye tohumu ekti.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-12','coktan_secmeli','Küçük Tohum: Saksıyı nereye koydu?','["Dolabın içine","Pencerenin yanına","Yatağın altına","Kapının dışına"]',1,'Ada bir fasulye tohumu ekti. Saksıyı pencerenin yanına koydu. Her gün az miktarda su verdi. Birkaç gün sonra küçük bir filiz çıktı. Saksı pencerenin yanına kondu.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-13','coktan_secmeli','Küçük Tohum: Ada tohumu nasıl suladı?','["Hiç sulamadı","Bir defada çok fazla","Ayda bir","Her gün az miktarda"]',3,'Ada bir fasulye tohumu ekti. Saksıyı pencerenin yanına koydu. Her gün az miktarda su verdi. Birkaç gün sonra küçük bir filiz çıktı. Her gün az miktarda su verdi.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-14','coktan_secmeli','Küçük Tohum: Birkaç gün sonra ne çıktı?','["Meyve","Filiz","Taş","Oyuncak"]',1,'Ada bir fasulye tohumu ekti. Saksıyı pencerenin yanına koydu. Her gün az miktarda su verdi. Birkaç gün sonra küçük bir filiz çıktı. Küçük bir filiz çıktı.',2,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-15','coktan_secmeli','Küçük Tohum: Metin en çok neyi anlatıyor?','["Bir oyunu","Bir geziyi","Bir yemeği","Bir tohumun bakımını"]',3,'Ada bir fasulye tohumu ekti. Saksıyı pencerenin yanına koydu. Her gün az miktarda su verdi. Birkaç gün sonra küçük bir filiz çıktı. Metin tohum ekme ve bakımını anlatıyor.',2,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-16','coktan_secmeli','Kütüphane Günü: Sınıf nereye gitti?','["Kütüphaneye","Parka","Müzeye","Hastaneye"]',0,'Sınıf kütüphaneye gitti. Zeynep hayvanlarla ilgili bir kitap seçti. Sessizce masaya oturdu ve kitabı inceledi. Çıkarken kitabı görevliye teslim etti. Sınıf kütüphaneye gitti.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-17','coktan_secmeli','Kütüphane Günü: Zeynep nasıl bir kitap seçti?','["Uzayla ilgili","Yemeklerle ilgili","Hayvanlarla ilgili","Taşıtlarla ilgili"]',2,'Sınıf kütüphaneye gitti. Zeynep hayvanlarla ilgili bir kitap seçti. Sessizce masaya oturdu ve kitabı inceledi. Çıkarken kitabı görevliye teslim etti. Hayvanlarla ilgili kitap seçti.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-18','coktan_secmeli','Kütüphane Günü: Zeynep masada nasıl davrandı?','["Sessizce oturdu","Bağırdı","Koştu","Şarkı söyledi"]',0,'Sınıf kütüphaneye gitti. Zeynep hayvanlarla ilgili bir kitap seçti. Sessizce masaya oturdu ve kitabı inceledi. Çıkarken kitabı görevliye teslim etti. Kütüphanede sessizce oturdu.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-19','coktan_secmeli','Kütüphane Günü: Çıkarken kitabı kime verdi?','["Arkadaşına","Şoföre","Görevliye","Doktora"]',2,'Sınıf kütüphaneye gitti. Zeynep hayvanlarla ilgili bir kitap seçti. Sessizce masaya oturdu ve kitabı inceledi. Çıkarken kitabı görevliye teslim etti. Kitabı görevliye teslim etti.',2,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-20','coktan_secmeli','Kütüphane Günü: Zeynep''in davranışı hangi kurala uygundur?','["Kütüphane kurallarına","Trafik kurallarına","Oyun kurallarına","Yemek kurallarına"]',0,'Sınıf kütüphaneye gitti. Zeynep hayvanlarla ilgili bir kitap seçti. Sessizce masaya oturdu ve kitabı inceledi. Çıkarken kitabı görevliye teslim etti. Sessiz olmak ve kitabı teslim etmek kütüphane kurallarına uygundur.',2,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-21','coktan_secmeli','Yağmurlu Gün: Hava nasıldı?','["Karlı","Yağmurlu","Güneşli","Rüzgârsız"]',1,'Sabah yağmur yağıyordu. Emir sarı yağmurluğunu giydi ve şemsiyesini aldı. Okula giderken su birikintilerinin yanından dikkatlice yürüdü. Sabah yağmur yağıyordu.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-22','coktan_secmeli','Yağmurlu Gün: Emir''in yağmurluğu ne renkti?','["Mavi","Kırmızı","Yeşil","Sarı"]',3,'Sabah yağmur yağıyordu. Emir sarı yağmurluğunu giydi ve şemsiyesini aldı. Okula giderken su birikintilerinin yanından dikkatlice yürüdü. Yağmurluğu sarıydı.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-23','coktan_secmeli','Yağmurlu Gün: Emir yanına ne aldı?','["Top","Şemsiye","Oyuncak","Kitaplık"]',1,'Sabah yağmur yağıyordu. Emir sarı yağmurluğunu giydi ve şemsiyesini aldı. Okula giderken su birikintilerinin yanından dikkatlice yürüdü. Şemsiyesini aldı.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-24','coktan_secmeli','Yağmurlu Gün: Emir nasıl yürüdü?','["Koşarak","Geri geri","Zıplayarak","Dikkatlice"]',3,'Sabah yağmur yağıyordu. Emir sarı yağmurluğunu giydi ve şemsiyesini aldı. Okula giderken su birikintilerinin yanından dikkatlice yürüdü. Su birikintilerinin yanında dikkatli yürüdü.',2,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'tr-okuma-25','coktan_secmeli','Yağmurlu Gün: Emir''in davranışı neyi gösterir?','["İsrafı","Güvenli davranmayı","Gürültü yapmayı","Düzensizliği"]',1,'Sabah yağmur yağıyordu. Emir sarı yağmurluğunu giydi ve şemsiyesini aldı. Okula giderken su birikintilerinin yanından dikkatlice yürüdü. Kayma riskine karşı dikkatli yürümek güvenli davranıştır.',2,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=1 AND k.konu_kodu='tr-okudugunu-anlama' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;
