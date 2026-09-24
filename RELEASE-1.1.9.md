# İlkAdım 1.1.9 — AdımBot Gelişmiş Ders Bağlamı

- AdımBot'un ders bağlamı algılama sistemi genişletildi.
- Yalnızca ilk başlığı almak yerine görünür durumdaki ders, konu, etkinlik ve soru öğeleri tercih edilir.
- Gizli veya ekranda olmayan öğeler bağlama alınmaz.
- AdımBot'un kendi arayüzü ve sohbet modalındaki metinler ders bağlamına yanlışlıkla karışmaz.
- Global seslendirme sisteminin oluşturduğu data-adimbot-text soru işaretleri doğrudan tanınır.
- Soru metinlerindeki “Soru”, “Şimdi sıra sende” ve “Sıra sende” başlangıçları temizlenir.
- Öğretmenim ekranındaki açık ders ve açık konu başlıkları bağlam için desteklenir.
- data-lesson-title, data-topic-title, data-activity-title gibi semantik işaretler varsa öncelikli kullanılır.
- Aktif alt menü adı ekran bağlamı olarak kullanılabilir; yoksa mevcut hash rotası güvenli geri dönüş olarak kalır.
- Aynı başlık ders/konu/etkinlik alanlarına tekrar tekrar yazılmaz.
- Yeni kişisel veri toplanmaz ve veritabanında değişiklik yapılmaz.
- 1.1.8 sürükleme stabilizasyonu aynen korunur; robot konumlandırma koduna dokunulmadı.
