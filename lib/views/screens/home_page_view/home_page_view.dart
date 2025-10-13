import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:threat_lens/app/router.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = [
      {
        'title': 'Siber Güvenlik Temelleri',
        'subtitle': 'Temel kavramlar ve prensipler',
        'icon': Icons.security,
        'color': const Color(0xFFBB86FC),
        'lessons': [
          {
            'title': 'Siber Güvenlik Nedir?',
            'duration': '15 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Siber Güvenlik Nedir?'},
                  {
                    'type': 'desc',
                    'text':
                        'Siber güvenlik, dijital sistemleri, ağları, programları ve verileri siber saldırılardan koruma sürecidir. Günümüzde her şeyin dijitalleşmesiyle birlikte siber güvenlik hayati önem taşımaktadır.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Gizlilik (Confidentiality): Bilgilerin yetkisiz kişilerden korunması',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Bütünlük (Integrity): Verilerin doğruluğunun ve güvenilirliğinin korunması',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Erişilebilirlik (Availability): Yetkili kullanıcıların ihtiyaç duyduğunda sisteme erişebilmesi',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Gerçek Hayat Örneği: Bir bankanın müşteri verilerinin sızdırılması gizlilik ihlalidir. Bir sağlık sisteminde verilerin yanlışlıkla değiştirilmesi bütünlük ihlalidir. Bir web sitesine erişilememesi ise erişilebilirlik sorunudur.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Siber güvenlik, kimlik doğrulama, şifreleme, antivirüs yazılımları, güvenlik duvarları, kullanıcı eğitimi ve güncel yazılım gibi birçok yöntemle sağlanır.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Siber güvenliğin temel prensiplerinden "Gizlilik" ne anlama gelir?',
                  'options': [
                    'Bilgilerin yetkisiz kişilerden korunması',
                    'Sistemin her zaman çalışır durumda olması',
                    'Verilerin doğruluğunun korunması',
                    'Sistemin hızlı çalışması',
                  ],
                  'correctIndex': 0,
                  'explanation':
                      'Gizlilik (Confidentiality), bilgilerin yetkisiz kişilerden korunması anlamına gelir.',
                },
              },
            ],
          },
          {
            'title': 'Siber Tehdit Türleri',
            'duration': '20 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Siber Tehdit Türleri'},
                  {
                    'type': 'desc',
                    'text':
                        'Siber dünyada karşılaşabileceğimiz çeşitli tehdit türleri vardır. Bu tehditleri tanımak, korunma stratejileri geliştirmek için önemlidir.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Malware (Zararlı Yazılım): Virüs, trojan, ransomware gibi zararlı programlar',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Phishing (Oltalama): Sahte e-postalar ve web siteleri ile bilgi çalma',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'DDoS Saldırıları: Sistemleri aşırı yükleyerek hizmet kesintisi yaratma',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'SQL Injection: Veritabanlarına yetkisiz erişim sağlama',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Man-in-the-Middle: İletişimi dinleyerek veri çalma',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Gerçek Hayat Örneği: 2021 yılında Colonial Pipeline\'a yapılan ransomware saldırısı, ABD\'nin doğu kıyısında benzin sıkıntısına neden oldu. Saldırganlar 4.4 milyon dolar fidye aldı.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Senaryo: Bir çalışan, sahte bir banka e-postasına tıklayarak hesap bilgilerini girdi. Bu phishing saldırısıydı.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Bir e-postada "Hesabınız askıya alındı, hemen tıklayın" yazıyorsa ne yapmalısın? (En güvenli davranış nedir?)',
                  'options': [
                    'E-postayı sil ve bağlantıya tıklama',
                    'Hemen tıkla ve hesabını kontrol et',
                    'E-postayı arkadaşlarına gönder',
                    'E-postayı aç ama bağlantıya tıklama',
                  ],
                  'correctIndex': 0,
                  'explanation':
                      'Şüpheli e-postaları açmamak ve bağlantılara tıklamamak en güvenli davranıştır.',
                },
              },
            ],
          },
          {
            'title': 'Günlük Güvenlik Pratikleri',
            'duration': '18 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Günlük Güvenlik Pratikleri'},
                  {
                    'type': 'desc',
                    'text':
                        'Bireyler için günlük yaşamda alınabilecek başlıca siber güvenlik önlemleri:',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Güçlü ve benzersiz şifreler kullanın, şifrelerinizi kimseyle paylaşmayın.',
                  },
                  {
                    'type': 'bullet',
                    'text': 'İki faktörlü kimlik doğrulama (2FA) kullanın.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Şüpheli e-posta ve ekleri açmayın, bağlantılara tıklamayın.',
                  },
                  {
                    'type': 'bullet',
                    'text': 'Ortak Wi-Fi ağlarında hassas işlemlerden kaçının.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Cihazlarınızı güncel tutun ve antivirüs yazılımı kullanın.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Kişisel bilgilerinizi sosyal medyada paylaşırken dikkatli olun.',
                  },
                  {
                    'type': 'bullet',
                    'text': 'Düzenli olarak verilerinizi yedekleyin.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Gerçek Hayat Örneği: Sosyal medyada doğum tarihi, telefon numarası gibi kişisel bilgilerin paylaşılması kimlik hırsızlığı riskini artırır.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Senaryo: Ortak Wi-Fi ağlarında banka işlemleri yapmak güvenli değildir çünkü verileriniz başkaları tarafından izlenebilir.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Aşağıdakilerden hangisi güçlü bir şifre politikasının en önemli bileşeni değildir?',
                  'options': [
                    'Şifre karmaşıklığı (büyük/küçük harf, rakam, özel karakter)',
                    'Şifre uzunluğu (en az 12-16 karakter)',
                    'Şifre yenileme sıklığı (30-90 günde bir değiştirme)',
                    'Şifre benzersizliği (farklı hesaplar için farklı şifreler)',
                  ],
                  'correctIndex': 2,
                  'explanation':
                      'Modern güvenlik yaklaşımlarında, sık şifre değiştirme zorunluluğu artık en iyi uygulama olarak kabul edilmemektedir. NIST (National Institute of Standards and Technology) gibi kuruluşlar, kullanıcıların sık değiştirme zorunluluğu nedeniyle daha basit ve tahmin edilebilir şifreler seçme eğiliminde olduğunu belirtmektedir. Bunun yerine, uzun, karmaşık ve benzersiz şifreler kullanmak ve şifre ihlali durumunda değiştirmek daha etkilidir.',
                },
              },
            ],
          },
          {
            'title': 'Kurumsal Güvenlik Önlemleri',
            'duration': '22 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Kurumsal Güvenlik Önlemleri'},
                  {
                    'type': 'desc',
                    'text':
                        'Kurumlar için siber güvenlikte alınabilecek başlıca önlemler:',
                  },
                  {
                    'type': 'bullet',
                    'text': 'Ağ segmentasyonu ve erişim kontrolleri uygulayın.',
                  },
                  {
                    'type': 'bullet',
                    'text': 'Çalışanlara düzenli siber güvenlik eğitimi verin.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Kritik verileri düzenli olarak yedekleyin ve yedekleri test edin.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Güvenlik duvarı, IDS/IPS ve antivirüs çözümleri kullanın.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Güvenlik açıklarını düzenli olarak tarayın ve yamalayın.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Olay müdahale ve iş sürekliliği planları oluşturun.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Veri şifreleme ve kimlik doğrulama sistemleri kurun.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Gerçek Hayat Örneği: 2020 yılında SolarWinds saldırısında 18.000\'den fazla kurum etkilendi. Bu, kurumsal güvenlik önlemlerinin önemini gösterdi.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Senaryo: Bir şirket, çalışanlarına düzenli güvenlik eğitimi vererek phishing saldırılarına karşı farkındalık yarattı.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Kurumsal siber güvenlikte yedekleme stratejisinin en önemli bileşeni nedir?',
                  'options': [
                    'Yedeklerin düzenli olarak test edilmesi',
                    'Veri kaybı riskine karşı koruma ve iş sürekliliği sağlaması',
                    'Yedeklerin farklı fiziksel lokasyonlarda saklanması',
                    'Yedekleme işlemlerinin otomatikleştirilmesi',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Veri kaybı riskine karşı koruma ve iş sürekliliği sağlaması, yedekleme stratejisinin temel amacıdır. Diğer seçenekler de önemli olmakla birlikte, bu temel amacı destekleyen unsurlardır.',
                },
              },
            ],
          },
          {
            'title': 'Güvenlik Testleri ve Değerlendirme',
            'duration': '25 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {
                    'type': 'title',
                    'text': 'Güvenlik Testleri ve Değerlendirme',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Siber güvenlikte güvenlik testleri, sistemlerin ve uygulamaların zafiyetlerini tespit etmek ve önlem almak için yapılan kontrollü denemelerdir.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Penetrasyon Testi: Bir saldırgan gibi davranarak sistemdeki açıkları bulmaya yönelik testler.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Zafiyet Taraması: Otomatik araçlarla sistemdeki bilinen güvenlik açıklarının tespiti.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Sosyal Mühendislik Testleri: Çalışanların sosyal mühendislik saldırılarına karşı farkındalığını ölçmek için yapılan testler.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Kaynak Kod Analizi: Yazılımın kaynak kodunda güvenlik açıklarını tespit etmeye yönelik inceleme.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Güvenlik Değerlendirmesi: Genel güvenlik durumunun kapsamlı analizi.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Gerçek Hayat Örneği: Bir şirket, yeni bir web uygulamasını yayına almadan önce penetrasyon testi yaptırarak olası açıkları kapatır.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Senaryo: Bir çalışan, sosyal mühendislik testi sırasında sahte bir e-postaya şifresini girerse, kurumun güvenlik farkındalığı düşük demektir.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Aşağıdakilerden hangisi etkili bir penetrasyon testinin özelliği değildir?',
                  'options': [
                    'Gerçek saldırı senaryolarını simüle etmesi',
                    'Sistemdeki güvenlik açıklarını belgelemesi',
                    'Sistemin normal işleyişini etkilemeden yapılması',
                    'Sadece otomatik tarama araçlarıyla gerçekleştirilmesi',
                  ],
                  'correctIndex': 3,
                  'explanation':
                      'Etkili bir penetrasyon testi sadece otomatik tarama araçlarıyla sınırlı kalmamalıdır. Manuel testler, sosyal mühendislik ve özel senaryolar da içermelidir. Otomatik araçlar yardımcı olabilir ancak tek başına yeterli değildir.',
                },
              },
            ],
          },
        ],
      },
      {
        'title': 'Ağ Güvenliği',
        'subtitle': 'Ağ altyapısı ve koruma',
        'icon': Icons.wifi,
        'color': const Color(0xFFBB86FC),
        'lessons': [
          {
            'title': 'Ağ Protokolleri ve Güvenlik',
            'duration': '20 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Ağ Protokolleri ve Güvenlik'},
                  {
                    'type': 'desc',
                    'text':
                        'Ağ protokolleri, cihazlar arasında veri iletimini sağlayan kurallar bütünüdür. Güvenlik açısından protokol seçimi kritik önem taşır.',
                  },
                  {
                    'type': 'bullet',
                    'text': 'HTTP: Açık metin ile veri iletimi, güvenli değil',
                  },
                  {
                    'type': 'bullet',
                    'text': 'HTTPS: Şifreli veri iletimi, güvenli',
                  },
                  {
                    'type': 'bullet',
                    'text': 'FTP: Dosya transferi, güvenli değil',
                  },
                  {'type': 'bullet', 'text': 'SFTP: Güvenli dosya transferi'},
                  {'type': 'bullet', 'text': 'SSH: Güvenli uzaktan erişim'},
                  {
                    'type': 'desc',
                    'text':
                        'Gerçek Hayat Örneği: Bir e-ticaret sitesinde HTTPS kullanılmazsa, kredi kartı bilgileri açık metin olarak gönderilir ve çalınabilir.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Senaryo: Bir kullanıcı HTTP kullanan bir banka sitesine giriş yaparsa, şifresi ağ üzerinde açık metin olarak görülebilir.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Halka açık Wi-Fi ağlarında banka uygulaması kullanırken aşağıdaki önlemlerden hangisi en az koruma sağlar?',
                  'options': [
                    'Banka uygulamasının SSL/TLS sertifikasını kontrol etmek',
                    'VPN kullanarak tüm trafiği şifrelemek',
                    'Mobil veri bağlantısına geçmek (Wi-Fi yerine)',
                    'Tarayıcı geçmişini ve çerezleri düzenli olarak temizlemek',
                  ],
                  'correctIndex': 3,
                  'explanation':
                      'Tarayıcı geçmişini ve çerezleri temizlemek genel gizlilik için faydalı olsa da, halka açık Wi-Fi ağlarındaki güvenlik risklerine karşı etkili bir koruma sağlamaz. Man-in-the-middle saldırıları, paket koklama gibi tehditlere karşı VPN kullanmak, SSL/TLS sertifikalarını kontrol etmek veya güvenli mobil veri bağlantısına geçmek çok daha etkili önlemlerdir.',
                },
              },
            ],
          },
          {
            'title': 'Firewall ve Ağ Koruması',
            'duration': '25 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Firewall ve Ağ Koruması'},
                  {
                    'type': 'desc',
                    'text':
                        'Firewall, ağ trafiğini kontrol eden ve zararlı bağlantıları engelleyen bir güvenlik sistemidir. Hem donanım hem yazılım tabanlı olabilir.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Paket Filtreleme: IP adresi ve port bazlı filtreleme',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Stateful Inspection: Bağlantı durumunu takip eden filtreleme',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Application Layer: Uygulama seviyesinde filtreleme',
                  },
                  {
                    'type': 'bullet',
                    'text': 'Next-Generation: Derin paket inceleme ve IDS/IPS',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Gerçek Hayat Örneği: Bir şirket, sadece e-posta (port 25, 587) ve web trafiğine (port 80, 443) izin verirken, diğer tüm portları firewall ile kapatır.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Senaryo: Bir saldırgan, şirket ağına 22. porttan (SSH) bağlanmaya çalışır ama firewall bunu engeller.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Aşağıdakilerden hangisi modern bir Next-Generation Firewall (NGFW) özelliği değildir?',
                  'options': [
                    'Derin paket incelemesi (Deep Packet Inspection)',
                    'Uygulama katmanı filtreleme (Application Layer Filtering)',
                    'Saldırı tespit ve önleme sistemleri (IDS/IPS)',
                    'Ağ trafiğini şifreleyerek iletme (Traffic Encryption)',
                  ],
                  'correctIndex': 3,
                  'explanation':
                      'Next-Generation Firewall (NGFW) sistemleri trafiği şifrelemez, aksine şifreli trafiği inceleyebilir. Şifreleme işlemi genellikle VPN gibi farklı güvenlik çözümleri tarafından gerçekleştirilir. NGFW\'ler derin paket incelemesi, uygulama katmanı filtreleme ve saldırı tespit/önleme özellikleri içerir.',
                },
              },
            ],
          },
          {
            'title': 'VPN ve Uzaktan Erişim',
            'duration': '18 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'VPN ve Uzaktan Erişim'},
                  {
                    'type': 'desc',
                    'text':
                        'VPN (Virtual Private Network), internet üzerinden güvenli ve şifreli bir bağlantı kurarak verilerin gizliliğini ve bütünlüğünü sağlar.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Site-to-Site VPN: Şirket lokasyonları arası güvenli bağlantı',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Remote Access VPN: Uzaktan çalışanlar için güvenli erişim',
                  },
                  {
                    'type': 'bullet',
                    'text': 'SSL/TLS VPN: Web tabanlı güvenli erişim',
                  },
                  {
                    'type': 'bullet',
                    'text': 'IPSec VPN: Ağ seviyesinde şifreleme',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Gerçek Hayat Örneği: Bir çalışan, evinden şirket ağına VPN ile bağlanarak tüm verilerini şifreli ve güvenli şekilde iletebilir.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Senaryo: Bir kullanıcı kafede çalışırken VPN kullanmazsa, verileri ağ üzerinde açık metin olarak görülebilir.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Aşağıdakilerden hangisi kurumsal VPN çözümlerinde kullanılan bir protokol değildir?',
                  'options': [
                    'IPSec (Internet Protocol Security)',
                    'SSL/TLS (Secure Sockets Layer/Transport Layer Security)',
                    'PPTP (Point-to-Point Tunneling Protocol)',
                    'SMTP (Simple Mail Transfer Protocol)',
                  ],
                  'correctIndex': 3,
                  'explanation':
                      'SMTP (Simple Mail Transfer Protocol) bir e-posta iletim protokolüdür ve VPN teknolojisiyle ilgisi yoktur. IPSec, SSL/TLS ve PPTP ise yaygın olarak kullanılan VPN protokolleridir. SMTP yerine VPN protokolü olarak OpenVPN, L2TP veya WireGuard gibi protokoller kullanılır.',
                },
              },
            ],
          },
          {
            'title': 'Kablosuz Ağ Güvenliği',
            'duration': '22 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Kablosuz Ağ Güvenliği'},
                  {
                    'type': 'desc',
                    'text':
                        'Kablosuz ağlarda güçlü şifreleme ve güvenli erişim noktaları kullanmak önemlidir. Wi-Fi güvenliği hem ev hem iş ortamında kritiktir.',
                  },
                  {
                    'type': 'bullet',
                    'text': 'WEP: Eski ve güvensiz şifreleme (kullanılmamalı)',
                  },
                  {'type': 'bullet', 'text': 'WPA: Orta seviye güvenlik'},
                  {'type': 'bullet', 'text': 'WPA2: Güçlü şifreleme (AES)'},
                  {
                    'type': 'bullet',
                    'text': 'WPA3: En güvenli şifreleme (yeni standart)',
                  },
                  {
                    'type': 'bullet',
                    'text': 'MAC Filtreleme: Cihaz bazlı erişim kontrolü',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Gerçek Hayat Örneği: Evde Wi-Fi ağına güçlü bir şifre koymak, komşuların internetinizi kullanmasını engeller.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Senaryo: Bir kafede açık Wi-Fi kullanırken, başka bir kullanıcı ağ trafiğinizi görebilir.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Aşağıdakilerden hangisi WPA3 protokolünün WPA2\'ye göre bir avantajı değildir?',
                  'options': [
                    'Simultaneous Authentication of Equals (SAE) ile daha güçlü şifre koruması',
                    'Forward Secrecy özelliği ile geçmiş trafiğin korunması',
                    'Daha güçlü şifreleme (192-bit güvenlik)',
                    'Daha yüksek veri transfer hızı sağlaması',
                  ],
                  'correctIndex': 3,
                  'explanation':
                      'WPA3, WPA2\'ye göre daha yüksek veri transfer hızı sağlamaz. WPA3\'ün avantajları güvenlikle ilgilidir: SAE ile daha güçlü şifre koruması, Forward Secrecy ile geçmiş trafiğin korunması ve 192-bit güvenlik seviyesi gibi. Veri transfer hızı, Wi-Fi standardına (802.11n, 802.11ac, 802.11ax gibi) bağlıdır, şifreleme protokolüne değil.',
                },
              },
            ],
          },
          {
            'title': 'Ağ İzleme ve Tehdit Tespiti',
            'duration': '20 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Ağ İzleme ve Tehdit Tespiti'},
                  {
                    'type': 'desc',
                    'text':
                        'Ağ izleme, ağ trafiğini analiz ederek olası tehditleri ve anormallikleri tespit etmeye yarar. Proaktif güvenlik için önemlidir.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'IDS (Intrusion Detection System): Saldırı tespit sistemi',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'IPS (Intrusion Prevention System): Saldırı önleme sistemi',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'SIEM (Security Information and Event Management): Güvenlik olay yönetimi',
                  },
                  {
                    'type': 'bullet',
                    'text': 'Netflow Analizi: Ağ trafiği analizi',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Gerçek Hayat Örneği: Bir kurumda ağ izleme yazılımı ile saldırı girişimleri tespit edilebilir ve önlenebilir.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Senaryo: Bir saldırgan, şirket ağına sürekli bağlanmaya çalışır. IDS bunu tespit eder ve alarm verir.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Aşağıdakilerden hangisi bir HIDS (Host-based Intrusion Detection System) ile NIDS (Network-based Intrusion Detection System) arasındaki fark değildir?',
                  'options': [
                    'HIDS tek bir cihazı izlerken, NIDS tüm ağ trafiğini izler',
                    'HIDS işletim sistemi olaylarını izlerken, NIDS ağ paketlerini analiz eder',
                    'HIDS sistem dosyalarındaki değişiklikleri tespit ederken, NIDS ağ anomalilerini tespit eder',
                    'HIDS saldırıları otomatik olarak engeller, NIDS sadece tespit eder ve alarm verir',
                  ],
                  'correctIndex': 3,
                  'explanation':
                      'Otomatik engelleme özelliği IDS sistemlerinin değil, IPS (Intrusion Prevention System) sistemlerinin özelliğidir. Hem HIDS hem de NIDS, varsayılan olarak saldırıları tespit eder ve alarm verir, otomatik engelleme yapmazlar. Engelleme yapan sistemler HIPS (Host-based IPS) ve NIPS (Network-based IPS) olarak adlandırılır.',
                },
              },
            ],
          },
        ],
      },
      {
        'title': 'Kriptografi',
        'subtitle': 'Şifreleme ve güvenlik',
        'icon': Icons.lock,
        'color': const Color(0xFFBB86FC),
        'lessons': [
          {
            'title': 'Kriptografi Temelleri',
            'duration': '25 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Kriptografi Temelleri'},
                  {
                    'type': 'desc',
                    'text':
                        'Kriptografi, bilgilerin şifrelenerek gizli tutulmasını sağlayan bilim dalıdır.',
                  },
                  {
                    'type': 'bullet',
                    'text': 'Şifreleme: Bilgilerin okunamaz hale getirilmesi.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Bir mesajın şifrelenerek sadece yetkili kişi tarafından okunabilmesi.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'End-to-end şifreleme (E2EE) ile ilgili aşağıdaki ifadelerden hangisi doğru değildir?',
                  'options': [
                    'Mesajlar sadece gönderen ve alıcı tarafından şifre çözme anahtarlarına sahiptir',
                    'Mesaj içeriği iletim sırasında üçüncü taraflar tarafından okunamaz',
                    'Servis sağlayıcı şirket bile mesaj içeriğine erişemez',
                    'Mesajların meta verileri (gönderici, alıcı, zaman) de tamamen şifrelenir ve kimse tarafından görülemez',
                  ],
                  'correctIndex': 3,
                  'explanation':
                      'End-to-end şifreleme (E2EE) sadece mesaj içeriğini şifreler, meta veriler (kimin kiminle, ne zaman mesajlaştığı gibi) genellikle şifrelenmez ve servis sağlayıcı tarafından görülebilir. WhatsApp gibi uygulamalarda mesaj içeriği şifrelenir ancak iletişim meta verileri şirket tarafından görülebilir ve analiz edilebilir.',
                },
              },
            ],
          },
          {
            'title': 'Simetrik Şifreleme',
            'duration': '20 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Simetrik Şifreleme'},
                  {
                    'type': 'desc',
                    'text':
                        'Simetrik şifrelemede aynı anahtar hem şifreleme hem de çözme işlemi için kullanılır.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Tek anahtar: Hem şifreleme hem çözme için aynı anahtar.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Bir dosyanın şifrelenip aynı anahtarla açılması.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Simetrik şifreleme algoritmalarının aşağıdaki özelliklerinden hangisi bir dezavantaj olarak değerlendirilir?',
                  'options': [
                    'Yüksek performans ve hızlı işlem süresi',
                    'Anahtar dağıtımı ve yönetimi sorunu',
                    'Düşük hesaplama maliyeti',
                    'Büyük veri setlerinde verimli çalışma',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Simetrik şifreleme, tek anahtar kullanımı nedeniyle hızlı ve verimlidir, ancak en büyük dezavantajı güvenli anahtar dağıtımı ve yönetimi sorunudur. Şifreleme ve çözme için aynı anahtarın kullanılması, bu anahtarın güvenli bir şekilde paylaşılmasını gerektirir ki bu da özellikle geniş ağlarda büyük bir zorluktur.',
                },
              },
            ],
          },
          {
            'title': 'Asimetrik Şifreleme',
            'duration': '22 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Asimetrik Şifreleme'},
                  {
                    'type': 'desc',
                    'text':
                        'Asimetrik şifrelemede açık ve özel anahtar olmak üzere iki farklı anahtar kullanılır.',
                  },
                  {
                    'type': 'bullet',
                    'text': 'Açık anahtar: Herkesle paylaşılır.',
                  },
                  {
                    'type': 'bullet',
                    'text': 'Özel anahtar: Sadece sahibi tarafından bilinir.',
                  },
                  {
                    'type': 'desc',
                    'text': 'Örnek: E-posta imzalama ve şifreleme işlemleri.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Asimetrik şifreleme sistemlerinde aşağıdaki senaryolardan hangisi matematiksel olarak mümkün DEĞİLDİR?',
                  'options': [
                    'Açık anahtarla şifrelenmiş bir mesajın özel anahtarla çözülmesi',
                    'Özel anahtarla şifrelenmiş bir mesajın açık anahtarla çözülmesi',
                    'Açık anahtarla şifrelenmiş bir mesajın aynı açık anahtarla çözülmesi',
                    'Özel anahtarla imzalanmış bir mesajın açık anahtarla doğrulanması',
                  ],
                  'correctIndex': 2,
                  'explanation':
                      'Asimetrik şifreleme sistemlerinde, açık anahtarla şifrelenmiş bir mesaj sadece ilgili özel anahtarla çözülebilir, aynı açık anahtarla çözülemez. Bu, RSA gibi asimetrik algoritmaların matematiksel yapısından kaynaklanır. Özel anahtarla şifrelenmiş (imzalanmış) bir mesaj açık anahtarla doğrulanabilir, ancak açık anahtarla şifrelenmiş bir mesaj asla aynı açık anahtarla çözülemez.',
                },
              },
            ],
          },
          {
            'title': 'Hash Fonksiyonları',
            'duration': '18 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Hash Fonksiyonları'},
                  {
                    'type': 'desc',
                    'text':
                        'Hash fonksiyonları, verileri sabit uzunlukta ve geri döndürülemez şekilde dönüştürür.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Sabit uzunluk: Her veri için aynı uzunlukta çıktı.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Parola saklamada hash fonksiyonu kullanmak.',
                  },
                ],
                'classicQuestion':
                    'Sosyal medyada doğum tarihini paylaşmak neden tehlikeli? (Hangi bilgi için kullanılabilir?)',
                'classicAnswer': [
                  'şifre',
                  'kimlik',
                  'hırsızlık',
                  'tahmin',
                  'güvenlik',
                  'soru',
                  'sıfırlama',
                  'kişisel',
                ],
                'classicHint':
                    'Doğum tarihi şifre sıfırlama ve kimlik doğrulama için kullanılabilir.',
              },
            ],
          },
          {
            'title': 'Dijital İmzalar',
            'duration': '20 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Dijital İmzalar'},
                  {
                    'type': 'desc',
                    'text':
                        'Dijital imzalar, verinin bütünlüğünü ve kaynağını doğrulamak için kullanılır.',
                  },
                  {
                    'type': 'bullet',
                    'text': 'Bütünlük: Verinin değişmediğini garanti eder.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Bir PDF dosyasının dijital imza ile doğrulanması.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Dijital imza teknolojisinde aşağıdaki güvenlik özelliklerinden hangisi sağlanmaz?',
                  'options': [
                    'İnkar edilemezlik (Non-repudiation)',
                    'Veri gizliliği (Confidentiality)',
                    'Veri bütünlüğü (Integrity)',
                    'Kimlik doğrulama (Authentication)',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Dijital imza teknolojisi, inkar edilemezlik (imzalayan kişinin imzasını reddedemeyeceği), veri bütünlüğü (verinin değiştirilmediği) ve kimlik doğrulama (imzalayanın kimliğinin doğrulanması) özelliklerini sağlar. Ancak, dijital imza tek başına veri gizliliğini sağlamaz. Veri gizliliği için şifreleme teknikleri kullanılmalıdır. Dijital imza, mesajın kimin tarafından gönderildiğini ve değiştirilmediğini doğrular, ancak mesajın içeriğini gizlemez.',
                },
              },
            ],
          },
        ],
      },
      {
        'title': 'PenTest',
        'subtitle': 'Güvenlik testleri ve değerlendirme',
        'icon': Icons.bug_report,
        'color': const Color(0xFFBB86FC),
        'lessons': [
          {
            'title': 'PenTest Nedir?',
            'duration': '20 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Penetrasyon Testi Nedir?'},
                  {
                    'type': 'desc',
                    'text':
                        'Penetrasyon testi, sistemdeki güvenlik açıklarını bulmak için yapılan kontrollü saldırı simülasyonudur.',
                  },
                  {
                    'type': 'bullet',
                    'text': 'Açık tespiti: Sistem zafiyetlerini bulmak.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Bir şirket, yeni bir uygulamayı yayına almadan önce penetrasyon testi yaptırır.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Aşağıdakilerden hangisi Black Box penetrasyon testinin White Box penetrasyon testine göre bir avantajı DEĞİLDİR?',
                  'options': [
                    'Gerçek dünya saldırı senaryolarını daha iyi simüle eder',
                    'Kaynak kodu analizi ile daha derin güvenlik açıklarını tespit eder',
                    'Test ekibinin önyargılarını azaltır',
                    'Saldırganın bakış açısıyla sistemin değerlendirilmesini sağlar',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Black Box penetrasyon testinde test ekibi sistem hakkında önceden bilgi sahibi olmadan test yapar, bu gerçek dünya saldırılarını simüle eder ve önyargıları azaltır. Ancak kaynak kodu analizi ile derin güvenlik açıklarını tespit etmek, White Box testinin bir avantajıdır, çünkü Black Box testinde kaynak koduna erişim yoktur. White Box testinde test ekibi sistem hakkında tam bilgiye sahiptir ve kaynak kodu analizi yapabilir.',
                },
              },
            ],
          },
          {
            'title': 'Reconnaissance',
            'duration': '25 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Reconnaissance'},
                  {
                    'type': 'desc',
                    'text':
                        'Reconnaissance, hedef sistem hakkında bilgi toplama aşamasıdır.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Bilgi toplama: Hedef sistemin zayıf noktalarını bulmak.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Alan adı, IP adresi, açık portlar gibi bilgilerin toplanması.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Aşağıdakilerden hangisi pasif reconnaissance (keşif) yöntemi DEĞİLDİR?',
                  'options': [
                    'WHOIS sorguları yapmak',
                    'Port taraması yapmak',
                    'Arama motorlarında hedef hakkında araştırma yapmak',
                    'Sosyal medya profillerini incelemek',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Port taraması, aktif reconnaissance (keşif) yöntemidir çünkü hedef sistemle doğrudan etkileşime geçer ve tespit edilebilir izler bırakır. Pasif reconnaissance yöntemleri (WHOIS sorguları, arama motorlarında araştırma, sosyal medya incelemesi) hedef sistemle doğrudan etkileşime geçmeden, halka açık kaynaklardan bilgi toplamayı içerir ve genellikle tespit edilemez.',
                },
              },
            ],
          },
          {
            'title': 'Vulnerability Assessment',
            'duration': '22 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Vulnerability Assessment'},
                  {
                    'type': 'desc',
                    'text':
                        'Zafiyet değerlendirmesi, sistemdeki güvenlik açıklarının tespit edilmesidir.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Açık tespiti: Otomatik araçlarla zafiyet taraması.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Bir sistemde zafiyet tarama aracı ile açıkların bulunması.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Aşağıdakilerden hangisi CVSS (Common Vulnerability Scoring System) skorlamasında değerlendirilen bir metrik DEĞİLDİR?',
                  'options': [
                    'Saldırı vektörü (Attack Vector)',
                    'Saldırı karmaşıklığı (Attack Complexity)',
                    'Gerekli ayrıcalıklar (Privileges Required)',
                    'Zafiyet düzeltme maliyeti (Remediation Cost)',
                  ],
                  'correctIndex': 3,
                  'explanation':
                      'CVSS (Common Vulnerability Scoring System), güvenlik açıklarının şiddetini değerlendirmek için kullanılan standart bir sistemdir. Saldırı vektörü, saldırı karmaşıklığı ve gerekli ayrıcalıklar CVSS metriklerindendir, ancak "zafiyet düzeltme maliyeti" CVSS skorlamasında değerlendirilen bir metrik değildir. CVSS, zafiyetin teknik özelliklerine odaklanır, düzeltme maliyeti gibi iş etkisi faktörleri genellikle organizasyonların kendi risk değerlendirme süreçlerinde ayrıca ele alınır.',
                },
              },
            ],
          },
          {
            'title': 'Exploitation',
            'duration': '30 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Exploitation'},
                  {
                    'type': 'desc',
                    'text':
                        'Exploitation, tespit edilen açıkların kullanılarak sisteme sızma aşamasıdır.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Açık kullanımı: Bulunan zafiyetin istismar edilmesi.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Bir web uygulamasında SQL Injection açığının kullanılması.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Aşağıdakilerden hangisi bir exploit geliştirme sürecinde "Proof of Concept (PoC)" aşamasının temel amacı DEĞİLDİR?',
                  'options': [
                    'Zafiyetin gerçekten var olduğunu doğrulamak',
                    'Zafiyetin sömürülebilir olduğunu göstermek',
                    'Tam yetki (root/admin) elde etmek',
                    'Güvenlik araştırmacılarına teknik detayları iletmek',
                  ],
                  'correctIndex': 2,
                  'explanation':
                      'Proof of Concept (PoC), bir güvenlik zafiyetinin varlığını ve sömürülebilirliğini göstermek için geliştirilen basit bir koddur. PoC\'nin amacı zafiyetin var olduğunu doğrulamak, sömürülebilir olduğunu göstermek ve güvenlik araştırmacılarına teknik detayları iletmektir. Tam yetki (root/admin) elde etmek genellikle tam geliştirilmiş bir exploit\'in amacıdır, basit bir PoC\'nin değil. PoC genellikle minimal işlevselliğe sahiptir ve sadece zafiyetin varlığını kanıtlamak için yeterli kodu içerir.',
                },
              },
            ],
          },
          {
            'title': 'Raporlama',
            'duration': '18 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Raporlama'},
                  {
                    'type': 'desc',
                    'text':
                        'Raporlama, test sonuçlarının ve önerilerin detaylı şekilde sunulmasıdır.',
                  },
                  {
                    'type': 'bullet',
                    'text': 'Detaylı rapor: Açıklar ve çözüm önerileri.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Penetrasyon testi sonrası müşteriye sunulan rapor.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Aşağıdakilerden hangisi tarayıcı tabanlı sahte Windows güvenlik uyarılarını (tech support scam) tespit etmek için en güvenilir yöntemdir?',
                  'options': [
                    'Uyarıdaki Windows logosunun orijinal olup olmadığını kontrol etmek',
                    'Uyarı penceresinin tarayıcı sekmesi içinde olup olmadığını kontrol etmek',
                    'Uyarıdaki telefon numarasını aramak ve doğrulamak',
                    'Uyarıdaki hata kodunu internette araştırmak',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Sahte Windows güvenlik uyarıları genellikle tarayıcı tabanlıdır ve gerçek sistem uyarıları gibi görünmeye çalışır. Gerçek Windows uyarıları tarayıcı sekmesi içinde değil, işletim sistemi seviyesinde görünür. Tarayıcı sekmesi içinde görünen bir uyarı, sahte olduğunun en güvenilir göstergesidir. Logo kontrolü yanıltıcı olabilir çünkü dolandırıcılar genellikle orijinal logoları kullanır. Telefon numarasını aramak dolandırıcılarla iletişime geçmenize neden olabilir. Hata kodunu araştırmak faydalı olabilir ancak dolandırıcılar gerçek hata kodlarını da kullanabilir.',
                },
              },
            ],
          },
        ],
      },
      {
        'title': 'CTI',
        'subtitle': 'Tehdit istihbaratı',
        'icon': Icons.visibility,
        'color': const Color(0xFF03DAC6),
        'lessons': [
          {
            'title': 'CTI Giriş',
            'duration': '18 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Tehdit İstihbaratına Giriş'},
                  {
                    'type': 'desc',
                    'text':
                        'Siber tehdit istihbaratı, potansiyel tehditleri önceden tespit etmek ve önlem almak için bilgi toplama ve analiz etme sürecidir.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Amaç: Tehditleri önceden tespit etmek ve savunmayı güçlendirmek.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Bir kurum, saldırı kampanyalarını önceden fark ederek sistemlerini güçlendirir.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Siber tehdit istihbaratı (CTI) sürecinde aşağıdaki aşamalardan hangisi en kritik öneme sahiptir?',
                  'options': [
                    'Tehdit verilerinin toplanması',
                    'Toplanan verilerin analiz edilmesi ve anlamlandırılması',
                    'Tehdit raporlarının oluşturulması',
                    'Tehdit verilerinin diğer kurumlarla paylaşılması',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Siber tehdit istihbaratında en kritik aşama, toplanan verilerin analiz edilmesi ve anlamlandırılmasıdır. Veri toplamak önemli bir başlangıç noktasıdır, ancak ham veriler analiz edilip anlamlandırılmadan gerçek değer sağlamazlar. Analiz aşamasında, tehdit aktörleri, motivasyonları, kullandıkları teknikler ve hedefleri belirlenir. Bu analiz sonucunda kurumun karşı karşıya olduğu gerçek tehditler ve risk seviyesi anlaşılır. Raporlama ve paylaşım da değerli adımlardır, ancak doğru ve derinlemesine analiz olmadan bu adımların etkinliği sınırlı kalır. Etkili bir CTI programı, ham verileri kuruma özgü, eylem alınabilir istihbarata dönüştürebilmelidir.',
                },
              },
            ],
          },
          {
            'title': 'Tehdit Kaynakları',
            'duration': '20 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Tehdit Kaynakları ve Türleri'},
                  {
                    'type': 'desc',
                    'text':
                        'Siber tehditler farklı kaynaklardan ve türlerden gelebilir.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Kaynaklar: İç tehditler, dış tehditler, organize suç grupları.',
                  },
                  {
                    'type': 'bullet',
                    'text': 'Türler: Zararlı yazılım, oltalama, APT, DDoS.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Bir çalışan (iç tehdit) veya bir hacker grubu (dış tehdit) saldırı başlatabilir.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Tehdit istihbaratında, aşağıdaki tehdit kaynaklarından hangisi genellikle en yüksek teknik yeteneğe ve en fazla kaynağa sahiptir?',
                  'options': [
                    'Organize suç grupları',
                    'Devlet destekli tehdit aktörleri (APT grupları)',
                    'Hacktivistler',
                    'İç tehditler (kötü niyetli çalışanlar)',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Devlet destekli tehdit aktörleri (Advanced Persistent Threat - APT grupları), genellikle en yüksek teknik yeteneğe ve en fazla kaynağa sahip tehdit kaynaklarıdır. Bu gruplar, devletler tarafından finanse edilir ve desteklenir, bu da onlara sofistike saldırı araçları geliştirmek, sıfır gün açıklarını keşfetmek ve uzun süreli, hedefli operasyonlar yürütmek için gereken kaynakları sağlar. APT grupları genellikle stratejik, politik veya ekonomik avantaj elde etmek için kritik altyapı, savunma, enerji, finans ve teknoloji sektörlerini hedef alır. Organize suç grupları da önemli kaynaklara sahip olabilir ancak genellikle finansal kazanç odaklıdır. Hacktivistler ideolojik motivasyonla hareket eder ve kaynakları sınırlıdır. İç tehditler ise genellikle sınırlı erişime sahiptir ve sofistike saldırı araçları kullanma yetenekleri daha düşüktür.',
                },
              },
            ],
          },
          {
            'title': 'OSINT',
            'duration': '22 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Açık Kaynak İstihbaratı (OSINT)'},
                  {
                    'type': 'desc',
                    'text':
                        'OSINT, herkese açık kaynaklardan (web, sosyal medya, forumlar) bilgi toplama sürecidir.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Kaynaklar: Web siteleri, sosyal medya, haberler, veri tabanları.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Bir saldırgan, sosyal medyada paylaşılan bilgilerden kurumun zayıf noktalarını tespit edebilir.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'OSINT (Açık Kaynak İstihbaratı) araştırması yaparken aşağıdaki kaynaklardan hangisi genellikle en az güvenilir bilgiyi sağlar?',
                  'options': [
                    'Resmi şirket belgeleri ve yıllık raporlar',
                    'Sosyal medya platformlarındaki kişisel paylaşımlar',
                    'Akademik makaleler ve araştırma yayınları',
                    'Devlet kurumlarının veri tabanları',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'OSINT (Açık Kaynak İstihbaratı) araştırmalarında, sosyal medya platformlarındaki kişisel paylaşımlar genellikle en az güvenilir bilgi kaynağıdır. Bu paylaşımlar doğrulanmamış, öznel, yanıltıcı veya kasıtlı olarak yanlış bilgiler içerebilir. Kullanıcılar genellikle kişisel görüşlerini, duyduklarını veya eksik bilgilerini paylaşabilir. Ayrıca, sosyal medya hesapları sahte olabilir veya manipüle edilmiş içerik sunabilir. Resmi şirket belgeleri, akademik makaleler ve devlet veri tabanları ise genellikle daha sıkı doğrulama süreçlerinden geçer ve daha güvenilir bilgiler sunar. OSINT analistleri, sosyal medyadan elde edilen bilgileri her zaman başka kaynaklarla doğrulamalı ve güvenilirliğini değerlendirmelidir.',
                },
              },
            ],
          },
          {
            'title': 'Analiz & Raporlama',
            'duration': '20 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'İstihbarat Analizi ve Raporlama'},
                  {
                    'type': 'desc',
                    'text':
                        'Toplanan tehdit verilerinin analiz edilip anlamlı raporlar haline getirilmesi gerekir.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Analiz: Verilerin ilişkilendirilmesi ve önceliklendirilmesi.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Raporlama: Karar vericilere anlaşılır şekilde sunmak.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Bir saldırı trendi tespit edilip yönetime raporlanır.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Tehdit istihbaratı analizinde aşağıdaki yaklaşımlardan hangisi en etkili raporlama stratejisidir?',
                  'options': [
                    'Tüm ham verileri detaylı olarak raporlamak',
                    'Sadece teknik göstergeleri (IoC) listelemek',
                    'Tehdit aktörlerinin motivasyonlarını tahmin etmek',
                    'Teknik bulguları iş etkisi ve eylem önerileriyle ilişkilendirmek',
                  ],
                  'correctIndex': 3,
                  'explanation':
                      'Tehdit istihbaratı analizinde en etkili raporlama stratejisi, teknik bulguları iş etkisi ve eylem önerileriyle ilişkilendirmektir. Bu yaklaşım, teknik verileri organizasyon için anlamlı bilgilere dönüştürür ve karar vericilerin somut adımlar atmasını sağlar. Sadece ham verileri raporlamak, alıcıları bilgi bombardımanına tutarak önemli noktaların gözden kaçmasına neden olabilir. Yalnızca teknik göstergeleri (IoC) listelemek, bağlamı ve etkiyi açıklamadan teknik detaylar sunduğu için yetersizdir. Tehdit aktörlerinin motivasyonlarını tahmin etmek ise spekülatif olabilir ve somut eylem önerileri sunmayabilir. Etkili bir tehdit istihbaratı raporu, "ne oldu, neden önemli, ve ne yapmalıyız" sorularını yanıtlamalıdır.',
                },
              },
            ],
          },
          {
            'title': 'CTI Otomasyon',
            'duration': '18 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Tehdit İstihbaratında Otomasyon'},
                  {
                    'type': 'desc',
                    'text':
                        'Otomasyon, tehdit verilerinin hızlı ve etkili şekilde toplanmasını ve analiz edilmesini sağlar.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Araçlar: SIEM, SOAR, otomatik analiz platformları.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: SIEM sistemi ile anlık tehdit tespiti ve otomatik aksiyon.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Tehdit istihbaratı otomasyonunda aşağıdaki teknolojilerden hangisi, tehdit verilerini toplamak, analiz etmek ve yanıt vermek için en kapsamlı entegrasyon sağlar?',
                  'options': [
                    'Firewall (Güvenlik Duvarı)',
                    'IDS/IPS (Saldırı Tespit/Önleme Sistemleri)',
                    'SIEM (Güvenlik Bilgi ve Olay Yönetimi)',
                    'SOAR (Güvenlik Orkestrasyon, Otomasyon ve Yanıt)',
                  ],
                  'correctIndex': 3,
                  'explanation':
                      'SOAR (Security Orchestration, Automation and Response - Güvenlik Orkestrasyon, Otomasyon ve Yanıt) platformları, tehdit istihbaratı otomasyonunda en kapsamlı entegrasyon sağlayan teknolojilerdir. SOAR, SIEM sistemlerinin bir adım ötesine geçerek, tehdit verilerini toplamak, analiz etmek ve yanıt vermek için çeşitli güvenlik araçlarını ve süreçlerini otomatikleştirir ve orkestre eder. SOAR platformları, playbook\'lar (iş akışları) aracılığıyla tekrarlayan güvenlik görevlerini otomatikleştirir, farklı güvenlik araçları arasında entegrasyon sağlar ve analiz süreçlerini hızlandırır. Firewall ve IDS/IPS sistemleri, tehdit tespiti ve önleme için önemli olmakla birlikte, kapsamlı otomasyon ve orkestrasyon yetenekleri sunmazlar. SIEM sistemleri ise olay korelasyonu ve analizi için güçlü olmakla birlikte, SOAR\'ın sağladığı otomatik yanıt ve orkestrasyon yeteneklerine sahip değildir.',
                },
              },
            ],
          },
          {
            'title': 'Tehdit İstihbaratı Yaşam Döngüsü',
            'duration': '20 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Tehdit İstihbaratı Yaşam Döngüsü'},
                  {
                    'type': 'desc',
                    'text':
                        'Tehdit istihbaratı yaşam döngüsü, bilgi toplama, analiz, yayma ve geri bildirim aşamalarını içerir.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Aşamalar: Yönlendirme, toplama, işleme, analiz, yayma, geri bildirim.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Bir kurum, tehdit verilerini toplar, analiz eder ve ilgili ekiplere raporlar.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Tehdit istihbaratı yaşam döngüsünde, aşağıdaki aşamalardan hangisi en kritik geri bildirim mekanizmasını sağlar?',
                  'options': [
                    'Yönlendirme (Direction)',
                    'Toplama (Collection)',
                    'İşleme (Processing)',
                    'Değerlendirme (Evaluation)',
                  ],
                  'correctIndex': 3,
                  'explanation':
                      'Tehdit istihbaratı yaşam döngüsünde, Değerlendirme (Evaluation) aşaması en kritik geri bildirim mekanizmasını sağlar. Bu aşama, üretilen istihbaratın etkinliğini, doğruluğunu ve organizasyona sağladığı değeri ölçer. Değerlendirme süreci, istihbarat ürünlerinin kalitesini, zamanlamasını ve kullanışlılığını analiz eder ve gelecekteki istihbarat çalışmalarını iyileştirmek için geri bildirim sağlar. Bu geri bildirim, bir sonraki istihbarat döngüsünün Yönlendirme aşamasını besler ve böylece sürekli iyileştirme sağlanır. Yönlendirme aşaması gereksinimleri belirler, Toplama aşaması ham verileri toplar, İşleme aşaması ise ham verileri anlamlı bilgilere dönüştürür. Ancak bu aşamaların hiçbiri, Değerlendirme aşaması kadar kapsamlı bir geri bildirim mekanizması sağlamaz.',
                },
              },
            ],
          },
          {
            'title': 'Taktik, Teknik ve Prosedürler (TTPs)',
            'duration': '18 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {
                    'type': 'title',
                    'text': 'Taktik, Teknik ve Prosedürler (TTPs)',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'TTPs, saldırganların kullandığı yöntemlerin sınıflandırılmasıdır.',
                  },
                  {'type': 'bullet', 'text': 'Taktik: Saldırının genel amacı.'},
                  {
                    'type': 'bullet',
                    'text': 'Teknik: Amaca ulaşmak için kullanılan yöntem.',
                  },
                  {
                    'type': 'bullet',
                    'text': 'Prosedür: Tekniklerin uygulanış şekli.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Kimlik avı saldırısı (taktik), zararlı e-posta gönderme (teknik), belirli bir e-posta şablonu kullanmak (prosedür).',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'MITRE ATT&CK çerçevesinde, aşağıdakilerden hangisi bir saldırı taktiği değil, bir tekniktir?',
                  'options': [
                    'Keşif (Reconnaissance)',
                    'Başlangıç Erişimi (Initial Access)',
                    'Kimlik Bilgisi Dumplamak (Credential Dumping)',
                    'Komuta ve Kontrol (Command and Control)',
                  ],
                  'correctIndex': 2,
                  'explanation':
                      'MITRE ATT&CK çerçevesinde, "Kimlik Bilgisi Dumplamak" (Credential Dumping) bir tekniktir, diğer seçenekler ise taktiklerdir. MITRE ATT&CK çerçevesinde taktikler, saldırganların genel hedeflerini temsil eder ("ne" yapmak istediklerini), teknikler ise bu hedeflere ulaşmak için kullandıkları spesifik yöntemleri ("nasıl" yaptıklarını) ifade eder. Keşif (Reconnaissance), Başlangıç Erişimi (Initial Access) ve Komuta ve Kontrol (Command and Control), saldırganların geniş hedeflerini temsil eden taktiklerdir. Kimlik Bilgisi Dumplamak ise, saldırganların sistemden parola hash\'lerini veya düz metin parolaları çıkarmak için kullandıkları spesifik bir tekniktir ve "Yetki Yükseltme" veya "Yanal Hareket" taktikleri altında sınıflandırılır.',
                },
              },
            ],
          },
          {
            'title': 'Indicator of Compromise (IoC) Analizi',
            'duration': '22 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {
                    'type': 'title',
                    'text': 'Indicator of Compromise (IoC) Analizi',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'IoC, bir sistemde güvenlik ihlali olduğunu gösteren izlerdir.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Örnekler: Kötü amaçlı dosya hashleri, şüpheli IP adresleri, zararlı alan adları.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Bir saldırı sonrası sistemde tespit edilen zararlı yazılım hash değeri.',
                  },
                ],
                'quizQuestion': {
                  'question':
                      'Aşağıdakilerden hangisi bir sistemde güvenlik ihlali olduğunu gösteren en güvenilir IoC (Indicator of Compromise) türüdür?',
                  'options': [
                    'Yüksek CPU kullanımı',
                    'Kötü amaçlı yazılım dosya hash değerleri',
                    'Yavaş internet bağlantısı',
                    'Sık sistem yeniden başlatmaları',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Kötü amaçlı yazılım dosya hash değerleri (örneğin MD5, SHA-1, SHA-256), bir sistemde güvenlik ihlali olduğunu gösteren en güvenilir IoC (Indicator of Compromise) türüdür. Hash değerleri, dosyaların benzersiz dijital parmak izleridir ve belirli bir kötü amaçlı yazılımı kesin olarak tanımlar. Bu değerler, bilinen zararlı yazılımların veritabanlarıyla karşılaştırılabilir ve yanlış pozitif sonuç verme olasılığı çok düşüktür. Yüksek CPU kullanımı, yavaş internet bağlantısı ve sık sistem yeniden başlatmaları, güvenlik ihlallerinin olası belirtileri olabilir, ancak bunlar aynı zamanda kötü amaçlı olmayan sorunlardan da kaynaklanabilir (örneğin, sistem kaynağı yetersizliği, ağ sorunları veya yazılım hataları). Bu nedenle, bu belirtiler tek başına güvenilir IoC\'lar olarak kabul edilmez. Diğer güvenilir IoC türleri arasında C2 (Command and Control) sunucu IP adresleri/domain\'leri, kötü amaçlı yazılım imzaları ve anormal ağ trafiği desenleri bulunur.',
                },
              },
            ],
          },
          {
            'title': 'MITRE ATT&CK Framework Kullanımı',
            'duration': '20 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'MITRE ATT&CK Framework Kullanımı'},
                  {
                    'type': 'desc',
                    'text':
                        'MITRE ATT&CK, saldırgan davranışlarını ve tekniklerini sınıflandıran bir bilgi tabanıdır.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Kullanım: Saldırı analizinde ve savunma stratejisi geliştirmede kullanılır.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Bir saldırının hangi tekniklerle yapıldığını ATT&CK matrisiyle analiz etmek.',
                  },
                ],
                'classicQuestion':
                    'MITRE ATT&CK çerçevesinde, bir saldırganın hedef sistemde kalıcılık (persistence) sağlamak için kullanabileceği teknikler nelerdir?',
                'classicAnswer': [
                  'başlangıç',
                  'kayıt defteri',
                  'zamanlanmış görev',
                  'servis',
                  'arka kapı',
                  'rootkit',
                  'bootkit',
                  'cron',
                ],
                'classicHint':
                    'Saldırganlar genellikle sistem yeniden başlatıldığında bile erişimi kaybetmemek için çeşitli yöntemler kullanır.',
              },
            ],
          },
          {
            'title': 'Tehdit Paylaşım Platformları',
            'duration': '18 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Tehdit Paylaşım Platformları'},
                  {
                    'type': 'desc',
                    'text':
                        'Tehdit paylaşım platformları, kurumların tehdit verilerini güvenli şekilde paylaşmasını sağlar.',
                  },
                  {
                    'type': 'bullet',
                    'text': 'ISAC: Sektörel tehdit paylaşım merkezleri.',
                  },
                  {
                    'type': 'bullet',
                    'text': 'MISP: Açık kaynak tehdit istihbaratı platformu.',
                  },
                  {
                    'type': 'bullet',
                    'text': 'STIX/TAXII: Tehdit verisi paylaşım standartları.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Bir banka, ISAC üzerinden diğer bankalarla tehdit verisi paylaşır.',
                  },
                ],
                'classicQuestion':
                    'Tehdit istihbaratı paylaşımında STIX ve TAXII standartlarının kullanılmasının en önemli avantajları nelerdir?',
                'classicAnswer': [
                  'standart',
                  'format',
                  'otomatik',
                  'entegrasyon',
                  'yapılandırılmış',
                  'makine',
                  'işlenebilir',
                  'otomasyon',
                ],
                'classicHint':
                    'STIX (Structured Threat Information eXpression) ve TAXII (Trusted Automated eXchange of Indicator Information), tehdit istihbaratı paylaşımını standartlaştıran ve otomatikleştiren teknolojilerdir. Bu standartlar, tehdit verilerinin yapılandırılmış bir formatta paylaşılmasını ve farklı sistemler arasında makine tarafından işlenebilir olmasını sağlar.',
              },
            ],
          },
          {
            'title': 'Sosyal Mühendislik',
            'duration': '20 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {
                    'type': 'title',
                    'text': 'Sosyal Mühendislik ve İnsan Faktörü',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Sosyal mühendislik, insanları manipüle ederek bilgi elde etme yöntemidir.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Yöntemler: Oltalama, sahte çağrı, fiziksel erişim.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Bir saldırganın kendini IT çalışanı gibi tanıtıp şifre istemesi.',
                  },
                ],
                'classicQuestion':
                    'Sosyal mühendislik saldırılarına karşı bir organizasyonda hangi savunma katmanları uygulanmalıdır?',
                'classicAnswer': [
                  'eğitim',
                  'farkındalık',
                  'politika',
                  'prosedür',
                  'simülasyon',
                  'test',
                  'raporlama',
                  'teknoloji',
                ],
                'classicHint':
                    'Sosyal mühendislik saldırılarına karşı etkili savunma, çok katmanlı bir yaklaşım gerektirir. Çalışan eğitimi ve farkındalık programları, güvenlik politikaları ve prosedürleri, düzenli phishing simülasyonları ve testleri, şüpheli olayların raporlanması için mekanizmalar ve teknik kontroller (e-posta filtreleme, çok faktörlü kimlik doğrulama) gibi önlemler bir arada kullanılmalıdır.',
              },
            ],
          },
          {
            'title': 'Dark Web İstihbaratı',
            'duration': '22 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {
                    'type': 'title',
                    'text': 'Dark Web ve Kapalı Kaynaklardan İstihbarat',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Dark web ve kapalı forumlar, siber tehditlerin planlandığı ve paylaşıldığı ortamlardır.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Kaynaklar: Dark web siteleri, kapalı forumlar, özel gruplar.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Bir saldırı planının dark web forumunda paylaşılması.',
                  },
                ],
                'classicQuestion':
                    'Dark web üzerinden tehdit istihbaratı toplarken hangi güvenlik önlemleri alınmalıdır?',
                'classicAnswer': [
                  'anonimlik',
                  'izolasyon',
                  'sanal',
                  'tor',
                  'vpn',
                  'sandbox',
                  'kimlik',
                  'yetkilendirme',
                ],
                'classicHint':
                    'Dark web üzerinden tehdit istihbaratı toplarken, araştırmacının kendi kimliğini ve organizasyonunu korumak için anonimlik araçları (Tor, VPN) kullanması, izole edilmiş sanal ortamlar (sandbox) içinde çalışması ve erişim yetkilerinin sıkı kontrolü gibi önlemler alınmalıdır. Bu, hem araştırmacıyı hem de organizasyonu potansiyel karşı saldırılardan korur.',
              },
            ],
          },
          {
            'title': 'Threat Hunting',
            'duration': '20 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Tehdit Avcılığı (Threat Hunting)'},
                  {
                    'type': 'desc',
                    'text':
                        'Tehdit avcılığı, aktif olarak ağda gizli tehditleri arama sürecidir.',
                  },
                  {
                    'type': 'bullet',
                    'text': 'Yöntemler: Davranış analizi, anomali tespiti.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Güvenlik ekibinin şüpheli aktiviteleri manuel olarak incelemesi.',
                  },
                ],
                'classicQuestion':
                    'Tehdit avcılığı (Threat Hunting) sürecinde, bir güvenlik analistinin proaktif olarak araması gereken anormal davranış belirtileri nelerdir?',
                'classicAnswer': [
                  'anormal',
                  'trafik',
                  'yetki',
                  'yükseltme',
                  'yanal',
                  'hareket',
                  'veri',
                  'sızıntı',
                ],
                'classicHint':
                    'Tehdit avcılığında, analistler normal sistem davranışından sapmaları aramalıdır. Bunlar arasında anormal ağ trafiği (beklenmeyen saatlerde veya hedeflere), yetkisiz yetki yükseltme girişimleri, sistemler arası şüpheli yanal hareket ve olağandışı veri transferleri gibi belirtiler yer alır.',
              },
            ],
          },
          {
            'title': 'CTI & AI',
            'duration': '18 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {
                    'type': 'title',
                    'text': 'Tehdit İstihbaratında Yapay Zeka ve Otomasyon',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Yapay zeka, büyük veri setlerinde tehditleri tespit etmek ve otomatik analiz yapmak için kullanılır.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Kullanım: Anomali tespiti, otomatik sınıflandırma, hızlı analiz.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Makine öğrenimi ile zararlı yazılım tespiti.',
                  },
                ],
                'classicQuestion':
                    'Yapay zeka ve makine öğrenimi teknolojileri, tehdit istihbaratı süreçlerinde hangi alanlarda en etkili şekilde kullanılabilir?',
                'classicAnswer': [
                  'anomali',
                  'tespit',
                  'sınıflandırma',
                  'tahmin',
                  'otomasyon',
                  'analiz',
                  'korelasyon',
                  'örüntü',
                ],
                'classicHint':
                    'Yapay zeka ve makine öğrenimi, tehdit istihbaratında özellikle büyük veri setlerindeki anomali tespiti, tehdit sınıflandırması, gelecekteki saldırıları tahmin etme, tekrarlayan görevlerin otomasyonu, karmaşık veri analizi, farklı kaynaklardan gelen verilerin korelasyonu ve insan gözünün kaçırabileceği karmaşık örüntülerin tespiti gibi alanlarda etkilidir.',
              },
            ],
          },
          {
            'title': 'Vaka & Örnekler',
            'duration': '25 dk',
            'steps': [
              {
                'type': 'info',
                'content': [
                  {'type': 'title', 'text': 'Vaka & Örnekler'},
                  {
                    'type': 'desc',
                    'text':
                        'Gerçekleşmiş siber saldırıların ve savunma stratejilerinin incelenmesi, pratik bilgi sağlar.',
                  },
                  {
                    'type': 'bullet',
                    'text':
                        'Örnekler: WannaCry, SolarWinds, NotPetya saldırıları.',
                  },
                  {
                    'type': 'desc',
                    'text':
                        'Örnek: Bir kurumun APT saldırısına karşı aldığı önlemler.',
                  },
                ],
                'classicQuestion':
                    'Bir e-postada "Hesabınız hacklendi, şifrenizi değiştirmek için bu bağlantıya tıklayın" yazıyorsa, bu e-postanın sahte olduğunu gösteren en belirgin teknik işaret nedir?',
                'classicAnswer': [
                  'URL',
                  'bağlantı',
                  'alan adı',
                  'farklı',
                  'gizli',
                  'yönlendirme',
                  'hover',
                  'üzerine gelme',
                ],
                'classicHint':
                    'Phishing e-postalarında en belirgin teknik işaret, görünen bağlantı metni ile gerçek hedef URL arasındaki farklılıktır. Fare imlecini bağlantının üzerine getirdiğinizde (hover) tarayıcının alt kısmında veya bir araç ipucunda görünen gerçek URL, genellikle e-postada iddia edilen kurumun resmi alan adından farklıdır. Örneğin, bağlantı "bankaniz.com" gibi görünebilir, ancak gerçek URL "bankaniz-guvenlik.xyz" veya tamamen ilgisiz bir alan adı olabilir. Bu tür gizli yönlendirmeler, kimlik avı saldırılarının en yaygın teknik göstergelerindendir.',
              },
            ],
          },
        ],
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0B132B),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _HomeHeader(),
              const SizedBox(height: 32),

              const _ProgressSection(),
              const SizedBox(height: 32),

              const Text(
                "Eğitim Modülleri",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 16),

              ...List.generate(modules.length, (index) {
                final module = modules[index];
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == modules.length - 1 ? 0 : 16,
                  ),
                  child: _ModuleCard(
                    title: module['title'] as String,
                    subtitle: module['subtitle'] as String,
                    icon: module['icon'] as IconData,
                    lessonCount: (module['lessons'] as List).length,
                    lessons: (module['lessons'] as List)
                        .cast<Map<String, dynamic>>(),
                    onTap: () =>
                        context.push(AppRoutes.moduleDetail, extra: module),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return const SizedBox();

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.school,
                    color: Color(0xFFBB86FC),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hoş geldin!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Her gün bir adım daha ileri!",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        final data = snapshot.data!.data() as Map<String, dynamic>?;
        final String userName = data?['displayName'] ?? 'Siber Öğrenci';

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.school,
                  color: Color(0xFFBB86FC),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hoş geldin, $userName!",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Her gün bir adım daha ileri!",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ProgressSection extends StatelessWidget {
  const _ProgressSection();

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return const SizedBox();

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFBB86FC),
              strokeWidth: 2.5,
            ),
          );
        }

        final data = snapshot.data!.data() as Map<String, dynamic>?;

        final int score = data?['score'] ?? 0;

        final int maxScore = 475;
        final double progress = maxScore > 0
            ? (score / maxScore).clamp(0.0, 1.0)
            : 0.0;

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.trending_up,
                    color: Color(0xFFBB86FC),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Genel İlerlemen - $score Puan",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 12,
                  backgroundColor: Colors.grey[900],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xFFBB86FC),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ModuleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final int lessonCount;
  final VoidCallback onTap;
  final List<Map<String, dynamic>> lessons;

  const _ModuleCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.lessonCount,
    required this.onTap,
    required this.lessons,
  });

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return const SizedBox();

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('progress')
          .doc(user.uid)
          .collection('lessons')
          .snapshots(),
      builder: (context, snapshot) {
        int completedCount = 0;
        int startedCount = 0;
        if (snapshot.hasData) {
          final docs = snapshot.data!.docs;
          for (final lesson in lessons) {
            final docList = docs.where((d) => d.id == lesson['title']);
            if (docList.isNotEmpty) {
              final doc = docList.first;
              final data = doc.data() as Map<String, dynamic>;
              final isCompleted = data['isCompleted'] ?? false;
              final completedSteps = data['completedSteps'] ?? 0;
              if (isCompleted || completedSteps > 0) {
                completedCount++;
              } else if (completedSteps > 0) {
                startedCount++;
              }
            }
          }
        }
        final totalProgress = completedCount + startedCount;

        final isFullyCompleted =
            completedCount == lessonCount && lessonCount > 0;
        final isPartiallyCompleted =
            totalProgress > 0 && completedCount < lessonCount;
        final isStarted = startedCount > 0;

        return GestureDetector(
          onTap: onTap,
          child: Container(
            height: 150,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isFullyCompleted
                    ? Colors.green.withValues(alpha: 0.5)
                    : isPartiallyCompleted
                    ? Colors.orange.withValues(alpha: 0.5)
                    : isStarted
                    ? Colors.yellow.withValues(alpha: 0.5)
                    : const Color(0xFFBB86FC).withValues(alpha: 0.3),
                width: isFullyCompleted || isPartiallyCompleted || isStarted
                    ? 2
                    : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: const Color(0xFFBB86FC), size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Tooltip(
                        message: title,
                        preferBelow: false,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C2541),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(
                              0xFFBB86FC,
                            ).withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Tooltip(
                        message: subtitle,
                        preferBelow: false,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C2541),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(
                              0xFFBB86FC,
                            ).withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        textStyle: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        child: Text(
                          subtitle,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.3,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFFBB86FC,
                              ).withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              "$lessonCount Ders",
                              style: const TextStyle(
                                color: Color(0xFFBB86FC),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          if (isFullyCompleted ||
                              isPartiallyCompleted ||
                              isStarted) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: isFullyCompleted
                                    ? Colors.green.withValues(alpha: 0.2)
                                    : isPartiallyCompleted
                                    ? Colors.orange.withValues(alpha: 0.2)
                                    : Colors.yellow.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                isFullyCompleted
                                    ? "Tamamlandı"
                                    : isPartiallyCompleted
                                    ? "$completedCount/$lessonCount"
                                    : "Başlandı",
                                style: TextStyle(
                                  color: isFullyCompleted
                                      ? Colors.green
                                      : isPartiallyCompleted
                                      ? Colors.orange
                                      : Colors.yellow,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isFullyCompleted ||
                            isPartiallyCompleted ||
                            isStarted)
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: isFullyCompleted
                                  ? Colors.green.withValues(alpha: 0.2)
                                  : isPartiallyCompleted
                                  ? Colors.orange.withValues(alpha: 0.2)
                                  : Colors.yellow.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                              isFullyCompleted
                                  ? Icons.check_circle
                                  : isPartiallyCompleted
                                  ? Icons.pending
                                  : Icons.play_circle,
                              size: 16,
                              color: isFullyCompleted
                                  ? Colors.green
                                  : isPartiallyCompleted
                                  ? Colors.orange
                                  : Colors.yellow,
                            ),
                          ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFFBB86FC,
                            ).withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFBB86FC),
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
