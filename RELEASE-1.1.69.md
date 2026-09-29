# İlkAdım v1.1.69

## AdımBot anahtar seçimi ve mobil mikrofon uyumu

1. Groq sohbeti, panel/yerel ayardaki eski örnek anahtar yerine varsa geçerli `GROQ_API_KEY` ortam anahtarına güvenle döner. Kök neden: boş olmayan yer tutucu değer ortam anahtarını gölgeliyordu.
2. Gemini sohbeti ve Groq/Gemini transkripsiyonu için aynı güvenli anahtar seçimi uygulanır; seçilmeyen sağlayıcının anahtarı kullanılmaz.
3. Süper Admin ayarları eski yer tutucu anahtarları kayıtlı anahtar saymaz; sonraki kayıtta temizler ve gerçek anahtar kaynağını doğru gösterir.
4. Tarayıcı ses tanımanın birden fazla sonuç parçası tek öğrenci cümlesinde birleştirilir. Kök neden: yalnız ilk sonuç okunuyordu.
5. `MediaRecorder.isTypeSupported` bulunmayan eski mobil tarayıcılarda kayıt varsayılan biçimle başlatılabilir. Kök neden: statik yöntem koşulsuz çağrılıyordu.
6. API, bağlantı ve beklenmeyen sohbet hatalarında “Tekrar dinle” ses kontrolleri gösterilmez; hata robot cevabı gibi elle de seslendirilemez.
7. Protokolsüz `.com`, `.net`, `.org`, `.tr` benzeri dış adresler ile TikTok/Facebook yönlendirmeleri çıktı filtresinde engellenir.
8. “A seçeneği doğru” ve “Yanıt A’dır” gibi yeni doğrudan cevap kalıpları ipucuna çevrilir.

## Doğrulama ve kalan risk

JavaScript sözdizimi, dış adres ve iletişim filtresi, yeni cevap anahtarı kalıpları, anahtar seçimi sözleşmeleri, sürüm JSON'u ve değişiklik kapsamı statik olarak kontrol edildi. PHP yorumlayıcısı, gerçek Groq/Gemini anahtarı ve fiziksel telefon bulunmadığından PHP çalışma zamanı, gerçek sağlayıcı, eski Safari ve fiziksel mikrofon testleri yapılamadı.

## Kapsam ve kurulum

Yalnız AdımBot AI köprüsü, yönetici ayarları, sohbet arayüzü, sohbet/transkripsiyon uç noktaları, sürüm dosyası ve bu sürüm notu değişti. Kurulum sırası: v1.1.68 → v1.1.69. Canlı sisteme otomatik kurulum yapılmaz.
