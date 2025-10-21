// lib/views/screens/lessons/trojan.dart
import 'package:flutter/material.dart';

final Map<String, dynamic> trojanModule = {
  'id': 'trojan-advanced',
  'title': 'Trojanlar — Derinlemesine (CTI & Tespit & Analiz Laboratuvarı)',
  'subtitle': 'Trojan türleri, davranış analizi, IOCs, YARA/Snort örnekleri, tespit ve giderme',
  'icon': Icons.security,
  'lessons': [
    // 1. Giriş & Mitoloji
    {
      'id': 'trojan-intro',
      'title': 'Giriş — Truva Atı metaforu ve temel kavramlar',
      'duration': '8 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Trojan Nedir?'},
            {
              'type': 'desc',
              'text':
                  'Trojan (Truva Atı) görünürde meşru gözüken, arka planda kötü amaçlı faaliyetler yapan türde yazılımlardır. Genelde sosyal mühendislik veya indirilen dosyalar ile yayılır.'
            },
            {'type': 'bullet', 'text': 'Arka kapı (backdoor), Keylogger, Downloader, Dropper vb.'},
            {'type': 'bullet', 'text': 'Saldırganlar RAT, Banker gibi farklı payload bileşenleri kullanır.'},
          ],
        },
      ],
    },

    // 2. Türler derinlemesine
    {
      'id': 'trojan-types',
      'title': 'Trojan Türleri ve Davranış Örnekleri',
      'duration': '18 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Backdoor / RAT'},
            {
              'type': 'desc',
              'text':
                  'Uzaktan komut gönderen, dosya transferi yapabilen, ekran/klavye/kamera erişimi sağlayabilen türler. Örnek: njRAT, DarkComet.'
            },
            {'type': 'title', 'text': 'Downloader / Dropper'},
            {
              'type': 'desc',
              'text':
                  'Downloader: ağ üzerinden ek zararlıları indirir. Dropper: kendisi başka bir malware paketini içerir ve bırakır.'
            },
            {'type': 'title', 'text': 'Banker / Keylogger / Rootkit'},
            {
              'type': 'desc',
              'text': 'Banker: finansal kredil bilgileri çalar; Keylogger: tuş vuruşlarını kaydeder; Rootkit: gizlenme/evasion için kullanılır.'
            },
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Çok bileşenli saldırılar'},
            {
              'type': 'desc',
              'text': 'Gelişmiş saldırılar RAT + Keylogger + Downloader gibi paketler halinde gelir; CTI bunların zincirini takip eder.'
            },
          ],
          'quizQuestion': {
            'question': 'Dropper ile Downloader arasındaki temel fark nedir?',
            'options': [
              'Dropper diğer yazılımları indirir, Downloader ise taşır',
              'Downloader ağdan indirir, Dropper içinde gömülü olarak bırakır',
              'Her ikisi de aynı işlevdedir',
              'Dropper yalnızca mobil cihazlarda görülür'
            ],
            'correctIndex': 1,
            'explanation': 'Downloader ağ üzerinden ikincil yazılımlar indirir; dropper ise genelde payload’ı taşır ve bırakır.'
          }
        },
      ],
    },

    // 3. Dağıtım yöntemleri ve yayılma
    {
      'id': 'trojan-distribution',
      'title': 'Dağıtım Yöntemleri (Phishing, Exploit, Malvertising)',
      'duration': '12 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Sosyal Mühendislik & Phishing'},
            {
              'type': 'desc',
              'text': 'Phishing epostaları veya sahte güncelleme pencereleri ile kullanıcı kandırılarak trojan çalıştırılır.'
            },
            {'type': 'title', 'text': 'Exploit Kitleri & Drive-by'},
            {
              'type': 'desc',
              'text': 'Tarayıcı/plug-in açıkları üzerinden otomatik bulaşma (drive-by) veya exploit kitleri ile dağıtım.'
            },
            {'type': 'title', 'text': 'Malvertising'},
            {'type': 'desc', 'text': 'Reklam ağları üzerinden zararlı yönlendirmeler yapılarak indirme tetiklenir.'},
          ],
        },
      ],
    },

    // 4. IOC & Davranış göstergeleri
    {
      'id': 'trojan-ioc',
      'title': 'Indicators of Compromise (IOC) ve Davranış Göstergeleri',
      'duration': '16 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Ağ Tabanlı IOC\'lar'},
            {'type': 'bullet', 'text': 'Şüpheli dış bağlantılar: nadir kullanılan portlar, uzun C2 domainleri'},
            {'type': 'bullet', 'text': 'Düzenli beacons (periyodik check-in)'},
            {'type': 'bullet', 'text': 'İçerik exfiltration: anormal veri çıkışları (large POST)'}, 
            {'type': 'title', 'text': 'Host Tabanlı IOC\'lar'},
            {'type': 'bullet', 'text': 'Yeni servisler, beklenmeyen autorun kayıtları, bilinmeyen DLL yüklemeleri'},
            {'type': 'bullet', 'text': 'Hash değerleri, dosya adları, kayıt defteri anahtarları'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Behavioral Indicators'},
            {'type': 'desc', 'text': 'Komut satırından şüpheli powershell kullanımı, rar/zip içinden otomatik çalıştırma, persistence mekanizmaları.'},
          ],
          'quizQuestion': {
            'question': 'Bir trojanın C2 sunucusuna periyodik bağlantı yapması en çok hangi tespitin göstergesi olur?',
            'options': ['File integrity', 'Beaconing (düzenli check-in)', 'DNS TTL', 'Port scanning'],
            'correctIndex': 1,
            'explanation': 'Beaconing, C2 ile düzenli iletişim yapan malware davranışıdır.'
          }
        },
      ],
    },

    // 5. Tespit: Yöntemler & Örnek kurallar
    {
      'id': 'trojan-detection',
      'title': 'Tespit Yöntemleri (IDS, EDR, YARA, Sandbox)',
      'duration': '20 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Ağ Analizi (NetFlow/Zeek/Suricata)'},
            {'type': 'desc', 'text': 'NetFlow/Zeek ile anormal trafik, uzun süreli küçük hacimli outbound POST trafiği ve bilinen C2 domainleri tespit edilir.'},
            {'type': 'title', 'text': 'EDR & Host İzleme'},
            {'type': 'desc', 'text': 'EDR; yeni process spawnları, dosya yazımı, kestirmeler, registry değişimleri ve API hooklar takip eder.'},
            {'type': 'title', 'text': 'Sandbox / Dynamic Analysis'},
            {'type': 'desc', 'text': 'Şüpheli sample izolasyonda çalıştırılıp network, dosya, API çağrısı davranışları gözlemlenir.'},
          ],
        },

        // YARA örneği
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'YARA Örneği (Basit)'},
            {
              'type': 'code',
              'lang': 'text',
              'text':
                  r"""rule trojan_example_suspicious_strings {
    meta:
        author = "CTI Team"
        description = "Suspicious strings used by sample RAT"
    strings:
        $s1 = "connect_back"
        $s2 = "cmd.exe /c powershell"
        $s3 = "http://malicious-c2.example"
    condition:
        any of ($s*) and filesize < 5MB
}"""
            },
            {'type': 'desc', 'text': 'Bu kural örneği, dosya içinde belirli zararlı stringler arar. Gerçek dünyada kurallar daha sofistike olur.'},
          ],
        },

        // Snort/Suricata örneği
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Snort/Suricata kuralı (örnek)'},
            {
              'type': 'code',
              'lang': 'text',
              'text':
                  r"""alert http any any -> any any (msg:"Possible C2 beacon to example-c2"; flow:established,to_server; content:"/beacon"; http_uri; content:"User-Agent: BadUA"; nocase; sid:1000001; rev:1;)"""
            },
            {'type': 'desc', 'text': 'Bu kural HTTP URI\'sinde /beacon ve kötü user-agent arar.'},
          ],
        },

        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Tespit Notları'},
            {'type': 'bullet', 'text': 'İmza tabanlı tespitler kolayca atlatılabilir — davranış temelli kombinasyonlar kullan.'},
            {'type': 'bullet', 'text': 'Anomali + imza + Threat Intelligence (IoC listeleri) birlikte etkili olur.'},
          ],
        },
      ],
    },

    // 6. CTI Süreci & Paylaşım
    {
      'id': 'trojan-cti-process',
      'title': 'CTI Süreci ve Trojan Analizi İş Akışı',
      'duration': '12 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'CTI Aşamaları (Kısa)'},
            {'type': 'bullet', 'text': 'Collection (hash, pcap, sample, metadata)'},
            {'type': 'bullet', 'text': 'Analysis (static + dynamic)'},
            {'type': 'bullet', 'text': 'Attribution (actor/cluster mapping)'},
            {'type': 'bullet', 'text': 'Dissemination (MISP, STIX/TAXII, VirusTotal paylaşımı)'},
            {'type': 'bullet', 'text': 'Mitigation (detections, firewall rules, IOC push)'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'CTI İyi Uygulamaları'},
            {'type': 'bullet', 'text': 'İyi etiketlenmiş örnekler (label), güvenilir kaynak kullanımı'},
            {'type': 'bullet', 'text': 'IoC yaşam döngüsünü takip et: eskime, false-positive yönetimi'},
          ],
        },
      ],
    },

    // 7. Analiz laboratuvarı (cli adımları)
    {
      'id': 'trojan-lab',
      'title': 'Analiz Laboratuvarı — Örnek Adımlar (Güvenli ortamda yapınız)',
      'duration': '20 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Hazırlık'},
            {
              'type': 'desc',
              'text': 'İzole bir VM, pcap toplayıcı (tcpdump/wireshark), sandbox (Cuckoo veya open-source), ve hash aracı (sha256sum) gereklidir.'
            },
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Statik Analiz Komut Örnekleri'},
            {
              'type': 'code',
              'lang': 'text',
              'text':
                  'sha256sum sample.exe\nstrings sample.exe | grep -i c2\nfile sample.exe\npeframe sample.exe'
            },
            {'type': 'desc', 'text': 'Hash al, strings ile gömülü URL/komutları ara, peframe veya lief ile PE statik bilgisi al.'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Dinamik Analiz (Sandbox)'},
            {
              'type': 'desc',
              'text': 'Sample\'ı izolasyonda çalıştır, pcap topla, proses davranışlarını kaydet, registry ve filesystem değişikliklerini incele.'
            },
            {
              'type': 'code',
              'lang': 'text',
              'text':
                  'tcpdump -w sample_run.pcap -i eth0\n# sandbox çalıştırıldıktan sonra\nscalpel sample_run.pcap "http"'
            },
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'IOC Çıktı Formatı (Örnek JSON)'},
            {
              'type': 'code',
              'lang': 'json',
              'text':
                  r'''{
  "sha256": "abcd1234...",
  "file_name": "sample.exe",
  "c2_domains": ["malicious-c2.example", "bad.example.net"],
  "ips": ["45.33.32.1"],
  "yara_matches": ["trojan_example_suspicious_strings"]
}'''
            },
            {'type': 'desc', 'text': 'Bu JSON MISP veya dahili CTI sistemine aktarılarak paylaşılabilir.'},
          ],
        },
      ],
    },

    // 8. Remediate & Incident Response
    {
      'id': 'trojan-remediate',
      'title': 'Giderme (Remediation) ve Olay Müdahalesi',
      'duration': '10 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Hızlı Müdahale Adımları'},
            {'type': 'bullet', 'text': '1) Etkilenen host izolasyonu (network disconnect)'},
            {'type': 'bullet', 'text': '2) Hash ile sample doğrulama ve karantina'},
            {'type': 'bullet', 'text': '3) Tüm ağ global IOC’leri blocking (firewall, proxy)'},
            {'type': 'bullet', 'text': '4) Kullanıcı şifre zorunlu resetleri ve MFA güçlendirme'},
            {'type': 'bullet', 'text': '5) Post-incident forensics: timeline, pcap, registry snapshot'},
          ],
        },
      ],
    },

    // 9. Quiz: Değerlendirme
    {
      'id': 'trojan-quiz',
      'title': 'Değerlendirme: Trojan Bilgisi Testi',
      'duration': '10 dk',
      'steps': [
        {
          'type': 'info',
          'content': [{'type': 'title', 'text': 'Soru 1'}],
          'quizQuestion': {
            'question': 'Which of the following is typical Trojan behavior?',
            'options': [
              'Serving webpages normally',
              'Becoming a persistent backdoor and contacting C2',
              'Increasing disk space usage intentionally',
              'Resetting network hardware'
            ],
            'correctIndex': 1,
            'explanation': 'Trojanlar genelde backdoor açıp C2 ile iletişime geçer.'
          }
        },
        {
          'type': 'info',
          'content': [{'type': 'title', 'text': 'Soru 2'}],
          'quizQuestion': {
            'question': 'Which record type maps a hostname to an IPv4 address?',
            'options': ['MX', 'CNAME', 'A', 'TXT'],
            'correctIndex': 2,
            'explanation': 'A kaydı IPv4 adresine karşılık gelir.'
          }
        },
        {
          'type': 'info',
          'content': [{'type': 'title', 'text': 'Soru 3'}],
          'quizQuestion': {
            'question': 'Which mitigation step helps quickly limit exfiltration?',
            'options': ['Upgrade OS later', 'Disconnect host from network', 'Delete logs', 'Increase DNS TTL'],
            'correctIndex': 1,
            'explanation': 'Etkiyi sınırlamak için hostun ağ bağlantısı kesilir.'
          }
        },
      ],
    },
  ],
};
