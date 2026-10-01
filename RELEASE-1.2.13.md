# İlkAdım 1.2.13

## 1.1.97 → 1.2.1 recovery hattı için history ve updater hardening

### Tespit edilen hata

1.2.12 kalite koşulunda `update-release.json` dosyasının son değiştiği commit ile HEAD'in birebir aynı olması zorunlu tutulmuştu. Bu sözleşme release sonrasında gelen normal CI/regression/dokümantasyon commitlerini yanlışlıkla history rewrite ihtiyacı gibi değerlendiriyordu.

GitHub Actions geçmişinde aynı `main` ref üzerinde yeni HEAD oluşurken önceki workflow'un başka bir HEAD'e checkout yaptığı da görüldü. Bu, update zincirinin kaybolduğu dönemdeki history/release ankraj probleminin tekrar üretilebilmesi açısından riskliydi.

### Yapılan düzeltmeler

- Release-head testi artık son `update-release.json` anchor commitinin güncel HEAD'in **ancestor**'ı olmasını şart koşuyor.
- Release sonrasında normal commit eklenmesine izin veriliyor.
- `main` için CI'da history rewrite/force-push tespiti eklendi.
- Aynı ref üzerindeki eski Quality Gate çalışması yeni commit geldiğinde iptal ediliyor.
- 1.1.97 → 1.2.1 doğrulanmış source lineage kontrolü korunuyor.
- 1.2.1 rev15 source SHA'sı değiştirilmedi.
- Sürüm metadata'sı 1.2.13 rev1 olarak hizalandı.

### Korunan recovery ankrajları

- 1.1.97: `be2651c5e375e3b54c0735d7283820a6ec9eb581`
- 1.2.1 rev15: `6a0f372871e6dbd2b71d2efef121fbf2dfb2f82c`

Production veritabanına doğrudan müdahale edilmez.
