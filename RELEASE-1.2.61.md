# İlkAdım 1.2.61

## Mutabakat Toplu Aksiyon Planlama

Bu sürüm 1.2.60 Mutabakat Aksiyon Sağlığı ekranının görünür hale getirdiği sahipsiz, aksiyon tarihi olmayan ve gecikmiş açık vakaları güvenli toplu planlama akışına bağlar.

Yeni migration yoktur.

Migration zinciri:

`086`

olarak kalır.

## Amaç

1.2.59 vaka bazında:

- sorumlu,
- aşama,
- takip notu,
- sonraki aksiyon

yönetiyordu.

1.2.60 ise:

- sahipsiz,
- aksiyon tarihi olmayan,
- gecikmiş,
- 8+ gün açık,
- ilk müdahale görmemiş

vakaları yönetim görünümünde ortaya çıkarıyordu.

Ancak çok sayıda vaka tek tek açılıp planlanmak zorundaydı.

1.2.61 bu operasyon yükünü güvenli toplu sahiplik ve tarih planlamasıyla azaltır.

## Yeni Sayfa

Yeni Süper Admin sayfası:

`ticari-mutabakat-planlama.php`

Yeni domain:

`src/ticari_mutabakat_planlama.php`

Yeni stil:

`ticari-mutabakat-planlama.css`

## Kapsam

Toplu planlama yalnız:

- sorumlu Süper Admin,
- sonraki aksiyon tarihi

alanlarını değiştirir.

Opsiyonel plan notu append-only geçmişe yazılır.

Toplu planlama:

- vaka aşamasını değiştirmez,
- kaynak finansal kaydı değiştirmez,
- vaka kapatmaz,
- kaynak sorunu çözülmüş saymaz.

## En Fazla 100 Vaka

Tek POST işleminde en fazla:

`100`

tekil vaka planlanabilir.

Duplicate vaka ID'leri önce tekilleştirilir.

Bu sınır:

- uzun transaction,
- büyük row-lock kümesi,
- yanlışlıkla aşırı geniş seçim

riskini azaltır.

## Yalnız Açık Vakalar

Seçilen her vaka şu açık aşamalardan birinde olmalıdır:

- Açık
- İncelemede
- Dış Aksiyon Bekleniyor

Kapalı vaka seçime karışırsa işlem kısmen uygulanmaz.

Tüm işlem rollback edilir.

## Kaynak Sorun Yeniden Doğrulaması

Seçim ekranındaki veri eski kalmış olabilir.

Bu nedenle POST sırasında her vaka:

`ma_case_source_still_open()`

ile yeniden doğrulanır.

Kaynak sorun artık çözülmüşse toplu planlama uygulanmaz.

Önce Mutabakat Aksiyon Merkezi'nde vaka senkronizasyonu çalıştırılmalıdır.

## Atomik İşlem

Toplu planlama tek transaction içinde çalışır.

Akış:

1. vaka ID'leri normalize edilir,
2. sorumlu doğrulanır,
3. tarih doğrulanır,
4. seçili vakalar ID sırasıyla `FOR UPDATE` kilitlenir,
5. tüm vakaların açık olduğu doğrulanır,
6. tüm kaynak sorunlarının hâlâ açık olduğu doğrulanır,
7. sorumlu ve sonraki aksiyon tarihi güncellenir,
8. her vaka için append-only planlama geçmişi yazılır,
9. transaction commit edilir.

Tek vaka bile doğrulamadan geçmezse:

- hiçbir seçili vaka güncellenmez,
- hiçbir kısmi geçmiş kaydı kalmaz.

## Sorumlu Doğrulaması

Sorumlu olarak yalnız:

- aktif kullanıcı,
- `super_admin` rolüne sahip kullanıcı

seçilebilir.

Kullanıcının ana rolü farklı olsa bile ek rol tablosunda:

`super_admin`

rolü varsa sorumlu olabilir.

Normal yönetici veya pasif Süper Admin seçilemez.

## Tarih Koruması

Sonraki aksiyon tarihi zorunludur.

Tarih:

- bugün,
- veya gelecek

olmalıdır.

Geçmiş tarih kabul edilmez.

