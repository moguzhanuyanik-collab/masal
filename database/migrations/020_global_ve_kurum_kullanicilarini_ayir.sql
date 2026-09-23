SET NAMES utf8mb4;

-- V1.0.40'ta doğrudan kullanıcılar geçici olarak İlkAdım platform kurumuna bağlanmıştı.
-- V1.0.41'de global öğrenci/veli/öğretmen kavramı kurumdan ayrılıyor.
DELETE kk
FROM kurum_kullanicilari kk
INNER JOIN kurumlar k ON k.id=kk.kurum_id
WHERE k.kod='ilkadim'
  AND kk.kurum_rolu IN ('ogrenci','veli','ogretmen');
