# İlkAdım 1.1.109

## Güncelleme maddeleri

- Updater çekirdeği handoff sırasında yeni çekirdek etkinleştirildikten sonra marker yazımı veya bütünlük adımı başarısız olursa eski çekirdek atomik olarak geri yüklenir.
- Rollback sonrası SHA-256 bütünlüğü doğrulanır; rollback de başarısızsa kurulum fail-closed durur.
- Çekirdek başarıyla yenilendikten sonraki recovery-manifest veya güncelleme-geçmişi yazım hataları otomatik ikinci isteği engellemez; hata sunucu loguna kaydedilir.
- Release branchlerinde `update-release.json` anchor commitinin HEAD'den geride kalması CI tarafından engellenir.
- Release HEAD'in `version.json`, `update-release.json` ve `update-managed-files.json` dosyalarını birlikte değiştirmesi zorunlu hale getirildi.
- Handoff rollback davranışı gerçek geçici dosya sistemi üzerinde PHP regresyon testiyle doğrulanır.

## Amaç

Güncelleme çekirdeğinin yarım etkinleşmesi, release anchor'ın erken bir committe kalması ve başarılı çekirdek handoff'unun ikincil log/recovery hataları nedeniyle kullanıcıya başarısız görünmesi engellenir.

## Rev 2

- Release HEAD invariant testinin parent commit farkını görebilmesi için CI checkout derinliği 2 olarak ayarlandı.
- Rev 1 adayında uygulama/PHP testleri ve handoff rollback testleri geçti; yalnız shallow Git geçmişi nedeniyle anchor invariant testi parent diffini okuyamamıştı.
