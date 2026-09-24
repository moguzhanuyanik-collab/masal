# İlkAdım 1.1.10 — AdımBot Akıllı İpucu Sistemi

- Sohbetteki tek aşamalı “İpucu ver” davranışı kademeli yardım sistemine dönüştürüldü.
- İlk dokunuşta “💡 1. ipucu” yalnızca küçük bir yönlendirme ister.
- Aynı soru için ikinci aşama “💡 2. ipucu” olur ve biraz daha açıklayıcı yardım ister.
- Üçüncü aşama “🧠 Birlikte açıkla” olur; soru 1. sınıf seviyesinde adım adım açıklanır.
- Üç aşamada da doğru cevap veya doğru şık doğrudan istenmez; son adım öğrenciye bırakılır.
- İpucu seviyesi mevcut ders/soru bağlamına bağlıdır. Öğrenci başka bir soruya geçtiğinde yeni bağlam sıfırdan 1. ipucuyla başlar.
- İpucu durumu yalnızca sessionStorage içinde tutulur; veritabanına veya öğrenci profiline yazılmaz.
- Sohbet temizlendiğinde ipucu aşaması da sıfırlanır.
- Sohbet yeniden açıldığında aynı soru için mevcut ipucu aşaması doğru düğme etiketiyle geri gösterilir.
- Basit anlat ve Örnek ver hızlı yardımcıları korunur.
- Mevcut sunucu tarafı cevap anahtarı engeli ve çocuk güvenliği kuralları aynen korunur.
- 1.1.9 gelişmiş ders bağlamı ve 1.1.8 sürükleme stabilizasyonu değiştirilmedi.
