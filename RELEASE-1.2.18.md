# İlkAdım 1.2.18

## Öğretmen öğrenci listesinde sınıf / grup filtreleme

Bu sürüm, Öğretmen → Öğrencilerim ekranını kurumun Sınıflar / Gruplar yapısıyla bütünleştirir.

### Yeni filtre

Öğretmen artık öğrencilerini:

- kurum,
- sınıf seviyesi,
- kurum sınıfı / grubu

ile birlikte filtreleyebilir.

### Öğretmene özel grup listesi

Grup filtresinde kurumun bütün grupları gösterilmez.

Yalnız:

- aktif kurumda,
- öğretmene aktif olarak bağlı,
- aktif öğrenci içeren,
- aktif sınıf / gruplar

gösterilir.

Bu sayede öğretmen kendisine bağlı öğrencisi olmayan kurum gruplarını görmez.

### Öğrenci kartlarında grup bilgisi

Öğrenci satırlarında öğrencinin aynı kurum içindeki aktif sınıf / grup üyelikleri etiket olarak gösterilir.

Örneğin:

- Sınıf · 4-A · 4. sınıf
- Grup · Destek

### Öğrenci Raporu kurum bağlamı

Öğrencilerim ekranından Öğrenci Raporu açılırken `kurum_id` korunur.

Öğrenci Raporu bu bağlamı doğrudan kabul etmez. Yeni `tol_teacher_report_context()` fonksiyonu:

- öğretmenin aktif profilini,
- öğretmenin aynı kurumda aktif üyeliğini,
- öğrencinin aynı kurumda aktif üyeliğini,
- öğretmen–öğrenci ilişkisinin aynı kurumda bulunmasını,
- kurumun aktif olmasını

yeniden doğrular.

Doğrulama başarılıysa geri tuşu **Öğrencilerim** ekranına, aynı kurum bağlamında döner.

### Tenant güvenliği

Yeni `src/ogretmen_ogrenci_listesi.php` domain katmanı:

- öğretmenin aktif kurumlarını,
- öğretmene bağlı öğrencilerin bulunduğu grupları,
- sınıf / grup filtreli öğrenci listesini,
- öğrenci grup etiketlerini,
- doğrulanmış Öğrenci Raporu dönüş bağlamını

tek yerde ve kurum kapsamlı olarak yönetir.

Başka kuruma ait bir `grup_id` öğrenci filtresi olarak kullanılamaz.

### Test

Yeni testler:

- `tests/teacher-group-filter-143.cjs`
- `tests/teacher-group-filter-db-143.php`

MariaDB entegrasyon testi:

1. Öğretmenin iki aktif kurumunu doğrular.
2. Öğretmene bağlı öğrencisi olmayan grubu filtre listesinden çıkarır.
3. Kurum öğrenci listesinin yalnız bağlı öğrencileri getirdiğini doğrular.
4. Sınıf seviyesi filtresini doğrular.
5. Sınıf / grup filtresini doğrular.
6. Başka kurum grup kimliğinin sonuç vermediğini doğrular.
7. Öğrenci grup etiketlerini doğrular.
8. Öğrenci Raporu geri bağlamını gerçek öğretmen–öğrenci ilişkisiyle doğrular.
9. Öğretmenin kurum üyeliği pasif olduğunda öğrenci listesi ve rapor bağlamını kapatır.
