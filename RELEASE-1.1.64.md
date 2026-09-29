# İlkAdım v1.1.64

## AdımBot gerçek bağlantı testi ve ses denetimi

- Süper Admin sohbet bağlantı testi artık yalnız HTTP 200 durumuna bakmaz; Groq, Gemini veya OpenAI'ın gerçekten okunabilir bir yanıt ürettiğini doğrular.
- Groq konuşma testi model listesini sorgulamak yerine geçici WAV kaydını gerçek Whisper transkripsiyon uç noktasına gönderir.
- Gemini konuşma testi de aynı geçici WAV kaydını seçilen modele göndererek ses kabulünü uçtan uca doğrular.
- Test kaydı bellekte üretilir, kalıcı saklanmaz ve Groq testi sonrası geçici dosya silinir.
- Cihaz seslendirmesi gerçekten başlamadan robot artık “konuşuyor” durumuna geçmez; başlamayan motor altı saniye içinde anlaşılır uyarı verir.
- Sesli okuma duraklatıldığında zaman aşımı sayacı da durur; uzun süre bekletilen yanıt yanlışlıkla takılmış sayılmaz.
- Eski ses motoru olaylarının yeni konuşmanın durumunu veya düğmelerini bozması benzersiz konuşma belirteciyle engellenir.
- Cihazın ses iznini reddetmesi ile normal seslendirme zaman aşımı öğrenciye farklı mesajlarla açıklanır.
- “Telefonun mucidi kim?” veya “adres ne demek?” gibi öğretici sorular mahremiyet ihlali sayılmaz; gerçek iletişim bilgisi isteme girişimleri engellenmeye devam eder.
- Telefon, e-posta veya kimlik verisi sunucuda maskelenmeden önce güvenlik sınıflandırmasından geçirilir; doğrudan API isteğinde de koruma atlanamaz.
- Groq veya Gemini'nin içerik güvenliği nedeniyle durdurduğu yanıtlar boş ya da anlamsız hata yerine kısa ve çocuk seviyesine uygun güvenli yönlendirmeye çevrilir.

## Kapsam

Yalnızca AdımBot AI köprüsü, sohbet arayüzü, cihaz seslendirmesi, AI uç noktası, AdımBot ayar ekranı, sürüm bilgisi ve bu sürüm notu değiştirildi. Canlı sisteme otomatik kurulum yapılmaz.
