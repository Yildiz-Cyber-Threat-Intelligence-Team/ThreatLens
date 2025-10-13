import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:threat_lens/services/progress_service.dart';

class CyberSecurityIntroLesson extends StatefulWidget {
  const CyberSecurityIntroLesson({super.key});

  @override
  State<CyberSecurityIntroLesson> createState() =>
      _CyberSecurityIntroLessonState();
}

class _CyberSecurityIntroLessonState extends State<CyberSecurityIntroLesson> {
  int _currentStep = 0;
  bool _showFeedback = false;
  bool _isAnswerCorrect = false;
  bool _loading = true;
  String _classicUserAnswer = '';
  String _classicFeedback = '';
  Map<int, bool> _classicQuestionAnswers = {};

  final List<Map<String, dynamic>> _steps = [
    {
      'type': 'info',
      'content': [
        {'type': 'title', 'text': 'Siber Güvenlik Nedir?'},
        {
          'type': 'desc',
          'text':
              'Siber güvenlik, dijital dünyada bilgi, sistem ve ağların yetkisiz erişim, saldırı, hasar ve hırsızlığa karşı korunmasını sağlayan bütünsel bir disiplindir. Bireylerden devletlere kadar herkes için kritik öneme sahiptir. Siber güvenlik, sadece teknik önlemlerle değil, aynı zamanda insan faktörü ve organizasyonel süreçlerle de sağlanır.',
        },
        {'type': 'desc', 'text': 'Siber güvenliğin temel amaçları şunlardır:'},
        {
          'type': 'bullet',
          'text':
              'Gizlilik (Confidentiality): Bilgilerin sadece yetkili kişiler tarafından erişilebilir olmasını sağlamak.',
        },
        {
          'type': 'bullet',
          'text':
              'Bütünlük (Integrity): Bilgilerin doğruluğunu ve değişmezliğini korumak.',
        },
        {
          'type': 'bullet',
          'text':
              'Erişilebilirlik (Availability): Bilgi ve sistemlerin ihtiyaç duyulduğunda erişilebilir olmasını sağlamak.',
        },
        {
          'type': 'desc',
          'text':
              'Örnek: Bir bankanın müşteri verilerinin sızdırılması gizlilik ihlalidir. Bir sağlık sisteminde verilerin yanlışlıkla değiştirilmesi bütünlük ihlalidir. Bir web sitesine erişilememesi ise erişilebilirlik sorunudur.',
        },
        {
          'type': 'desc',
          'text':
              'Siber güvenlik, kimlik doğrulama, şifreleme, antivirüs yazılımları, güvenlik duvarları, kullanıcı eğitimi ve güncel yazılım gibi birçok yöntemle sağlanır.',
        },
      ],
      'classicQuestion':
          'Siber güvenliğin üç temel amacı nedir? (Her birini kısa yazabilirsin)',
      'classicAnswer': [
        'gizlilik',
        'confidentiality',
        'bütünlük',
        'integrity',
        'erişilebilirlik',
        'availability',
      ],
      'classicHint': 'Baş harfleri G-B-E. İngilizce veya Türkçe yazabilirsin.',
    },
    {
      'type': 'info',
      'content': [
        {'type': 'title', 'text': 'Siber Güvenlik Nasıl Sağlanır?'},
        {
          'type': 'desc',
          'text':
              'Siber güvenlik, sadece teknik önlemlerle değil, aynı zamanda insan faktörü ve organizasyonel süreçlerle de sağlanır. Aşağıda en yaygın kullanılan yöntemler ve araçlar detaylandırılmıştır:',
        },
        {
          'type': 'bullet',
          'text':
              'Kimlik Doğrulama: Şifre, biyometrik, iki faktörlü doğrulama gibi yöntemlerle kullanıcıların kimliğinin doğrulanması.',
        },
        {
          'type': 'bullet',
          'text':
              'Şifreleme: Verilerin, yetkisiz kişiler tarafından okunamayacak şekilde kodlanması. Hem dosya hem de iletişim şifrelemesi önemlidir.',
        },
        {
          'type': 'bullet',
          'text':
              'Antivirüs ve Antimalware Yazılımları: Zararlı yazılımları tespit edip engelleyen programlar.',
        },
        {
          'type': 'bullet',
          'text':
              'Güvenlik Duvarı (Firewall): Ağ trafiğini izleyip zararlı bağlantıları engelleyen sistemler.',
        },
        {
          'type': 'bullet',
          'text':
              'Saldırı Tespit ve Önleme Sistemleri (IDS/IPS): Şüpheli aktiviteleri tespit edip önlem alan sistemler.',
        },
        {
          'type': 'bullet',
          'text':
              'Düzenli Yedekleme: Verilerin kaybolma veya saldırı durumunda geri yüklenebilmesi için yedeklenmesi.',
        },
        {
          'type': 'bullet',
          'text':
              'Kullanıcı Eğitimi: Kullanıcıların sosyal mühendislik ve siber saldırılar konusunda bilinçlendirilmesi.',
        },
        {
          'type': 'bullet',
          'text':
              'Güncel Yazılım: İşletim sistemi ve uygulamaların güncel tutulması, güvenlik açıklarının kapatılması.',
        },
        {
          'type': 'bullet',
          'text':
              'Ağ Segmentasyonu: Ağın bölümlere ayrılarak saldırıların yayılmasının önlenmesi.',
        },
        {
          'type': 'bullet',
          'text':
              'Erişim Kontrolleri: Her kullanıcının sadece ihtiyacı olan verilere erişebilmesi.',
        },
      ],
      'classicQuestion': 'Şifreleme nedir?',
      'classicAnswer': ['kodlama', 'şifreleme'],
      'classicHint': 'Veriler okunamaz hale getirilir.',
    },
    {
      'type': 'info',
      'content': [
        {'type': 'title', 'text': 'Tehdit Türleri'},
        {
          'type': 'desc',
          'text':
              'Siber güvenlikte karşılaşılan tehditler çok çeşitlidir ve sürekli olarak evrilmektedir. Tehditler hem teknik hem de sosyal mühendislik yöntemleriyle ortaya çıkabilir. Kurumlar ve bireyler, bu tehditleri tanıyarak daha etkili savunma stratejileri geliştirebilir.',
        },
        {'type': 'desc', 'text': 'Başlıca siber tehdit türleri şunlardır:'},
        {
          'type': 'bullet',
          'text':
              'Kötü Amaçlı Yazılımlar (Malware): Virüs, solucan, truva atı, fidye yazılımı (ransomware), casus yazılım (spyware) gibi zararlı yazılımlar.',
        },
        {
          'type': 'bullet',
          'text':
              'Kimlik Avı (Phishing): Sahte e-posta, SMS veya web siteleriyle kullanıcıların kişisel bilgilerini ele geçirme girişimleri.',
        },
        {
          'type': 'bullet',
          'text':
              'Fidye Yazılımları (Ransomware): Dosyaları şifreleyip, çözmek için fidye talep eden yazılımlar.',
        },
        {
          'type': 'bullet',
          'text':
              'DDoS Saldırıları: Hizmetin aksamasına yol açan, çoklu sistemlerden gelen yoğun trafik saldırıları.',
        },
        {
          'type': 'bullet',
          'text':
              'Sıfırıncı Gün Açıkları (Zero-Day): Henüz keşfedilmemiş veya yamalanmamış güvenlik açıklarının istismarı.',
        },
        {
          'type': 'bullet',
          'text':
              'İç Tehditler (Insider Threats): Kurum içinden gelen kasıtlı veya kasıtsız tehditler.',
        },
        {
          'type': 'desc',
          'text':
              'Örnek: Bir çalışanın şifresini paylaşması iç tehdit, bir kullanıcıya sahte e-posta ile şifre sızdırılması ise kimlik avı saldırısıdır.',
        },
      ],
      'classicQuestion':
          'Phishing (kimlik avı) saldırısı nedir? (Kısa ve anahtar kelimelerle yanıtla)',
      'classicAnswer': [
        'kimlik avı',
        'phishing',
        'sahte',
        'e-posta',
        'web sitesi',
        'bilgi çalma',
      ],
      'classicHint': 'Kullanıcıyı kandırmak için sahte e-posta veya site.',
    },
    {
      'type': 'info',
      'content': [
        {'type': 'title', 'text': 'Güvenlik Önlemleri'},
        {
          'type': 'desc',
          'text':
              'Siber güvenlikte etkili koruma sağlamak için bir dizi teknik ve organizasyonel önlem alınmalıdır. Bu önlemler, hem bireysel hem de kurumsal düzeyde uygulanabilir ve siber saldırıların etkisini azaltmada kritik rol oynar.',
        },
        {'type': 'desc', 'text': 'Başlıca güvenlik önlemleri şunlardır:'},
        {
          'type': 'bullet',
          'text':
              'Güçlü Parolalar: Karmaşık, tahmin edilmesi zor ve her hesap için farklı şifreler kullanmak.',
        },
        {
          'type': 'bullet',
          'text':
              'Çok Faktörlü Kimlik Doğrulama (MFA): Sadece şifre değil, ek doğrulama adımları (SMS, uygulama, biyometrik) kullanmak.',
        },
        {
          'type': 'bullet',
          'text':
              'Güncel Yazılım: İşletim sistemi ve uygulamaların güncel tutulması, güvenlik açıklarının kapatılması.',
        },
        {
          'type': 'bullet',
          'text':
              'Antivirüs ve Güvenlik Duvarı: Zararlı yazılımları engelleyen ve ağ trafiğini kontrol eden yazılımlar kullanmak.',
        },
        {
          'type': 'bullet',
          'text':
              'Düzenli Yedekleme: Verilerin kaybolma veya saldırı durumunda geri yüklenebilmesi için yedeklenmesi.',
        },
        {
          'type': 'bullet',
          'text':
              'Kullanıcı Eğitimi: Sosyal mühendislik ve oltalama saldırılarına karşı farkındalık oluşturmak.',
        },
        {
          'type': 'desc',
          'text':
              'Örnek: Bir kullanıcı, aynı şifreyi hem e-posta hem sosyal medya hesabında kullanırsa, birinin ele geçirilmesi diğerini de riske atar. Güçlü ve benzersiz şifreler bu riski azaltır.',
        },
      ],
      'classicQuestion':
          'Güçlü bir şifre oluşturmak için neler yapılmalı? (Kısa ve anahtar kelimelerle yanıtla)',
      'classicAnswer': [
        'güçlü',
        'karmaşık',
        'uzun',
        'büyük',
        'küçük',
        'harf',
        'rakam',
        'sembol',
        'benzersiz',
        'farklı',
      ],
      'classicHint': 'Farklı karakter türleri ve uzunluk önemli.',
    },
    {
      'type': 'info',
      'content': [
        {'type': 'title', 'text': 'Günlük Güvenlik'},
        {
          'type': 'desc',
          'text':
              'Siber güvenlik sadece kurumlar için değil, bireyler için de günlük yaşamda büyük önem taşır. Kişisel verilerin korunması, kimlik hırsızlığına ve maddi kayıplara karşı önlem almak için temel güvenlik alışkanlıkları edinilmelidir.',
        },
        {
          'type': 'desc',
          'text':
              'Günlük hayatta uygulanabilecek başlıca siber güvenlik önlemleri şunlardır:',
        },
        {
          'type': 'bullet',
          'text':
              'Güçlü ve benzersiz şifreler kullanın, şifrelerinizi kimseyle paylaşmayın.',
        },
        {
          'type': 'bullet',
          'text': 'Şüpheli e-posta ve ekleri açmayın, bağlantılara tıklamayın.',
        },
        {
          'type': 'bullet',
          'text': 'Ortak Wi-Fi ağlarında hassas işlemlerden kaçının.',
        },
        {
          'type': 'bullet',
          'text': 'Cihazlarınızı güncel tutun ve antivirüs yazılımı kullanın.',
        },
        {
          'type': 'bullet',
          'text':
              'Kişisel bilgilerinizi sosyal medyada paylaşırken dikkatli olun.',
        },
        {
          'type': 'bullet',
          'text': 'Mobil cihazlarda sadece güvenilir uygulamaları yükleyin.',
        },
        {
          'type': 'desc',
          'text':
              'Örnek: Sosyal medyada doğum tarihi, telefon numarası gibi kişisel bilgilerin paylaşılması kimlik hırsızlığı riskini artırır. Ayrıca, ortak Wi-Fi ağlarında banka işlemleri yapmak güvenli değildir.',
        },
      ],
      'classicQuestion':
          'Ortak Wi-Fi ağlarında neden hassas işlemlerden kaçınılmalı? (Kısa ve anahtar kelimelerle yanıtla)',
      'classicAnswer': [
        'güvensiz',
        'açık',
        'risk',
        'veri',
        'çalınma',
        'dinlenme',
        'man-in-the-middle',
        'saldırı',
      ],
      'classicHint': 'Veriler başkaları tarafından izlenebilir.',
    },
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
          'text': 'Güvenlik duvarı, IDS/IPS ve antivirüs çözümleri kullanın.',
        },
        {
          'type': 'bullet',
          'text': 'Güvenlik açıklarını düzenli olarak tarayın ve yamalayın.',
        },
        {
          'type': 'bullet',
          'text': 'Olay müdahale ve iş sürekliliği planları oluşturun.',
        },
      ],
      'classicQuestion': 'Kurumsal siber güvenlikte neden yedekleme önemlidir?',
      'classicAnswer': ['veri', 'kaybı', 'önlenir'],
      'classicHint': 'Veri kaybı riskine karşı alınan önlem.',
    },
    {
      'type': 'info',
      'content': [
        {'type': 'title', 'text': 'Güvenlik Testleri'},
        {
          'type': 'desc',
          'text':
              'Siber güvenlikte güvenlik testleri, sistemlerin ve uygulamaların zafiyetlerini tespit etmek ve önlem almak için yapılan kontrollü denemelerdir. Bu testler, hem kurumlar hem de bireyler için güvenlik seviyesini artırmada kritik rol oynar.',
        },
        {'type': 'desc', 'text': 'Başlıca güvenlik testleri şunlardır:'},
        {
          'type': 'bullet',
          'text':
              'Penetrasyon Testi (Sızma Testi): Bir saldırgan gibi davranarak sistemdeki açıkları bulmaya yönelik testler.',
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
          'type': 'desc',
          'text':
              'Örnek: Bir şirket, yeni bir web uygulamasını yayına almadan önce penetrasyon testi yaptırarak olası açıkları kapatır.',
        },
      ],
      'classicQuestion':
          'Penetrasyon testi nedir? (Kısa ve anahtar kelimelerle yanıtla)',
      'classicAnswer': [
        'sızma',
        'penetrasyon',
        'açık',
        'zafiyet',
        'test',
        'saldırgan',
        'güvenlik açığı',
      ],
      'classicHint': 'Bir saldırgan gibi sistemdeki açıkları bulmaya çalışmak.',
    },
    {
      'type': 'info',
      'content': [
        {'type': 'title', 'text': 'Ağ Protokolleri'},
        {
          'type': 'desc',
          'text':
              'Ağ protokolleri, bilgisayarlar ve cihazlar arasında veri iletimini düzenleyen kurallar bütünüdür. Protokoller sayesinde farklı donanım ve yazılımlar birbiriyle uyumlu şekilde iletişim kurabilir.',
        },
        {'type': 'desc', 'text': 'En yaygın ağ protokolleri şunlardır:'},
        {
          'type': 'bullet',
          'text':
              'TCP/IP: İnternetin temel protokolü, veri paketlerinin güvenli ve sıralı iletimini sağlar.',
        },
        {
          'type': 'bullet',
          'text':
              'UDP: Hızlı ama bağlantısız veri iletimi sağlar, genellikle video/oyun gibi gecikmeye duyarlı uygulamalarda kullanılır.',
        },
        {
          'type': 'bullet',
          'text':
              'HTTP/HTTPS: Web sitelerine erişim ve veri iletimi için kullanılır. HTTPS, şifreli ve güvenli iletişim sağlar.',
        },
        {
          'type': 'bullet',
          'text':
              'FTP/SFTP: Dosya transferi için kullanılır. SFTP, şifreli dosya aktarımı sunar.',
        },
        {
          'type': 'bullet',
          'text': 'SMTP/IMAP/POP3: E-posta gönderme ve alma protokolleridir.',
        },
        {
          'type': 'desc',
          'text':
              'Örnek: Bir web sitesine bağlandığınızda tarayıcınız HTTP veya HTTPS protokolünü kullanır. E-posta gönderirken ise SMTP protokolü devreye girer.',
        },
      ],
      'classicQuestion':
          'HTTPS protokolünün temel avantajı nedir? (Kısa ve anahtar kelimelerle yanıtla)',
      'classicAnswer': [
        'güvenli',
        'şifreli',
        'koruma',
        'gizlilik',
        'security',
        'encrypted',
        'secure',
      ],
      'classicHint': 'Veriler şifrelenir ve güvenli iletilir.',
    },
    {
      'type': 'info',
      'content': [
        {'type': 'title', 'text': 'Firewall Yapılandırması'},
        {
          'type': 'desc',
          'text':
              'Firewall (güvenlik duvarı), bir ağdaki trafiği kontrol eden ve zararlı ya da istenmeyen bağlantıları engelleyen bir güvenlik sistemidir. Hem donanım hem de yazılım tabanlı firewall çözümleri mevcuttur.',
        },
        {
          'type': 'desc',
          'text':
              'Firewall yapılandırması, ağ güvenliğinin temel taşlarından biridir ve doğru yapılandırılmazsa sistemler saldırılara açık hale gelebilir.',
        },
        {
          'type': 'bullet',
          'text':
              'Kurallar (Rules): Hangi trafiğe izin verileceği veya engelleneceği belirlenir.',
        },
        {
          'type': 'bullet',
          'text':
              'Port Yönetimi: Sadece gerekli portlar açık bırakılır, gereksiz portlar kapatılır.',
        },
        {
          'type': 'bullet',
          'text':
              'Günlükleme (Logging): Tüm trafik ve olaylar kaydedilerek izlenir.',
        },
        {
          'type': 'bullet',
          'text':
              'Bölgesel Güvenlik (DMZ): Dışarıya açık sunucular için ayrı bir ağ bölgesi oluşturulur.',
        },
        {
          'type': 'desc',
          'text':
              'Örnek: Bir şirket, sadece e-posta ve web trafiğine izin verirken, diğer tüm portları firewall ile kapatır.',
        },
      ],
      'classicQuestion':
          'Firewall\'un temel görevi nedir? (Kısa ve anahtar kelimelerle yanıtla)',
      'classicAnswer': [
        'engelleme',
        'koruma',
        'filtreleme',
        'kontrol',
        'güvenlik',
        'izin',
        'block',
        'filter',
        'protect',
        'control',
        'security',
        'allow',
      ],
      'classicHint': 'Zararlı trafiği engeller, güvenli trafiğe izin verir.',
    },
    {
      'type': 'info',
      'content': [
        {'type': 'title', 'text': 'VPN Teknolojileri'},
        {
          'type': 'desc',
          'text':
              'VPN (Virtual Private Network - Sanal Özel Ağ), internet üzerinden güvenli ve şifreli bir bağlantı kurarak verilerin gizliliğini ve bütünlüğünü sağlar. Özellikle uzaktan çalışanlar ve halka açık ağlarda güvenli iletişim için kullanılır.',
        },
        {
          'type': 'desc',
          'text': 'VPN teknolojilerinin başlıca avantajları şunlardır:',
        },
        {
          'type': 'bullet',
          'text':
              'Veri Şifreleme: Tüm internet trafiği şifrelenir ve üçüncü şahıslar tarafından okunamaz.',
        },
        {
          'type': 'bullet',
          'text':
              'Kimlik Gizleme: Gerçek IP adresi gizlenir, farklı bir lokasyondan internete çıkış yapılabilir.',
        },
        {
          'type': 'bullet',
          'text':
              'Güvenli Uzaktan Erişim: Kurum ağına veya özel kaynaklara güvenli şekilde erişim sağlanır.',
        },
        {
          'type': 'bullet',
          'text':
              'Sansür ve Kısıtlamaları Aşma: Erişim engelleri ve coğrafi kısıtlamalar VPN ile aşılabilir.',
        },
        {
          'type': 'desc',
          'text':
              'Örnek: Bir çalışan, evinden şirket ağına VPN ile bağlanarak tüm verilerini şifreli ve güvenli şekilde iletebilir.',
        },
      ],
      'classicQuestion':
          "VPN'in temel faydası nedir? (Kısa ve anahtar kelimelerle yanıtla)",
      'classicAnswer': [
        'gizlilik',
        'şifreleme',
        'güvenli',
        'koruma',
        'anonim',
        'erişim',
        'uzaktan',
        'private',
        'security',
        'encrypted',
        'access',
        'hide',
        'ip',
      ],
      'classicHint':
          'Veriler şifrelenir, kimlik gizlenir, güvenli erişim sağlanır.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadClassicQuestionAnswers();
  }

  Future<void> _loadClassicQuestionAnswers() async {
    final lessonId = 'cyber_security_intro';
    final answers = await ProgressService.getLessonQuizAnswers(lessonId);
    if (mounted) {
      setState(() {
        _classicQuestionAnswers = answers;
        _loading = false;
      });
    }
  }

  bool get _isCurrentClassicQuestionLocked {
    return _classicQuestionAnswers.containsKey(_currentStep);
  }

  Future<void> _nextStep() async {
    setState(() {
      _showFeedback = false;
    });

    final nextStep = _currentStep + 1;
    final total = _steps.length;

    await ProgressService.saveLessonProgress(
      lessonId: "cybersecurity-intro",
      completedStep: nextStep,
      totalSteps: total,
    );

    if (nextStep < total) {
      setState(() {
        _currentStep = nextStep;
        _classicUserAnswer = '';
        _classicFeedback = '';
      });
    } else {
      if (mounted) {
        context.go('/');
      }
    }
  }

  void _checkAnswer(bool isCorrect) {
    setState(() {
      _showFeedback = true;
      _isAnswerCorrect = isCorrect;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        backgroundColor: Color(0xFF0B132B),
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    final step = _steps[_currentStep];
    final contentList = (step['type'] == 'info' && step['content'] != null)
        ? (step['content'] as List).cast<Map<String, dynamic>>()
        : <Map<String, dynamic>>[];
    final titleEntry = contentList.firstWhere(
      (e) => e['type'] == 'title',
      orElse: () => <String, dynamic>{'text': ''},
    );
    final appBarTitle = titleEntry['text'] ?? 'Ders';

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: const Color(0xFF1C2541),
        foregroundColor: Colors.white,
        leading: _currentStep > 0
            ? Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFFBB86FC)),
                  onPressed: () {
                    setState(() {
                      _currentStep--;
                      _classicUserAnswer = '';
                      _classicFeedback = '';
                    });
                  },
                ),
              )
            : null,
      ),
      backgroundColor: const Color(0xFF0B132B),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (step['type'] == 'info') ...[
                _buildInfoBox(step['content'] ?? step['text']),
                const SizedBox(height: 24),
                _buildClassicQuestion(step),
                const SizedBox(height: 24),
                _buildContinueButton(),
              ] else if (step['type'] == 'question') ...[
                _buildQuestion(step),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(List content) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha((0.2 * 255).toInt()),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.info_outline, color: Color(0xFFBB86FC)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  content.firstWhere(
                    (e) => e['type'] == 'title',
                    orElse: () => {'text': ''},
                  )['text'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...content
              .where((e) => e['type'] == 'desc')
              .map<Widget>(
                (e) => Text(
                  e['text'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.4,
                  ),
                ),
              ),
          ...content
              .where((e) => e['type'] == 'subtitle')
              .map<Widget>(
                (e) => Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 4),
                  child: Text(
                    e['text'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ...content
              .where((e) => e['type'] == 'bullet')
              .map<Widget>(
                (e) => Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 2),
                  child: Row(
                    children: [
                      const Text(
                        '• ',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Expanded(
                        child: Text(
                          e['text'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return ElevatedButton(
      onPressed: _nextStep,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFBB86FC),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text("Devam Et"),
    );
  }

  Widget _buildQuestion(Map<String, dynamic> step) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          step['question'],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        ...List.generate(step['options'].length, (index) {
          final option = step['options'][index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1C2541),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              onPressed: () => _checkAnswer(option['isCorrect']),
              child: Text(option['text']),
            ),
          );
        }),
        const SizedBox(height: 20),
        if (_showFeedback)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  _isAnswerCorrect ? '✅ Doğru!' : '❌ Yanlış cevap!',
                  style: TextStyle(
                    color: _isAnswerCorrect ? Colors.green : Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (step['explanation'] != null)
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha((0.2 * 255).toInt()),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Text(
                    step['explanation'],
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ElevatedButton(
                onPressed: _nextStep,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Devam"),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildClassicQuestion(Map step) {
    if (step['classicQuestion'] == null) return const SizedBox();

    final isLocked = _isCurrentClassicQuestionLocked;
    final isCorrectlyAnswered = _classicQuestionAnswers[_currentStep] == true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          step['classicQuestion'],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (step['classicHint'] != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 8),
            child: Text(
              'İpucu: ${step['classicHint']}',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        const SizedBox(height: 8),

        if (!_classicFeedback.isNotEmpty && isLocked) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isCorrectlyAnswered
                  ? Colors.green.withValues(alpha: 0.2)
                  : Colors.red.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isCorrectlyAnswered
                    ? Colors.green.withValues(alpha: 0.3)
                    : Colors.red.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  isCorrectlyAnswered ? Icons.check_circle : Icons.cancel,
                  color: isCorrectlyAnswered ? Colors.green : Colors.red,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    isCorrectlyAnswered
                        ? "Bu soruyu daha önce doğru cevapladınız"
                        : "Bu soruyu daha önce yanlış cevapladınız",
                    style: TextStyle(
                      color: isCorrectlyAnswered ? Colors.green : Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],

        if (!isLocked) ...[
          Row(
            children: [
              Expanded(
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Cevabınızı yazın',
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white.withAlpha((0.2 * 255).toInt()),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _classicUserAnswer = val;
                    });
                  },
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  final user = _classicUserAnswer.trim().toLowerCase();
                  final answers =
                      (step['classicAnswer'] as List<dynamic>?)
                          ?.map((e) => e.toString().toLowerCase())
                          .toList() ??
                      [];
                  bool allMatch =
                      answers.isNotEmpty &&
                      answers.every((a) => user.contains(a));
                  if (user.isNotEmpty && allMatch) {
                    _submitClassicAnswer(true);
                  } else {
                    _submitClassicAnswer(false);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBB86FC),
                ),
                child: const Text('Kontrol Et'),
              ),
            ],
          ),
        ],

        if (_classicFeedback.isNotEmpty || isLocked) ...[
          const SizedBox(height: 8),
          Text(
            isLocked
                ? (isCorrectlyAnswered ? 'Doğru!' : 'Yanlış!')
                : _classicFeedback,
            style: TextStyle(
              color: isLocked
                  ? (isCorrectlyAnswered ? Colors.green : Colors.red)
                  : (_classicFeedback == 'Doğru!' ? Colors.green : Colors.red),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ],
    );
  }

  Future<void> _submitClassicAnswer(bool isCorrect) async {
    final lessonId = 'cyber_security_intro';

    await ProgressService.saveLessonQuizAnswer(
      lessonId: lessonId,
      questionIndex: _currentStep,
      isCorrect: isCorrect,
    );

    setState(() {
      _classicFeedback = isCorrect ? 'Doğru!' : 'Yanlış, tekrar dene!';
      _classicQuestionAnswers[_currentStep] = isCorrect;
    });
  }
}
