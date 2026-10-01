# İlkAdım 1.2.4

## 1.1.97 → 1.2.1 kayıp güncelleme zinciri güvenlik kilidi

### Hata analizi

Kaynak kodu ve Git geçmişi incelendiğinde 1.1.97–1.2.1 arasındaki uygulama değişikliklerinin GitHub tarihçesinde tamamen kaybolmadığı; asıl kırılmanın güncelleme zincirinin DB migrationları ile uygulama dosyalarını aynı başarı kriteriyle doğrulamamasından kaynaklandığı görüldü.

1.2.2 ile bekleyen migrationların genel update akışına alınması, 1.2.3 ile de 1.1.97 için doğrudan güvenli updater-core kurtarma köprüsü eklenmişti. Ancak güncelleme sonunda "dosyalar kopyalandı + version yazıldı" seviyesinden daha güçlü bir release postcondition zorunlu değildi.

### 1.2.4 geliştirmesi

- 1.2.1 ve üzeri hedeflerde release postcondition kontrolü eklendi.
- 064, 065 ve 066 migration checkpointleri zorunlu doğrulanıyor.
- 064'ün gerçek adimbot_rate_limitleri şeması kontrol ediliyor.
- Legacy kurum_kullanicilari kolonlarının geri dönmediği doğrulanıyor.
- veli_ogrenci ve ogretmen_ogrenci tenant kurum_id kolonları doğrulanıyor.
- 066 tenant schema guard güncelleme sonunda yeniden çalıştırılıyor.
- Paket ve canlı updater çekirdeğinin en az generation 121 olması doğrulanıyor.
- Release metadata'nın hedef sürümle eşleştiği doğrulanıyor.
- Yeni MariaDB integration testi eklendi.
- Yeni source-contract regression testi eklendi.
- Quality Gate'e workflow_dispatch eklendi; doğrulama gerektiğinde Actions üzerinden aynı kalite kapısı manuel çalıştırılabilir.

### Sonuç

Bundan sonra 1.1.97'den güncel sürüme kurtarma yalnızca uygulama dosyalarının ileri alınmasıyla başarılı kabul edilmeyecek. DB geçmişi ve gerçek tenant şeması hedef release postcondition'ını karşılamıyorsa güncelleme başarısız sayılacak ve mevcut recovery manifesti üzerinden incelemeye bırakılacak.
