# İlkAdım 1.1.14 — AdımBot Birlikte Çözelim Modu

- AdımBot sohbetine “🤝 Birlikte çözelim” modu eklendi.
- Mod açıldığında öğrenci adına soruyu çözmek yerine küçük adımlarla düşünme isteği başlatılır.
- İlk aşamada AdımBot'tan yalnızca ilk düşünme adımını sorması istenir; öğrenci yanıt verdikçe mevcut kısa sohbet geçmişi üzerinden konuşma devam eder.
- Mod açıkken düğme “🤝 Birlikte çözüyoruz” olarak değişir ve aria-pressed durumu güncellenir.
- Sohbet bağlam alanında modun açık olduğu ayrıca gösterilir.
- Aynı düğmeye tekrar basılarak birlikte çözüm modu kapatılabilir.
- Mod durumu aktif soru/ders bağlamının imzasına bağlı sessionStorage kaydıdır; farklı bağlama geçildiğinde eski mod aktif kabul edilmez.
- Sohbet temizlendiğinde birlikte çözüm modu da kapatılır.
- Mevcut cevap anahtarı engeli, çocuk güvenliği, kısa sohbet geçmişi ve AI güvenlik köprüsü değiştirilmedi.
- Yeni API uç noktası, veritabanı tablosu veya kişisel veri alanı eklenmedi.
- 1.1.13 zorlanılan ders algılama, 1.1.12 doğru cevap tepkileri, 1.1.11 yanlış cevap koçluğu ve 1.1.8 sürükleme stabilizasyonu korunur.
