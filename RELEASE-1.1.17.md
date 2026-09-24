# İlkAdım 1.1.17 — AdımBot Sesli Sohbet Geliştirmesi

- Uzun AdımBot yanıtları tek parça yerine doğal cümle sınırlarında kısa ses parçalarına ayrılarak okunur.
- Ses parçaları yaklaşık 180 karakteri geçmeyecek şekilde bölünür; uzun tek cümlelerde uygun boşluklardan güvenli bölme yapılır.
- Yapay zekâ yanıtlarının seslendirilmesi otomatik olarak yeni uzun-okuma akışını kullanır.
- Sohbetteki her AdımBot yanıtına “🔊 Tekrar dinle”, “⏸ Duraklat / ▶️ Devam” ve “⏹ Durdur” kontrolleri eklendi.
- Tekrar dinleme de uzun yanıtları parçalara ayırarak okur.
- Duraklatılan sistem sesi kaldığı yerden devam ettirilebilir; durdurma ise mevcut okumayı tamamen keser.
- Türkçe ses seçimi, öğrenci ayarlarındaki konuşma hızı ve mevcut ağız/kol konuşma animasyonları korunur.
- 1.1.16 duygu sistemi, 1.1.15 ders özeti, 1.1.14 birlikte çözelim modu ve önceki güvenlik kuralları korunur.
- Robotun sürükleme koordinatlarına, veritabanına ve sunucu AI güvenlik kurallarına dokunulmadı.
