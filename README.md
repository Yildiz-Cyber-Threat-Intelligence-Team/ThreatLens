# 🛡️ ThreatLens

**ThreatLens**, siber güvenlik ve CTI (Cyber Threat Intelligence) eğitimlerini mobil ortamda interaktif, oyunlaştırılmış ve uygulamalı senaryolarla sunan bir öğrenme platformudur. Teknik ve operasyonel bilgiyi hem teorik hem de pratiğe dönük örneklerle öğreten modüller içerir.

---

## 🎯 Amaç

- Kullanıcılara **mobil cihazları üzerinden** istedikleri zaman CTI ve siber güvenlik konularında eğitim alma imkânı sunmak.
- **SOC, BT ve çağrı merkezi ekipleri** gibi farklı rollere özel içerikler ile hem farkındalık hem de teknik yetkinlik kazandırmak.
- Tehdit tespiti, analiz ve olay müdahalesi süreçlerini uygulamalı olarak öğretmek.

---

## 🧩 Öne çıkan özellikler

- 📱 **Mobil Uyumlu Eğitimler**: İçerikler küçük ekranlarda okunaklı ve etkileşimli olacak şekilde tasarlanmıştır.
- 🧠 **Quiz ve Değerlendirme**: Modüller sonunda otomatik testler; hatırlatma ve ilerleme takibi.
- 🏅 **Rozet ve Seviye Sistemi**: Başarıya göre rozetler, seviye atlama ve liderlik tablosu.
- 🧪 **Sandbox ve Pratik Senaryolar**: Phishing/IDS/EDR senaryoları, log analizi ve IOC incelemeleri.
- 🔁 **Sürekli Güncellenen İçerik**: CTI odaklı vaka çalışmaları ve güncel tehdit örnekleri.

---

## 📚 Eğitim Modülleri (Kısa Açıklamalar)

### 1. Kriptografi
- Gizlilik, bütünlük, kimlik doğrulama ve inkâr edilemezlik temelleri.
- Simetrik (AES, ChaCha20) ve asimetrik (RSA, ECC — Ed25519/X25519) yapılar.
- Anahtar yönetimi, PKI, HSM/TPM uygulamaları ve rastgele sayı üretimi.
- Parola saklama (Argon2id, bcrypt), AEAD (AES-GCM, ChaCha20-Poly1305) ve post-kuantum kavramları.

### 2. Sosyal Mühendislik & Phishing
- Sosyal mühendislik türleri: vishing, smishing, spear-phishing, whaling, clone phishing.
- E-posta başlık analizleri, SPF/DKIM/DMARC kontrolleri, URL ve sertifika incelemeleri.
- Kullanıcı farkındalığı kampanyaları ve kurumsal önlemler.

### 3. Phishing Tespit Yöntemleri
- Teknik tespit: header, URL, WHOIS, Passive DNS, TLS sertifika incelemesi.
- Otomatik tespit akışı: Mail gateway → Sandbox → ML tabanlı skor → SIEM korelasyonu.
- ML kullanımında etiket kalitesi ve bias yönetimi.

### 4. Network Temelleri
- Ağ tipleri (LAN/MAN/WAN), IP adresleme, subnetting, DHCP, ARP.
- OSI ve TCP/IP modelleri, TCP vs UDP, yaygın servis portları ve protokoller.
- Ağ güvenliği: ARP spoofing, DNS spoofing, DHCP spoofing, IDS/IPS ve firewall yaklaşımları.

### 5. Trojans & Malware Temelleri
- Trojan türleri: RAT, banker, dropper, downloader, rootkit, banker, fake-AV, SMS Trojan.
- CTI açısından IoC toplama, C2 altyapısı tespiti ve mitigasyon adımları.

### 6. SIGINT (Sinyal İstihbaratı) — Temel Bakış
- COMINT / ELINT ayrımı, RF spektrum analizi, yön bulma (DF), SDR ekosistemi (HackRF, RTLSDR, USRP).
- SigintOS gibi ortamlar, etik ve hukuki çerçeveler.

---

## 🛠️ Uygulama Özellikleri & Teknik Mimari

- Modüler içerik sunumu (her modül ayrı quiz/senaryo içerir).
- Backend: İçerik yönetimi, kullanıcı ilerleme kaydı, rozet motoru.
- Entegrasyonlar: SIEM, TIP (MISP), sandbox hizmetleri, e-posta gateway'leri.
- Güvenlik: TLS 1.3 desteği, anahtar yönetimi ve gizli verilerin güvenli saklanması.

---

## 📸 Uygulama Ekran Görüntüleri

### Giriş Ekranı
<img src="assets/images/loginpage.png" alt="Giriş Ekranı" width="400"/>

### Ana Sayfa
<img src="assets/images/mainpage.png" alt="Ana Sayfa" width="400"/>

### Modüller
- **Eğitim Modülleri**
  <img src="assets/images/moduller.png" alt="Eğitim Modülleri" width="400"/>
- **Modül İçeriği**
  <img src="assets/images/modullicerik.png" alt="Modül İçeriği" width="400"/>

### Quiz
- **Quiz Soruları**
  <img src="assets/images/sorular.png" alt="Quiz Soruları" width="400"/>
  
  <img src="assets/images/sorular2.png" alt="Quiz Sonuçları" width="400"/>

### APT Sözlüğü

  <img src="assets/images/aptsozluk.png" alt="APT Sözlük" width="400"/>

  <img src="assets/images/apt-analiz.png" alt="APT Analiz" width="400"/>

### Ayarlar
- **Genel Ayarlar**
  <img src="assets/images/settings1.png" alt="Genel Ayarlar" width="400"/>

  <img src="assets/images/settings2.png" alt="Bildirim Ayarları" width="400"/>

### Liderlik Tablosu
<img src="assets/images/leaderboard.png" alt="Liderlik Tablosu" width="400"/>

---

## 📦 İçerik Kaynakları (Projede yüklü dokümanlardan derleme)
- Kriptografi referans notları (AES, AEAD, KDF, PKI).
- Sosyal mühendislik ve phishing eğitim PDF'leri (tespit yöntemleri, pratik kontroller).
- Network temelleri dökümanı (OSI, TCP/IP, DHCP, ARP, DNS).
- Trojan ve malware örnekleri ile CTI kullanım senaryoları.
- SIGINT giriş notları ve SigintOS uygulama örnekleri.

---

## 🚀 Nasıl Katkıda Bulunabilirsiniz?
- Yeni modül içerikleri gönderin (.md, .pdf) — içerik gözden geçirilip sisteme eklenir.
- Quiz ve test soruları hazırlayın; otomatik değerlendirme kurallarıyla entegre ediyoruz.
- UI/UX geri bildirimleri için issue açın.

---

## Lisans
Bu proje eğitim amaçlıdır. İçerikler, kaynakça gösterilerek iç kullanım ve eğitim dağıtımı için uygundur.

---



