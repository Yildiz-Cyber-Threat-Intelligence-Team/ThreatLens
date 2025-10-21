// lib/views/screens/lessons/network_temelleri.dart
import 'package:flutter/material.dart';

final Map<String, dynamic> networkTemelleriModule = {
  'id': 'network-temelleri',
  'title': 'Network Temelleri (Detaylı)',
  'subtitle': 'Ağ türleri, bileşenler, adresleme, protokoller, OSI/TCP-IP ve güvenlik',
  'icon': Icons.wifi, // Gerekirse Icons.router veya Icons.device_hub
  'lessons': [

    // 1) Giriş
    {
      'id': 'giris',
      'title': 'Ağ Nedir? Neden Önemli?',
      'duration': '6 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Ağ (Network) Tanımı'},
            {'type': 'desc', 'text': 'En az iki cihazın veri alışverişi yapabildiği iletişim yapısıdır. Veri, ses, görüntü gibi içeriklerin güvenli ve hızlı aktarımını sağlar.'},
          ],
        },
      ],
    },

    // 2) Ağ Türleri: LAN / MAN / WAN
    {
      'id': 'ag-turleri',
      'title': 'LAN • MAN • WAN',
      'duration': '10 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type':'title','text':'LAN (Local Area Network)'},
            {'type':'desc','text':'Okul, ev, ofis gibi sınırlı alanlarda hızlı ve düşük gecikmeli iletişim sunan yerel ağ.'},
            {'type':'title','text':'MAN (Metropolitan Area Network)'},
            {'type':'desc','text':'Şehir ölçeğinde geniş alanları kapsayan, kurumlar ve kampüsler arası yüksek hızlı omurga.'},
            {'type':'title','text':'WAN (Wide Area Network)'},
            {'type':'desc','text':'Kıtalar arası iletişime uzanan, pek çok LAN’ı birbirine bağlayan geniş ağ yapıları.'},
          ],
        },
      ],
    },

    // 3) Temel Ağ Bileşenleri
    {
      'id': 'ag-bilesenleri',
      'title': 'Router • Switch • AP • Modem • Firewall',
      'duration': '14 dk',
      'steps': [
        {
          'type':'info',
          'content': [
            {'type':'title','text':'Router (Yönlendirici)'},
            {'type':'desc','text':'Farklı ağları birbirine bağlar ve paketleri en uygun yoldan hedefe yönlendirir.'},
            {'type':'title','text':'Switch (Anahtar)'},
            {'type':'desc','text':'Aynı ağ içindeki cihazlar arasında çerçeveleri doğru MAC adresine iletir (L2).'},
            {'type':'title','text':'Access Point (AP)'},
            {'type':'desc','text':'Kablolu LAN ile kablosuz cihazlar arasında köprü görevi görür (Wi-Fi erişimi).'},
            {'type':'title','text':'Modem'},
            {'type':'desc','text':'Dijital veriyi analog sinyale (ve tersi) çevirerek ISS üzerinden internete çıkış sağlar.'},
            {'type':'title','text':'Firewall / IDS / IPS'},
            {'type':'desc','text':'Trafiği denetler, zararlı içerikleri engeller; saldırı tespit/önleme sistemleri ile birlikte çalışır.'},
          ],
        },
      ],
    },

    // 4) IP Adresleme: IPv4 • IPv6 • Public/Private • Gateway
    {
      'id': 'ip-adresleme',
      'title': 'IP Adresleme ve Ağ Geçidi',
      'duration': '12 dk',
      'steps': [
        {
          'type':'info',
          'content': [
            {'type':'title','text':'IPv4 ve IPv6'},
            {'type':'bullet','text':'IPv4: 32 bit (örn. 192.168.1.10) • IPv6: 128 bit (örn. 2001:db8::7334)'},
            {'type':'title','text':'Public vs Private IP'},
            {'type':'desc','text':'Ev/Ofis içinde private IP kullanılır; dış dünyaya çıkışta cihazlar NAT ile public IP’yi paylaşır.'},
            {'type':'title','text':'Gateway (Ağ Geçidi)'},
            {'type':'desc','text':'Farklı ağlara çıkış kapısıdır; dış dünyaya giden trafik önce gateway’e gider.'},
          ],
        },
      ],
    },

    // 5) Subnetting (Alt Ağlar)
    {
      'id': 'subnetting',
      'title': 'Alt Ağ (Subnet) Mantığı',
      'duration': '9 dk',
      'steps': [
        {
          'type':'info',
          'content': [
            {'type':'desc','text':'Büyük ağları küçük parçalara bölerek adres/performans/güvenlik yönetimini kolaylaştırır.'},
            {'type':'bullet','text':'CIDR gösterimi (örn. 192.168.1.0/24)'},
            {'type':'bullet','text':'Ağ adresi, yayın (broadcast) adresi, host aralığı kavramları'},
          ],
        },
      ],
    },

    // 6) Transport: TCP vs UDP
    {
      'id': 'tcp-udp',
      'title': 'TCP ve UDP',
      'duration': '8 dk',
      'steps': [
        {
          'type':'info',
          'content': [
            {'type':'title','text':'TCP (Bağlantılı)'},
            {'type':'desc','text':'Sıralama/yeniden iletim/doğrulama ile güvenilir; dosya aktarımı gibi işlerde uygundur.'},
            {'type':'title','text':'UDP (Bağlantısız)'},
            {'type':'desc','text':'Kontrol yükü az; canlı yayın, oyun ve düşük gecikme gereken senaryolarda tercih edilir.'},
          ],
          'quizQuestion': {
            'question': 'Gerçek zamanlı yayın için genelde hangi protokol tercih edilir?',
            'options': ['TCP', 'UDP', 'ICMP', 'SCTP'],
            'correctIndex': 1,
            'explanation': 'UDP ek kontrol yükü olmadan düşük gecikme sağlar.'
          }
        },
      ],
    },

    // 7) DHCP ile IP Atama
    {
      'id': 'dhcp',
      'title': 'DHCP ve IP Dağıtımı',
      'duration': '7 dk',
      'steps': [
        {
          'type':'info',
          'content': [
            {'type':'desc','text':'Cihaza dinamik IP atar (Discover → Offer → Request → ACK). Statik IP sunucu/yazıcı gibi sabit erişim gerektiren cihazlarda kullanılır.'},
          ],
        },
      ],
    },

    // 8) MAC & ARP (ve ARP Spoofing)
    {
      'id': 'mac-arp',
      'title': 'MAC Adresi, ARP ve MITM Riskleri',
      'duration': '10 dk',
      'steps': [
        {
          'type':'info',
          'content': [
            {'type':'title','text':'MAC Adresi'},
            {'type':'desc','text':'Ağ kartının benzersiz fiziksel adresidir (L2).'},
            {'type':'title','text':'ARP (Adres Çözümleme)'},
            {'type':'desc','text':'“Bu IP kimde?” sorusuna karşılık IP→MAC eşlemeyi yapan protokoldür.'},
            {'type':'title','text':'ARP Spoofing / MITM'},
            {'type':'desc','text':'Saldırgan “bu IP bende” diyerek trafiği kendi üstünden geçirip dinleyebilir veya manipüle edebilir.'},
          ],
          'quizQuestion': {
            'question': 'Aşağıdakilerden hangisi ARP spoofing ile ilişkilidir?',
            'options': [
              'DNS cash poisoning',
              'İstemci-sunucu oturum yönetimi',
              'IP→MAC sahte yanıtlarla trafiği ele alma',
              'SSL sertifika üretimi'
            ],
            'correctIndex': 2,
            'explanation': 'ARP spoofing, hatalı IP→MAC eşlemeleriyle MITM saldırılarını kolaylaştırır.'
          }
        },
      ],
    },

    // 9) Portlar ve Servisler
    {
      'id': 'port-servis',
      'title': 'Portlar ve Servisler (80/443/22/25...)',
      'duration': '8 dk',
      'steps': [
        {
          'type':'info',
          'content': [
            {'type':'desc','text':'Aynı IP üzerinde farklı servisler farklı portlardan yayın yapar. Kullanmadığın portu kapat—açık port saldırgan için giriş kapısıdır.'},
            {'type':'bullet','text':'80: HTTP • 443: HTTPS • 22: SSH • 25: SMTP • 53: DNS'},
          ],
        },
      ],
    },

    // 10) OSI ve TCP/IP Katmanları
    {
      'id': 'osi-tcpip',
      'title': 'OSI 7 Katman & TCP/IP 4 Katman',
      'duration': '13 dk',
      'steps': [
        {
          'type':'info',
          'content': [
            {'type':'title','text':'OSI Modeli (7)'},
            {'type':'bullet','text':'1: Physical • 2: Data Link • 3: Network • 4: Transport • 5: Session • 6: Presentation • 7: Application'},
            {'type':'desc','text':'Güvenlik örnekleri: DDoS (Transport/4), ARP Spoofing (Data Link/2), Phishing (Application/7).'},
            {'type':'title','text':'TCP/IP Modeli (4)'},
            {'type':'bullet','text':'Network Access • Internet • Transport • Application'},
          ],
        },
      ],
    },

    // 11) Yaygın Ağ Protokolleri
    {
      'id': 'yaygin-protokoller',
      'title': 'DNS • HTTP/HTTPS • SMTP • FTP • SSH',
      'duration': '14 dk',
      'steps': [
        {
          'type':'info',
          'content': [
            {'type':'title','text':'DNS: İnternetin Rehberi'},
            {'type':'desc','text':'Alan adını IP’ye çevirir. DNS Spoofing ve DNS Tunneling risklerine dikkat.'},
            {'type':'title','text':'HTTP / HTTPS'},
            {'type':'desc','text':'HTTP düz metindir; HTTPS şifreleme ve kimlik doğrulama sağlar (TLS).'},
            {'type':'title','text':'SMTP / FTP / SSH'},
            {'type':'desc','text':'SMTP e-posta gönderimi; FTP şifresiz dosya aktarımı; SSH güvenli uzak erişim (anahtar tabanlı doğrulama önerilir).'},
          ],
          'quizQuestion': {
            'question': 'Hassas bilgileri şifrelemeden taşıyan protokol hangisidir?',
            'options': ['FTP', 'HTTPS', 'SSH', 'SFTP'],
            'correctIndex': 0,
            'explanation': 'FTP düz metin taşır; SFTP/FTPS gibi güvenli alternatifler tercih edilmelidir.'
          }
        },
      ],
    },

    // 12) Güvenlik Tehditleri ve En İyi Uygulamalar
    {
      'id': 'guvenlik',
      'title': 'Ağ Güvenliği: Tehditler ve Tedbirler',
      'duration': '12 dk',
      'steps': [
        {
          'type':'info',
          'content': [
            {'type':'bullet','text':'DNS Spoofing → Doğru hedef yerine sahte siteye yönlendirme.'},
            {'type':'bullet','text':'Rogue DHCP → Yanlış gateway ile tüm trafiği saldırgana ak