## Append-only Audit

Her planlanan vaka için:

- tür: `planlama`
- kod: `toplu_planlama`

geçmiş olayı yazılır.

Kayıt:

- eski sorumlu,
- yeni sorumlu,
- eski aksiyon tarihi,
- yeni aksiyon tarihi,
- opsiyonel plan notu

bilgisini içerir.

Eski vaka geçmişi silinmez.

## İlk Müdahale Semantiği Korunur

1.2.60 ilk müdahaleyi yalnız:

- `takip_notu`
- `asama_*`

olaylarıyla ölçer.

Toplu sahiplik/tarih planlaması:

`toplu_planlama`

kodu kullanır.

Bu nedenle yalnız vaka dağıtımı yapmak:

`İlk müdahale yapıldı`

gibi yanlış bir sağlık sonucu üretmez.

Gerçek inceleme/not/aşama hareketi ayrıca yapılmalıdır.

## Filtreler

Planlama ekranı 1.2.60 sağlık sorgusunu tekrar kullanır.

Desteklenen filtreler:

- kurum/sözleşme/teşhis araması,
- veri bütünlüğü / operasyon açığı,
- 0–1 / 2–3 / 4–7 / 8+ gün,
- sahipsiz,
- aksiyon tarihi yok,
- aksiyon gecikti,
- aksiyon bugün,
- ilk müdahale yok,
- dış aksiyon bekliyor.

Filtre SQL seviyesinde uygulanır.

## Son Planlama Geçmişi

Ekran son toplu planlama hareketlerini:

- kurum,
- sözleşme,
- işlemi yapan Süper Admin,
- tarih,
- planlama değişiklik açıklaması

ile gösterir.

Bu alan yalnız append-only geçmişten okunur.

## Navigasyon

`Mutabakat Toplu Planlama` bağlantısı:

- Süper Admin ana menüsüne,
- Mutabakat Aksiyon Merkezi'ne,
- Mutabakat Aksiyon Sağlığı ekranına,
- Ticari Yönetim Dashboardu'na

eklendi.

## Yeni Migration Yok

1.2.61 yalnız mevcut:

- `ticari_mutabakat_vakalari`
- `ticari_mutabakat_vaka_gecmisi`

tablolarını kullanır.

Bu nedenle yapay bir:

`087_mutabakat_toplu_planlama.sql`

migrationı oluşturulmamıştır.

Migration zinciri:

`086`

olarak devam eder.

## Testler

Yeni testler:

- `tests/reconciliation-bulk-planning-186.cjs`
- `tests/reconciliation-bulk-planning-db-186.php`

MariaDB testi şunları doğrular:

1. aktif primary-role Süper Admin listesini,
2. secondary-role Süper Admin desteğini,
3. pasif Süper Admin'in dışlanmasını,
4. duplicate vaka ID'lerinin tekilleştirilmesini,
5. ID sıralamasını,
6. iki açık vakanın tek işlemle planlanmasını,
7. sorumlu atamasını,
8. sonraki aksiyon tarihini,
9. vaka aşamasının değişmemesini,
10. her vaka için append-only `toplu_planlama` olayını,
11. planlamanın ilk müdahale olayı üretmemesini,
12. normal yöneticinin sorumlu seçilememesini,
13. pasif Süper Admin'in sorumlu seçilememesini,
14. geçmiş aksiyon tarihinin reddini,
15. 100 vaka sınırını,
16. kapalı vaka seçiminde tüm transaction rollback'ini,
17. rollback sırasında diğer seçili vakanın sorumlusunun değişmemesini,
18. rollback sırasında diğer seçili vakanın tarihinin değişmemesini,
19. rollback sırasında kısmi geçmiş oluşmamasını,
20. kaynak sorunu çözülmüş stale vaka seçiminde tüm transaction rollback'ini,
21. son toplu planlama audit listesini,
22. plan notunun geçmişte korunmasını.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- POST + CSRF,
- aktif Super Admin owner doğrulaması,
- en fazla 100 vaka,
- stabil ID sıralı row lock,
- kaynak sorunu yeniden doğrulama,
- tek transaction,
- tam rollback,
- append-only audit

ile çalışır.
