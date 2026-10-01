# İlkAdım 1.1.112

## Uygulanan yeni kritik güncellemeler

- Updater handoff marker için 6 saatlik güven sınırı eklendi; eski/stale marker otomatik yeniden kullanılamaz.
- Handoff marker target version + target commit kimliğine bağlandı.
- Updater çekirdeği yedeğinin SHA-256 değeri marker içindeki old_sha256 ile yeniden doğrulanır.
- Canlı src/updater.php SHA-256 değeri marker içindeki new_sha256 ile yeniden doğrulanır.
- Runtime managed-files manifesti yalnız yerel version.json sürüm/revision kimliğiyle eşleşirse güvenilir kabul edilir.
- Runtime manifest release revision uyuşmazsa hash baseline kullanılmaz.
- Format-2 runtime manifest hash kapsamı tüm managed dosyaları eksiksiz içermiyorsa baseline reddedilir.
- Güvenilmeyen runtime dosya listesinde paket manifestine fail-safe fallback uygulanır.
- Handoff expiry, updater-backup tamper ve runtime-manifest identity senaryoları gerçek dosya sistemi testlerine eklendi.
- 1.1.111 kalite testleri yeni sürümlerde tarihsel kataloğu yanlış reddetmeyecek biçimde düzeltildi.

## Yeni 500 madde

- Q501–Q1000 arasında 500 yeni, benzersiz kalite/güncelleme maddesi oluşturuldu.
- 10 yeni kategori × 50 madde.
- Yeni maddelerin 12'si bu sürümde uygulanmış kritik kontrol; 488'i açık plan statüsünde.
- Önceki Q001–Q500 korunur; toplam izlenebilir katalog 1000 maddedir.

## Rev 2

- 1.1.111 managed-integrity davranış testi yeni runtime manifest kimlik sözleşmesine uyumlu hale getirildi.
- Test fixture artık yerel `version.json` sürüm/revision kimliğini kurarak hash baseline davranışını gerçek çalışma koşuluyla doğrular.

## Rev 3

- Continuity Node regresyon testi runtime manifest sürüm eşleşmesini birebir satır metnine değil gerçek guard ifadesine göre doğrulayacak şekilde düzeltildi.

## Rev 4

- 1.1.112 continuity regresyon testi sabit revision yerine pozitif release revision sözleşmesini doğrular.

## Rev 5

- Q501–Q1000 kalite kataloğu tarihsel release artefaktı olarak 1.1.112 rev1 kimliğine sabitlendi; sonraki aynı-sürüm düzeltme revisionları kataloğu yanlış negatif üretmeyecek.
