# İlkAdım v1.1.61

## AdımBot yanıt güvenliği ve yeniden deneme

- Yapılandırılmamış veya kapalı sağlayıcı denemeleri artık öğrencinin 10 dakikalık AdımBot kotasını tüketmez.
- Dış API isteği başlamadan PHP oturum kilidi bırakılır; diğer öğrenci istekleri yavaş bir AI yanıtını beklemek zorunda kalmaz.
- Önceki cevabın küçük kelime ve noktalama değişiklikleriyle tekrarlanması benzerlik kontrolüyle engellenir.
- Aktif ders sorusunda “cevap/sonuç/doğru seçenek şudur” biçimindeki doğrudan cevaplar sunucuda ipucuna dönüştürülür.
- Modelin Markdown işaretleri temizlenir ve yanıt en fazla dört kısa cümleyle sınırlandırılarak çocuk için daha okunur hâle getirilir.
- Geçici bağlantı veya sağlayıcı hatasında öğrencinin yazdığı soru giriş alanına geri konur; yeniden yazmadan tekrar gönderebilir.
- Yeniden denenen soru sohbet ekranında ve geçmişte ikinci kez çoğaltılmaz.
- Sohbet durum mesajı erişilebilir `role=status` ve `aria-live=polite` alanından duyurulur.
- Ses sağlayıcısından bozuk JSON gelmesi ayrı tanılanır ve belirsiz ayar hatasına dönüştürülmez.

## Kapsam

Yalnızca AdımBot AI uç noktası, ses yazıya çevirme uç noktası, sohbet arayüzü, sürüm bilgisi ve bu sürüm notu değiştirildi. Canlı sisteme otomatik kurulum yapılmaz.
