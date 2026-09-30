# İlkAdım 1.1.91

Taban: 1.1.90 / d45b0dc05c6bf3b548f2cfa0624fd3bb3941a0c8.

## Düzeltilenler

1. install.php artık storage/install.lock varken POST ile yeniden kurulum başlatmıyor.
2. İlk kurulum formuna CSRF doğrulaması eklendi.
3. Installer yanıtlarına no-store ve nosniff başlıkları eklendi.
4. Kurulum lock dosyası oluşturulamazsa işlem başarılı sayılmıyor.
5. Güncelleme merkezindeki install POST isteği CSRF olmadan çalışmıyor.
6. Güncelleme AJAX parametreleri $_REQUEST yerine açıkça $_GET üzerinden okunuyor.
7. index.php içindeki AdımBot CSS cache-busting sabit sürüm yerine dosya SHA-256 özetiyle yapılıyor.
8. ogretmenim.php için aynı CSS cache-busting düzeltmesi uygulandı.
9. Ses transkripsiyonu 400 karakteri aşınca metni sessizce kesmiyor; kontrollü too_long hatası dönüyor.
10. Sohbet arayüzü uzun sesli soru için anlaşılır geri bildirim veriyor.
11. Service Worker cache nesli 1.1.91'e yükseltildi.
12. Offline çekirdek asset sürüm parametreleri 1.1.91 ile eşitlendi.

## Bilinçli olarak değiştirilmedi

GitHub HEAD içinde bulunmayan src/bootstrap.php, styles.css, app-runtime.js, database/schema.sql ve database/seed.sql dosyaları tahmin edilerek üretilmedi. Gerçek canlı kopyaları olmadan bunları yeniden oluşturmak güvenli değil.

MySQL tam rollback/backup mimarisi, login rate-limit ve upstream Retry-After aktarımı ayrı kontrollü işler olarak bırakıldı.
