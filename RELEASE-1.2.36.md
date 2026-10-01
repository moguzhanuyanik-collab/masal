# İlkAdım 1.2.36

## Paket / Lisans Yönetimi

Bu sürüm, İlkAdım'ın kurumsal satış tarafındaki en önemli eksiklerden biri olan paket ve kurum lisans altyapısını ekler.

### Yeni Süper Admin Modülü

Yeni sayfa:

`paketler.php`

Süper Admin artık:

- paket oluşturabilir,
- paket düzenleyebilir,
- kullanılmayan paketi pasife alabilir,
- kuruma paket atayabilir,
- lisansı aktif / deneme / askıda / iptal durumunda tutabilir,
- başlangıç ve bitiş tarihi belirleyebilir,
- satış / sözleşme notu ekleyebilir,
- kurumun mevcut öğrenci / öğretmen / veli kullanımını paket limitiyle birlikte görebilir.

### Paket Kapasiteleri

Her pakette:

- öğrenci limiti,
- öğretmen limiti,
- veli limiti,
- aylık AI kota limiti,
- aylık liste fiyatı,
- TRY / USD / EUR para birimi

tanımlanabilir.

Kullanıcı limitlerinde `0` değeri **sınırsız** anlamına gelir.

### Kullanıcı Limitlerinin Gerçek Uygulanması

Aktif veya deneme lisansı bulunan kurumlarda paket kapasitesi artık yalnız ekranda gösterilmez; kullanıcı işlemlerine bağlanır.

Kontrol edilen işlemler:

- yeni öğrenci / öğretmen / veli ekleme,
- kullanıcıyı başka kuruma taşıma,
- pasif kurum üyesini yeniden aktifleştirme.

Limit doluysa işlem başlamadan güvenli şekilde reddedilir.

### Geriye Uyumluluk

En kritik güvenlik kuralı:

**Kurumun lisans kaydı yoksa mevcut davranış aynen devam eder ve kullanıcı limiti uygulanmaz.**

Bu nedenle 1.2.36 kurulduğu anda mevcut kurumlar veya kullanıcılar kendiliğinden kilitlenmez.

Ayrıca:

- askıdaki lisans mevcut kullanıcı erişimini kapatmaz,
- süresi dolmuş lisans mevcut kullanıcı erişimini kapatmaz,
- paket limitleri yalnız aktif / deneme ve tarih olarak geçerli lisansın yeni kapasite işlemlerini sınırlar.

Tam abonelik erişim kesme politikası daha sonra ayrı ve kontrollü bir sürümde ele alınabilir.

### AI Kotası

Paketlerde aylık AI kotası tanımı eklenmiştir.

Bu sürümde kota ticari paket verisi olarak saklanır. AdımBot gerçek kullanım sayacına bağlama ayrı bir entegrasyon adımı olarak bırakılmıştır; böylece mevcut AI akışı bu sürümde riske atılmaz.

### Veritabanı

Yeni migration:

`071_paket_ve_kurum_lisanslari.sql`

Yeni tablolar:

- `paketler`
- `kurum_lisanslari`

Bir kurum için tek güncel lisans satırı tutulur; paket değişikliği aynı kurum lisansını güvenli biçimde günceller.

### Test

Yeni testler:

- `tests/institution-license-161.cjs`
- `tests/institution-license-db-161.php`

MariaDB testi:

1. Paket oluşturmayı,
2. lisans atamayı,
3. öğrenci limitini,
4. öğretmen limitini,
5. veli kapasitesini,
6. lisansı olmayan kurumun geriye uyumluluğunu,
7. askı durumunun mevcut sistemi kilitlememesini,
8. aynı kurum için lisans upsert davranışını,
9. kullanım sayılarının tenant bazında hesaplanmasını

doğrular.
