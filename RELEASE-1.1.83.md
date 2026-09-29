# AdımBot v1.1.83
Taban: main v1.1.82, b528045bbd8bf4688477fbaef92cd532e0675efd.
Kurulum: v1.1.82 → v1.1.83. Canlı kurulum yapılmadı.

Tamamlanan 15 ayrı değişiklik:
1. MediaRecorder kendiliğinden sona erdiğinde session, kayıt/geri sayım/ses analiz zamanlayıcıları ve mikrofon düğmesi temizlenir.
2. Durdur işlemi paused durumundaki MediaRecorder'ı da kapatır.
3. Bir track.stop hatası diğer ses kanallarının kapanmasını engellemez.
4. Ses parçaları alınırken toplam 1.600.000 byte sınırı uygulanır; büyük kayıt erken durdurulur.
5. İptal edilmiş kayıt parçaları serbest bırakılır; blob oluşturulunca ve doğrulama hatalarında parça dizisi temizlenir.
6. Tarayıcı ses tanımasının tamamlanan sonucu yalnız bir kez kabul edilir; eski oturumun sonucu gönderilmez.
7. isFinal olmayan ses tanıma sonuçları soru olarak gönderilmez.
8. Transkripsiyon kilidi ve 50 saniyelik zaman aşımı response.json tamamlanana kadar korunur; JSON aşaması timeout'u ayrı tanılanır.
9. Eski transkripsiyonun finally bloğu yeni controller veya mikrofon düğmesi durumunu değiştiremez.
10. Eski isteğin geç hatası yeni oturumun cooldown süresi veya durum metnini değiştiremez.
11. AudioContext.resume ve close Promise retleri karşılanır; kaynak temizleme asenkron hatayla yarıda kalmaz.
12. Retry-After sayısal süre veya HTTP-date biçiminde okunur; negatif/bozuk değerler elenir ve 600 saniyelik mevcut sınır korunur.
13. Ağ, ses çıkışı meşgul, donanım, dil, voice ve uzun metin seslendirme hataları sohbet ekranında ayrı sabit Türkçe mesajlarla gösterilir; olayın keyfi message alanı kullanılmaz.
14. Mikrofon dinlerken sakin, hafif eğilen dinleme pozu ve dinlenme konumundaki kollar gösterilir. Mevcut karakter kimliği korunur.
15. Transkripsiyonda dinlemeden farklı düşünme/pulse ifadesi gösterilir; uzun işlemde yenilenir, başarı/hata/iptal sonunda yalnız ilgili oturum tarafından temizlenir.

Kök nedenler: recorder.onstop yalnız track kapatıyordu; paused recorder kapanmıyordu; ses parçaları ancak tüm kayıt sonunda sınırlandırılıyordu; recognition sonuçlarında oturum/isFinal kontrolü yoktu; transkripsiyon kilidi fetch headers geldiğinde JSON okumadan bırakılıyordu; eski finally/catch blokları yeni mikrofon/cooldown'u değiştirebiliyordu; ses hatası UI'si ayrıntılı motor tanılarını tek genel mesaja indiriyordu.

Gerçekçilik katkısı: dinleme ve transkripsiyon için ayrı karakter ifadeleri; ses alma ile düşünme aşamaları görünür biçimde ayrılır. Yalnız robotun iç görseli hareket eder; ekran/widget koordinatları değişmez. Hareket azaltma, sürükleme, askıya alma ve minimize kuralları korunur.

Değişen dosyalar: adimbot-chat-ui.js, adimbot-student.js, adimbot-student.css, tests/adimbot-voice-83.cjs, version.json, bu sürüm notu; index.php ve ogretmenim.php yalnız robot CSS önbellek referansı. JS referansları zaten içerik hash'i kullanır. API, sağlayıcı anahtar/model ayarları, roller, veritabanı, ders iş mantığı, menü ve genel tasarım değiştirilmedi.

Testler: node --check adimbot-chat-ui.js; node --check adimbot-student.js; node tests/adimbot-voice-83.cjs; node tests/adimbot-speech-81.cjs; node tests/adimbot-lifecycle-82.cjs geçti. Testler gerçek kaynak işlevlerini VM'de taklit mikrofon/recognition/fetch/zamanlayıcılarla yürütür. Kayıt temizleme, boyut, tekrar sonuç, final sonuç, gecikmiş JSON, JSON aşamasında timeout, eski controller, stale cooldown, HTTP-date, güvenli sabit hata mesajları ve ifade kaynak kontrolleri kapsanır. CSS parantez ve yayın kapsamı kontrolleri yapıldı.

Sınırlamalar: Playwright mevcut fakat Chromium çalıştırılabilir dosyası yok; tarayıcı başlatma başarısız. Görsel doğrulama ve ses dinleme yapılmadı. PHP çalıştırıcısı, gerçek API, gerçek mikrofon ve mobil Safari/fiziksel cihaz testleri yapılmadı. Görsel kalite ve canlı çalışma doğrulanmış değildir. Kaydın bitiş/izin davranışları gerçek Safari'de ayrıca denenmelidir. Yeni ücretli TTS, sağlayıcı veya ödeme entegrasyonu etkinleştirilmedi.

Sonraki öncelik: gerçek cihazda mikrofon/ses/görsel regresyonu; Groq/Gemini sağlayıcı ayarları ve bağımsız bağlantı testlerinin çalışma doğrulaması.
