# İlkAdım v1.1.22

## Tamamlanan ders soruları
- Öğrencinin tamamladığı ders adımları mevcut öğrenci state ve `ogrenci_ilerleme` kayıtlarından okunur.
- Tamamlanmış bir modül için soru metni, seçenekler ve doğru cevap bilgisi öğrenciye tekrar gönderilmez.
- Modül sırası değiştirilmez; `ders-kodu + modul-indeksi` anahtarı korunur.
- Tamamlanmamış veya yanlış cevap verilmiş sorular normal şekilde açık kalır.

## Aynı oturum koruması
- Yeni `completed-question-guard.js`, mevcut `window.LESSONS` verisini öğrencinin tamamlanan `steps` listesine göre korur.
- Öğrenci aynı oturumda bir soruyu doğru tamamladıktan sonra ilerleme state'i güncellendiğinde ilgili modülün soru/şık verisi yeniden kullanılamaz.
- Sayfa/rota değişimlerinde koruma tekrar uygulanır.

## Bilerek değiştirilmedi
- `app-runtime.js` GitHub'da olmadığı için değiştirilmedi.
- `src/bootstrap.php` GitHub'da olmadığı için değiştirilmedi.
- İlerlemeyi sıfırlama davranışına dokunulmadı.
- Veritabanı şeması veya migration eklenmedi.
- CSS değiştirilmedi.
- Öğrenci ekranının DOM/tasarım yapısı değiştirilmedi.
- Logo, ikon, AdımBot görseli ve diğer resimler değiştirilmedi.

Taban sürüm: v1.1.21
