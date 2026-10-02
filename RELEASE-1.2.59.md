# İlkAdım 1.2.59

## Ticari Mutabakat Aksiyon & İstisna Merkezi

Bu sürüm 1.2.58 Ticari Mutabakat & Kontrol Merkezi'nin tespit ettiği operasyon açıklarını ve veri bütünlüğü anomalilerini kalıcı, izlenebilir operasyon vakalarına dönüştürür.

Yeni migration:

`086_ticari_mutabakat_aksiyon_merkezi.sql`

Migration zinciri:

`086`

olur.

## Amaç

1.2.58 şu sorulara cevap veriyordu:

- hangi sözleşme mutabık,
- hangisinde operasyon açığı var,
- hangisinde veri kontrolü gerekiyor,
- hangi belge açık,
- hangi tahsilat dağıtılmamış,
- hangi kurum/sözleşme/para birimi ilişkisi bozuk.

Ancak tespit edilen sorunun:

- kimin sorumluluğunda olduğu,
- incelenip incelenmediği,
- dış aksiyon bekleyip beklemediği,
- hangi notların alındığı,
- sonraki takip tarihinin ne olduğu,
- kaynak sorun çözülünce gerçekten kapandığı,
- aynı sorun tekrar oluşursa geçmişin korunup korunmadığı

izlenmiyordu.

1.2.59 bu operasyon katmanını ekler.

## Yeni Sayfa

Yeni Süper Admin sayfası:

`ticari-mutabakat-aksiyon.php`

Yeni domain:

`src/ticari_mutabakat_aksiyon.php`

Yeni stil:

`ticari-mutabakat-aksiyon.css`

## Finansal Kaynaklara Dokunmaz

Mutabakat Aksiyon Merkezi:

- sözleşme değiştirmez,
- tahsilat değiştirmez,
- belge değiştirmez,
- belge–tahsilat eşlemesi değiştirmez,
- finansal tutarı yeniden yazmaz.

Yeni tablolar yalnız:

- kaynak vaka kimliği,
- sorun sınıfı,
- operasyon aşaması,
- sorumlu,
- sonraki aksiyon,
- son teşhis açıklaması,
- append-only vaka geçmişi

tutar.

Kaynak finansal gerçek mevcut ticari tablolarda kalır.

## Yeni Tablolar

### ticari_mutabakat_vakalari

Her tekil kaynak sorunu için tek operasyon vakası tutar.

Temel alanlar:

- anahtar
- kaynak_turu
- kaynak_kodu
- kaynak_id
- kaynak_alt_id
- sozlesme_id
- kurum_id
- para_birimi
- sorun_turu
- durum
- sorumlu_kullanici_id
- sonraki_aksiyon_tarihi
- son_tespit_tarihi
- son_aciklama
- kapanma_kodu
- kapanma_tarihi
- oluşturan/güncelleyen kullanıcı
- timestamp alanları

### ticari_mutabakat_vaka_gecmisi

Append-only operasyon geçmişidir.

Alanlar:

- vaka_id
- kullanici_id
- tur
- kod
- not_metni
- olusturulma_tarihi

Uygulama akışında vaka ve geçmiş fiziksel olarak silinmez.

## Stabil Vaka Kimliği

Her vaka deterministik SHA-256 kaynak anahtarına sahiptir.

Sözleşme mutabakat vakasında anahtar:

`sozlesme_mutabakat + sozlesme_id`

üzerinden türetilir.

Bu nedenle aynı sözleşme:

- önce Operasyon Açığı,
- sonra Veri Bütünlüğü sorunu,
- sonra tekrar Operasyon Açığı

olsa bile yeni vaka açılmaz.

Aynı vaka kimliği korunur.

Belge/tahsilat/eşleme kimlik anomalilerinde anahtar kaynak kayıt ID'lerinden türetilir.

## Sorun Türleri

### Operasyon Açığı

1.2.58 sözleşme mutabakat durumu:

`eksik`

ise vaka:

`operasyon`

olarak açılır.

Örnek:

- belgesiz sözleşme tutarı,
- açık belge tutarı,
- dağıtılmamış tahsilat.

### Veri Bütünlüğü

1.2.58 sözleşme mutabakat durumu:

`hata`

ise veya gerçek kimlik anomalisi varsa vaka:

`butunluk`

olarak açılır.

Kapsanan kimlik anomalileri:

- belge–sözleşme kurum/para birimi uyumsuzluğu,
- tahsilat–sözleşme kurum/para birimi uyumsuzluğu,
- belge–tahsilat eşleme kimlik uyumsuzluğu,
- sözleşme/belge/eşleme kapasite aşımı.

