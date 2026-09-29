# İlkAdım v1.1.67

## AdımBot ses kaydı ve yanıt durumu düzeltmeleri

1. Sunucunun güvenlik veya cevap anahtarı nedeniyle engellediği yanıtın `blocked` ve `reason` bilgisi tarayıcıda ve seslendirme sonrasında korunur. Kök neden: AI köprüsü sunucu yanıtını yalnız metne indiriyordu.
2. HTTP 200 içinde açıkça `ok:false` gelen sağlayıcı yanıtı başarılı sohbet gibi gösterilmez. Kök neden: köprü yalnız HTTP durumunu kontrol ediyordu.
3. Tekrar edilmesi gereken ders ve tekrar gerekçesi AI isteğine taşınır. Kök neden: sohbet arayüzünün gönderdiği iki bağlam alanı köprünün izin listesinde yoktu.
4. Mikrofon izni 15 saniyede verilmezse bekleme iptal edilir; sonradan açılan mikrofon kanalı kapatılır. Kök neden: 15 saniyelik sayaç yalnız kayıt başladıktan sonra çalışıyordu.
5. Ses dosyası gerçek başlık imzasıyla doğrulanır; MIME tanımasının imzayla çeliştiği dosya sağlayıcıya gönderilmez. Kök neden: desteklenen bir MIME tespiti varsa dosya başlığı incelenmiyordu.
6. Gemini transkripsiyonunda birden fazla metin parçası birleştirilir ve düşünce parçaları öğrenci sorusuna eklenmez. Kök neden: yalnız ilk parça okunuyordu.
7. Tarayıcının transkripsiyon zaman aşımı, sunucunun 45 saniyeye kadar izin verdiği ayarı erken kesmemesi için 50 saniyeye çıkarıldı. Kök neden: istemci 30 saniyede isteği iptal ediyordu.

## Doğrulama ve kalan risk

JavaScript sözdizimi, engelleme nedeni ve başarısız yanıt davranışı, tekrar bağlamı, sürüm JSON'u ve değişiklik kapsamı kontrol edildi. PHP yorumlayıcısı, gerçek Groq/Gemini anahtarı ve fiziksel telefon bulunmadığından PHP çalışma zamanı, gerçek sağlayıcı ve mobil Safari testleri yapılamadı. Ses başlığı denetimi kapsayıcı biçimin tamamını doğrulamaz; sağlayıcı bozuk kayıtları yine reddedebilir.

## Kapsam ve kurulum

Yalnız AdımBot AI köprüsü, sohbet arayüzü, transkripsiyon uç noktası, sürüm dosyası ve bu not değişti. Kurulum sırası: v1.1.66 → v1.1.67. Canlı sisteme otomatik kurulum yapılmaz.
