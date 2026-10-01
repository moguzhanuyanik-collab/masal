# İlkAdım 1.2.6

## Manuel Güncelleme

Güncelleme Merkezi'ne otomatik GitHub akışından bağımsız çalışan güvenli manuel ZIP kurulumu eklendi.

### Arayüz

- Güncelleme ekranında yeni **Manuel Güncelle** butonu bulunur.
- Buton mobil uyumlu bir modal açar.
- ZIP seçimi tıklama veya sürükle-bırak ile yapılabilir.
- Seçilen dosyanın adı ve boyutu modal içinde gösterilir.
- Kullanıcıya kurulum öncesi sürüm/revision, manifest/ağaç ve ZIP güvenlik kontrollerinin yapılacağı açıkça gösterilir.

### Güvenlik ve kurulum

- Yalnız Süper Admin kullanabilir.
- CSRF doğrulaması zorunludur.
- Yalnız gerçek HTTP upload olarak gelen .zip dosyaları kabul edilir.
- Sıkıştırılmış boyut, dosya sayısı, açılmış toplam boyut, tek dosya boyutu, compression ratio, yol kaçışı ve symlink kontrolleri mevcut updater güvenlik katmanını kullanır.
- version.json, update-release.json ve update-managed-files.json sürüm/revision kimliği aynı olmalıdır.
- Paket manifestindeki dosyalar ZIP içindeki gerçek uygulama ağacıyla birebir eşleşmelidir.
- Daha eski sürüm veya aynı sürüm/revision yeniden kurulamaz. Aynı sürümün daha yüksek revision paketi kabul edilir.
- Manuel ZIP SHA-256 ile kimliklendirilir ve staging alanına kopyalandıktan sonra hash tekrar doğrulanır.
- Mevcut uygulama yedeği, migration güvenlik kontrolleri, gerektiğinde DB yedeği, updater-core handoff, activation verification, stale-file koruması ve recovery manifest akışı aynen kullanılır.
- Manuel kurulum GitHub erişimi olmadan başlayabilir. Kurulum tamamlandıktan sonraki GitHub sürüm kontrolü başarısız olursa kurulum yine başarılı kabul edilir.

### Veritabanı

Yeni migration yoktur. Mevcut 064–066 migration zinciri değişmeden korunur.
