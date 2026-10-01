# İlkAdım 1.2.5

## 1.1.97 → 1.2.4 gerçek MariaDB recovery doğrulaması

### Neden

1.1.97–1.2.1 arasındaki güncelleme zinciri yeniden kurulurken yalnızca kaynak kodu ve source-contract testleriyle yetinmek yeterli değildi. Asıl kritik risk, gerçek legacy DB şemasının 064 → 065 → 066 recovery sırasından geçip geçememesiydi.

### Geliştirme

- Gerçek MariaDB üzerinde minimal 1.1.97 legacy DB fixture'ı eklendi.
- 001–063 migration geçmişi tamamlanmış legacy checkpoint olarak hazırlanıyor.
- 064 eksik checkpoint recovery'si çalıştırılıyor.
- Eski `kurum_kullanicilari` yapısı gerçek recovery fonksiyonuyla yeni kurum üyeliği şemasına dönüştürülüyor.
- Eski veli/öğrenci ve öğretmen/öğrenci ilişkileri gerçek 065 migration'ı üzerinden ortak kuruma taşınıyor.
- 066 tenant schema guard gerçek recovery sonunda çalıştırılıyor.
- Son durumda 064/065/066 checkpointleri, tenant PK/indexleri, kurum üyeliği şeması ve release postcondition birlikte doğrulanıyor.
- CI kalite kapısına uçtan uca legacy recovery testi eklendi.

### Sonuç

Artık 1.1.97 → güncel recovery yolunun yalnızca kod sözleşmesi değil, MariaDB üzerinde gerçek migration ve legacy şema dönüşümü de CI tarafından sınanıyor.
