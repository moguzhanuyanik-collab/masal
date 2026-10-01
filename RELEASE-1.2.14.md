# İlkAdım 1.2.14

## Öğretmen içeriklerinde güvenli düzenleme ve kopyalama

Bu sürüm, **İçeriklerim** ekranında eksik kalan içerik düzenleme akışını tamamlar.

### Düzenleme

Öğretmen artık kendi içeriğinde öğrenci aktivitesi oluşmamışsa:

- ders,
- konu,
- özel konu başlığı,
- içerik türü,
- başlık,
- içerik metni,
- soru,
- cevap seçenekleri,
- doğru cevap,
- cevap açıklaması,
- ödev teslim tarihi,
- hedef öğrenciler

alanlarını güncelleyebilir.

İçeriğin kurumu düzenleme sırasında değiştirilemez. Böylece bir yayın yanlışlıkla başka kuruma taşınmaz.

### Geçmiş veri koruması

İçerikte öğrenci yanıtı veya ödev durum kaydı oluştuysa yerinde düzenleme engellenir.

Bu kural:

- soru metni veya doğru cevabın geçmiş cevap sonuçlarını değiştirmesini,
- ödev içeriğinin tamamlandıktan sonra sessizce farklılaşmasını,
- performans raporlarının geçmişteki verilerle tutarsızlaşmasını

önler.

Bu tür içerikler listede **Geçmiş var** etiketiyle görünür ve düzenleme ekranında salt-okunur koruma mesajı gösterilir.

### Güvenli kopyalama

Her içerik için **Kopyala** işlemi eklendi.

Kopya:

- aynı öğretmene,
- aynı kuruma,
- aynı ders/konuya,
- aynı hedef öğrencilere

bağlı olarak oluşturulur.

Ancak yeni kopya **pasif** başlar. Öğretmen önce kopyayı düzenler, sonra hazır olduğunda aktifleştirir.

Kopyalanmayan veriler:

- öğrenci soru cevapları,
- deneme sayıları,
- doğru/yanlış geçmişi,
- ödev tamamlanma durumları.

Böylece yeni yayın temiz bir performans geçmişiyle başlar.

### Hedef öğrenci güvenliği

Düzenleme sırasında seçilen öğrenciler yeniden doğrulanır.

Öğretmen yalnız:

- aynı kurumda,
- kendisine bağlı,
- aktif

öğrencileri hedefleyebilir. Başka kurum öğrencisi sunucu tarafında reddedilir.

### Arayüz

- İçerik satırlarına **Düzenle / İncele** eklendi.
- **Kopyala** eklendi.
- Aktivitesi olan içerikte **Geçmiş var** etiketi gösterilir.
- Oluşturma ve düzenleme formları aynı JS davranışını güvenli şekilde paylaşır.
- Soru seçenekleri 6 seçeneğe kadar desteklenir.
- CSS/JS cache sürümü 1.2.14'e yükseltildi.

### Test

Yeni testler:

- `tests/teacher-content-edit-copy-139.cjs`
- `tests/teacher-content-edit-copy-db-139.php`

MariaDB entegrasyon testi:

1. Aktivitesi olmayan içeriği günceller.
2. Kurum kimliğinin değiştirilemediğini doğrular.
3. Hedef öğrencinin güvenli değiştirildiğini doğrular.
4. Öğrenci cevabı oluştuktan sonra yerinde düzenlemeyi engeller.
5. İçeriği pasif kopya olarak çoğaltır.
6. Hedef öğrencilerin kopyalandığını doğrular.
7. Cevap ve ödev durum geçmişinin kopyalanmadığını doğrular.
8. Başka öğretmenin içeriğine erişimi reddeder.
9. Başka kurum öğrencisinin hedeflenmesini reddeder.
