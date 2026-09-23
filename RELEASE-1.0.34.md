# İlkAdım V1.0.34 — V4 ek özellikler ve çevrimdışı PWA

## Eski uygulama korunur
Mevcut `styles.css`, `app-runtime.js`, eski seslendirme dosyaları, ana navigasyon ve mevcut dersler değiştirilmedi. V4 ekranları sadece yeni JS/CSS dosyalarında ve yeni `#/v4/` yollarında çalışır.

## GitHub güncellemesiyle gelenler
- Profil: Uygulamayı Kur, Avatar Oluşturucu, Yıldız Dükkânı, Haftalık Planım ve Başarı Sertifikam.
- PWA: Ana ekrana kurulum, çevrimdışı kullanım için mevcut MySQL derslerini ve sorulu oyunlarını açıkça indirme.
- Çevrimdışı çalışma: Önceden indirilen ders, soru ve etkinlikleri ayrı `offline-v4.html` ekranında tamamlama.
- Ayrı öğrenci kimliğine bağlı IndexedDB ilerleme paketi ve kalıcı bekleyen işlem kuyruğu.
- Bağlantı geri geldiğinde açık uygulamadan otomatik MySQL eşitlemesi; destekleyen tarayıcılarda Background Sync.
- `016_pwa_offline_sync.sql`: Öğrenci + işlem UUID'sine göre çift kaydı engelleyen MySQL tablosu. `api/offline-sync.php`: sunucudaki ilerlemeyle birleştirme, öğrencinin hesap kimliğini ve CSRF doğrulama.
- `017_v4_ozellikler.sql`: avatar tercihleri, yıldızla satın alınan ödüller, haftalık hedefler ve okuma denemesi tabloları.
- `api/v4-features.php`: öğrenciye özel yetkilendirilmiş avatar, ödül satın alma, haftalık plan ve sertifika durumu.
- Öğrenci çıkış yaptığında PWA öğrenci verileri ve kurulum önbelleği temizlenir.
- Kurulum ve özellikler internet/HTTPS/tarayıcı desteğine göre çalışır.

## Kullanıcının yüklediği tam V4 tasarımı
Ayrıca ayrı bir **V4 tasarım ek paketi** sağlanır. Bu paket, yüklenen V4'ün kendi HTML/CSS/JS ve kahraman görselini `v4/` altında muhafaza eder. Normal GitHub güncellemesinin ardından sunucu köküne yalnızca `v4/` dizini olarak yüklenir. Ana uygulamanın dosyaları üzerine yazılmaz. `/v4/index.php` oturum açılmış öğrencinin mevcut MySQL derslerini kullanır, ana ders/oyun ilerlemesini `api/offline-sync.php` ve kozmetik ödül verilerini `api/v4-features.php` ile eşitler. `config/app.php` güncelleyicide `v4/` dizinini korur.

## Bilinçli sınırlar
- V4 tam tasarımın 6 örnek oyunu, halihazırdaki 25 veritabanı oyununu değiştirmez.
- Farklı çocuklara ait hesaplara geçiş ve öğretmen adına görev atama **yetkili aile/öğretmen hesapları kurulmadan açılmaz**. Yerel PIN sunucu yetkilendirmesi değildir.
- Ses tanıma tarayıcı desteğine bağlıdır; AI, uzaktan bildirimler ve profesyonel okuma değerlendirmesi eklenmedi.
- Otomatik eşitleme uygulama açıkken bağlantı geldiğinde çalışır; kapalıyken Background Sync tarayıcı desteğine bağlıdır.
- Ders/görsel indirilmediyse ilk çevrimdışı açılışta eğitim içeriği bulunmaz. Dış medya ve tarayıcı sesleri çevrimdışı garanti değildir.
- Normal uygulamanın eski `api/state.php` bütün-durum kayıtları nedeniyle aynı öğrencinin birden fazla cihazda aynı anda **çelişen** değişiklikleri için tam çatışma çözümü henüz sağlanmaz.
- Kaynakta sözdizimi ve V4 referans testleri kontrol edildi; gerçek hosting, veritabanı migrasyonu ve iOS/Android uçak modu testleri sunucuda ayrıca yapılmalıdır.
