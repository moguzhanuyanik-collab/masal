# İlkAdım v1.1.56

- AdımBot sohbetine mikrofon düğmesi eklendi. Öğrenci düğmeye dokunarak kısa bir soru sorar; konuşma metne çevrilir, mevcut çocuk güvenliği denetimlerinden geçer ve seçilen AI sağlayıcısına gönderilir. Yanıt robotun mevcut Türkçe cihaz sesiyle okunur.
- Süper Admin → AdımBot AI Ayarları ekranına Gemini sohbet sağlayıcısı, Gemini anahtarı, mikrofon açık/kapalı, tarayıcı/Groq/Gemini konuşma tanıma seçimi ve Groq Whisper modeli eklendi. Anahtarlar sunucuda kalır; mikrofon izinle açılır. Sağlayıcıya gönderilen kısa ses kayıtları uygulamada kalıcı saklanmaz.
- Groq ile konuşma tanıma `whisper-large-v3-turbo` veya `whisper-large-v3` üzerinden, Gemini ile konuşma tanıma `gemini-3.5-flash-lite` üzerinden çalışır. Tarayıcı yöntemi destekleyen cihazlarda kullanılır. Türkçe ses üretimi cihazın seslendirme motoruna bağlıdır; Groq'un İngilizce/Arapça ses modeli kullanılmaz.
- Her ses kaydı en fazla 15 saniyedir; yük boyutu, MIME, öğrenci oturumu, CSRF ve istek sınırı sunucuda kontrol edilir. Görünüm kapanınca mikrofon durur. Konuşma metni ve yanıt sohbet geçmişinde önceki kurallarla tutulur; ham ses kaydı tutulmaz.
- Gemini ve Groq ücretsiz katmanları hesap/model kotalarıyla sınırlıdır; uygulama sınırsız ücretsiz kullanım vaat etmez. Gerçek API anahtarları dağıtım paketinde bulunmaz.

## Kurulum

1. v1.1.55 kurulu sistemde v1.1.56'yı sistem güncelleme ekranından kurun.
2. Süper Admin → Sistem → AdımBot AI Ayarları bölümünden sohbet sağlayıcısını, uygun modeli ve anahtarı kaydedin.
3. Mikrofon yöntemini seçin. Groq veya Gemini yöntemi için ilgili sağlayıcının anahtarı gerekir. Öğrenci hesabında AdımBot sohbetini açıp mikrofon izni vererek deneyin.

## Doğrulama

- JavaScript söz dizimi, sürüm ve kod farkı kontrolü yapıldı. PHP çalışma zamanı, gerçek API anahtarları, öğrenci oturumu ve farklı telefonlarda mikrofon/ses testi bu ortamda yapılamadı; canlı kurulumdan önce bu kontroller gereklidir.

Taban sürüm: v1.1.55
