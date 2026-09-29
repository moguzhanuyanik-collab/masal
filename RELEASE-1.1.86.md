# AdımBot v1.1.86
Taban: main v1.1.85, 49f8cde52702c17cca0023564738b0c250c3367d.
Kurulum: v1.1.85 → v1.1.86. Canlı kurulum yapılmadı.

Tamamlanan 15 ayrı değişiklik:
1. Mouse sağ/orta tuş pointerdown sürükleme başlatmaz.
2. Aktif sürüklemede ikinci pointer veya isPrimary=false olayı oturumu devralamaz.
3. Pointercancel robot konuşması/rehber dokunuşu olarak değerlendirilmez.
4. İlk 5 px içindeki dokunma titreşimi konum frame'i oluşturmaz; gerçek sürükleme eşiği korunur.
5. setPointerCapture hatasında dragging/pointer/class durumu temizlenir; devam eden konuşmanın jestleri yeniden planlanır.
6. Sadece tap ile manualPosition açılmaz ve yerel konum kaydı yeniden yazılmaz; gerçek taşıma kaydedilir.
7. Ok tuşlarıyla 8 px, Shift+ok ile 24 px taşıma ve sınırlandırılmış konum kaydı eklenir. Alt/Ctrl/Meta kombinasyonları ve aktif drag korunur.
8. Home varsayılan CSS konumunu/otomatik yerleştirmeyi geri getirir, kayıtlı konumu siler; mevcut görünür ekran sınırı yeniden uygulanır.
9. Robot stage için belirgin focus-visible çerçevesi eklenir; klavye taşıma ve Home açıklaması aria-label'a eklenir.
10. Sınır hesapları visualViewport offset/width/height kullanır; mobil klavye ve yakınlaştırmada layout viewport dışındaki görünür sınır korunur. visualViewport yoksa mevcut ölçü yedeği kullanılır.
11. Resize olayında manuel konum da görünür ekrana sınırlandırılır; geçici ekran daralması kayıtlı tercihi ezmez.
12. Visual viewport scroll/resize olayları tek requestAnimationFrame ile birleştirilir; yakınlaştırılmış görünüm kayarken robot tekrar sınırlandırılır.
13. Pageshow/görünür sayfaya dönüşte robotun konumu yeniden sınırlandırılır; suspension sırasında bekleyen viewport frame'i temizlenir.
14. Gerçek sürükleme sonunda iç karakter görseline kısa .28 saniyelik settle eklenir. Konuşmada, reduced-motion'da ve askıya alınmış sayfada tetiklenmez; ekran/widget koordinatı animasyonla oynatılmaz.
15. Enter/Space auto-repeat konuşmayı tekrar tekrar başlatmaz; normal tek basış ve ok tekrarı korunur.

Kök nedenler: tüm pointerdown olayları kabul ediliyordu; pointercancel normal pointerup gibi konuşmayı başlatıyordu; jitter konum yazıyordu; tap manualPosition'a dönüşüyordu; capture hatası yarım drag bırakıyordu; manualPosition resize düzeltmesini engelliyordu; sınırlar visualViewport'u dikkate almıyordu; klavyeyle konumlandırma/focus göstergesi yoktu.

Gerçekçilik katkısı: dokunma jitter'ında karakter sabit kalır; taşıma bitince yalnız iç görsel hafifçe dengeye gelir. Tekrarlanan tuşlar konuşmayı kesip yeniden başlatmaz. Mevcut karakter, konuşma, blink, hareket azaltma ve mobil frame birleştirme davranışı korunur.

Dosyalar: adimbot-student.js, adimbot-student.css, tests/adimbot-position-86.cjs, version.json, bu sürüm notu; index.php/ogretmenim.php yalnız robot CSS önbellek referansı 1.1.86. API/PHP iş mantığı, AI sağlayıcı/anahtar/model ayarları, sohbet modülü, roller, veritabanı, ders mantığı, menü ve genel tasarım değiştirilmedi.

Kontroller: node --check adimbot-student.js; adimbot-position-86.cjs, adimbot-speech-81.cjs, adimbot-lifecycle-82.cjs, adimbot-voice-83.cjs, adimbot-dialog-84.cjs ve adimbot-provider-speech-85.cjs geçti. Yeni test kaynak kodu VM'de taklit pointer/DOM/viewport/frame/storage ile yürütür: sağ tık/ikinci pointer, cancel, jitter, capture hatası, tap persistence, klavye/Home, görünür sınır, manual resize, pan birleştirme, resume, drop/reduced-motion/speaking guards ve key repeat. CSS focus/settle/reduced-motion kaynak ve parantez bütünlüğü kontrol edildi. Yayın kapsamı ve diff boşluk kontrolü yapıldı. Önceki sağlayıcı testindeki 11 çocuk güvenliği öz testi de geçti.

Sınırlamalar: gerçek tarayıcı görseli, fiziksel telefon/mikrofon, iOS/Android pinch/keyboard, gerçek TTS/API ve PHP çalışma testi yapılmadı; Chromium çalıştırılabilir dosyası ortamda yok. VisualViewport/PointerCapture davranışı gerçek cihazda ayrıca denenmeli. Aşırı yakınlaştırmada görünür alan robotun boyutundan küçükse bütün widget'ın aynı anda sığması garanti edilmez. Görsel kalite ve canlı çalışma doğrulanmış değildir. Canlı kurulum yapılmadı.
