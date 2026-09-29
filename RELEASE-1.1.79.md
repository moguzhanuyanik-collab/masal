# İlkAdım AdımBot v1.1.79

## Değişiklikler

- Süper Admin sohbet ve mikrofon bağlantı testleri; 401 anahtar reddi, 403 erişim izni, 404 bulunamayan model, 410 kaldırılan model, 400/422 ayar hatası, kota, zaman aşımı ve geçici servis kesintisini aynı güvenli sınıflandırmayla ayrı gösterir.
- Groq ve Gemini'nin HTTP 200 içinde döndürebildiği gömülü hata nesneleri de yönetici testinde doğru sınıflandırılır; ham sağlayıcı yanıtı veya API anahtarı tarayıcıya yazılmaz.
- Öğrenci başına sohbet ve ses istek sınırı dolduğunda API kesin `Retry-After` süresini döndürür; istemci kalan saniyeyi gösterir ve süre dolmadan aynı isteği yeniden başlatmaz.
- Önceki sürümlerden oturum deposunda kalmış sohbet geçmişi okunurken e-posta, bağlantı, telefon ve 11 haneli kimlik bilgileri yalnız ekranda değil depolanan kayıtta da kalıcı olarak maskelenir.
- Aktif ders sorusunda “Cevap 4'tür”, “sonuç dört” veya çözülmüş eşitlik gibi sayısal cevap sızıntıları hem sunucu hem istemci güvenlik katmanında düşünme ipucuna çevrilir.
- Mobil cihazlarda konuşma sentezi ses listesini geç yüklüyorsa AdımBot kısa süre bekleyip Türkçe sesi yeniden seçer; bekleme sırasında iptal, sayfa gizleme ve yeni seslendirme güvenli kalır.
- Sağlayıcının gömülü `DEADLINE_EXCEEDED`, `UNAVAILABLE` ve benzeri hata kodları genel hata yerine zaman aşımı veya geçici servis kesintisi olarak ayrılır.

## Doğrulama

- Üç JavaScript dosyasının sözdizimi, AdımBot güvenlik öz testi, sayısal cevap filtresi, yeniden deneme süresi aktarımı, kaynak tabanlı yönetici/API kontrolleri ve `git diff --check` doğrulandı.
- Değişiklik kapsamı AdımBot kodları, AdımBot testi, sürüm dosyası ve bu sürüm notuyla sınırlandı.
- Bu ortamda PHP yorumlayıcısı, gerçek Groq/Gemini anahtarları ve telefon bulunmadığından PHP çalışma testi, gerçek sağlayıcı isteği ve mobil cihaz ses testi yapılmadı.
