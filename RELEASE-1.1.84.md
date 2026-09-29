# AdımBot v1.1.84
Taban: main v1.1.83, bf574c702a4745f66f1d8037370bcb1a81dfaf0e.
Kurulum: v1.1.83 → v1.1.84. Canlı kurulum yapılmadı.

Tamamlanan 15 ayrı değişiklik:
1. Sohbet kapanınca robotun devam eden seslendirmesi durdurulur.
2. Temizle işlemi robot sesini/ifadesini ve yarım soru alanını sıfırlar; karakter sayacı input olayıyla eşitlenir.
3. Gecikmiş bekleme animasyonu yalnız kendi chatGeneration değeri hâlâ aktifse tetiklenir.
4. İptal işlemi isteğin düşünme zamanlayıcısını temizler ve robotun ifadesini boşta durumuna getirir.
5. Başarısız veya bağlantısız sohbet sonucunda robot düşünme ifadesinde bırakılmaz; başarılı yanıt ifadesi korunur.
6. Gecikmiş açılış odak çağrısı kapanmış veya daha yeni açılmış pencereye odak vermez.
7. Gecikmiş kapanış odak çağrısı yeniden açılmış sohbetten eski düğmeye kaçmaz; silinmiş hedefe odak verilmez.
8. Odak döngüsü hidden/inert/aria-hidden ataları, disabled/negatif tabindex, CSS görünmezliği ve layout dışı kontrolleri eler.
9. Odaklanabilir kontrol yoksa Tab odağı tabindex=-1 dialog paneline verilir; odak kontrol listesinin dışındaysa ilk/son kontrole alınır.
10. Soru alanına açık Türkçe ekran okuyucu etiketi eklenir.
11. IME composition boyunca Enter gönderimi durdurulur; compositionend/Temizle/Kapat akışında durum sıfırlanır.
12. Eski mesaj okuyan kullanıcı yeni bot yanıtıyla aşağı sıçratılmaz; liste sonunda olan kullanıcı ve kendi soru gönderimi aşağı kaydırılır.
13. Tüm duraklat/devam düğmeleri gerçek robot pause/end olaylarıyla metin ve erişilebilirlik etiketi olarak eşitlenir.
14. Güvenlik nedeniyle yönlendirilen yanıtlarda şaşkın ifade yerine destekleyici encourage ifadesi gösterilir; hata mesajlarında başarı ifadesi tetiklenmez.
15. Düşünme ifadesinde sürekli salınım yerine küçük eğim ve uzun dinlenme aralıklı sakin hareket kullanılır.

Kök nedenler: kapanış/Temizle oynayan sesi durdurmuyordu; düşünme zamanlayıcısı istek nesnesine bağlı değildi; odak timeout'ları pencere yaşam döngüsünü kontrol etmiyordu; odak listesi yalnız el.hidden denetliyordu; mesaj ekleme her defasında scrollTop'u sona zorluyordu; IME durumu izlenmiyordu; tüm AI yanıtlarına şaşkın ifade atanıyordu.

Gerçekçilik katkısı: hatada/iptalde düşünmenin bitmesi, güvenlik yönlendirmesinde destekleyici karakter davranışı ve sakin beklemeli düşünme hareketi. Yalnız karakterin iç görseli hareket eder; ekran veya widget koordinatları değişmez. Mevcut reduced-motion, sürükleme, minimize ve sayfa askıya alma kuralları korunur.

Dosyalar: adimbot-chat-ui.js, adimbot-student.css, tests/adimbot-dialog-84.cjs, version.json, bu sürüm notu; index.php/ogretmenim.php yalnız robot CSS önbellek referansı. adimbot-student.js, AI/API/sağlayıcı ayarları, roller, veritabanı, ders mantığı, menü ve genel tasarım değiştirilmedi.

Kontroller: node --check adimbot-chat-ui.js; node tests/adimbot-dialog-84.cjs; node tests/adimbot-voice-83.cjs; node tests/adimbot-speech-81.cjs; node tests/adimbot-lifecycle-82.cjs geçti. Yeni testler gerçek kaynak işlevlerini taklit DOM/AI/ses/zamanlayıcı ile yürütür: kapanış/Temizle iptali, odak yarışları, gizli kontroller, Tab fallback, IME, scroll davranışı, pause metinleri, başarısız/güvenlik yönlendirmeli yanıt ifadeleri. CSS parantez, reduced-motion kaynak, kapsam ve diff boşluk kontrolleri yapıldı. Yeni kullanıcı metni HTML olarak eklenmez; API anahtarı veya yeni dış ağ isteği eklenmedi.

Sınırlamalar: ortamda Chromium çalıştırılabilir dosyası yok; görsel tarayıcı testi yapılmadı. Ses dinleme, gerçek mikrofon, gerçek API, PHP ve fiziksel mobil cihaz testleri yapılmadı. Ekran okuyucu/IME ve odak davranışları gerçek iOS/Android tarayıcıda ayrıca denenmeli. Yeni görsel hareketin kalitesi kaynak testinden bağımsız canlı görsel doğrulama gerektirir. Canlı çalışıyor veya ses kalitesi doğrulandı iddiası yok.
