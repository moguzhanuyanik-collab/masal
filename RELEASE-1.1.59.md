# İlkAdım v1.1.59

## AdımBot ses, API ve konuşma güvenilirliği

- Groq, Gemini ve OpenAI sohbet isteklerinde zaman aşımı, bağlantı, kota, anahtar, model ve sağlayıcı kesintisi ayrı hata türleri olarak ele alınır.
- Groq Whisper ve Gemini ses yazıya çevirme istekleri aynı ayrıntılı hata ayrımını kullanır; öğrenci artık her sorunda belirsiz bir ayar uyarısı görmez.
- Mikrofon izni kapalı, mikrofon bulunamadı, mikrofon başka uygulamada, ses algılanmadı ve kayıt biçimi desteklenmedi durumları anlaşılır Türkçe mesajlarla ayrılır.
- Ses kaydı isteği 30 saniyede güvenli biçimde sonlandırılır; sohbet kapanırsa devam eden yükleme iptal edilir.
- iPhone/iPad Safari için tarayıcının kendi ses biçimine geri dönülür ve kayıt parçaları saniyelik alınarak kısa kayıt kaybı azaltılır.
- Ses sağlayıcısının anahtar, model, kota, bağlantı ve geçici servis hataları öğrenciye anahtarı veya sağlayıcı cevabını sızdırmadan ayrı gösterilir.
- AdımBot'a bağlamda olmayan bilgi uydurmama, aynı selam/övgü kalıbını tekrarlamama ve bilgi eksikse tek kısa soru sorma kuralları eklendi.
- Önceki AdımBot yanıtının aynen dönmesi sunucuda yakalanır ve öğrenciye tekrar yerine netleştirici bir soru sunulur.

## Kapsam

Yalnızca AdımBot sohbet, ses, API köprüsü, sürüm bilgisi ve bu sürüm notu değiştirildi. Canlı sisteme otomatik kurulum yapılmaz.
