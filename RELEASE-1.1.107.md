# İlkAdım 1.1.107

## Hedef

1.1.96 kurulumunda eski updater kodu 1.1.97 paketinin kurtarma koduna ulaşmadan
DB kontrolünde durduğunda, canlı `src/updater.php` dosyasını güvenli ve geri
alınabilir biçimde rescue updater ile değiştirmek.

## Eklenenler

- `tools/apply-updater-1.1.97-rescue.php`: yalnız CLI ve yalnız kurulu sürüm
  1.1.96 iken çalışır.
- Mevcut updater SHA-256 adıyla `storage/backups` altına yedeklenir.
- Rescue updater önce aynı dizinde geçici dosyaya yazılır, SHA-256 doğrulanır,
  sonra `rename()` ile atomik etkinleştirilir.
- Etkinleştirme sonrası hash tekrar doğrulanır; başarısızsa eski updater geri
  yüklenir.
- `tools/rollback-updater-1.1.97-rescue.php`: yalnız
  `storage/backups` altındaki yedekten atomik geri dönüş yapar.
- Araçlar HTTP üzerinden çalışmaz; yalnız CLI kullanımına izin verir.
- PHP ve Node kaynak/regresyon testleri kalite kapısına eklendi.

## Kullanım

`php tools/apply-updater-1.1.97-rescue.php`

Başarılı olduktan sonra yönetim panelindeki Güncelleme ekranından 1.1.97 tekrar
kurulur. 1.1.97 kurulduğunda normal sürüm zinciri devam eder.
