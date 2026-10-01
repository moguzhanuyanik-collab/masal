# İlkAdım 1.2.5

## Release-chain metadata recovery hardening

### Kök neden

1.2.2 hazırlığı sırasında oluşan `5dae36e8dfa2e6d17abd942bdaea4030384e1bf2` ara commitinde `version.json` ve `update-release.json` 1.2.2 rev1 iken `update-managed-files.json` 1.2.1 rev21 olarak kalmıştı.

Sıralı updater `update-release.json` geçmişinden aday seçtiği için bu ara commit geçerli 1.2.2 release'i sanılıyor ve paket doğrulamasında metadata uyuşmazlığı oluşuyordu.

### Recovery

- Final ve doğrulanmış 1.2.2 uygulama ağacından yeni bir **1.2.2 rev2 recovery anchor** üretildi.
- Recovery anchor içindeki `version.json`, `update-release.json` ve `update-managed-files.json` aynı sürüm/revision kimliğine sahiptir.
- 1.2.1 rev21 üzerinde kalan kurulumlar aynı 1.2.2 sürümündeki daha yüksek revizyon nedeniyle bozuk rev1 yerine rev2 anchor'ı seçer.
- Recovery anchor yeni migration eklemez ve final 1.2.2 kod ağacını kullanır.

### Updater hardening

- Release adayı kuruluma seçilmeden önce aynı committeki üç metadata dosyası doğrulanır.
- Sürüm veya release_revision uyuşmuyorsa tarihsel commit aday listesinden elenir.
- Bozuk bir ara release anchor artık güncelleme hedefi olamaz.
- Release-chain HMAC cache korunur; HEAD değiştiğinde mevcut davranış gereği cache yeniden oluşturulur.

### Veritabanı

Yeni migration yoktur. 064, 065 ve 066 migration zinciri değişmeden korunur.


### Rev2 release-head anchor

PR #40 normal merge ile recovery commitlerini korudu; ancak merge commitinin kendisi `update-release.json` değiştirmediği için release-head regression kuralı main HEAD'i son release anchor olarak kabul etmedi.

Rev2, aynı 1.2.5 kodunu korur ve final squash commitinin doğrudan release anchor olmasını sağlar. Uygulama kodu, migration zinciri ve recovery anchor değişmez.
