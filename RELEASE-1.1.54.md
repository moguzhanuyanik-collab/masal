# İlkAdım v1.1.54

- AdımBot'un Groq veya OpenAI yanıtındaki dış bağlantı ve kişisel bilgi isteme kalıpları, maskelemeden önce denetlenir. Böylece maskelenmiş bir bağlantı güvenli yanıt olarak sohbet geçmişine alınmaz.
- Uygun yanıtlar, öğrenciye gönderilmeden önce kişisel bilgiler açısından yine maskelenir.
- Öğrenci görünümü, ayarlar ve veritabanı değişmedi.

## Doğrulama

- `git diff --check` ve `version.json` ayrıştırma kontrolü geçti.
- Sunucu yanıtındaki denetim sırası kod farkında kontrol edildi. Bu ortamda PHP yorumlayıcısı, gerçek Groq anahtarı ve canlı öğrenci oturumu olmadığından çalışma zamanı testi yapılmadı.

Taban sürüm: v1.1.53
