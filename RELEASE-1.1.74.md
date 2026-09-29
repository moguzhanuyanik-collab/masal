# İlkAdım AdımBot v1.1.74

## Değişiklikler

1. Sohbet API testi ile mikrofon sağlayıcısı testi ayrı düğmelere ayrıldı.
2. Sohbet testi, mikrofon modeli veya ses anahtarı hatasıyla engellenmiyor.
3. Mikrofon testi, kayıtlı sohbet sağlayıcısı/modeli hatasıyla engellenmiyor.
4. Sohbet testi yalnız sohbet ayarlarını ve test edilen sağlayıcı anahtarını uygular.
5. Mikrofon testi yalnız mikrofon ayarlarını ve seçilen sağlayıcı anahtarını uygular.
6. Diğer sağlayıcıya ait kayıtlı anahtar, test sırasında yanlışlıkla değiştirilmez.
7. Başarısız testten sonra sağlayıcı, model ve diğer gizli olmayan seçimler formda kalır.
8. API anahtarları hata mesajına yazılmaz ve parola alanları başarısız testte yeniden doldurulmaz.
9. API HTTP durumu ve cURL hata kodu, sağlayıcı hata metni açığa çıkarılmadan gösterilir.
10. Gemini/OpenAI test isteğinin JSON hazırlığı ve cURL seçeneklerinin uygulanması doğrulanır.
11. Başarı mesajı, sohbet veya mikrofon testinden hangisinin geçtiğini açıkça belirtir.
12. Her test, diğer test alanlarındaki bozuk veya eksik değerlerden etkilenmeden kendi girişlerini doğrular.

## Kök neden / davranış

Önceki akış, mikrofon sağlayıcısını sohbet API testi sırasında da test edebiliyor ve ses hatasının çalışan sohbet bağlantısını maskelemesine izin veriyordu. Ayrıca ağ ve HTTP hataları sağlayıcı, model veya ağ aşamasını ayırt etmek için yeterince ayrıntılı değildi. Yeni düğmeler testleri ayırır; her test yalnız kendi ayar grubunu kaydeder.

## Doğrulama

- `git diff --check` geçti.
- Sohbet testi/mikrofon testi ayrımı, ayar grubu izolasyonu, parola alanlarının yeniden doldurulmaması ve hata ayrıntılarının güvenli gösterimi için kaynak sözleşmeleri denetlendi.
- Bu çalışma ortamında PHP CLI bulunmadığından PHP lint ve çalıştırılabilir PHP regresyon testleri yapılamadı.
- Gerçek API anahtarları ve canlı sunucu olmadığı için Groq/Gemini bağlantısı doğrulanmadı.

## Kurulum

`v1.1.73 → v1.1.74`. Canlı sisteme kurulum yapılmadı.
