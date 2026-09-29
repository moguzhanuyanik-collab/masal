# İlkAdım v1.1.66

## AdımBot güvenli ayar doğrulama ve istek iptali

- Süper Admin “Kaydet ve Bağlantıyı Test Et” işlemi artık aday Groq/Gemini sohbet ve ses ayarlarını canlı ayar dosyasını değiştirmeden önce gerçek uç noktada doğrular; test başarısızsa çalışan önceki ayarlar korunur.
- Ağ testi sırasında ayar kilidi tutulmaz; test sürerken başka bir yönetici değişiklik yaptıysa parmak izi denetimi eski formun yeni ayarı ezmesini engeller.
- Başarısız bağlantı testleri artık “kaydedildi” demek yerine aday ayarın uygulanmadığını ve önceki ayarın korunduğunu açıkça bildirir.
- Groq ve Gemini anahtarının panel ayar dosyasından, yerel sunucu yapılandırmasından veya ortam değişkeninden geldiği anahtarın kendisi gösterilmeden ayrı ayrı belirtilir.
- `API_KEY`, `YOUR_API_KEY`, `CHANGE_ME` ve benzeri örnek anahtarlar panelde reddedilir; eski yapılandırmada kalmış örnek değerler sohbet ve ses uç noktalarında sağlayıcıya gönderilmez.
- Sohbet, transkripsiyon ve yönetici bağlantı testi; 402 kota/bakiye hatasını istek sınırı, 422 hatasını model/istek yapılandırması olarak ayırır.
- Groq ses testi hata veya istisnayla kesilse bile geçici WAV dosyası `finally` temizliğiyle sunucuda bırakılmaz.
- Sohbet penceresi kapatıldığında bekleyen AI isteği iptal edilir; geç gelen yanıt yeni açılan konuşmaya yazılmaz veya seslendirilmez.
- İptal edilen yarım soru konuşma geçmişinden geri alınır ve yeniden denemek için metin alanına taşınır.
- Sağlayıcı hata yanıtları artık cihaz sesinden okunmaz; yalnız güvenli veya başarılı AdımBot yanıtları seslendirilir.

## Doğrulama

- JavaScript sözdizimi denetimleri, AdımBot köprü güvenlik öz-testleri, iptal sinyali testi, hata yanıtının seslendirilmemesi testi, işlem sırası/statik ayar kontrolleri ve `git diff --check` geçti.
- Bu çalışma ortamında PHP yorumlayıcısı, gerçek Groq/Gemini anahtarı ve fiziksel telefon bulunmadığından PHP çalışma zamanı, gerçek sağlayıcı ve mobil Safari uçtan uca testleri yapılmadı; bunlar canlı kurulum öncesi kalan doğrulama sınırıdır.

## Kapsam

Yalnızca AdımBot yönetici ayarları, sohbet arayüzü, AI köprüsü, sohbet/transkripsiyon uç noktaları, sürüm bilgisi ve bu sürüm notu değiştirildi. Canlı sisteme otomatik kurulum yapılmaz.
