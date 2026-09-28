# İlkAdım v1.1.52

- AdımBot çocuk güvenliği kontrolleri yalnız tarayıcıya bağlı olmaktan çıkarıldı; API’ye doğrudan istek gönderilse de sunucuda zorunlu olarak uygulanır.
- Kendine zarar, kişisel bilgi, dış iletişim/buluşma, doğrudan cevap isteme ve yaşa uygun olmayan içerik istekleri Groq/OpenAI çağrısından önce güvenli mesaja dönüştürülür.
- İstemciden değiştirilebilecek sohbet geçmişindeki güvenlik riski taşıyan satırlar sağlayıcı bağlamına alınmaz.
- Tarayıcı öz testi kendine zarar ve tehlikeli içerik kontrollerini de kapsar; kişisel bilgi testi engelleme veya maskeleme sonuçlarının ikisini de doğru kabul eder.
- Öğrenci HTML/CSS görünümü, veritabanı şeması ve kullanıcı kayıtları değiştirilmedi.

## Doğrulama

- `git diff --check`, JavaScript sözdizimi ve `version.json` ayrıştırma kontrolleri geçti.
- AdımBot tarayıcı öz testindeki kişisel bilgi, cevap anahtarı, kendine zarar, tehlikeli içerik, komut yok sayma, kimlik dışlama ve öğrenme bağlamı kontrollerinin tamamı geçti.
- PHP yorumlayıcısı, test veritabanı ve gerçek Groq anahtarı bu ortamda yoktu; PHP çalışma zamanı ve canlı öğrenci sohbeti testi yapılmadı.

Taban sürüm: v1.1.51
