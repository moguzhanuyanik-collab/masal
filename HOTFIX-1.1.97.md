# İlkAdım 1.1.97 Güncelleme Kurtarma

## Kök neden

1.1.96 -> 1.1.97 farkında yeni bir DB migrationı yoktur. Ancak 1.1.96 updater
paket içindeki tüm eski migrationları tarar ve ayrıca legacy kurum eşleştirme
repair kodunu çalıştırır. Migration geçmişi eksik veya legacy tablo veri
içeriyorsa 1.1.97 kurulumu daha dosya aktivasyonuna gelmeden durabilir.

## Otomatik düzeltme

Git geçmişine yeni bir 1.1.97 rev 2 repair-anchor eklendi. Paket
`001_1_1_97_history_checkpoint.sql` ile 1.1.96'ya kadar olan migration
adlarını mevcut şemanın tarihsel baseline'ı olarak işaretler. Sonraki
1.1.98...1.1.105 anchor sırası yeniden oluşturulmuştur; ara sürümler atlanmaz.

## Rescue updater

Canlı 1.1.96 updater legacy kurum kontrolünde checkpoint'e ulaşmadan duruyorsa
`tools/updater-1.1.97-rescue.php` dosyası tek seferlik drop-in rescue
updater'dır. Canlıdaki `src/updater.php` yerine bu dosyanın içeriği konulduktan
sonra Güncelleme ekranından 1.1.97 tekrar kurulabilir.

Rescue yalnız tam `1.1.96 -> 1.1.97` geçişinde özel davranır:
- legacy kurum repair çalıştırmaz,
- eski migrationları yeniden çalıştırmaz,
- yalnız 1.1.97 paketindeki history checkpoint'i çalıştırır,
- uygulama dosyalarını normal updater akışıyla yedekleyip etkinleştirir.

Diğer sürüm geçişlerinde 1.1.96 updater davranışı korunur.

## Veri güvenliği

Checkpoint SQL kullanıcı/kurum/öğrenci verisini değiştirmez ve tablo şeması
değiştirmez. Yalnız `sistem_migrations` tablosundaki tarihsel kayıtları
1.1.96 şemasına göre tamamlar.
