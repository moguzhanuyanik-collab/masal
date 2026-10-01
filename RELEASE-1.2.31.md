# İlkAdım 1.2.31

## Öğretmen dashboard'larında sınıf / grup performans filtresi

Bu sürüm, 1.2.30 ile eklenen sınıf / grup hedeflemeyi öğretmenin performans dashboard'larına taşır.

### Yayın-anı grup snapshot'ı

Yeni tablo:

`ogretmen_icerik_hedef_gruplari`

Her grup hedeflemesinde şu bilgiler yayın anında saklanır:

- içerik kimliği,
- kurum sınıf / grup kimliği,
- kurum,
- hedef öğrenci,
- grup adı,
- grup türü,
- sınıf seviyesi.

Bu kayıt öğrenci bazındadır.

Aynı öğrenci iki seçili grupta bulunuyorsa iki grup snapshot satırı oluşur; genel hedef öğrenci listesinde öğrenci yine tekilleştirilir.

### Neden ayrı snapshot?

1.2.30'da içerik hedef öğrencileri zaten snapshot olarak saklanıyordu.

Ancak hangi öğrencinin hangi seçilmiş sınıf / gruptan geldiği ayrıca tutulmadığı için öğretmen daha sonra:

- 4-A performansı,
- Destek grubu performansı

gibi ayrımları tarihsel olarak güvenli biçimde yapamıyordu.

Yeni snapshot ile grup üyeliği sonradan değişse bile eski yayının:

- hangi gruba gönderildiği,
- o grubun yayın anındaki hangi öğrencileri içerdiği

değişmez.

### Soru Performansı

Öğretmen → Soru Performansı ekranına yeni **Sınıf / grup** filtresi eklendi.

Grup seçildiğinde:

- hedef öğrenci,
- cevaplayan,
- doğru,
- yanlış,
- bekleyen,
- cevaplanma oranı,
- doğruluk oranı,
- dağıtılan yıldız

yalnız seçili grubun yayın-anı öğrenci snapshot'ı üzerinden hesaplanır.

Başka gruptaki veya yalnız tekil seçilmiş öğrenci bu grubun rakamlarına karışmaz.

### Ödevlerim

Öğretmen → Ödevlerim ekranına yeni **Sınıf / grup** filtresi eklendi.

Grup seçildiğinde:

- hedef öğrenci,
- tamamlayan,
- geciken,
- bekleyen

yalnız seçili grubun yayın-anı öğrenci snapshot'ına göre hesaplanır.

### Detay ekranları

Soru veya ödev dashboard'u grup filtresindeyken detay ekranına geçildiğinde `grup_id` korunur.

Detay sayfasında da yalnız aynı snapshot grubunun öğrencileri gösterilir.

Böylece dashboard kartındaki sayılar ile açılan öğrenci listesi birebir tutarlı kalır.

### Öğrenci Raporu bağlamı

Öğretmen içerik detayından Öğrenci Raporu'na geçerken içerik kurumunun `kurum_id` değeri artık korunur.

Bu sayede 1.2.18'de eklenen doğrulanmış öğretmen kurum bağlamı devreye girer ve raporda farklı kurum içerikleri karışmaz.

### Düzenleme ve kopyalama

Henüz öğrenci aktivitesi oluşmamış bir içerik düzenlenirken daha önce seçilmiş sınıf / gruplar artık işaretli gelir.

İçerik güncellenirse grup snapshot'ları güvenli biçimde yeniden oluşturulur.

İçerik kopyalanırsa mevcut grup snapshot'ları yeni pasif kopyaya taşınır.

### Eski yayınlar

1.2.31 öncesinde oluşturulmuş içeriklerde grup→öğrenci snapshot tablosu bulunmadığı için bu yayınlar belirli bir grup filtresinde sınıflandırılmaz.

**Tüm sınıf / grup hedefleri** görünümünde mevcut davranış aynen devam eder.

### Migration

Yeni migration:

`070_ogretmen_icerik_grup_hedef_snapshot.sql`

Migration yalnız yeni snapshot tablosunu oluşturur; mevcut içerik, öğrenci hedefi, cevap, ödev ve performans kayıtlarını değiştirmez.

### Test

Yeni testler:

- `tests/teacher-dashboard-group-filter-156.cjs`
- `tests/teacher-dashboard-group-filter-db-156.php`

MariaDB entegrasyon testi:

1. Aynı öğrencinin iki grupta bulunabildiğini doğrular.
2. İki grup hedefinin genel öğrenci hedefinde tekilleştirildiğini doğrular.
3. Grup→öğrenci snapshot satırlarını doğrular.
4. Soru dashboard'unda 4-A ve Destek grubunun doğru/yanlış/bekleyen sonuçlarını ayrı hesaplar.
5. Yıldız ödülünün başka gruba sızmadığını doğrular.
6. Soru detayında yalnız seçili snapshot grubunun öğrencilerini döndürür.
7. Düzenleme ekranında seçili grup kimliklerini geri yükler.
8. Kopyalama sırasında grup snapshot'larını korur.
9. Grup + tekil öğrenci hedefli ödevde genel hedef ile grup hedefini ayırır.
10. Ödev dashboard'unda tamamlanan / geciken sayılarını seçili snapshot grubuna göre hesaplar.
