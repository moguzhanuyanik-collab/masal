# İlkAdım v1.1.70

## AdımBot mikrofon gizliliği ve bağlantı dayanıklılığı

1. Mikrofon açıkken sayfa arka plana geçerse kayıt hemen durdurulur. Kök neden: görünürlük değişimi yalnız robot seslendirmesinde ele alınıyordu.
2. Kayıt sırasında internet bağlantısı kesilirse ses yakalama iptal edilir ve öğrenciye açık durum mesajı gösterilir.
3. Mikrofon ses kanalı `mute` olduğunda kayıt sağlayıcıya gönderilmez; bağlantının kapanmasından ayrı açıklanır.
4. Tarayıcıdan yankı giderme, gürültü azaltma ve otomatik ses seviyesi desteği istenir; çocuk sesinin yazıya dönüşme kalitesi desteklenen cihazlarda iyileştirilir.
5. Robot seslendirmesi bittiğinde veya iptal edildiğinde tüm “Duraklat” düğmeleri normal durumuna döner. Kök neden: ses motorunun bitiş olayı sohbet kontrollerine aktarılmıyordu.
6. Sohbet ve transkripsiyon cURL oturumu başlatılamaz veya ayarlanamazsa ham PHP hatası yerine anlaşılır bağlantı hatası döner.
7. Sağlayıcının HTTP 200 içindeki gömülü 401/403, 400/404/422 ve 402/429 hataları sırasıyla anahtar, model ve kota hatası olarak ayrıştırılır.
8. Aktif soruda yalnız “4”, “B” veya “dört” biçiminde gelen doğrudan cevaplar güvenli ipucuna çevrilir.
9. Sunucuda istek JSON'u hazırlanamazsa ayrı hata üretilir ve tarayıcı öğrenciyi sayfayı yenilemeye yönlendirir.

## Doğrulama ve kalan risk

JavaScript sözdizimi, görünürlük/ağ/mute mikrofon iptali, seslendirme bitiş olayı, cURL korumaları, gömülü hata eşlemeleri, yalın cevap filtresi, sürüm JSON'u ve dosya kapsamı statik olarak kontrol edildi. PHP yorumlayıcısı, gerçek Groq/Gemini anahtarı ve fiziksel telefon bulunmadığından PHP çalışma zamanı, gerçek sağlayıcı, mikrofon ve mobil Safari testleri yapılamadı. Gürültü azaltma seçenekleri yalnız tarayıcının desteklediği ölçüde uygulanır.

## Kapsam ve kurulum

Yalnız AdımBot AI köprüsü, robot seslendirmesi, sohbet arayüzü, sohbet/transkripsiyon uç noktaları, sürüm dosyası ve bu sürüm notu değişti. Kurulum sırası: v1.1.69 → v1.1.70. Canlı sisteme otomatik kurulum yapılmaz.
