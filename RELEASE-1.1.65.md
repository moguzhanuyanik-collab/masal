# İlkAdım v1.1.65

## AdımBot tarayıcı mikrofonu ve Safari kayıt uyumu

- Tarayıcı ses tanımada durdur düğmesine dokunulduğunda oturum hemen silinmez; tarayıcının son Türkçe transkripti güvenle beklenir.
- Durdurma işlemi sürerken ikinci dokunuş yeni bir durdurma veya kayıt yarışı başlatmaz.
- Tarayıcı tanımanın `aborted` olayı, öğrenci bilerek durdurduğunda genel mikrofon arızası olarak gösterilmez.
- 15 saniyelik süre dolduktan sonra gecikerek gelen eski transkript artık öğrenci sorusu olarak gönderilmez.
- iPhone/iPad'in `application/octet-stream` olarak bildirebildiği geçerli MP4/M4A kaydı `ftyp` dosya imzasıyla güvenli biçimde tanınır.
- WebM, Ogg, WAV ve MP3 kayıtları da MIME bilgisi eksik olduğunda gerçek dosya imzalarıyla doğrulanabilir.
- `finfo` eklentisi bulunmayan sunucuda güvenli dosya imzası doğrulaması kullanılabilir; geçersiz biçimler kabul edilmez.
- Yüklenen ses dosyası tek kez okunur ve bildirilen boyutla eşleşmiyorsa API kotası tüketilmeden durdurulur.
- Oturum veya istek kaynağı hatası, sağlayıcı API anahtarı reddiyle karıştırılmadan sayfayı yenileme yönlendirmesi gösterir.
- Aktif ders sorusunda “doğru olan B”, “A şıkkını seç” veya yalnızca “C seçeneğidir” biçimindeki doğrudan cevaplar ipucuna çevrilir.
- Gemini'nin ses güvenlik filtresiyle durdurduğu transkripsiyon, boş kayıt veya belirsiz sağlayıcı hatası yerine güvenli ve anlaşılır mesaj gösterir.

## Kapsam

Yalnızca AdımBot sohbet arayüzü, AI köprüsü, AI ve transkripsiyon uç noktaları, sürüm bilgisi ve bu sürüm notu değiştirildi. Canlı sisteme otomatik kurulum yapılmaz.
