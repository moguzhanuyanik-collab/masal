# İlkAdım v1.1.47

- Veli panelinde öğrenci eşleştirmesi okunamazsa boş liste yerine açık hata durumu ve HTTP 503 gösterilir.
- Öğrenci ilerlemesi okunamazsa sıfır ilerleme gösterilmez; yalnız ilgili öğrencinin kartında verinin geçici olarak okunamadığı belirtilir.
- Bağlı kurum bilgisi okunamazsa veli hesabı yanlışlıkla doğrudan kullanıcı olarak gösterilmez.
- Öğrenci HTML/CSS, veritabanı şeması ve kayıtlar değiştirilmedi.

## Doğrulama

- Sürüm JSON'u, değişiklik kapsamı ve hata yolları statik olarak denetlendi.
- Bu ortamda PHP yorumlayıcısı ve test veritabanı olmadığı için çalışma zamanı testi yapılamadı.

Taban sürüm: v1.1.46
