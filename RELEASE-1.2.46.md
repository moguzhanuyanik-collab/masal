# İlkAdım 1.2.46

## Paket & Lisans Veri Bütünlüğü Sertleştirmesi

Bu sürüm paket/lisans yönetiminde hedef doğrulamasını, lisans değişiklik geçmişini ve AdımBot lisans yetkilendirmesini sertleştirir.

### Olmayan Paket Güncellemesi Artık Başarılı Görünmez

Önceki kodda paket güncellemesinde yalnız gönderilen ID'nin sıfırdan büyük olması kontrol ediliyordu.

Bu nedenle veritabanında bulunmayan bir paket ID'sine UPDATE çalışıp 0 satır etkilediğinde işlem hatasız gibi görünebiliyordu.

1.2.46'da güncelleme öncesi paket satırı:

`SELECT ... FOR UPDATE`

ile kilitlenir ve varlığı doğrulanır.

Paket gerçekten yoksa:

`Paket bulunamadı.`

hatası üretilir.

### Paket Aktif / Pasif İşlemi Hedef Doğrulaması

Paket aktiflik değişikliğinde de hedef paket önce kilitlenir.

Kurallar:

- olmayan paket ID'si hata verir,
- aynı duruma geçiş güvenli no-op olarak kabul edilir,
- gerçek durum değişikliği 1 satır etkilemek zorundadır,
- aktif lisanslarda kullanılan paket pasife alınamaz.

Böylece 0 affected-row işlemleri yanlış başarı olarak raporlanmaz.

### Append-only Lisans Değişiklik Geçmişi

Yeni migration:

`079_paket_lisans_butunlugu.sql`

Yeni tablo:

`kurum_lisans_gecmisi`

079'dan sonra yapılan lisans değişiklikleri için:

- lisans ID,
- kurum ID,
- işlem,
- eski paket,
- yeni paket,
- eski durum,
- yeni durum,
- eski başlangıç/bitiş,
- yeni başlangıç/bitiş,
- işlemi yapan kullanıcı,
- zaman

saklanır.

Geçmiş satırları güncellenmez veya silinmez.

### Lisans Notlarında Veri Minimizasyonu

Lisansın serbest metin notu geçmiş tablosuna ikinci kez açık metin olarak kopyalanmaz.

Bunun yerine:

- `eski_not_hash`
- `yeni_not_hash`

SHA-256 olarak saklanır.

Böylece değişiklik kanıtı korunurken ticari/operasyonel notların gereksiz kopyaları oluşturulmaz.

### Demo Satış Lisans Geçmişi

1.2.45 Demo & Satış akışı da yeni geçmiş tablosuna bağlandı.

079 kuruluysa şu işlemler lisans geçmişine eklenir:

- `demo_deneme`
- `demo_donusum`
- `demo_kayip`

079 henüz kurulu değilse eski akış kırılmaz.

### Lisans Kaydetme Artık Kilitli ve Açık Upsert

Kurum lisansı kaydedilirken mevcut lisans:

`FOR UPDATE`

ile kilitlenir.

Sistem açıkça iki akıştan birini çalıştırır:

- mevcut lisansı güncelle,
- yoksa yeni lisans oluştur.

Aynı değerlerle yapılan no-op kayıtta gereksiz geçmiş satırı üretilmez.

### AdımBot Lisans Yetki Motoru

Yeni:

`kl_ai_entitlement()`

katmanı, AI kota işleminden önce öğrencinin gerçekten AI erişim hakkı olup olmadığını çözer.

#### Geriye uyumluluk

Öğrenci yalnız **tek bir kuruma** bağlıysa ve o kurumda hiç lisans kaydı yoksa mevcut legacy davranış korunur:

- AI açık,
- kota uygulanmaz,
- kullanım mümkünse kurum bazında izlenir.

#### AI erişimi kapalı durumlar

Kurumda lisans kaydı varsa aşağıdaki durumlar artık legacy lisanssız davranışına düşmez:

