import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:threat_lens/app/router.dart';
import 'package:threat_lens/services/progress_service.dart';

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
                    'Sistemin her zaman çalışır durumda olması',
                    'Bilgilerin yetkisiz kişilerden korunması',
                    'Verilerin doğruluğunun korunması',
                    'Sistemin hızlı çalışması',
                  ],
                  'correctIndex': 1,
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
                    'Hemen tıkla ve hesabını kontrol et',
                    'E-postayı sil ve bağlantıya tıklama',
                    'E-postayı arkadaşlarına gönder',
                    'E-postayı aç ama bağlantıya tıklama',
                  ],
                  'correctIndex': 1,
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
                      'Şifren "123456" ise neden değiştirmelisin? (En önemli sebep nedir?)',
                  'options': [
                    'Çünkü çok uzun',
                    'Çünkü çok yaygın ve kolay tahmin edilebilir',
                    'Çünkü çok kısa',
                    'Çünkü çok karmaşık',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Çok yaygın ve kolay tahmin edilebilir şifreler güvenlik riski oluşturur.',
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
                      'Kurumsal siber güvenlikte neden yedekleme önemlidir?',
                  'options': [
                    'Sadece maliyet tasarrufu için',
                    'Veri kaybı riskine karşı koruma ve iş sürekliliği için',
                    'Sadece yasal zorunluluk için',
                    'Sadece performans artışı için',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Veri kaybı riskine karşı alınan önlem ve iş sürekliliği sağlar.',
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
                  'question': 'Penetrasyon testi nedir?',
                  'options': [
                    'Sadece otomatik güvenlik taraması',
                    'Bir saldırgan gibi davranarak sistemdeki açıkları bulmaya yönelik testler',
                    'Sadece performans testi',
                    'Sadece kullanılabilirlik testi',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Penetrasyon testi, bir saldırgan gibi davranarak sistemdeki güvenlik açıklarını bulmaya yönelik kontrollü testlerdir.',
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
                      'Kafede ücretsiz Wi-Fi kullanırken banka uygulaması açmak güvenli mi? (Neden?)',
                  'options': [
                    'Evet, tamamen güvenli',
                    'Hayır, verileriniz başkaları tarafından izlenebilir',
                    'Evet, sadece kısa süreli kullanımda',
                    'Hayır, sadece yavaş olur',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Ortak Wi-Fi ağlarında verileriniz başkaları tarafından izlenebilir.',
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
                  'question': 'Firewall\'ın temel görevi nedir?',
                  'options': [
                    'Sadece internet hızını artırmak',
                    'Ağ trafiğini kontrol ederek zararlı bağlantıları engellemek',
                    'Sadece dosyaları şifrelemek',
                    'Sadece yedekleme yapmak',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Firewall, ağ trafiğini kontrol ederek zararlı bağlantıları engelleyen bir güvenlik sistemidir.',
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
                  'question': 'VPN teknolojisi ne sağlar?',
                  'options': [
                    'Sadece internet hızını artırır',
                    'Güvenli, şifreli ve anonim erişim sağlar',
                    'Sadece dosya paylaşımını kolaylaştırır',
                    'Sadece oyun performansını artırır',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Veriler şifrelenir, kimlik gizlenir, güvenli erişim sağlanır.',
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
                      'Kablosuz ağlarda güvenlik için hangi şifreleme kullanılmalı?',
                  'options': [
                    'WEP (eski standart)',
                    'WPA2 veya WPA3 ile AES şifreleme',
                    'Açık ağ (şifresiz)',
                    'Sadece WPA (eski)',
                  ],
                  'correctIndex': 1,
                  'explanation': 'WPA2 veya WPA3 ile AES şifreleme kullanın.',
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
                  'question': 'IDS (Intrusion Detection System) ne işe yarar?',
                  'options': [
                    'Sadece ağ hızını artırır',
                    'Ağdaki saldırı girişimlerini tespit eder ve alarm verir',
                    'Sadece dosyaları şifreler',
                    'Sadece yedekleme yapar',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'IDS, ağdaki saldırı girişimlerini tespit eder ve güvenlik ekibine alarm verir.',
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
                      'WhatsApp mesajların neden "end-to-end şifreli" yazıyor? (Bu ne anlama geliyor?)',
                  'options': [
                    'Sadece WhatsApp şirketi okuyabilir',
                    'Mesajlar sadece gönderen ve alıcı tarafından okunabilir',
                    'Sadece internet sağlayıcısı görebilir',
                    'Sadece hükümet görebilir',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Mesajlar sadece gönderen ve alıcı tarafından okunabilir, başka kimse göremez.',
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
                  'question': 'Simetrik şifrelemede kaç anahtar kullanılır?',
                  'options': [
                    'İki farklı anahtar (açık ve özel)',
                    'Tek anahtar (hem şifreleme hem çözme için)',
                    'Üç farklı anahtar',
                    'Hiç anahtar kullanılmaz',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Simetrik şifrelemede aynı anahtar hem şifreleme hem de çözme işlemi için kullanılır.',
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
                  'question': 'Asimetrik şifrelemede kaç anahtar kullanılır?',
                  'options': [
                    'Tek anahtar',
                    'İki farklı anahtar (açık ve özel)',
                    'Üç farklı anahtar',
                    'Hiç anahtar kullanılmaz',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Asimetrik şifrelemede açık ve özel anahtar olmak üzere iki farklı anahtar kullanılır.',
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
                  'question': 'Dijital imza ne işe yarar?',
                  'options': [
                    'Sadece dosyayı şifreler',
                    'Verinin bütünlüğünü ve kaynağını doğrulamak',
                    'Sadece dosyayı sıkıştırır',
                    'Sadece dosyayı yedekler',
                  ],
                  'correctIndex': 1,
                  'explanation': 'Verinin bütünlüğünü ve kaynağını doğrulamak.',
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
                  'question': 'Penetrasyon testi nedir?',
                  'options': [
                    'Sadece güvenlik taraması',
                    'Bir saldırgan gibi sistemdeki açıkları bulmaya çalışmak',
                    'Sadece performans testi',
                    'Sadece kullanılabilirlik testi',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Bir saldırgan gibi sistemdeki açıkları bulmaya çalışmak.',
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
                  'question': 'Reconnaissance nedir?',
                  'options': [
                    'Sadece saldırı yapmak',
                    'Hedef hakkında bilgi toplama',
                    'Sadece raporlama yapmak',
                    'Sadece temizlik yapmak',
                  ],
                  'correctIndex': 1,
                  'explanation': 'Hedef hakkında bilgi toplama.',
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
                  'question': 'Vulnerability assessment nedir?',
                  'options': [
                    'Sadece performans testi',
                    'Güvenlik açıklarını tespit etmek',
                    'Sadece kullanılabilirlik testi',
                    'Sadece maliyet analizi',
                  ],
                  'correctIndex': 1,
                  'explanation': 'Güvenlik açıklarını tespit etmek.',
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
                  'question': 'Exploitation nedir?',
                  'options': [
                    'Sadece raporlama yapmak',
                    'Açıkları kullanarak sisteme sızmak',
                    'Sadece bilgi toplamak',
                    'Sadece temizlik yapmak',
                  ],
                  'correctIndex': 1,
                  'explanation': 'Açıkları kullanarak sisteme sızmak.',
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
                      'Bilgisayarında "Windows güvenlik güncellemesi" pop-up\'ı çıkıyorsa ne yapmalısın? (En güvenli davranış nedir?)',
                  'options': [
                    'Hemen tıkla ve güncelle',
                    'Pop-up\'ı kapat ve Windows ayarlarından kontrol et',
                    'E-postayı arkadaşlarına gönder',
                    'Pop-up\'ı aç ama güncelleme yapma',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Sahte güncelleme pop-up\'ları zararlı yazılım bulaştırmak için kullanılır.',
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
                      'Bir e-postada "Kazandınız! Hemen tıklayın" yazıyorsa ne yapmalısın? (En güvenli davranış nedir?)',
                  'options': [
                    'Hemen tıkla ve ödülünü al',
                    'E-postayı sil ve bağlantıya tıklama',
                    'E-postayı arkadaşlarına gönder',
                    'E-postayı aç ama bağlantıya tıklama',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Beklenmedik kazanç vaatleri genellikle aldatma amaçlıdır.',
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
                      'Bilgisayarında "Sisteminizde 15 virüs bulundu" uyarısı çıkıyorsa ne yapmalısın? (En güvenli davranış nedir?)',
                  'options': [
                    'Hemen tıkla ve virüsleri temizle',
                    'Pop-up\'ı kapat ve gerçek antivirüs yazılımını kullan',
                    'E-postayı arkadaşlarına gönder',
                    'Pop-up\'ı aç ama temizleme yapma',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Gerçek antivirüs yazılımları böyle pop-up\'lar göstermez.',
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
                      'Telefonunda "Android güvenlik uyarısı" bildirimi geliyorsa ne yapmalısın? (En güvenli davranış nedir?)',
                  'options': [
                    'Hemen tıkla ve güvenlik kontrolü yap',
                    'Bildirimi kapat ve Google Play Store\'dan kontrol et',
                    'Bildirimi arkadaşlarına gönder',
                    'Bildirimi aç ama kontrol yapma',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Gerçek Android güvenlik uyarıları Google Play Store\'dan gelir.',
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
                      'Bir web sitesinde "Bu site güvenli değil" uyarısı görüyorsan ne yapmalısın? (En güvenli davranış nedir?)',
                  'options': [
                    'Hemen giriş yap ve işlemini tamamla',
                    'Siteye girmemek ve kişisel bilgi girmemek',
                    'Siteye giriş yap ama şifre girme',
                    'Siteye giriş yap ve arkadaşlarına öner',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Güvenli olmayan sitelerde kişisel bilgi girmemek gerekir.',
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
                      'Bir e-postada "Hesabınız kilitlendi, hemen açın" yazıyorsa ne yapmalısın? (En güvenli davranış nedir?)',
                  'options': [
                    'Hemen tıkla ve hesabını aç',
                    'E-postayı sil ve uygulama içinden kontrol et',
                    'E-postayı arkadaşlarına gönder',
                    'E-postayı aç ama bağlantıya tıklama',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Gerçek hesap kilitleme bildirimleri genellikle uygulama içinden gelir.',
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
                      'Bilgisayarında "Sisteminiz yavaşladı, optimize edin" uyarısı çıkıyorsa ne yapmalısın? (En güvenli davranış nedir?)',
                  'options': [
                    'Hemen tıkla ve sistemi optimize et',
                    'Uyarıyı kapat ve güvenilir araçları kullan',
                    'Uyarıyı arkadaşlarına gönder',
                    'Uyarıyı aç ama optimizasyon yapma',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Sahte optimizasyon uyarıları genellikle zararlı yazılım bulaştırmak için kullanılır.',
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
                      'Bir web sitesinde "Bu site güvenlik sertifikası geçersiz" uyarısı görüyorsan ne yapmalısın? (En güvenli davranış nedir?)',
                  'options': [
                    'Hemen giriş yap ve işlemini tamamla',
                    'Siteye girmemek ve güvenli alternatif aramak',
                    'Siteye giriş yap ama şifre girme',
                    'Siteye giriş yap ve arkadaşlarına öner',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Geçersiz sertifika uyarısı alındığında siteye girmemek gerekir.',
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
                      'Telefonunda "Battery saver" uygulaması indirmen gerekiyor uyarısı geliyorsa ne yapmalısın? (En güvenli davranış nedir?)',
                  'options': [
                    'Hemen tıkla ve uygulamayı indir',
                    'Uyarıyı kapat ve sadece Google Play Store\'dan indir',
                    'Uyarıyı arkadaşlarına gönder',
                    'Uyarıyı aç ama indirme yapma',
                  ],
                  'correctIndex': 1,
                  'explanation':
                      'Gerçek uygulama önerileri sadece Google Play Store\'dan gelir.',
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
                    'Bir e-postada "Hesabınız askıya alındı, hemen tıklayın" yazıyorsa ne yapmalısın? (En güvenli davranış nedir?)',
                'classicAnswer': [
                  'açma',
                  'tıklama',
                  'silme',
                  'şüpheli',
                  'sahte',
                  'güvenli değil',
                  'doğrulama',
                  'telefon',
                ],
                'classicHint':
                    'Gerçek hesap askıya alma bildirimleri genellikle uygulama içinden gelir.',
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
                    'Bilgisayarında "Flash Player güncellemesi gerekli" uyarısı çıkıyorsa ne yapmalısın? (En güvenli davranış nedir?)',
                'classicAnswer': [
                  'kapatma',
                  'tıklama',
                  'sahte',
                  'flash',
                  'adobe',
                  'güvenlik',
                  'şüpheli',
                  'güncelleme',
                ],
                'classicHint':
                    'Flash Player artık desteklenmiyor, sahte güncelleme uyarıları zararlı yazılım içerir.',
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
                    'Bir e-postada "Hesabınız hacklendi, hemen tıklayın" yazıyorsa ne yapmalısın? (En güvenli davranış nedir?)',
                'classicAnswer': [
                  'açma',
                  'tıklama',
                  'silme',
                  'şüpheli',
                  'sahte',
                  'güvenli değil',
                  'doğrulama',
                  'telefon',
                ],
                'classicHint':
                    'Gerçek güvenlik uyarıları genellikle uygulama içinden gelir.',
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
                    'Bilgisayarında "Java güncellemesi gerekli" uyarısı çıkıyorsa ne yapmalısın? (En güvenli davranış nedir?)',
                'classicAnswer': [
                  'kapatma',
                  'tıklama',
                  'sahte',
                  'java',
                  'oracle',
                  'güvenlik',
                  'şüpheli',
                  'güncelleme',
                ],
                'classicHint':
                    'Sahte Java güncelleme uyarıları genellikle zararlı yazılım bulaştırmak için kullanılır.',
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
                    'Bir e-postada "Hesabınız donduruldu, hemen tıklayın" yazıyorsa ne yapmalısın? (En güvenli davranış nedir?)',
                'classicAnswer': [
                  'açma',
                  'tıklama',
                  'silme',
                  'şüpheli',
                  'sahte',
                  'güvenli değil',
                  'doğrulama',
                  'telefon',
                ],
                'classicHint':
                    'Gerçek hesap dondurma bildirimleri genellikle uygulama içinden gelir.',
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
                    'Bilgisayarında "Adobe Reader güncellemesi gerekli" uyarısı çıkıyorsa ne yapmalısın? (En güvenli davranış nedir?)',
                'classicAnswer': [
                  'kapatma',
                  'tıklama',
                  'sahte',
                  'adobe',
                  'reader',
                  'güvenlik',
                  'şüpheli',
                  'güncelleme',
                ],
                'classicHint':
                    'Sahte Adobe güncelleme uyarıları genellikle zararlı yazılım bulaştırmak için kullanılır.',
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
                    'Bir e-postada "Hesabınız bloke edildi, hemen tıklayın" yazıyorsa ne yapmalısın? (En güvenli davranış nedir?)',
                'classicAnswer': [
                  'açma',
                  'tıklama',
                  'silme',
                  'şüpheli',
                  'sahte',
                  'güvenli değil',
                  'doğrulama',
                  'telefon',
                ],
                'classicHint':
                    'Gerçek hesap bloke bildirimleri genellikle uygulama içinden gelir.',
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
        final double progress = (score / 100).clamp(0.0, 1.0);

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

  Future<Map<String, int>> _getLessonProgress() async {
    int completedCount = 0;
    int startedCount = 0;

    for (final lesson in lessons) {
      final progress = await ProgressService.getLessonCompletionStatus(
        lesson['title'],
      );
      if (progress >= 1.0) {
        completedCount++;
      } else if (progress > 0.0) {
        startedCount++;
      }
    }

    return {'completed': completedCount, 'started': startedCount};
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, int>>(
      future: _getLessonProgress(),
      builder: (context, snapshot) {
        final progress = snapshot.data ?? {'completed': 0, 'started': 0};
        final completedCount = progress['completed'] ?? 0;
        final startedCount = progress['started'] ?? 0;
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
