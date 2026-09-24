# İlkAdım 1.0.99 — AdımBot Güvenli AI Altyapısı

- AdımBot için sağlayıcıdan bağımsız AI Bridge katmanı eklendi.
- Bu sürümde sohbet arayüzü açılmadı; yalnız güvenli kontrol altyapısı hazırlandı.
- AI bağlamına öğrenci kullanıcı ID'si, tam adı, e-posta, telefon, adres, şifre veya kimlik bilgisi aktarılmaz.
- E-posta, telefon, bağlantı ve 11 haneli kimlik benzeri veriler sağlayıcıya gitmeden önce maskelenir.
- “Doğru cevabı söyle / hangi şık?” benzeri istekler sağlayıcıya gönderilmeden yerel ipucu yanıtına çevrilir.
- Kişisel iletişim bilgisi isteme, başka uygulamaya yönlendirme, buluşma/özel iletişim ve riskli içerik istekleri yerel güvenlik filtresinde durdurulur.
- AI çıktısından yalnız metin kabul edilir; action, command, URL veya DOM talimatları çalıştırılmaz.
- Dış bağlantı içeren, kişisel bilgi isteyen veya doğrudan cevap anahtarı veren AI yanıtları öğrenciye iletilmez.
- AI'nin ürettiği güvenli metin, mevcut AdımBot konuşma motoru üzerinden seslendirilebilir.
- Gerçek sağlayıcı bağlantısı ve kontrollü sohbet arayüzü 1.1.1 sürümüne bırakıldı.
