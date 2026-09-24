# İlkAdım 1.1.5 — AdımBot Bağlamsal Sohbet Yardımcıları

- AdımBot sohbet modalı açıldığında mevcut ders/konu/etkinlik bağlamını küçük bir bilgi etiketiyle gösterir.
- Çocukların uzun soru yazmak zorunda kalmaması için üç güvenli hızlı yardım düğmesi eklendi:
  - Basit anlat
  - İpucu ver
  - Örnek ver
- Hızlı yardım düğmeleri mevcut AI güvenlik katmanından geçer; doğrudan cevap anahtarı istemez.
- “İpucu ver” isteği özellikle cevabı söylemeden yönlendirme ister.
- Hızlı yardım seçenekleri mobil ekranda yatay kaydırılabilir ve ana ders ekranını değiştirmez.
- 1.1.4 kısa sohbet hafızası, Temizle düğmesi ve oturum içi geçmiş korunur.
- 1.1.3 robot üzerindeki 💬 modal sohbet ve ayrı AdımBot Ayarları sayfası korunur.
- CSRF, timeout, hız limiti, kişisel veri filtresi ve cevap anahtarı koruması aynen devam eder.
