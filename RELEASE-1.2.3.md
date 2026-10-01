# İlkAdım 1.2.3

## Global / kurum kapsamı bütünlük düzeltmesi

Bu sürüm 1.2.2 migration yürütme düzeltmesinin üstünde, legacy Sistem Rolleri ekranında kalan kurum kapsamı açıklarını kapatır.

### Düzeltilenler

- Global veli–öğrenci ve öğretmen–öğrenci eşleştirmeleri artık açıkça `kurum_id=0` ile yazılır.
- Global eşleştirme silme işlemleri yalnız `kurum_id=0` kaydını siler; aynı kişi çiftinin kurum içindeki ilişkilerine dokunmaz.
- Sistem Rolleri ekranındaki eşleştirme listesi yalnız global kapsamı gösterir.
- Kuruma bağlı kullanıcılar legacy global eşleştirme ekranından yeni global ilişkiye eklenemez.
- Kurumsuz yönetici hesabı veya çıplak yönetici rolü oluşturma yolu kapatıldı; yöneticiler Kurumlar modülünden kurum üyeliğiyle birlikte oluşturulmalıdır.
- Kullanıcı aktif/pasif durumu değiştirilirken öğrenci/veli/öğretmen profilinin aktif durumu da aynı transaction içinde eşitlenir.
- İlişki tablolarında `kurum_id` şeması hazır değilse işlem fail-closed durur.

### Kalite kapısı

- Yeni `tests/global-scope-integrity-129.cjs` regression testi eklendi.
- Mevcut PHP/JS syntax, updater, migration, AdımBot ve MariaDB tenant testleri korunur.
- Bu sürüm yeni veritabanı migrationı gerektirmez.

## Rev 2 — manifest ve release-head temizliği

- Managed-file manifest mevcut sırasını koruyacak şekilde yalnız 1.2.3 dosyalarıyla genişletildi.
- Gereksiz manifest satır taşımaları kaldırıldı.
- 1.2.3 release metadata rev2 olarak yeniden ankrajlandı.
- Ana dala squash merge zorunluluğu korunarak release HEAD ile update-release ankrajının aynı commit olması hedeflendi.
