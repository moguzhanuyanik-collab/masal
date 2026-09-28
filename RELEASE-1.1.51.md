# İlkAdım v1.1.51

- AdımBot'un HTTP hata yanıtları artık başarılı yapay zekâ cevabı olarak işaretlenmez.
- Sağlayıcı istek sınırı, erişim anahtarı/yetki ve model ayarı hataları için öğrenciye anlaşılır, anahtarı açığa çıkarmayan mesajlar gösterilir. Sağlayıcıdan dönen hata gövdesi öğrenciye aktarılmaz.
- Başarısız bağlantı mesajları sohbet geçmişine eklenmez; böylece sonraki AI isteğinin bağlamına karışmaz.
- Değişen JavaScript dosyalarının önbellek sürümü yenilendi. Öğrenci görünümü, veritabanı şeması ve kullanıcı kayıtları değişmedi.

## Doğrulama

- `git diff --check`, iki JavaScript dosyası için `node --check` ve `version.json` ayrıştırma kontrolü geçti.
- Tarayıcı köprüsünün 429, erişim hatası, kapalı sağlayıcı ve başarılı yanıt akışları Node VM ile doğrulandı.
- PHP yorumlayıcısı, test veritabanı ve gerçek Groq anahtarı bu ortamda yoktu; PHP çalışma zamanı ve canlı sohbet testi yapılmadı.

Taban sürüm: v1.1.50
