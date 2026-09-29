# AdımBot v1.1.85
Taban: main v1.1.84, fec6d44e84834227e2fad9d1664f04ee75790aa8.
Kurulum: v1.1.84 → v1.1.85. Canlı kurulum yapılmadı.

Tamamlanan 15 ayrı değişiklik:
1. AI response.json aşamasındaki abort/zaman aşımı invalid_response olarak yutulmaz; timeout/cancelled tanısı korunur.
2. JSON okunamayan HTTP 429 yanıtında Retry-After başlığının süresi kullanıcıya aktarılır.
3. Başarılı yanıtın text alanı string ve dolu olmak zorundadır; nesne/dizi/null/sayı metne çevrilip seslendirilmez.
4. Sohbet sağlayıcısı Retry-After için sayısal süre ve HTTP-date destekler; 0–600 saniye sınırı korunur.
5. Yanıt gövdesi okunduktan sonra abort tekrar kontrol edilir; iptal edilen isteğin geç başarı yanıtı kullanılmaz.
6. Offline olayında bekleyen sohbet iptal edilip sorusu input alanına geri yüklenir.
7. Pagehide olayında bekleyen sohbet isteği iptal edilir; mikrofon temizliği korunur.
8. Reduced-motion açıkken konuşma jest döngüsü zamanlayıcısı oluşturulmaz.
9. Jest tekrarında root.offsetWidth zorunlu layout ölçümü kaldırılır; varsa yalnız ilgili kolun Web Animations zamanları sıfırlanır. Destek yoksa CSS hareketi korunur.
10. Kuyruğa alınmış ama onstart gelmemiş ses duraklatılabilir; gecikmiş onstart duraklama durumunu kaldırmaz. Ağız/jest başlangıcı yalnız motor başlangıcı gerçekten geldiyse devamda uygulanır.
11. onStart callback'i yeni konuşma başlatırsa eski konuşma, yeni konuşmanın watchdog'unu ezmez.
12. Yalnız emoji içeren uzun okuma ekranda korunur ve sessiz tamamlanır; boş metin reddi korunur.
13. Markdown HTTP/WWW bağlantısı ses metninde görünen başlığıyla okunur; özgün ekrandaki metin korunur.
14. Ses hazırlığı ve kelime ağız ritmi NFC Unicode normalizasyonu kullanır; ayrık Unicode Türkçe harflerde ünlü/uzunluk değerlendirmesi korunur.
15. Sayılar arasındaki >, <, ≥, ≤, ≠ işaretleri Türkçe sözcüklerle okunur; hesaplama yapılmaz.

Kök nedenler: JSON abort hatası catch içinde yutuluyordu; bozuk 429 gövdesinde retry metadata kayboluyordu; text alanı String() ile herhangi bir türe dönüştürülüyordu; son abort kontrolü yoktu; offline/pagehide sohbet isteğini iptal etmiyordu; kuyruğa alınmış ses pause için aktif kabul edilmiyordu; onStart callback'i sonrası eski zaman aşımı tekrar kuruluyordu.

Gerçekçilik katkısı: doğru Türkçe karşılaştırma/bağlantı başlığı okuma, ayrık Türkçe harflerde kelimeye bağlı ağız ritmi ve gecikmiş ses başlangıcında duraklama/jest uyumu. Jest tekrarı sayfa ölçümü zorlamadan ilgili kol animasyonunu başlatır. Ses motorunun fonem veya duygu desteği dışında ağız senkronu vaat edilmez; gerçek kalite dinlenerek doğrulanmadı.

Değişenler: adimbot-ai-bridge.js, adimbot-chat-ui.js, adimbot-student.js, tests/adimbot-provider-speech-85.cjs, version.json, bu sürüm notu. JS önbellek referansları zaten içerik hash'i kullandığından PHP/CSS/asset referansı değiştirilmedi. API/PHP, anahtar/model ayarları, sağlayıcı entegrasyonu, roller, veritabanı, menü, ders mantığı ve genel tasarım değiştirilmedi.

Kontroller: üç değişen JS için node --check; tests/adimbot-provider-speech-85.cjs ve önceki adimbot-voice-83.cjs, adimbot-dialog-84.cjs, adimbot-speech-81.cjs, adimbot-lifecycle-82.cjs geçti. Yeni test gerçek kaynak kodunu VM'de taklit fetch/ses motoru/zamanlayıcılarla yürütür: JSON timeout, bozuk 429, yanlış payload türü, HTTP-date, gecikmiş iptal yanıtı, offline/pagehide callback'leri, reduced-motion döngüsü, offsetWidth okunmadan kol tekrarı, onstart öncesi pause, callback sonrası watchdog, emoji-only tamamlama, link başlığı, Unicode cadence ve karşılaştırma metni. AI bridge'in 11 çocuk güvenliği öz testi de geçti. Yayın kapsamı ve diff boşluk kontrolü yapıldı.

Sınırlamalar: gerçek Groq/Gemini, API anahtarı, PHP çalıştırıcısı, fiziksel mikrofon/telefon, gerçek cihaz TTS ve görsel tarayıcı testi yapılmadı. Ortamda Chromium çalıştırılabilir dosyası bulunmuyor. Web Animations desteği ve gerçek mobil pause olay sırası cihazda ayrıca denenmeli. Yeni ücretli servis, sağlayıcı veya TTS etkinleştirilmedi. Canlı çalışma/duyulan ses kalitesi doğrulanmış değildir.
