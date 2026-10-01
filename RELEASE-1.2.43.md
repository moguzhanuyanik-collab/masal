# İlkAdım 1.2.43

## Versiyonlu Yasal Belge & Açık Onay Merkezi

Bu sürüm İlkAdım'a versiyonlu yasal metin yönetimi, kullanıcı bazlı açık onay kaydı, yeni sürümde yeniden onay ve Süper Admin onay raporu ekler.

Bu altyapı teknik kayıt ve onay mekanizmasıdır. KVKK, gizlilik ve kullanım koşulları metinlerinin hukuki içeriği hukuk danışmanı tarafından ayrıca gözden geçirilmelidir.

### Geriye Uyumlu Başlangıç

Migration 077 hiçbir yasal metni otomatik yayınlamaz.

Bu nedenle 1.2.43 kurulunca mevcut kullanıcılar aniden sistemden kilitlenmez.

Zorunlu onay yalnız Süper Admin bir belge sürümünü:

`Yayınla`

işlemiyle aktif hale getirdiğinde başlar.

### Belge Türleri

İlk sürümde desteklenen belge türleri:

- KVKK Aydınlatma Metni
- Gizlilik Politikası
- Kullanım Koşulları

### Sürüm Yönetimi

Süper Admin yeni belgeyi önce **Taslak** olarak oluşturur.

Taslakta:

- belge türü,
- sürüm numarası,
- başlık,
- metin,
- hedef roller,
- zorunlu / bilgilendirme seçimi,
- yürürlük tarihi

tanımlanır.

Taslak düzenlenebilir.

Yayınlandıktan sonra belge metni değiştirilemez. Yeni içerik için yeni sürüm oluşturulur.

Aynı belge türünün yeni sürümü yayınlandığında önceki yayın sürümü arşive alınır.

### Gelecek Tarihli Belge Koruması

Gelecek yürürlük tarihli bir taslak saklanabilir ancak yürürlük tarihinden önce yayınlanamaz.

Bu kural eski sürümün erken arşivlenip kullanıcıların geçici olarak zorunlu belgesiz kalmasını önler.

### Hedef Roller

Belge sürümü ayrı ayrı şu rollere hedeflenebilir:

- Öğrenci
- Veli
- Öğretmen
- Yönetici
- Süper Admin

Varsayılan taslak seçimi dış kullanıcı rolleri içindir; Süper Admin ayrıca seçilebilir.

### Zorunlu Onay Kapısı

Yayında, zorunlu ve yürürlükte olan belge sürümü kullanıcının rolünü hedefliyorsa kullanıcıdan açık onay istenir.

Kullanıcı onaylamadıysa:

- normal authenticated sayfalara geçemez,
- öğrenci ana uygulamasına geçemez,
- öğrenci API çağrılarında normal veri alamaz.

Öğrenci API'si:

- HTTP 428
- `legal_consent_required: true`
- bekleyen belge sayısı

döndürür.

### Açık Onay Ekranı

Yeni sayfa:

`yasal-onay.php`

Her zorunlu belge ayrı kartta tam metniyle gösterilir.

Her belge için ayrı checkbox bulunur:

`Bu belgeyi okudum ve bu sürümü onaylıyorum.`

Tek toplu checkbox kullanılmaz.

Tüm zorunlu belgeler ayrı ayrı işaretlenmeden devam edilemez.

Kullanıcı onay vermek istemezse çıkış yapabilir.

### Exact-Hash Onay

Belge bütünlüğü SHA-256 hash ile tutulur.

Onay kaydı:

- belge ID,
- kullanıcı ID,
- onay anındaki rol,
- belge hash,
- onay tarihi,
- IP hash,
- user-agent hash

içerir.

IP adresinin kendisi saklanmaz.

Bir onayın zorunluluğu karşılaması için kayıtlı:

`belge_hash`

ile aktif belgenin:

`icerik_hash`

değeri eşleşmek zorundadır.

Bu nedenle aynı ID üzerinde içerik bütünlüğü bozulursa eski onay geçerli sayılmaz.

### Yeni Sürümde Yeniden Onay

Yeni belge sürümü yeni bir belge ID'si ve hash oluşturur.

Önceki sürüme ait onay geçmişte kalır ancak yeni sürüm için kullanıcı yeniden açık onay vermelidir.

### Onay Geçmişim

Kullanıcılar:

`Hesap Güvenliği → Yasal Belgeler ve Onay Geçmişim`

bağlantısından daha önce onayladıkları belge sürümlerini ve onay zamanlarını görebilir.

### Süper Admin Yasal Belge Merkezi

Yeni sayfa:

`yasal-belgeler.php`

Süper Admin:

- taslak oluşturabilir,
- yalnız taslağı düzenleyebilir,
- hukuki kontrol onay kutusuyla yayınlayabilir,
- taslak veya yayındaki sürümü arşivleyebilir,
- yayın sürümlerinin onay durumunu görebilir.

Yayınlama işleminde ayrıca:

`Hukuki kontrol tamam`

kutusunun açıkça işaretlenmesi gerekir.

### Onay Raporu

Her yayındaki sürüm için:

- hedef aktif kullanıcı sayısı,
- onaylayan sayısı,
- bekleyen sayısı

gösterilir.

Detaylı raporda:

- kullanıcı adı,
- e-posta,
- rol,
- Onaylandı / Bekliyor durumu,
- onay zamanı

görülebilir.

IP hash ve user-agent hash yönetim raporunda gösterilmez.

### Silinmeyen Geçmiş

Yasal belgeler ve kullanıcı onayları fiziksel olarak silinmez.

Belge sürümü arşivlenebilir ancak:

- eski belge sürümü,
- eski onay kaydı,
- onay tarihi,
- belge hash

geçmişte korunur.

### Yeni Migration

`077_yasal_belge_onay_merkezi.sql`

Yeni tablolar:

- `yasal_belgeler`
- `yasal_belge_onaylari`

Migration yasal içerik seed etmez veya otomatik yayınlamaz.

### Test

Yeni testler:

- `tests/legal-consent-168.cjs`
- `tests/legal-consent-db-168.php`

Testler:

1. boş kurulumda kullanıcının bloke olmamasını,
2. taslağın zorunlu onay oluşturmamasını,
3. hedef rolün yayın sonrası bekleyen onay almasını,
4. hedef olmayan rolün bloke olmamasını,
5. tüm belgelerin ayrı işaretlenme zorunluluğunu,
6. IP'nin hash olarak saklanmasını,
7. exact document hash onayını,
8. yayınlanan belgenin değiştirilememesini,
9. hash uyumsuz onayın geçersiz sayılmasını,
10. yeni sürümün yeniden onay istemesini,
11. eski sürüm ve onay geçmişinin korunmasını,
12. ayrıntılı Onaylandı / Bekliyor raporunu,
13. gelecek tarihli belgenin erken yayınlanamamasını,
14. arşiv işleminin geçmişi silmemesini

doğrular.
