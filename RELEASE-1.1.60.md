# İlkAdım v1.1.60

## AdımBot bağlantı testi ve Türkçe ses tanılama

- Süper Admin ekranına **Kaydet ve Bağlantıyı Test Et** düğmesi eklendi; seçili sohbet sağlayıcısının anahtarı ve modeli gerçek, küçük bir istekle doğrulanır.
- Groq Whisper veya Gemini mikrofon yöntemi seçiliyse konuşma modelinin anahtar ve model erişimi ayrıca test edilir.
- Groq, Gemini ve OpenAI sağlayıcılarıyla açıkça uyuşmayan model kimlikleri kaydedilmeden engellenir.
- Gemini konuşmayı yazıya çevirme modeli artık ayarlardan değiştirilebilir; sunucu sabit model yerine kaydedilen güvenli model kimliğini kullanır.
- API bağlantı zaman aşımı Süper Admin ekranından 5–40 saniye arasında ayarlanabilir.
- Cihazda seslendirme desteği yoksa öğrenciye yanıtı ekrandan okuyabileceğini söyleyen anlaşılır bir uyarı gösterilir.
- Türkçe cihaz sesi bulunamadığında varsayılan sese geçildiği açıkça bildirilir.
- Cihaz ses motorunun başlatma ve çalışma hataları sohbet durum alanında gösterilir; hata ayrıntısı veya anahtar öğrenciye sızdırılmaz.
- Takılan seslendirme süre sonunda iptal edilir; robot konuşuyor durumunda kilitli kalmaz.
- Mobil cihazlarda geç yüklenen ses listesi iki kez yenilenerek Türkçe sesin bulunma olasılığı artırılır.

## Kapsam

Yalnızca AdımBot ayarları, sohbet/ses dosyaları, konuşma API'si, sürüm bilgisi ve bu sürüm notu değiştirildi. Canlı sisteme otomatik kurulum yapılmaz.
