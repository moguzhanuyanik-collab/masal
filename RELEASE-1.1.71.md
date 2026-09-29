# İlkAdım v1.1.71

## AdımBot güvenli konuşma ve hata sonrası bağlam

1. Süper Admin AdımBot ayar sayfası artık `no-store` ile sunulur; API anahtarının tarayıcı önbelleğinde veya geri/ileri geçmişinde tutulma riski azaltılır.
2. Sohbet bağlantı testi, HTTP 200 içindeki gömülü anahtar/yetki, kota ve model/istek hatalarını birbirinden ayırır. Kök neden: başarılı HTTP durumundaki bütün sağlayıcı hataları tek bir genel mesajla gösteriliyordu.
3. Groq Whisper ve Gemini konuşma bağlantı testi de gömülü hataları aynı anlaşılır sınıflarla bildirir; hatalı aday ayarlar kaydedilmez.
4. İnternet bağlantısı kayıt dışında kesildiğinde artık yanlışlıkla “Ses kaydı durduruldu” denmez; bu açıklama yalnız gerçekten etkin bir kayıt durdurulduğunda gösterilir.
5. Başarısız AI soruları konuşma geçmişinden geri alınır. Kök neden: yalnız geçici kabul edilen birkaç hata geri alınıyor, diğer başarısız sorular sonraki istekte cevaplanmış konuşma gibi modele gönderiliyordu.
6. Kota/istek sınırına takılan soru giriş kutusuna geri yüklenir ve bağlantı hatasından farklı olarak birkaç dakika bekleme önerisi gösterilir.
7. “Yaşamak istemiyorum” gibi çekimli yardım ifadeleri hem sunucu hem tarayıcı güvenlik katmanında algılanıp öğrenciyi hemen güvenilir bir yetişkine yönlendirir. Kök neden: eski desen yalnız `isteme...` kökünü kapsıyor, `istemi...` çekimini kaçırıyordu.
8. Modelin hakaret veya kırıcı söz üretmesi sunucuda engellenir; tarayıcıda ikinci bir filtre ve yerleşik öz test bulunur. Sistem yönergesi de öğrenciye hakaret etmemeyi, küçümsememeyi ve korkutmamayı açıkça söyler.
9. Transkripsiyon sağlayıcısının dizi olmayan bozuk `error` alanı artık metin yanıtı gibi işlenmez; anlaşılır sağlayıcı hatasına çevrilir.
10. Groq/Gemini tarafından `[music]`, `(silence)`, `[noise]`, `(applause)` ve Türkçe karşılıkları olarak dönen konuşmasız kayıtlar boş ses sayılır ve sohbet sorusu olarak gönderilmez.

## Doğrulama ve kalan risk

JavaScript sözdizimi, AdımBot güvenlik öz testi, çekimli kendine zarar ifadesi, hakaret filtresi, kota sonrası geri yükleme, geçmiş geri alma, çevrimdışı durum ayrımı, gömülü hata eşlemeleri, konuşmasız ses işaretleri, sürüm JSON'u ve dosya kapsamı statik olarak kontrol edildi. PHP yorumlayıcısı, gerçek Groq/Gemini anahtarı ve fiziksel telefon bulunmadığından PHP çalışma zamanı, gerçek sağlayıcı, mikrofon ve mobil Safari testleri yapılamadı. Sağlayıcıların ileride ekleyebileceği yeni hata kodları genel sağlayıcı hatası olarak görünmeye devam eder.

## Kapsam ve kurulum

Yalnız AdımBot ayarları, AI köprüsü, sohbet arayüzü, sohbet/transkripsiyon uç noktaları, sürüm dosyası ve bu sürüm notu değişti. Kurulum sırası: v1.1.70 → v1.1.71. Canlı sisteme otomatik kurulum yapılmaz.
