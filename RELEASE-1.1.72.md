# İlkAdım v1.1.72 — AdımBot bağlantı düzeltmeleri

- Ana sayfa ve Öğretmenim ekranındaki üç AdımBot JavaScript dosyasının URL sürümü artık dosya içeriğinin SHA-256 özetinden üretilir. Gelecek robot güncellemelerinde de önbellek adresi otomatik değişir.
- AdımBot panel ayarları okunmadan önce ilgili PHP OPcache girdisi geçersizleştirilir. Zaman damgası doğrulaması kapalı sunucularda eski sağlayıcı/anahtar ayarının sürmesi önlenir.
- Ayar dosyası atomik kaydedildikten sonra OPcache geçersizleştirilir.
- AI yanıtları kapalıyken bağlantı testi başarı göstererek kapalı yapılandırma kaydetmez; kullanıcıya açılması gereken kutuyu belirtir. Normal kapalı kayıt desteklenir ve açıkça bildirilir.
- Sohbet API'si kapalı AI, geçersiz sağlayıcı, eksik model ve eksik anahtarı ayrı nedenlerle döndürür; istemci bunları ayrı açıklar. Anahtar değeri hiçbir yanıta eklenmez.

## Doğrulama
Node VM üzerinde gerçek köprü fonksiyonu çalıştırılarak same-origin API isteği, CSRF, başarılı yanıt, beş hata yanıtı ve yerleşik çocuk güvenliği öz testi doğrulandı. JavaScript sözdizimi ve git diff kontrolü geçti. Başlangıç ağ yanıtları taklit edildi; gerçek sağlayıcı çağrısı yapılmadı. PHP çalıştırıcısı ve canlı sunucu erişimi olmadığından PHP/OPcache/gerçek Groq-Gemini ve fiziksel telefon testleri yapılamadı.

## Kapsam ve kurulum
v1.1.71 → v1.1.72. Öğrenci sayfalarında yalnız AdımBot betik adresleri, config/app.php içinde yalnız AdımBot ayar yükleme bölümü değişti. Diğer işlevler, tasarım ve veritabanı değiştirilmedi. Canlı kurulum yapılmadı.

Bu düzeltmeler kodda doğrulanan bağlantı risklerini giderir; kullanıcının canlı hatasının kesin nedeni henüz doğrulanmadı. Kurulumdan sonra Süper Admin AdımBot ekranında AI yanıtları açıkken Kaydet ve Bağlantıyı Test Et sonucu kontrol edilmeli; sonrasında öğrenci sohbetinden gerçek yanıt alınmalıdır.
