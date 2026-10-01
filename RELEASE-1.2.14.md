# İlkAdım 1.2.14

## 1.1.97 → 1.2.1 recovery güvenlik güçlendirmesi

### Hata analizi

1.1.97 tabanından 1.2.1 recovery zinciri GitHub'da mevcut ve doğrulanmış durumda; ancak legacy `kurum_kullanicilari` dönüşümünde staging tablo canlı tabloya çevrildikten sonra yapılan post-swap doğrulama başarısız olursa eski tablo yalnızca backup adıyla kalabiliyordu.

Bu durum güncelleme sırasında veri kaybı oluşmasa bile yarım dönüşüm durumunun oluşmasına neden olabilecek bir recovery riskiydi.

### Yapılan düzeltme

- Legacy kurum üyeliği dönüşümünde RENAME öncesi staging şema postcondition kontrolü eklendi.
- RENAME başarılı olduktan sonra herhangi bir doğrulama hata verirse otomatik ters RENAME ile eski canlı tablo geri alınıyor.
- Rollback de başarısız olursa işlem açıkça fail-closed hata ile duruyor.
- Recovery kaynak zinciri için immutable Git geçmişi regression testi eklendi.
- 1.1.97 baseline → 1.2.1 source arasında 30 commitlik zincir, baseline/source sürümleri ve source commit'in current HEAD'e atalık ilişkisi CI'da doğrulanıyor.
- Recovery evidence dosyasına 1.2.1 source tree SHA ve parent commit ankrajı eklendi.
- Mevcut 1.1.97 → 1.2.1 source authority değiştirilmedi.

### Doğrulanan recovery authority

- Baseline: `1.1.97` — `be2651c5e375e3b54c0735d7283820a6ec9eb581`
- Source: `1.2.1` — `6a0f372871e6dbd2b71d2efef121fbf2dfb2f82c`
- Source tree: `9665e2754d02db81f8ca07a97b95506397103e1e`
- Baseline → source: 30 commit
- Recovery integrity testi: `tests/recovery-source-integrity-139.cjs`

Bu sürüm canlı veritabanına veya production sunucusuna doğrudan müdahale etmez; yalnız GitHub güncelleme/recovery kodunu güçlendirir.
