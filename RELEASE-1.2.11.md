# İlkAdım 1.2.11

## Sınıf / Grup düzenleme akışı

Bu sürüm, 1.2.9 ile eklenen Kurum Sınıfları / Grupları modülünde eksik kalan kayıt düzenleme akışını tamamlar.

### Yeni düzenleme işlemi

Kurum yöneticisi veya Süper Admin, öğrenci yönetimi yetkisi varsa mevcut sınıf/grup kaydında:

- adı,
- türü (Sınıf / Grup),
- sınıf seviyesini

düzenleyebilir.

Düzenleme listeden açılan modal üzerinden yapılır.

### Güvenli sınıf seviyesi değişikliği

Sınıf veya seviyeli grup yeni bir sınıf seviyesine geçirilirken mevcut üyeler kontrol edilir.

Yeni seviyeye uymayan öğrenci varsa sistem:

- hiçbir öğrenciyi otomatik silmez,
- sınıf/grup kaydını değiştirmez,
- yöneticiden önce uyumsuz öğrencileri gruptan çıkarmasını ister.

Böylece sessiz veri kaybı veya yanlış üyelik oluşmaz.

### Domain ayrımı

Yeni `src/kurum_siniflari.php` dosyası eklendi.

- `ksg_validate_input()`
- `ksg_update()`

Sayfa, sınıf/grup güncellemesini bu merkezi ve test edilebilir domain katmanı üzerinden gerçekleştirir.

### Arayüz

- Sınıf / grup satırlarına **Düzenle** butonu eklendi.
- Düzenleme modalı eklendi.
- Sınıf türü seçildiğinde arayüz boş sınıf seviyesi bırakmaz.
- Yeni `kurum-siniflari.js` dosyası modal davranışını yönetir.
- Modül CSS sürümü cache-bust için 1.2.11'e yükseltildi.

### Güvenlik

- Mevcut CSRF koruması korunur.
- Yönetilebilir kurum kontrolü korunur.
- `ogrenci_yonet` yetkisi korunur.
- Güncelleme sorgusu hem `id` hem `kurum_id` ile sınırlandırılır.
- Üye uyumluluk kontrolü aynı kurum ve aynı sınıf/grup üzerinde çalışır.
- Değişiklik audit kaydına yazılır.

### Test

Yeni testler:

- `tests/institution-class-edit-136.cjs`
- `tests/institution-class-edit-db-136.php`

MariaDB testi:

1. karma grupta 4. ve 5. sınıf öğrencileri varken grubu 4. sınıfa çevirmeyi dener ve işlemin engellendiğini doğrular,
2. uyumsuz öğrenci çıkarıldıktan sonra güncellemenin başarılı olduğunu doğrular,
3. sınıfı tekrar karma gruba çevirmeyi doğrular,
4. sınıf türünde boş sınıf seviyesi verilemediğini doğrular.
