# İlkAdım 1.2.10

## Kurum kullanıcılarında tam CRUD

Bu sürüm, Kurum Öğretmenleri, Velileri, Öğrencileri ve Yöneticileri sayfalarında eksik kalan düzenleme ve güvenli pasife alma/yeniden aktifleştirme akışını tamamlar.

### Ortak kullanıcı yönetimi

Dört kurum rol sayfası artık aynı merkezi ve güvenli CRUD çekirdeğini kullanır:

- yeni kullanıcı oluşturma,
- mevcut kullanıcıyı düzenleme,
- kurumdan güvenli biçimde çıkarma,
- pasif üyeliği yeniden aktifleştirme.

Kurumdan çıkarma fiziksel silme yapmaz.

Kullanıcının başka aktif kurum üyeliği varsa yalnız ilgili kurum üyeliği pasif olur. Başka aktif kurum üyeliği yoksa kullanıcı hesabı ve rol profili de pasife alınır. Yeniden aktifleştirme işlemi üyeliği, hesabı ve rol profilini birlikte geri açar.

### Düzenleme

Aktif kayıtlar listeden **Düzenle** ile modal içinde güncellenebilir.

- Ad Soyad
- E-posta
- İsteğe bağlı yeni şifre
- Öğretmen / Veli için telefon
- Öğrenci için sınıf seviyesi

Şifre alanı boş bırakıldığında mevcut şifre korunur.

### Öğrenci sınıf seviyesi düzeltmesi

Merkezi `km_update_member()` fonksiyonunda eksik olan öğrenci sınıf seviyesi güncellemesi tamamlandı.

Ayrıca merkezi `km_create_member()` artık öğrenci oluştururken seçilen sınıf seviyesini `ky_create_user()` fonksiyonuna aktarır. Böylece AJAX Kurumlar modülü ile oluşturulan öğrenciler de yanlışlıkla varsayılan 1. sınıfta oluşmaz.

### Pasif kayıt görünürlüğü

`ky_role_members()` geriye dönük uyumlu şekilde `includeInactive` seçeneği kazandı.

CRUD sayfaları:

- aktif üyelik,
- kullanıcı hesabı durumu,
- profil durumu

bilgilerini ayrı ayrı okuyarak pasif kaydı listede tutar ve **Yeniden aktifleştir** işlemini sunar.

### Güvenlik

- Tüm POST işlemleri CSRF korumalıdır.
- Yönetici yalnız kendi yönetebildiği kurumda işlem yapabilir.
- Rol bazlı yönetici izinleri korunur.
- Kurum Yöneticileri sayfası yalnız Süper Admin tarafından yönetilebilir.
- Süper Admin hesabının kurumdan silinmesini engelleyen mevcut koruma korunur.
- Kurumdan çıkarma öncesi kullanıcıya onay sorulur.
- Tüm merkezi CRUD işlemleri audit kaydına yazılır.

### Test

Yeni testler:

- `tests/institution-member-crud-135.cjs`
- `tests/institution-member-crud-db-135.php`

MariaDB entegrasyon testi gerçek bir öğrenci kaydı üzerinde:

1. ad/e-posta/sınıf güncelleme,
2. kurumdan güvenli çıkarma,
3. üyelik + hesap + profil pasiflik kontrolü,
4. pasif kaydın yönetim listesinde görünmesi,
5. yeniden aktifleştirme,
6. ikinci restore çağrısının idempotent davranması

akışını doğrular.