Kapasite aşımı ayrıca ikinci duplicate vaka açmaz; ilgili sözleşmenin tek mutabakat vakası üzerinden izlenir.

## Büyük Veri / Sayfalama

1.2.58:

`tm_contract_rows()`

okuyucusu geriye uyumlu olarak:

- `sozlesme_id` hedef filtresi,
- `offset`

desteği kazanır.

1.2.59 sözleşme mutabakat taramasını 1000 kayıtlık sayfalarda yürütür.

Bu nedenle ilk 500/800/2000 UI kaydının dışında kalan açık sözleşmeler sırf liste limitine takıldığı için yanlışlıkla çözülmüş sayılmaz.

## Vaka Senkronizasyonu

Süper Admin:

`Mutabakat Vakalarını Senkronize Et`

işlemini çalıştırır.

İşlem:

1. güncel sözleşme mutabakat açıklarını tarar,
2. belge kimlik anomalilerini tarar,
3. tahsilat kimlik anomalilerini tarar,
4. eşleme kimlik anomalilerini tarar,
5. kaynak anahtarına göre vaka oluşturur/günceller,
6. kapanmış kaynak sorun geri geldiyse aynı vakayı yeniden açar,
7. artık kaynakta bulunmayan sorunları tekrar hedefli sorguyla doğrular,
8. gerçekten çözülmüş vakaları otomatik kapatır.

## GET Yan Etkisi Yok

Sayfayı açmak vaka senkronizasyonu yapmaz.

Senkronizasyon yalnız:

- POST
- CSRF

ile çalışır.

Bu nedenle salt görüntüleme operasyon tablolarına sessiz yazım yapmaz.

## Manuel Kapatma Yok

Kullanıcı için:

`Vakayı Kapat`

işlemi yoktur.

Kaynak sorun devam ederken vaka elle gizlenemez.

Kapalı durum yalnız senkronizasyon:

`kaynak artık bu sorunu üretmiyor`

doğrulamasını yaptıktan sonra oluşur.

Kapanma kodu:

`kaynak_cozuldu`

olarak saklanır.

## Yeniden Açılma

Kaynak sorun çözülüp vaka kapandıktan sonra aynı sorun tekrar oluşursa:

- ikinci vaka açılmaz,
- eski vaka silinmez,
- aynı vaka `acik` durumuna döner,
- kapanma bilgileri temizlenir,
- append-only geçmişe `vaka_yeniden_acildi` eklenir.

Sorumlu bilgisi korunur.

Eski operasyon geçmişi korunur.

## Sorun Sınıfı Değişirse

Aynı sözleşme vakası örneğin:

`Veri Bütünlüğü → Operasyon Açığı`

veya tersi yönde değişirse:

- yeni vaka oluşmaz,
- mevcut vakanın güncel sorun türü/kodu yenilenir,
- geçmişe `sinif_degisti` olayı yazılır.

## Vaka Aşamaları

Açık vaka şu aşamalarda tutulabilir:

- Açık
- İncelemede
- Dış Aksiyon Bekleniyor

Kapalı ayrı kullanıcı seçeneği değildir.

## Sorumlu Atama

İlk:

- aşama değişikliğini,
- veya takip notunu

yapan Süper Admin vaka sorumlusu olarak atanır.

Mevcut sorumlu sonraki işlemlerde sessizce değiştirilmez.

## Takip Notu

Vaka içine 2–2000 karakter arası operasyon notu eklenebilir.

Örnek:

- belge kontrol edildi,
- muhasebe dönüşü bekleniyor,
- yanlış kurum referansı düzeltilecek,
- tahsilat eşleme kaydı yeniden incelenecek.

Not append-only geçmişe yazılır.

## Sonraki Aksiyon Tarihi

Opsiyonel:

`sonraki_aksiyon_tarihi`

tanımlanabilir.

Tarih:

- bugün,
- veya gelecek

olmalıdır.

Geçmiş tarih kabul edilmez.

Zamanı gelen açık aksiyonlar dashboard sayacında ayrıca gösterilir.

## Son Kaynak Teşhisi

Vaka tablosu:

`son_aciklama`

alanında en son kaynak teşhis metnini tutar.

Bu alan finansal gerçek veya muhasebe snapshot'ı değildir.

Her senkronizasyonda güncel teşhis açıklamasıyla yenilenir.

Vaka geçmişindeki kullanıcı notları ayrıca korunur.

## Otomatik Kapanma Öncesi Hedefli Doğrulama

