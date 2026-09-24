# İlkAdım 1.1.7 — AdımBot Modal Odak ve Mobil Klavye

- AdımBot sohbet modalına klavye odak kilidi eklendi; Tab ve Shift+Tab modal dışına kaçmaz.
- Escape ile modal kapatıldığında odak, sohbeti açan 💬 düğmesine geri döner.
- Modal başlığı ve açıklaması erişilebilirlik için aria-labelledby / aria-describedby ile bağlandı.
- AI yanıtı beklenirken modal aria-busy durumuna geçer; hızlı yardım düğmeleri geçici olarak pasifleşir.
- Mobil cihazlarda ekran klavyesi açıldığında taşmayı azaltmak için dinamik viewport (dvh) yüksekliği kullanılır.
- 1.1.6 Tekrar dinle, karakter sayacı ve çevrimdışı geri bildirim özellikleri korunur.
- Önceki kısa sohbet hafızası, bağlamsal yardımcılar, güvenlik katmanı ve ayrı AdımBot Ayarları sayfası değişmedi.
