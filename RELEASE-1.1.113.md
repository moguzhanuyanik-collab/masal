# İlkAdım 1.1.113

## 1.1.97 güncelleme kilidi

- 1.1.97 updater'ın dolu legacy `kurum_kullanicilari` tablosunda 1.1.98 paketine ulaşmadan durduğu kök neden için veri-korumalı köprü eklendi.
- Köprü varsayılan dry-run çalışır; mutation için açık `--apply` gerekir.
- Öğrenci, veli ve öğretmen legacy profil ID'leri gerçek `kullanici_id` değerlerine çevrilir.
- Yönetici yalnız doğrulanabilir profil veya `super_admin/yonetici` kullanıcı rolü ile eşlenir.
- Tüm satırlar mutation öncesinde doğrulanır; tek çözümsüz referansta işlem başlamaz.
- Kurum referansı doğrulanır.
- Benzersiz üyelikler PK anahtarına göre deduplicate edilir.
- Yeni tablo ayrı oluşturulur ve satır sayısı doğrulanır.
- Eski tablo `kurum_kullanicilari_legacy_backup_1_1_97` adıyla saklanır.
- Son geçiş atomik `RENAME TABLE` ile yapılır.
- Ayrı rollback aracı eklendi.
- Rescue sonucu `storage/updates/legacy-membership-rescue-1.1.97.json` raporuna yazılır.
- 1.1.98 tarihsel recovery anchor'ı korunur; köprü sonrası panelden normal 1.1.98 kurulumu devam eder.

## Yeni 500 madde

- Q1001–Q1500 arasında 500 yeni ve benzersiz kalite/güncelleme maddesi eklendi.
- 10 kategori × 50 madde.
- Bu sürümde 15 kritik madde uygulanmış, 485 madde plan statüsündedir.
- Q001–Q1500 sürekliliği CI tarafından otomatik doğrulanır.

## Rev 2

- 1.1.112 continuity testi sonraki sürümleri kabul edecek minimum sürüm sözleşmesine geçirildi.
- Q1001–Q1500 katalog ve quality-index dosyaları tarihsel 1.1.113 rev1 artefaktı olarak sabitlendi; aynı sürüm içi test düzeltme revisionları kataloğu bozmayacak.
