# İlkAdım 1.2.7

## Ödev modülü bütünlük tamamlama

Bu sürüm, kodda açık biçimde yarım bırakılmış olan ödev teslim tarihi ve öğrenci tamamlama takibini uçtan uca tamamlar.

### Öğrenci

- Yeni `ogrenci-odevleri.php` sayfası eklendi.
- Öğrenci kendisine atanmış aktif ödevleri tek ekranda görür.
- Ders, öğretmen, kurum ve teslim zamanı gösterilir.
- Ödev durumları **Bekliyor**, **Süresi geçti** ve **Tamamlandı** olarak ayrılır.
- Öğrenci ödevi **Tamamladım** olarak işaretleyebilir.
- Yanlış işaretlenen ödev **Tekrar bekliyor yap** ile geri alınabilir.
- İşlemler öğrenci oturumu ve CSRF doğrulamasıyla korunur.
- Ödevlerim ekranına Öğretmenim sayfasından ve profil menüsünden erişilebilir.

### Öğretmen

- Ödev yayınlarken isteğe bağlı teslim tarihi verilebilir.
- İçerik listesinde ödevin teslim tarihi görünür.
- Ödev listesinde teslim tarihi görünür.
- Ödev ayrıntısında tamamlanan/bekleyen öğrenci sayısı gösterilir.
- Her hedef öğrencinin tamamlanma durumu ve varsa tamamlanma zamanı gösterilir.

### Veli

- Çocuğun ödevlerinde teslim tarihi ve tamamlanma durumu görünür.
- Tamamlanmış ödevlerde tamamlanma zamanı gösterilir.
- Çocuk erişimi merkezi kurum izolasyonlu erişim hesabına bağlandı.
- Veli–öğrenci ve öğretmen–öğrenci ilişkileri ödevin kurum kapsamıyla eşleştirilir.

### Veritabanı

Yeni migration: `067_odev_teslim_tarihi_ve_tamamlama.sql`

- `ogretmen_icerikleri.teslim_tarihi` alanı eklenir.
- `ogrenci_odev_durumlari` tablosu eklenir.
- Migration idempotenttir.
- Mevcut ödevler korunur.
- Veri silme veya tablo düşürme işlemi yoktur.
- Migration MariaDB entegrasyon testinde iki kez çalıştırılarak doğrulanır.

### Güvenlik ve regresyon

- Öğretmen içerik hedefleri `ogretmen_ogrenci.kurum_id` ile açıkça sınırlandı.
- Öğrencinin öğretmen içeriği sorgusu içerik kurumu ile ilişki kurumunu eşler.
- Veli ödev sorgusu veli, öğrenci, öğretmen ve ödevin aynı aktif kurum kapsamında olmasını ister.
- Yeni source-contract ve MariaDB migration testleri Quality Gate'e eklendi.
