# İlkAdım 1.1.2 — AdımBot AI Sohbet Stabilizasyonu

- AdımBot AI sohbet endpoint'ine CSRF doğrulaması eklendi.
- CSRF token öğrenci bootstrap'ından alınır ve yalnız aynı oturumdaki sohbet isteğinde kullanılır.
- Tarayıcı tarafındaki AI isteğine 25 saniyelik zaman aşımı ve AbortController desteği eklendi.
- Ağ gecikmesi, oturum doğrulama ve hız limiti durumları için çocuk dostu hata mesajları eklendi.
- Aynı anda ikinci sohbet mesajının gönderilmesi engellendi.
- Sohbet kutusunda en fazla son 12 mesaj tutulur; DOM'un gereksiz büyümesi engellendi.
- Varsayılan OpenAI modeli güncel ve maliyet odaklı gpt-5.6-luna olarak düzeltildi.
- API anahtarı yalnız sunucuda config/local.php veya OPENAI_API_KEY üzerinden tutulmaya devam eder.
- 1.1.1'deki güvenlik filtreleri, ders bağlamı, sesli yanıt ve soru/şık korumaları aynen korunur.
