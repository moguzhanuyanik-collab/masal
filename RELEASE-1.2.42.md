# İlkAdım 1.2.42

## Destek / Talep Merkezi

Bu sürüm kurumsal kullanıcılar ile İlkAdım operasyon ekibi arasında güvenli, metin tabanlı destek akışı ekler.

### Yeni Destek Merkezi

Yeni sayfa:

`destek.php`

Destek merkezi şu roller için kullanılabilir:

- Yönetici
- Öğretmen
- Veli
- Süper Admin

Öğrenci rolü bu sürümde ticket açamaz.

### Kullanıcı Akışı

Yönetici, öğretmen veya veli:

- aktif bağlı kurumunu seçer,
- kategori belirler,
- öncelik seçer,
- konu ve açıklama yazar,
- destek talebi oluşturur,
- yalnız kendi taleplerini görür,
- cevap geçmişini takip eder,
- açık veya çözülmüş talebe ek yanıt yazabilir.

Çözülmüş talebe kullanıcı yeniden mesaj yazarsa talep otomatik olarak yeniden **Açık** duruma döner.

Kapalı talebe yeni mesaj eklenemez.

### Kategoriler

- Teknik Sorun
- Hesap & Giriş
- İçerik / Eğitim
- Paket / Faturalama
- Diğer

### Öncelikler

- Normal
- Önemli
- Acil

Süper Admin kuyruğu acil talepleri üstte gösterecek şekilde sıralanır.

### Süper Admin Operasyon Merkezi

Süper Admin:

- tüm kurumların destek taleplerini görebilir,
- durum / öncelik / kategori / kurum filtreleri kullanabilir,
- talep sahibini ve rolünü görebilir,
- cevap geçmişini inceleyebilir,
- kullanıcıya yanıt gönderebilir,
- ticket durumunu değiştirebilir.

Dashboard özetinde:

- aktif talepler,
- acil talepler,
- incelenenler,
- kullanıcı yanıtı bekleyenler,
- çözülenler

gösterilir.

### Durum Akışı

Destek durumları:

- Açık
- İnceleniyor
- Kullanıcı Yanıtı Bekleniyor
- Çözüldü
- Kapalı

Süper Admin yanıt gönderdiğinde talep **Kullanıcı Yanıtı Bekleniyor** durumuna geçer.

Kullanıcı yanıt verdiğinde talep yeniden **Açık** olur.

Çözüm ve kapanış zamanları ayrı tutulur.

Kapalı ticket yeniden mesaj kabul etmez.

### Tenant ve Sahiplik Güvenliği

Talep açılırken kullanıcının seçtiği kurumda aktif ve doğru rolde üyeliği zorunludur.

Kullanıcı tarafında ticket erişimi yalnız:

`acani_kullanici_id = oturumdaki kullanıcı`

kuralıyla yapılır.

Aynı kurumda bulunan başka bir kullanıcı bile diğer kullanıcının destek talebini görüntüleyemez.

Süper Admin ise operasyon gereği tüm talepleri görebilir.

### Değişmez Mesaj Geçmişi

Destek talepleri ve mesajlar fiziksel olarak silinmez.

Mesajlar ayrı tabloda zaman sırasıyla tutulur.

Bu sürümde:

- ticket silme,
- mesaj silme,
- mesaj düzenleme

özellikle bulunmaz.

Böylece destek ve audit geçmişi korunur.

### Dosya Yükleme Yok

1.2.42 destek sistemi bilinçli olarak yalnız metin tabanlıdır.

Dosya yükleme eklenmemesinin nedeni:

- zararlı dosya riski,
- kişisel belge yüklenmesi,
- depolama ve kota riski,
- antivirüs / MIME doğrulama bağımlılığı

oluşturmamaktır.

Gerekirse güvenli dosya destek sistemi ayrı bir sürümde geliştirilebilir.

### Rol Paneli Entegrasyonu

Destek Merkezi bağlantısı eklendi:

- Yönetici Paneli
- Öğretmen Paneli
- Veli Paneli
- Süper Admin

### Yeni Migration

`076_destek_talep_merkezi.sql`

Yeni tablolar:

- `destek_talepleri`
- `destek_talep_mesajlari`

### Test

Yeni testler:

- `tests/support-center-167.cjs`
- `tests/support-center-db-167.php`

MariaDB testi şunları doğrular:

1. yöneticinin yalnız kendi kurumuna ticket açabilmesini,
2. başka kurum adına ticket oluşturamamasını,
3. öğretmenin kendi kurumu için ticket açabilmesini,
4. kullanıcının yalnız kendi ticketlarını listelemesini,
5. aynı kurumda başka kullanıcının ticketa erişememesini,
6. mesaj geçmişinin append-only davranışını,
7. Süper Admin yanıtıyla kullanıcı-bekleniyor durumuna geçişi,
8. çözüm zamanının tutulmasını,
9. kullanıcı yanıtında çözülmüş ticketın yeniden açılmasını,
10. kapanış zamanının ayrı tutulmasını,
11. kapalı ticketa kullanıcı veya admin mesajı eklenememesini,
12. Süper Admin filtre ve özet davranışını,
13. mesaj geçmişinin fiziksel olarak korunmasını.
