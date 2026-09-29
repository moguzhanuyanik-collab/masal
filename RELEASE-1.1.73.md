# İlkAdım AdımBot v1.1.73

## Değişiklikler

1. Groq ücretsiz/geliştirici hesaplarında kapatılan `llama-3.1-8b-instant` ve `llama-3.3-70b-versatile` modelleri yerine sırasıyla `openai/gpt-oss-20b` ve `openai/gpt-oss-120b` seçenekleri eklendi.
2. Eski Groq modeli yalnızca sağlayıcı açıkça `model_decommissioned` veya `model_deprecated` döndürürse, aynı API anahtarı ve istek süresi içinde bir kez güncel karşılığıyla deneniyor.
3. GPT-OSS istekleri `max_completion_tokens` ve düşük akıl yürütme ayarına geçirildi; desteklenmeyen `max_tokens` alanı ve akıl yürütme metni isteğe eklenmiyor.
4. Yönetici bağlantı testi de sohbetle aynı Groq model geçişini kullanıyor ve başarılı geçişte güncel modeli kaydediyor. Başarısız testte aday ayarlar kaydedilmiyor.
5. 401 anahtar reddi, 403 izin, kapalı model, bulunamayan model, kota ve genel model/istek ayarı hataları ayrı sınıflandırılıyor; öğrenci ekranında ham sağlayıcı yanıtı gösterilmiyor.
6. AdımBot ayar sayfasındaki Gemini ses testi PHP sözdizimi hatası giderildi.

## Kök neden

Groq’un 16 Ağustos 2026’da ücretsiz/geliştirici katmanında kapattığı iki Llama modeli hâlâ varsayılan ve kayıtlı model olarak kullanılıyordu. Bu modeller reddedilince hata, genel "AdımBot ayarlarında sorun" mesajına dönüşüyordu. Yönetici ayar dosyasındaki ek bir parantez hatası da Gemini ses testi bölümünün PHP tarafından ayrıştırılmasını engelleyebiliyordu.

## Kontroller

- Groq model geçişi, aynı anahtar/süre, yeniden deneme sınırı, model yükü ve hata sınıflandırması için CLI PHP testi eklendi.
- JavaScript sözdizimi ve `git diff --check` kontrolleri geçti.
- Bu çalışma ortamında PHP yorumlayıcısı bulunmadığından PHP linter ve eklenen PHP testi çalıştırılamadı.
- Gerçek Groq/Gemini anahtarları, canlı API ve telefonla test yapılmadı; bağlantının canlıda çalıştığı doğrulanmış sayılmıyor.

## Kurulum

`v1.1.72 → v1.1.73`. Canlı sisteme kurulum yapılmadı.
