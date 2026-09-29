# AdımBot v1.1.82
Taban: main v1.1.81, commit 0578eda9db5c7bf90d6f89bdad3d090b747f0320.
Kurulum: v1.1.81 → v1.1.82. Canlı kurulum yapılmadı.

Tamamlanan 15 ayrı değişiklik:
1. Durdurulan sessiz okumanın gecikmiş bitiş olayı yeni konuşmayı etkilemez.
2. İptal edilen uzun okumanın gecikmiş bitişi yeni cümle kuyruğu oluşturmaz.
3. Uzun okuma cümle arası beklemede durdurulsa da tamamlanma sonucu yalnız bir kez bildirilir.
4. Ses metni uzun okuma bölünmeden önce hazırlanır; matematik işaretleri ve biçimlendirme bütün olarak işlenir. Ekrandaki özgün metin korunur.
5. Sesin başlaması/cihaz sesinin yüklenmesi beklenirken duraklatma ve devam desteklenir.
6. Mevcut konuşmanın ağız temposu ve zaman aşımı, başladığı konuşma hızını kullanır; yeni hız tercihi sonraki konuşmaya uygulanır.
7. Cümle türündeki boundary olayları kelime sanılarak ağız/jest tetiklemez.
8. Negatif, metin dışı, tekrarlanan veya geriye giden kelime konumları reddedilir.
9. Ses nesnesi oluşturulamıyorsa kontrollü Türkçe hata ve iptal sonucu verilir.
10. Geç yüklenen Türkçe ses 100 ms aralıklarla en fazla 1 saniye beklenir; ardından mevcut cihaz yedeği kullanılır.
11. İzin, ağ, meşgul ses çıkışı, donanım, dil, ses ve aşırı uzun metin hataları ayrı sabit Türkçe mesajlarla açıklanır.
12. Sürükleme başlangıcı konuşmayı kesmez; jestler sürükleme süresince durur, bırakmada yeniden planlanır.
13. Hareket azaltma tercihi çalışma sırasında açıldığında mevcut jest döngüsü temizlenir; kapandığında koşullar uygunsa yeniden başlar.
14. Cümle sonundaki kelime olayı sonrasında ağız yaklaşık kelime süresiyle yumuşak kapanır; sonraki kelimede tekrar açılır.
15. Ses duraklatıldığında baş/gövde görseli ve düşünme göz kapağı animasyonları da durur.

Kök nedenler: sessiz callback'lerin konuşma kimliği kontrolü yoktu; uzun konuşmanın cümle arası iptal callback'i tutulmuyordu; bekleyen ses başlatıcısı duraklatılmıyordu; boundary türü/konumları doğrulanmıyordu; hareket tercihinin dinamik değişimi izlenmiyordu; sürükleme sesi tamamen iptal ediyordu.

Gerçekçilik katkısı: cümle sonunda ağzın kapanması, duraklatılan karakterin düşünme/baş hareketlerinin durması, konuşmanın sürüklemede devam etmesi ve jestlerin bırakmada sürmesi. Ağız zamanlaması yaklaşık kelime olayına dayanır; fonem/dudak senkronu veya ses motorunda olmayan duygu desteği vaat edilmez.

Değişen kapsam: adimbot-student.js, adimbot-student.css; index.php/ogretmenim.php yalnız robot CSS önbellek referansı; tests/adimbot-speech-81.cjs güncel lifecycle değişkenleri ve utterance hızına uyarlandı; tests/adimbot-lifecycle-82.cjs; version.json ve bu sürüm notu. API, roller, veritabanı, menü, ders mantığı ve genel tasarım değiştirilmedi.

Kontroller: node --check adimbot-student.js; node tests/adimbot-speech-81.cjs; node tests/adimbot-lifecycle-82.cjs geçti. 15 madde için taklit ses motoru/zamanlayıcı davranışları veya animasyon kaynak kontrolleri yapıldı. CSS parantez bütünlüğü ve kapsam kontrolleri geçti. Yeni HTML enjeksiyonu, ağ isteği, anahtar veya ekran hareketi eklenmedi.

Sınırlamalar/riskler: ortamda Chromium/Firefox ve PHP çalıştırıcısı bulunmadı. Dinleme, görsel tarayıcı, gerçek API, mobil Safari ve fiziksel cihaz testi yapılmadı. Türkçe ses kalitesi cihaz motoruna bağlıdır; kalite dinlenerek doğrulanmadı. 1 saniyelik ses seçimi beklemesi ilk başlangıcı geciktirebilir. Sunucu TTS entegrasyonu veya ücretli servis etkinleştirilmedi; mevcut sağlayıcılar değiştirilmedi. Sonraki turda sağlayıcı/mikrofon regresyonları ve gerçek cihazda ses/hareket doğrulaması önceliklidir.
