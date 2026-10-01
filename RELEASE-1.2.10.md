# İlkAdım 1.2.10

## 1.1.97 recovery bootstrap kalıcı ankraj

### Hata analizi

1.1.97 kurtarma köprüsü updater çekirdeğini güncel GitHub `main` HEAD'inden ve tarihsel `version.json` taramasından alıyordu. Bu, 1.1.97–1.2.1 arasındaki tarihçe yeniden ankrajlandığında veya ara sürümler iptal edildiğinde recovery yolunu tekrar kırılgan hale getiriyordu.

GitHub incelemesinde 1.1.97 → 1.2.1 arasındaki uygulama ağacının kaybolmadığı ve doğrulanmış final anchor'ın korunmuş olduğu görüldü:

- 1.1.97 tabanı: `be2651c5e375e3b54c0735d7283820a6ec9eb581`
- 1.2.1 rev15 final rebuild anchor: `6a0f372871e6dbd2b71d2efef121fbf2dfb2f82c`
- Doğrulanmış recovery bootstrap updater: `2c86df240cde635812e12d35cafbb10fe99471d1` / 1.2.9

### 1.2.10 düzeltmesi

- 1.1.97 rescue artık mutable `main` HEAD'ini kullanmıyor.
- Tarihsel 1.1.98 → 1.2.1 commit taramasına bağımlılık kaldırıldı.
- Bootstrap updater sabit 40 karakter SHA ile 1.2.9 commit'ine bağlandı.
- Bootstrap `version.json`, `update-release.json` ve `update-managed-files.json` birlikte doğrulanıyor.
- Bootstrap manifestinde recovery dosyaları zorunlu tutuluyor.
- Bootstrap updater'ın immutable 1.2.1 rev15 hedefini bildiği ayrıca doğrulanıyor.
- Rescue yine yalnız `src/updater.php` çekirdeğini değiştiriyor; veritabanına migration çalıştırmıyor.
- Mevcut updater SHA-256 ile yedekleniyor; atomik aktivasyon başarısız olursa eski dosya geri yükleniyor.

### 1.1.97 → 1.2.1 akışı

1.1.97 → sabit 1.2.9 bootstrap updater → sabit 1.2.1 rev15 uygulama ağacı → kontrollü 064/065/066 DB recovery → 1.2.1 postcondition.

Bu yapı, ara sürümlerin daha sonra silinmesi veya main branch'in yeniden ankrajlanması durumunda 1.1.97 kurtarma yolunun bozulmasını önler.

### Test

- Direct 1.1.97 recovery regression
- Immutable bootstrap anchor regression
- Recovery chain/order/postcondition testleri
- Tenant MariaDB entegrasyonu
- Mevcut PHP/JS regression suite

Production veritabanına bu çalışma sırasında doğrudan müdahale edilmedi.
