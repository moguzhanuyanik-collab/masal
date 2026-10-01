# İlkAdım 1.2.30

## Öğretmen içeriklerinde sınıf / grup hedefleme

Bu sürüm, kurumun mevcut Sınıflar / Gruplar altyapısını Öğretmen → İçeriklerim yayın hedefleme akışına bağlar.

### Yeni sınıf / grup hedefleme

Öğretmen içerik oluştururken veya henüz öğrenci aktivitesi oluşmamış bir içeriği düzenlerken:

- bir veya daha fazla kurum sınıfı / grubu seçebilir,
- isterse buna ek olarak tek tek öğrenciler de seçebilir.

Seçilen sınıf / grupların geçerli öğrencileri ile tekil öğrenci seçimleri sunucu tarafında birleştirilir ve tekilleştirilir.

### Yalnız öğretmene bağlı öğrenciler

Bir sınıf / grup hedef olarak görünmek için:

- aktif olmalı,
- seçili kurumda bulunmalı,
- en az bir aktif öğrencisi olmalı,
- bu öğrenci aktif kullanıcı hesabına sahip olmalı,
- öğrenci aynı kurumda aktif öğrenci üyesi olmalı,
- öğrenci ilgili öğretmene aynı kurumda bağlı olmalı,
- öğretmen aynı kurumda aktif öğretmen üyesi olmalı.

Öğretmene bağlı öğrencisi bulunmayan gruplar hedef seçeneklerinde gösterilmez.

### Snapshot hedefleme

Sınıf / grup seçimi dinamik bir bağ olarak saklanmaz.

Yayın anında grupta bulunan ve öğretmene bağlı aktif öğrenciler mevcut
`ogretmen_icerik_hedefleri` tablosuna tek tek yazılır.

Böylece grup üyeliği daha sonra değişirse:

- eski yayınların hedef listesi değişmez,
- eski soru / ödev performans raporları bozulmaz,
- geçmiş öğrenci sonuçları farklı kişilere taşınmaz.

### Birden fazla grup ve tekil öğrenci

Öğretmen aynı yayında:

- 4-A sınıfını,
- Destek grubunu,
- ayrıca tekil bir öğrenciyi

birlikte seçebilir.

Aynı öğrenci birden fazla seçimin içinde bulunuyorsa hedef listesine yalnız bir kez yazılır.

### Fail-closed güvenlik

URL / POST üzerinden:

- başka kuruma ait grup,
- öğretmene bağlı öğrencisi bulunmayan grup,
- artık erişilemeyen grup

gönderilirse sistem bunu "tüm öğrencilere gönder" olarak yorumlamaz.

İşlem hata vererek durur.

Bu davranış özellikle boş / geçersiz grup kimliğinin yanlışlıkla tüm sınıfa yayın üretmesini engeller.

### Mevcut akışlarla uyum

- Tüm bağlı öğrenciler
- Tek tek öğrenci seçimi
- İçerik düzenleme
- Güvenli kopyalama
- Soru / tekrar / ödev / not / diğer türleri
- Yıldız ödülü
- Ödev teslim tarihi

davranışları korunur.

### Arayüz

İçerik formuna yeni **Sınıf / grup hızlı hedefleme** alanı eklendi.

Her sınıf / grup için:

- tür,
- ad,
- sınıf seviyesi,
- öğretmene bağlı geçerli öğrenci sayısı

gösterilir.

### Test

Yeni testler:

- `tests/teacher-group-targeting-155.cjs`
- `tests/teacher-group-targeting-db-155.php`

MariaDB entegrasyon testi:

1. Başka kurum gruplarını hedef seçeneklerinden çıkarır.
2. Öğretmene bağlı öğrencisi olmayan grubu çıkarır.
3. Grup öğrenci sayısını yalnız geçerli bağlı öğrencilerle hesaplar.
4. Tek bir grubu öğrenci kimliklerine çözer.
5. Başka kurum / boş grup hedefini fail-closed reddeder.
6. Birden fazla grup ve tekil öğrenci seçimini birleştirip tekilleştirir.
7. Grup hedefli içeriği `secili_ogrenciler` snapshotı olarak kaydeder.
8. Grup üyeliği sonradan değişse bile eski yayının hedef snapshotının değişmediğini doğrular.
9. Öğretmen kurum üyeliği pasif olduğunda grup hedefleme erişimini kapatır.
