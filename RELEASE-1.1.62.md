# İlkAdım v1.1.62

## AdımBot mikrofon ve sessizlik güvenilirliği

- Mikrofon izni beklenirken düğmeye yeniden dokunulduğunda istek güvenle iptal edilir; üst üste izin penceresi ve çift kayıt oluşmaz.
- Tarayıcı ses tanıma ve sağlayıcıya gönderilen kayıt için 15 saniyelik kalan süre ekranda saniye saniye gösterilir.
- Bir saniyeden kısa kayıtlar API'ye gönderilmeden anlaşılır bir uyarıyla durdurulur.
- Desteklenen cihazlarda ses enerjisi ölçülür; sessiz kayıtlar kota ve ağ kullanmadan önce yerelde yakalanır.
- Kayıt sırasında mikrofonun çıkarılması veya ses kanalının kapanması ayrı algılanır ve cihazı kontrol etme yönlendirmesi gösterilir.
- iPhone ve iPad'de askıda kalabilen ses analiz motoru güvenle sürdürülür; analiz kullanılamıyorsa geçerli kayıt yanlışlıkla sessiz sayılmaz.
- cURL, API anahtarı ve model yapılandırması ses kotası işlenmeden önce doğrulanır; yönetici ayar hataları öğrencinin kullanım hakkını tüketmez.
- Groq ve Gemini transkriptlerindeki “Transkripsiyon”, “Deşifre” ve “Metin” ön ekleri ile gereksiz tırnaklar temizlenir.
- Sağlayıcının sessiz ses için üretebildiği “müzik”, “sessizlik” veya “ses algılanmadı” gibi sahte transkriptler öğrenci sorusu olarak gönderilmez.

## Kapsam

Yalnızca AdımBot sohbet mikrofonu, ses yazıya çevirme uç noktası, sürüm bilgisi ve bu sürüm notu değiştirildi. Canlı sisteme otomatik kurulum yapılmaz.