- Askıda → `license_suspended`
- İptal → `license_cancelled`
- Süresi doldu → `license_expired`
- Henüz başlamadı → `license_not_started`
- Lisansın paketi pasif → `package_inactive`
- Paket kaydı bulunamıyor → `license_package_missing`

Bu durumlarda AI isteği fail-closed engellenir.

### Çoklu Kurum AI Belirsizliği

Bir öğrenci birden fazla kuruma bağlıysa:

- yalnız bir kurumda uygun aktif/deneme lisansı varsa o kurum seçilir,
- birden fazla uygun aktif lisans varsa istek engellenir,
- hiçbir uygun lisans yok fakat lisans kayıtları varsa istek engellenir,
- birden fazla tamamen legacy/lisanssız kurum varsa tenant seçimi belirsiz olduğu için istek engellenir.

Böylece kurum seçilemediğinde kota kontrolünün tamamen atlanması engellenir.

### API Yanıtları Ayrıldı

Aylık kota dolduğunda mevcut davranış korunur:

- HTTP 429
- `reason: institution_ai_quota`

Lisans/kurum yetkisi nedeniyle engellendiğinde:

- HTTP 403
- `reason: institution_ai_license`
- `license_reason`

döner.

Kullanıcıya "kota doldu" yerine lisansın veya kurum seçiminin uygun olmadığı anlatılır.

### Paket & Lisans Veri Bütünlüğü Taraması

Paket & Lisans ekranına:

`PAKET / LİSANS BÜTÜNLÜĞÜ`

alanı eklendi.

Şunlar raporlanır:

- paket kaydı bulunmayan lisans,
- aktif/deneme lisansında pasif paket,
- pasif kurum üzerinde aktif/deneme lisansı.

Geçmiş veri otomatik değiştirilmez.

### Süper Admin AI Görünürlüğü

AI Kullanım Merkezi artık lisansın etkin durumunu dikkate alır.

Askıda, iptal, süresi dolmuş, başlamamış veya pasif paketli lisans:

`AI Kapalı`

olarak görünür.

### Lisans Değişiklik Geçmişi Ekranı

Bir kurum lisansı düzenleme için seçildiğinde Süper Admin aynı ekranda 079 sonrası lisans değişikliklerini görebilir:

- işlem türü,
- işlemi yapan,
- eski paket / durum,
- yeni paket / durum,
- zaman.

### Test

Yeni testler:

- `tests/package-license-integrity-171.cjs`
- `tests/package-license-integrity-db-171.php`

Ayrıca eski:

- `institution-license-161`
- `adimbot-license-quota-162`

regresyonları yeni güvenlik davranışına uyarlanmıştır.

MariaDB testi şunları doğrular:

1. olmayan paket ID'sinin güncellenememesini,
2. olmayan paket aktiflik hedefinin reddedilmesini,
3. aynı aktiflik durumunun güvenli no-op olmasını,
4. lisans oluşturma geçmişinin yazılmasını,
5. lisans notunun yalnız hash'inin geçmişe gitmesini,
6. aynı lisansı tekrar kaydetmenin gereksiz geçmiş üretmemesini,
7. durum değişikliğinde eski/yeni durumun korunmasını,
8. askıdaki lisansın AI kullanımını engellemesini,
9. süresi dolmuş lisansın AI kullanımını engellemesini,
10. gelecek başlangıçlı lisansın AI kullanımını engellemesini,
11. geçerli aktif lisansın kota rezervasyonunu,
12. kullanılan paketin pasife alınamamasını,
13. geçmişte pasife düşmüş paketin AI erişimini engellemesini,
14. bütünlük tarayıcısının pasif paketli canlı lisansı bulmasını,
15. tek legacy lisanssız kurumun geriye uyumlu kalmasını,
16. iki aktif lisanslı kurum belirsizliğinin fail-closed olmasını,
17. belirsiz isteğin rastgele kuruma kullanım yazmamasını,
18. iki legacy/lisanssız kurum belirsizliğinin engellenmesini,
19. pasif kurum üzerindeki canlı lisansın bütünlük taramasında görünmesini.

### Migration Zinciri

Bu sürümle migration zinciri:

`079`

olur.
