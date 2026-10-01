# İlkAdım 1.2.44

## Ticari Finans Veri Bütünlüğü Sertleştirmesi

Bu sürüm yeni bir ticari modül eklemek yerine 1.2.38 ile gelen sözleşme / tahsilat merkezindeki veri bütünlüğü kurallarını güçlendirir.

Yeni migration yoktur. Mevcut tablo yapısı korunur.

### Çoklu Tahsilatta Finans Özeti Düzeltmesi

Önceki finans özeti sözleşmeleri doğrudan tahsilat satırlarına join ederek topluyordu.

Bir sözleşmede iki veya daha fazla tahsilat olduğunda aynı sözleşme toplamı tahsilat satırı sayısı kadar tekrar toplanabiliyordu.

1.2.44'te aktif tahsilatlar önce:

`sozlesme_id`

bazında alt sorguda toplanır.

Ardından her sözleşme finans özetine yalnız bir kez katılır.

Böylece örneğin:

- sözleşme toplamı: 1.000 TRY
- tahsilat 1: 200 TRY
- tahsilat 2: 300 TRY

durumunda özet:

- sözleşme: 1.000 TRY
- tahsil edilen: 500 TRY
- kalan: 500 TRY

olarak kalır; sözleşme toplamı 2.000 TRY'ye şişmez.

### Sözleşme Kurumu Tahsilat Sonrası Sabit

Bir sözleşmede herhangi bir tahsilat geçmişi oluştuktan sonra sözleşmenin kurumu değiştirilemez.

Bu kural yalnız aktif tahsilatlar için değil:

- aktif tahsilat,
- sonradan iptal edilmiş tahsilat

geçmişinin tamamı için geçerlidir.

Sebep: tahsilat satırı kendi `kurum_id` bilgisini taşır. Sözleşmenin daha sonra başka kuruma taşınması geçmiş finans kayıtlarının tenant sahipliğini bozabilir.

### Para Birimi Geçmiş Sonrası Sabit

Herhangi bir tahsilat geçmişi bulunan sözleşmenin para birimi artık değiştirilemez.

İptal edilmiş tahsilat geçmişi de bu korumaya dahildir.

### Aktif Tahsilat Varken Sözleşme İptali Engeli

Aktif tahsilatı olan sözleşme doğrudan:

`iptal`

durumuna alınamaz.

Önce aktif tahsilatların nedenleriyle ayrı ayrı iptal edilmesi gerekir.

Böylece "iptal sözleşme + aktif tahsilat" tutarsızlığı yeni işlemlerde üretilemez.

### Tahsilat Geçmişi Varken Taslağa Dönüş Yok

Tahsilat geçmişi oluşmuş sözleşme yeniden:

`taslak`

durumuna alınamaz.

Taslak durumu yalnız henüz finansal hareketi başlamamış sözleşmeler için kullanılabilir.

### Tamamlandı Durumu Artık Bakiye Türevi

`tamamlandi` durumu manuel ticari tercih olmaktan çıkarıldı.

Sistem aktif tahsilat toplamını sözleşme toplamıyla karşılaştırır:

- aktif tahsilat toplamı sözleşme toplamına ulaştıysa → `tamamlandi`
- bakiye varsa → `aktif`

Sözleşme toplamı sonradan artırılırsa daha önce tamamlanmış sözleşme otomatik yeniden `aktif` olur.

Sözleşme toplamı aktif tahsilat toplamına eşitlenirse otomatik `tamamlandi` olur.

### Tahsilat İptalinde Durum Yeniden Hesaplanır

Tahsilat iptal edildiğinde sözleşme durumu kalan aktif tahsilatlara göre yeniden hesaplanır.

Bu yalnız "tamamlandı → aktif" özel durumu değildir; bakiye ile durum tek bir normalizasyon kuralından türetilir.

### İptal Sözleşmeler Finans Özetine Girmez

Finans özeti yalnız:

- aktif
- tamamlandı

sözleşmeleri toplar.

Taslak ve iptal sözleşmeler ticari portföy toplamına katılmaz.

Aktif tahsilat geçmişi yanlışlıkla iptal bir sözleşmede kalmış eski veri varsa finans özeti bu sözleşmeyi ticari toplamda göstermez; bunun yerine veri bütünlüğü tarayıcısı uyarı üretir.

### Geçmiş Tutarsız Kayıtlar Artık Gizlenmez

Eski sürümde tahsilat geçmişi sorgusu:

`sozlesme_id + kurum_id`

eşleşmesini join şartı olarak kullanıyordu.

Geçmişte sözleşme kurumu değiştirilmişse tahsilat satırı ekrandan tamamen kaybolabiliyordu.

1.2.44'te tahsilat geçmişi sözleşmeye yalnız `sozlesme_id` ile bağlanır.

Tahsilatın kayıtlı kurumu ile sözleşmenin güncel kurumu farklıysa kayıt görünür kalır ve açık uyarı gösterilir.

### Veri Bütünlüğü Tarayıcısı

Ticari Finans ekranına yeni:

`VERİ BÜTÜNLÜĞÜ`

alanı eklendi.

Şunlar taranır:

1. tahsilat kurumu ile sözleşme kurumu uyuşmayan geçmiş kayıtlar,
2. iptal durumda olup aktif tahsilatı bulunan sözleşmeler,
3. bakiye ile sözleşme durumu uyuşmayan kayıtlar.

Bu ekran geçmişte oluşmuş kayıtları otomatik değiştirmez.

Ama yeni işlemlerde aynı tutarsızlıkların oluşması domain kurallarıyla engellenir.

### UI Açıklamaları

Sözleşme düzenleme ekranında artık açıkça belirtilir:

- tahsilat geçmişinden sonra kurum değiştirilemez,
- tahsilat geçmişinden sonra para birimi değiştirilemez,
- aktif tahsilatlar iptal edilmeden sözleşme iptal edilemez,
- Tamamlandı durumu tahsilata göre otomatik belirlenir.

### Test

Yeni testler:

- `tests/commercial-finance-integrity-169.cjs`
- `tests/commercial-finance-integrity-db-169.php`

MariaDB testi şunları doğrular:

1. iki tahsilatın sözleşme toplamını çoğaltmamasını,
2. iki tahsilatın tahsil edilen toplamda birer kez sayılmasını,
3. tahsilat geçmişinden sonra kurum değişikliğinin engellenmesini,
4. para birimi değişikliğinin engellenmesini,
5. aktif tahsilat varken sözleşme iptalinin engellenmesini,
6. tahsilat geçmişi varken taslağa dönüşün engellenmesini,
7. tam ödeme durumunun otomatik tamamlanmasını,
8. sözleşme tutarı artırılınca durumun otomatik aktifleşmesini,
9. tüm tahsilatlar iptal edilince sözleşmenin iptal edilebilmesini,
10. iptal edilmiş tahsilat geçmişinin kurum sahipliğini yine kilitlemesini,
11. iptal sözleşmenin finans özetinden çıkmasını,
12. eski kurum/tahsilat uyuşmazlığının görünür kalmasını,
13. veri bütünlüğü tarayıcısının geçmiş sorunları tespit etmesini.

### Geriye Uyumluluk

Bu sürüm yeni tablo veya kolon eklemez.

Migration zinciri 077'de kalır.

Mevcut ticari kayıtlar otomatik değiştirilmez veya silinmez.

Yeni kurallar yalnız yeni yazma işlemlerini güvenli hale getirir; geçmiş tutarsızlıklar raporlanır.
