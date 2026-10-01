# İlkAdım 1.2.12

## Kurum Raporları gelişmiş performans görünümü

Bu sürüm, Kurum Raporları ekranını yeni Sınıf / Grup yapısı ve öğretmen içerik sistemiyle bütünleştirir.

### Yeni filtreler

Kurum raporu artık şu filtreleri birlikte destekler:

- Sınıf seviyesi
- Kurum sınıfı / grubu
- Başlangıç tarihi
- Bitiş tarihi

Sınıf / grup filtresi yalnızca seçili kurumun aktif kayıtlarından oluşur. Başka kuruma ait bir grup kimliği sunucu tarafında reddedilir.

### Birleşik performans görünümü

Öğrenci bazında şu metrikler birlikte gösterilir:

- Sistem sorusu yanıt sayısı
- Sistem sorusu doğru sayısı
- Öğretmen sorusu yanıt sayısı
- Öğretmen sorusu doğru sayısı
- Birleşik doğruluk oranı
- Atanan ödev sayısı
- Tamamlanan ödev sayısı
- Ödev tamamlama oranı
- Süresi geçmiş ve hâlâ bekleyen ödev sayısı

Kurum özetinde de aynı verilerin toplamları gösterilir.

### Tarih filtresi davranışı

- Sistem sorularında cevap tarihi kullanılır.
- Öğretmen sorularında cevap tarihi kullanılır.
- Ödevlerde içerik yayın tarihi kullanılır.
- "Süresi geçmiş bekleyen" değeri rapor görüntülendiği andaki mevcut tamamlanma durumuna göre hesaplanır.

Bu davranış rapor ekranında açıkça belirtilir.

### Tenant / kurum izolasyonu

Yeni `src/kurum_raporlari.php` domain katmanı eklendi.

- Kurum öğrencileri yalnız aktif `kurum_kullanicilari` üyeliğinden gelir.
- Öğretmen soruları `ogretmen_icerikleri.kurum_id` ile kuruma sınırlandırılır.
- Ödevler aynı kurumun aktif öğretmen üyeliği ve `ogretmen_ogrenci.kurum_id` ilişkisiyle eşleştirilir.
- Seçili öğrenci hedefleri yalnız aynı öğrenci için dikkate alınır.
- Sınıf / grup üyeliği hem `kurum_id` hem `kurum_sinif_id` ile sınırlandırılır.

### Öğrenci detaya geçiş

Kurum raporundaki her öğrenci satırı mevcut Öğrenci Raporu'na bağlanır.

- Öğrenci raporu artık e-posta yerine öğrenci adını öncelikli gösterir.
- Kurum raporundan açılmışsa kurum kimliği sunucu tarafında aktif öğrenci üyeliğiyle doğrulanır.
- Doğrulama başarılıysa geri tuşu **Kurum Raporları** ekranına döner.
- Yetkisiz veya sahte kurum bağlamı geri bağlantıyı değiştiremez.

### Test

Yeni testler:

- `tests/institution-reporting-137.cjs`
- `tests/institution-reporting-db-137.php`

MariaDB entegrasyon testi iki ayrı kurumla şu durumları doğrular:

1. Başka kurum öğrencisinin rapora sızmaması
2. Başka kurum öğretmen sorularının sayılmaması
3. Sınıf / grup filtresinin yalnız kendi üyelerini getirmesi
4. Başka kuruma ait grup filtresinin reddedilmesi
5. Tüm öğrencilere verilen ve seçili öğrenciye verilen ödevlerin doğru sayılması
6. Tamamlanan ve süresi geçmiş ödev sayılarını doğru hesaplama
7. Sistem ve öğretmen sorularının tarih filtresinde doğru toplanması
