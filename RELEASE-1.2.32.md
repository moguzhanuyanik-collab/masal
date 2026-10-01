# İlkAdım 1.2.32

## Kurum İçerikleri sınıf / grup performans filtresi

Bu sürüm, 1.2.31 ile öğretmen dashboard'larına eklenen yayın-anı sınıf / grup performans filtresini Yönetici / Süper Admin tarafındaki **Kurum İçerikleri** dashboard'una taşır.

### Yeni Sınıf / Grup filtresi

Kurum İçerikleri ekranında artık:

- Öğretmen
- Sınıf / grup
- İçerik türü
- Yayın durumu
- Performans durumu

filtreleri birlikte kullanılabilir.

Sınıf / grup seçenekleri mevcut `ogretmen_icerik_hedef_gruplari` yayın-anı snapshot tablosundan üretilir.

### Yayın-anı performans hesabı

Bir sınıf / grup seçildiğinde soru ve ödev performans rakamları yalnız seçili grubun yayın anındaki öğrenci snapshot'ı üzerinden hesaplanır.

Soru için:

- Hedef öğrenci
- Cevaplayan
- Doğru
- Yanlış
- Bekleyen
- Doğruluk oranı

yalnız seçili grup öğrencilerinden oluşur.

Ödev için:

- Hedef öğrenci
- Tamamlayan
- Geciken
- Bekleyen
- Tamamlama oranı

yalnız seçili grup öğrencilerinden oluşur.

### Tarihsel tutarlılık

Grup üyeliği yayın sonrasında değişse bile eski içerik performansı değişmez.

Dashboard canlı `kurum_sinif_ogrencileri` üyeliğine göre yeniden hesap yapmaz; 1.2.31'de saklanan yayın-anı snapshot'ını kullanır.

Bu nedenle:

- 4-A yayın anındaki öğrencileriyle kalır.
- Destek grubu kendi yayın-anı öğrencileriyle kalır.
- Aynı öğrenci iki seçili gruptaysa her grubun kendi performansında ayrı ayrı görünür.
- Genel içerik hedefinde öğrenci yine tekilleştirilmiş olarak kalır.

### Eski yayınlar

1.2.31 öncesinde grup snapshot'ı bulunmayan yayınlar:

- genel Kurum İçerikleri görünümünde aynen görünmeye devam eder,
- belirli bir sınıf / grup filtresinde görünmez.

Bu davranış eski veriyi tahmin ederek yanlış gruba bağlamayı engeller.

### Detay ekranı sürekliliği

Grup filtresindeki bir içerikten **Detay** ekranına geçildiğinde `grup_id` korunur.

Detay ekranında:

- yalnız aynı snapshot grubunun öğrencileri listelenir,
- soru doğru / yanlış / bekleyen özeti aynı gruba göre hesaplanır,
- ödev tamamlandı / gecikti / bekleyen özeti aynı gruba göre hesaplanır,
- seçili snapshot grubu açıkça gösterilir.

Dashboard kartındaki rakamlarla detay öğrenci listesi birebir aynı kapsamı kullanır.

### Fail-closed güvenlik

Yönetici URL üzerinden kurum içeriğine ait olmayan veya başka kuruma ait bir `grup_id` gönderirse:

- dashboard filtresi 403 ile reddedilir,
- detay ekranı geçersiz snapshot bağlamında açılmaz.

### Tenant güvenliği

Mevcut kurum içerik güvenlik kuralları korunur:

- aktif öğretmen,
- öğretmenin içerik kurumunda aktif üyeliği,
- öğretmen–öğrenci ilişkisinin aynı kurumda olması,
- aktif öğrenci profili ve kullanıcı hesabı,
- öğrencinin aynı kurumda aktif üyeliği,
- seçili öğrenci hedeflemesi.

Grup snapshot filtresi bu kuralların üzerine ek bir daraltma olarak uygulanır.

### Migration

Yeni migration yoktur.

Bu sürüm, 1.2.31'de eklenen:

`ogretmen_icerik_hedef_gruplari`

tablosunu kullanır.

### Test

Yeni testler:

- `tests/institution-group-performance-157.cjs`
- `tests/institution-group-performance-db-157.php`

MariaDB entegrasyon testi:

1. Kurumdaki 4-A ve Destek snapshot gruplarını doğrular.
2. Başka kurum snapshot grubunun seçeneklere sızmadığını doğrular.
3. Snapshot'sız eski yayının genel görünümde kaldığını doğrular.
4. 4-A soru performansını yalnız Ada + Bora ile hesaplar.
5. Destek soru performansını yalnız Bora + Cem ile hesaplar.
6. İki grubun doğru / yanlış / bekleyen sayılarını ayrı doğrular.
7. 4-A ve Destek ödev tamamlanma / gecikme sayılarını ayrı doğrular.
8. Başka kurum grup filtresinin sonuç üretmediğini doğrular.
9. Detay ekranında 4-A ve Destek öğrenci listelerinin dashboard ile aynı olduğunu doğrular.
10. Snapshot'ı olmayan eski yayının belirli grup detayında açılmadığını doğrular.
