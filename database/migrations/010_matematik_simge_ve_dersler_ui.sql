SET NAMES utf8mb4;

UPDATE ders_modulleri dm
INNER JOIN dersler d ON d.id = dm.ders_id
SET dm.emoji = '↔️'
WHERE (d.kod = 'matematik' OR d.ad = 'Matematik')
  AND dm.baslik = 'Önceki ve Sonraki Sayı';