Bir vaka tarama sonucunda görünmüyorsa doğrudan kapatılmaz.

Kaynak türüne göre tekrar doğrulanır:

### Sözleşme Mutabakat

Belirli sözleşme ID'si:

`tm_contract_rows(... sozlesme_id ...)`

ile tekrar hesaplanır.

### Belge Kimliği

Belge ile sözleşme kurum/para birimi ilişkisi tekrar sorgulanır.

### Tahsilat Kimliği

Tahsilat ile sözleşme kurum/para birimi ilişkisi tekrar sorgulanır.

### Eşleme Kimliği

Belge+tahsilat mapping kimliği tekrar sorgulanır.

Yalnız hedef doğrulama da sorunun çözülmüş olduğunu gösterirse vaka kapatılır.

## Aksiyon Kuyruğu

Kuyruk filtreleri:

- tüm açık vakalar,
- Açık,
- İncelemede,
- Dış Aksiyon Bekleniyor,
- Kapalı,
- Veri Bütünlüğü,
- Operasyon Açığı,
- kurum,
- sözleşme,
- kurum/sözleşme/açıklama arama

destekler.

Sıralama:

1. açık vakalar,
2. veri bütünlüğü,
3. aksiyon zamanı gelmiş vakalar,
4. takip tarihi bulunan vakalar,
5. son güncellenenler

şeklindedir.

## Vaka Detayı

Detay ekranı:

- kurum,
- sözleşme,
- kaynak türü,
- kaynak kodu,
- para birimi,
- sorumlu,
- son tespit,
- sonraki aksiyon,
- son kaynak teşhisi,
- append-only vaka geçmişi

gösterir.

Kaynağa göre:

- Mutabakat Kontrolü,
- Kurum Ticari 360,
- Sözleşme,
- Ticari Belge,
- Eşlemeler

sayfalarına güvenli yönlendirme bulunur.

## 1.2.58 Ayrımı Korunur

`ticari-mutabakat.php`

salt-okunur teşhis ekranı olmaya devam eder.

Yeni aksiyon merkezi:

`ticari-mutabakat-aksiyon.php`

operasyonel vaka metadata'sını yönetir.

Bu iki sorumluluk tek sayfada birbirine karıştırılmaz.

## Menü Entegrasyonu

Mutabakat Aksiyon Merkezi bağlantısı:

- Süper Admin,
- Ticari Yönetim Dashboardu,
- Ticari Mutabakat & Kontrol,
- Ticari Belge & Tahakkuk

ekranlarına eklendi.

## Yeni Testler

- `tests/commercial-reconciliation-actions-184.cjs`
- `tests/commercial-reconciliation-actions-db-184.php`

MariaDB testi şunları doğrular:

1. ilk senkronizasyonda operasyon açığı vakasını,
2. kapasite aşımı sözleşme vakasını,
3. belge kimlik anomalisini,
4. tahsilat kimlik anomalisini,
5. eşleme kimlik anomalisini,
6. tekil kaynak anahtarlarını,
7. tekrar senkronizasyonun idempotent olmasını,
8. sorun türü özetini,
9. vaka aşaması değişikliğini,
10. sorumlu atamasını,
11. takip notunu,
12. sonraki aksiyon tarihini,
13. append-only takip geçmişini,
14. aynı sözleşmenin bütünlük sorunundan operasyon açığına geçerken yeni vaka oluşturmamasını,
15. sınıf değişikliğinin geçmişe yazılmasını,
16. kaynak mutabık olunca otomatik kapanmayı,
17. kapalı vakanın manuel aşama değişikliğiyle açılamamasını,
18. sorun tekrar oluşunca aynı vakanın yeniden açılmasını,
19. yeniden açılmada duplicate vaka oluşmamasını,
20. yeniden açılma geçmişini,
21. belge/tahsilat/eşleme kimlikleri düzeltildiğinde üç vakanın otomatik kapanmasını,
22. sözleşme mutabakatı tamamlanınca vakanın kapanmasını,
23. tüm kaynak sorunlar giderilince açık vaka sayısının sıfıra inmesini,
24. kapalı vaka geçmişinin fiziksel olarak korunmasını,
25. hedefli sözleşme mutabakat okumasını.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- CSRF,
- transaction,
- vaka row lock,
- deterministik SHA-256 vaka anahtarı,
- DB unique vaka anahtarı,
- hedefli kaynak tekrar doğrulaması,
- manuel kapatma yasağı,
- append-only geçmiş,
- kaynak finansal tablolara otomatik yazım yapılmaması

ile çalışır.
