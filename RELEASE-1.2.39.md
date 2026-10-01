# İlkAdım 1.2.39

## Merkezi Bildirim & Duyuru Sistemi

Bu sürüm İlkAdım'a kurum kapsamlı merkezi bildirim kutusu, manuel duyuru gönderimi, okunma takibi ve öğretmen içeriklerinden otomatik sistem bildirimi ekler.

### Merkezi Bildirim Merkezi

Yeni sayfa:

`bildirimler.php`

Öğretmen, veli ve öğrenci yalnız kendisine snapshot olarak teslim edilmiş bildirimleri görür.

Yönetici ve Süper Admin ayrıca yetkili olduğu kurumlarda:

- yeni duyuru gönderebilir,
- öğrenci / veli / öğretmen hedef gruplarını seçebilir,
- önem seviyesini belirleyebilir,
- isteğe bağlı son gösterim tarihi verebilir,
- gönderimin toplam alıcı sayısını görebilir,
- kaç alıcının okuduğunu takip edebilir,
- manuel duyuruyu fiziksel silmeden arşivleyebilir.

### Alıcı Snapshot Güvenliği

Duyuru gönderildiği anda aktif kurum üyeleri `kurum_duyuru_alicilari` tablosuna snapshot olarak yazılır.

Bunun sonucu:

- sonradan kuruma eklenen kullanıcı geçmiş duyuruyu almaz,
- sonradan rolü değişen kullanıcı geçmiş teslimatın sahipliğini değiştirmez,
- başka kurum kullanıcısı tenant sınırını aşarak duyuru göremez,
- pasif hesaplar gönderim listesine alınmaz.

### Okundu Takibi

Her kullanıcı için bağımsız `okundu_tarihi` tutulur.

Kullanıcı tek bildirimi veya tüm aktif bildirimleri okundu olarak işaretleyebilir. Rol panellerinde okunmamış bildirim sayısı gösterilir.

### Öğretmen İçeriklerinden Otomatik Bildirim

Başarılı öğretmen içeriği yayını veritabanına commit edildikten sonra sistem bildirimi oluşturulur.

- Soru / tekrar / not / diğer içerikler hedef öğrencilere bildirilir.
- Ödev yayınında hedef öğrenciye ek olarak kurum kapsamındaki aktif eşleştirilmiş veliye de bildirim gider.
- Sistem bildirimi içerik kaynağı + içerik ID ile tekilleştirilir; aynı içerik için tekrar bildirim üretilmez.
- Bildirim katmanı hata verirse öğretmenin başarılı içerik yayını geri alınmaz.

### Rol Panelleri

Bildirim erişimi eklendi:

- Yönetici Paneli
- Öğretmen Paneli
- Veli Paneli
- Öğrenci uygulaması
- Süper Admin

Öğrenci uygulamasında mevcut beşli alt navigasyon bozulmadan ayrı bir bildirim kısayolu kullanılır.

### Yeni Migration

`074_merkezi_bildirim_ve_duyurular.sql`

Yeni tablolar:

- `kurum_duyurulari`
- `kurum_duyuru_alicilari`

### Test

Yeni testler:

- `tests/institution-notifications-164.cjs`
- `tests/institution-notifications-db-164.php`

MariaDB testi kurum yöneticisinin tenant sınırını, pasif hesap filtrelemesini, bağımsız okunma durumunu, hedef öğrenci + veli ödev bildirimi davranışını, kaynak tekilleştirmeyi ve silmeden arşivlemeyi doğrular.
