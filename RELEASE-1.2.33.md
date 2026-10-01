# İlkAdım 1.2.33

## Global Arşiv ve güvenli hesap geri açma

Bu sürüm, Süper Admin tarafındaki Global Öğrenci / Veli yönetiminde eksik olan pasif hesap geri dönüş akışını tamamlar.

### Sorun

Global Öğrenciler ve Global Veliler ekranındaki **Sil** işlemi fiziksel kayıt silmiyor; güvenli biçimde:

- `kullanicilar.aktif=0`
- ilgili öğrenci / veli profilinde `aktif=0`

yapıyordu.

Ancak pasife alınan kayıt aktif listeden çıktıktan sonra:

- tekrar görüntülenemiyor,
- yeniden aktifleştirilemiyor,
- yanlışlıkla pasife alınan global hesap için geri dönüş yolu bulunmuyordu.

### Yeni Global Arşiv

Yeni sayfa:

`global-arsiv.php`

Global Yönetim merkezine **Global Arşiv** bağlantısı eklendi.

Ayrıca:

- Global Öğrenciler ekranına **Arşiv**
- Global Veliler ekranına **Arşiv**

kısayolu eklendi.

### Arşiv kapsamı

Global Arşiv yalnız:

- global öğrenci,
- global veli

hesaplarını gösterir.

Öğretmen ve yönetici kurum üyeliği gerektiren roller olduğu için Global Arşiv kapsamına eklenmez.

### Yarım-pasif hesap koruması

Arşiv yalnız iki kaydı birden pasif olan hesapları değil, veri tutarsızlığı nedeniyle:

- kullanıcı pasif / profil aktif,
- kullanıcı aktif / profil pasif

durumunda kalan global hesapları da yakalar.

Bu hesap **Aktifleştir** edildiğinde kullanıcı ve profil birlikte aktif hale getirilir.

### Kurum güvenliği

Bir kullanıcıda aktif `kurum_kullanicilari` üyeliği varsa hesap global arşiv kaydı sayılmaz.

URL / POST üzerinden böyle bir hesabı global olarak geri açma denemesi de reddedilir.

Bu sayede kurum hesabı yanlışlıkla kurumdan bağımsız global hesaba dönüştürülmez.

### Güvenli geri açma

Yeni domain fonksiyonu:

`ky_restore_global_user()`

Aktifleştirme:

- yalnız Süper Admin tarafından yapılabilir,
- rol allow-list kontrolünden geçer,
- aktif kurum üyeliği olmadığını tekrar doğrular,
- kullanıcı + öğrenci / veli profilini tek transaction içinde açar,
- hata durumunda rollback yapar,
- `global_kullanici_aktif` audit kaydı oluşturur.

### Eşleştirme korunur

Global veli–öğrenci ilişkileri pasife alma sırasında fiziksel olarak silinmediği için geri açmada da korunur.

Örneğin:

1. Global veli ile öğrenci eşleştirilir.
2. Veli veya öğrenci pasife alınır.
3. Hesap Global Arşiv'den tekrar aktifleştirilir.
4. Eski global eşleştirme aynen devam eder.

### Arayüz

Global Arşiv:

- Tüm pasif hesaplar
- Öğrenciler
- Veliler

filtrelerini destekler.

Tabloda:

- hesap adı,
- rol,
- e-posta,
- bağlı veli / öğrenci bilgisi,
- kullanıcı/profil pasif durumu,
- Aktifleştir işlemi

gösterilir.

Yeni genel CSS veya tasarım bileşeni eklenmedi; mevcut Süper Admin tasarım sistemi kullanıldı.

### Migration

Yeni migration yoktur.

Mevcut `kullanicilar`, `ogrenciler`, `veliler`, `veli_ogrenci` ve `kurum_kullanicilari` tabloları kullanılır.

### Test

Yeni testler:

- `tests/global-archive-158.cjs`
- `tests/global-archive-db-158.php`

MariaDB entegrasyon testi:

1. Aktif global hesabın arşive girmediğini doğrular.
2. Tam pasif global öğrenciyi arşivde gösterir.
3. Yarım-pasif global öğrenciyi arşivde gösterir.
4. Pasif global veliyi arşivde gösterir.
5. Aktif kurum üyeliği bulunan pasif hesabı global arşivden çıkarır.
6. Öğrenciyi kullanıcı + profil katmanında birlikte geri açar.
7. Yarım-pasif öğrenciyi tutarlı aktif duruma getirir.
8. Veliyi kullanıcı + profil katmanında birlikte geri açar.
9. Global veli–öğrenci ilişkilerinin geri açmada korunduğunu doğrular.
10. Aktif kurum üyeliği bulunan hesabın geri açılmasını reddeder.
11. Süper Admin olmayan aktörün geri açma işlemini reddeder.
12. Başarılı geri açmaların audit kaydı ürettiğini doğrular.
