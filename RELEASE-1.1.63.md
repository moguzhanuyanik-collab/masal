# İlkAdım v1.1.63

## AdımBot ses kuyruğu ve bağlantı dayanıklılığı

- Tarayıcının ağ isteği başarısız olduğunda hata bağlantı sorunu olarak tanınır; öğrencinin sorusu kaybolmadan yeniden gönderilebilir.
- Sohbet isteğinin tarayıcı zaman aşımı, yönetici panelindeki 40 saniyelik sunucu sınırını erken kesmeyecek şekilde güvenli payla 45 saniyeye çıkarıldı.
- Ses yazıya çevirme uç noktası JSON yerine geçici HTML veya bozuk yanıt döndürürse durum kodu korunur ve anlaşılır ses hatasına çevrilir.
- Oturum, güvenlik kaynağı, yükleme ve mikrofonun kapalı olması ses akışında birbirinden farklı Türkçe mesajlarla gösterilir.
- Uzun yanıtın sıradaki ses parçası, öğrenci yeni bir konuşma başlatmışsa artık yeni sesi yarıda kesmez.
- Sekme arka plana geçtiğinde cihaz ses motoruna yeni konuşma gönderilmez; eski veya görünmeyen sayfanın konuşması duyulmaz.
- Sohbet geçmişi, ders bağlamı, ipucu seviyesi ve birlikte çözme durumu öğrenci kimliğine göre ayrıldı; aynı sekmede başka hesaba geçildiğinde önceki öğrenci konuşması taşınmaz.
- Sunucuda cURL bulunmaması ve sağlayıcı-model uyumsuzluğu öğrenci sohbet kotası artırılmadan önce yakalanır.
- Süper Admin konuşma modeli testi artık yalnız HTTP başarısını değil, Groq model kimliğini ve Gemini `generateContent` desteğini de doğrular.

## Kapsam

Yalnızca AdımBot sohbet köprüsü, sohbet arayüzü, cihaz seslendirmesi, AI uç noktası, AdımBot ayar ekranı, sürüm bilgisi ve bu sürüm notu değiştirildi. Canlı sisteme otomatik kurulum yapılmaz.
