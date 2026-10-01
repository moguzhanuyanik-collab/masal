# İlkAdım 1.2.13

## Öğrenci Raporu detaylı öğretmen içeriği görünümü

Bu sürüm, Kurum Raporları ekranından öğrenciye inildiğinde açılan Öğrenci Raporu'nu öğretmen soruları ve ödevlerle tamamlar.

### Öğretmen içerikleri özeti

Öğrenci raporunda artık:

- Atanan öğretmen sorusu sayısı
- Yanıtlanan öğretmen sorusu sayısı
- Doğru öğretmen sorusu sayısı
- Öğretmen sorusu doğruluk oranı
- Atanan ödev sayısı
- Tamamlanan ödev sayısı
- Ödev tamamlama oranı
- Süresi geçmiş bekleyen ödev sayısı

gösterilir.

### Ödev ayrıntıları

Son aktif ödevler ayrı bölümde listelenir.

Her ödevde:

- Ders
- Öğretmen
- Yayın tarihi
- Teslim tarihi
- Tamamlanma tarihi
- Bekliyor / Süresi geçti / Tamamlandı durumu

görünür.

### Öğretmen soruları

Son aktif öğretmen soruları ayrı bölümde listelenir.

Her soruda:

- Ders
- Öğretmen
- Yayın tarihi
- Bekliyor / Doğru / Yanlış durumu
- Cevaplandıysa deneme sayısı

gösterilir.

### Kurum bağlamı ve tenant izolasyonu

Kurum Raporları üzerinden öğrenci raporuna girildiyse:

- Kurum kimliği önce öğrencinin aktif kurum üyeliğiyle doğrulanır.
- Öğretmen içerikleri yalnız doğrulanmış kurum kimliğiyle filtrelenir.
- Başka kurumun öğretmen sorusu veya ödevi drill-down ekranına karışmaz.
- Öğrencinin aktif kurum sınıf/grup üyelikleri gösterilir.
- Geri bağlantısı Kurum Raporları ekranına döner.

Kurum bağlamı yoksa mevcut yetkilendirilmiş öğrenci raporu davranışı korunur ve erişilebilir öğretmen içerikleri birlikte gösterilir.

### Genel durum iyileştirmesi

Genel durum bölümüne mevcut normalize öğrenci verilerinden:

- Sistem soru yanıtı
- Sistem doğru yanıtı

metrikleri de eklendi.

### Domain ve test

Yeni `src/ogrenci_rapor_detay.php` domain katmanı:

- kurum bazlı öğretmen içeriği filtreleme,
- soru/ödev özet hesaplama,
- son ödev ve soru sıralama

işlemlerini test edilebilir biçimde sağlar.

Yeni testler:

- `tests/student-report-detail-138.cjs`
- `tests/student-report-detail-138.php`

Testler farklı kurum içeriklerinin ayrılmasını, soru doğruluk hesabını, ödev tamamlanma/gecikme hesabını ve son kayıt sıralamasını doğrular.
