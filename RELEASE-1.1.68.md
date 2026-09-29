# İlkAdım v1.1.68

## AdımBot yarım yanıt ve çocuk güvenliği koruması

1. Groq `length`, Gemini `MAX_TOKENS` ve OpenAI `incomplete` yanıtları tamamlanmış cevap gibi öğrenciye gösterilmez. Kök neden: yalnız HTTP durumu ve çıkarılan metin kontrol ediliyordu.
2. Yarım kalan sohbet yanıtında öğrencinin sorusu geri yüklenir ve yeniden gönderilebilir. Kök neden: `provider_incomplete` istemcinin yeniden denenebilir hata listesinde yoktu.
3. Süper Admin bağlantı testi yarım kesilen model yanıtını başarı saymaz ve çalışan önceki ayarları korur. Kök neden: test yalnız boş olmayan bir metin arıyordu.
4. Modelin kendine zarar verme veya yaşa uygun olmayan içerik üretmesi sunucuda güvenli yetişkin yönlendirmesine çevrilir. Kök neden: çıktı filtresi yalnız mahremiyet, dış iletişim ve cevap anahtarını denetliyordu.
5. Aynı çocuk güvenliği kontrolü tarayıcıda ikinci savunma katmanı olarak uygulanır; riskli metin cihaz sesiyle okunmaz. Kök neden: istemci çıktı filtresinde bu iki sınıf eksikti.
6. Tarayıcı, sağlayıcı metnini en fazla dört kısa cümlede sınırlar. Kök neden: dört cümle sınırı yalnız sunucunun normal cevap yolunda uygulanıyordu.
7. Gemini ses yanıtındaki gömülü hata ve başarısız bitiş nedenleri boş ses sanılmaz; yarım transkripsiyon ayrı ve anlaşılır hata verir.
8. “Elbette, transkripsiyon:” ve “Duyduğum metin:” gibi sağlayıcı ön ekleri öğrenci sorusundan temizlenir.

## Doğrulama ve kalan risk

JavaScript sözdizimi, dört cümle sınırı, sunucu engelleme nedeninin korunması, kendine zarar verme/yaşa uygun olmayan çıktı engeli, yarım yanıt eşlemesi, sürüm JSON'u ve değişiklik kapsamı statik olarak kontrol edildi. PHP yorumlayıcısı, gerçek Groq/Gemini anahtarı ve fiziksel telefon bulunmadığından PHP çalışma zamanı, gerçek sağlayıcı ve mobil Safari uçtan uca testleri yapılamadı.

## Kapsam ve kurulum

Yalnız AdımBot AI köprüsü, yönetici ayarları, sohbet arayüzü, sohbet/transkripsiyon uç noktaları, sürüm dosyası ve bu sürüm notu değişti. Kurulum sırası: v1.1.67 → v1.1.68. Canlı sisteme otomatik kurulum yapılmaz.
