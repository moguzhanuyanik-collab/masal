# İlkAdım v1.1.50

- Süper Admin için `adimbot-ayarlari.php` eklendi. Groq/OpenAI sağlayıcısı, model kimliği, Groq API anahtarı, açık/kapalı durumu ve öğrenci başına istek sınırı burada ayarlanır.
- Groq API anahtarı tarayıcıya geri yazılmaz. Ayarlar `storage/adimbot-ai.php` dosyasında 0600 izinle saklanır ve güncelleme motorunun koruduğu `storage` altında kalır. Sunucudaki `GROQ_API_KEY` de kullanılabilir.
- AdımBot sunucuda Groq Chat Completions uç noktasını destekler. Mevcut çocuk güvenliği, CSRF, oturum ve istek sınırları her iki sağlayıcıda çalışır. Groq limiti için anlaşılır mesaj gösterilir; ücretli sağlayıcıya otomatik geçilmez.
- Kurulum sonrası Süper Admin → AdımBot AI Ayarları bölümünden Groq API anahtarı girilip model seçilmelidir. API anahtarı bu pakette bulunmaz.
- Öğrenci HTML/CSS/JS, veritabanı şeması ve kullanıcı kayıtları değiştirilmedi.

## Doğrulama

- Sürüm JSON'u, ayar dosyasının güncellemede korunması, anahtarın çıktıdan gizlenmesi ve sağlayıcı istek biçimi statik olarak denetlendi.
- Bu ortamda PHP yorumlayıcısı, gerçek Groq anahtarı ve test veritabanı bulunmadığından çalışma zamanı testi yapılmadı.

Taban sürüm: v1.1.49
