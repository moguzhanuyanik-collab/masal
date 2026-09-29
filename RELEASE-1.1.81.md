# AdımBot v1.1.81

Taban: v1.1.80. Yalnız robotun seslendirme ve animasyon kapsamı.

Tamamlanan 15 değişiklik:
1. Ondalık sayılardaki nokta cümle sınırı sayılmaz.
2. Dr., Prof., Doç., Sn., vb. ve vs. kısaltmaları gereksiz bölünmez.
3. Uzun kelimeler bölünürken Unicode surrogate çiftleri korunur.
4. Emojiler yalnız ses metninden ayıklanır; balonda korunur.
5. Kalın yazı, başlık ve satır içi kod işaretleri ses metninden ayıklanır.
6. Sayılar arasındaki artı, çarpı, bölü, eksi ve eşittir işaretleri Türkçe sözcüklere dönüştürülür; hesaplama yapılmaz.
7. Cihaz varsayılanı olan tr-TR sesi varsa öncelikli seçilir; yoksa mevcut Türkçe seçim sırası korunur.
8. Kelime bazlı ağız temposu kayıtlı konuşma hızına uyarlanır.
9. Seslendirme zaman aşımı konuşma hızını hesaba katar.
10. Ses motorunun hata olayı uzun konuşmayı iptal eder; sonraki cümleye geçilmez.
11. Önceki isteğin gecikmiş başlangıç ve hata olayları yeni konuşmayı etkilemez.
12. Duraklatınca ağız kapanır, kol/pulse hareketi durur; paused durumu API'den izlenebilir.
13. Cümle arası beklemede duraklatma ve kalan süreyle devam desteklenir; Stop iptalini korur.
14. Hareketi azalt tercihi etkinse konuşma jestleri tetiklenmez.
15. Normal göz kırpma döngüsü tamamlanınca aralık 4.5–7.5 saniye arasında değişir; gizli/minimize/hareketi azalt durumunda yeni rastgele ayar yapılmaz.

Öğrenci ve öğretmen ekranlarında yalnız robot CSS önbellek referansı 1.1.81'e yükseltildi. Menü, ders iş mantığı, soru içeriği, veritabanı ve AI sağlayıcı ayarları değiştirilmedi.

Test: Node sözdizimi; metin hazırlama, ondalık/kısaltma, Unicode, Türkçe ses seçimi, cümle arası duraklatma/devam, iptal, eski callback, hata sonrası durma, hıza bağlı deadline testleri geçti. Animasyon korumaları ve CSS bütünlüğü kaynak kontrolünden geçti. Diff boşluk kontrolü temiz. Gerçek tarayıcı/telefon, dinleme ve görsel animasyon testi bu ortamda yapılamadı. Bunlar canlı doğrulanmış değildir. Canlı sisteme kurulmadı.

Kurulum sırası: v1.1.80 → v1.1.81.
