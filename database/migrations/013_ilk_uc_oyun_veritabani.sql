SET NAMES utf8mb4;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES
('hafiza','Hafıza Bahçesi','🍓','Dikkat & hafıza','3–5 dk','#e1f6e7','Gizlenen meyvelerin eşlerini bul!',1,1),
('renkler','Renk Laboratuvarı','🎨','Renkler & yaratıcılık','2–3 dk','#fff0cd','İki rengi birleştir, yenisini keşfet.',2,1),
('oruntu','Sırada Ne Var?','🧩','Mantık & düşünme','2–3 dk','#eee2ff','Şekillerin sırasını takip et!',3,1)
ON DUPLICATE KEY UPDATE
  ad=VALUES(ad),
  emoji=VALUES(emoji),
  kategori=VALUES(kategori),
  sure=VALUES(sure),
  renk=VALUES(renk),
  aciklama=VALUES(aciklama),
  sira=VALUES(sira),
  aktif=1;
