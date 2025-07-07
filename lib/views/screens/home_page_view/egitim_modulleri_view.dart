import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:threat_lens/app/router.dart';

class EgitimModulleriView extends StatelessWidget {
  final String baslik;
  final List<String> egitimler;

  const EgitimModulleriView({
    required this.baslik,
    required this.egitimler,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B132B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C2541),
        title: Text(
          baslik,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),

              ...List.generate(egitimler.length, (index) {
                final egitim = egitimler[index];
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == egitimler.length - 1 ? 0 : 16,
                  ),
                  child: _buildEgitimCard(context, egitim, index),
                );
              }),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
            child: const Icon(Icons.school, color: Color(0xFFBB86FC), size: 24),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Eğitim Modülleri",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Siber güvenlik konularında kendinizi geliştirin",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEgitimCard(BuildContext context, String egitim, int index) {
    return GestureDetector(
      onTap: () {
        if (egitim == 'Siber Güvenlik Nedir?') {
          context.go(AppRoutes.cyberIntro);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$egitim henüz aktif değil.'),
              backgroundColor: const Color(0xFFBB86FC),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFBB86FC).withValues(alpha: 0.3),
            width: 1,
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
              child: Icon(
                _getEgitimIcon(egitim),
                color: const Color(0xFFBB86FC),
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Tooltip(
                    message: egitim,
                    preferBelow: false,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C2541),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFBB86FC).withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    child: Text(
                      egitim,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Tooltip(
                    message: _getEgitimDescription(egitim),
                    preferBelow: false,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C2541),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFBB86FC).withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    textStyle: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    child: Text(
                      _getEgitimDescription(egitim),
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "Eğitim Modülü",
                      style: TextStyle(
                        color: Color(0xFFBB86FC),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
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
      ),
    );
  }

  IconData _getEgitimIcon(String egitim) {
    switch (egitim) {
      case 'Siber Güvenlik Nedir?':
        return Icons.security;
      case 'Tehdit Türleri':
        return Icons.warning;
      case 'Güvenlik Önlemleri':
        return Icons.shield;
      case 'Ağ Protokolleri':
        return Icons.wifi;
      case 'Firewall':
        return Icons.security;
      case 'VPN Teknolojisi':
        return Icons.vpn_key;
      case 'Wireless Güvenlik':
        return Icons.wifi_lock;
      case 'Ağ İzleme':
        return Icons.monitor;
      case 'Simetrik Şifreleme':
        return Icons.lock;
      case 'Asimetrik Şifreleme':
        return Icons.key;
      case 'Hash Fonksiyonları':
        return Icons.fingerprint;
      case 'Dijital İmzalar':
        return Icons.edit;
      case 'Penetrasyon Testi':
        return Icons.bug_report;
      case 'Reconnaissance':
        return Icons.search;
      case 'Saldırı Teknikleri':
        return Icons.gps_fixed;
      default:
        return Icons.book;
    }
  }

  String _getEgitimDescription(String egitim) {
    switch (egitim) {
      case 'Siber Güvenlik Nedir?':
        return 'Temel kavramlar ve prensipler';
      case 'Tehdit Türleri':
        return 'Siber tehditlerin sınıflandırılması';
      case 'Güvenlik Önlemleri':
        return 'Korunma yöntemleri ve stratejiler';
      case 'Ağ Protokolleri':
        return 'Güvenli iletişim protokolleri';
      case 'Firewall':
        return 'Ağ güvenlik duvarları';
      case 'VPN Teknolojisi':
        return 'Sanal özel ağ teknolojileri';
      case 'Wireless Güvenlik':
        return 'Kablosuz ağ güvenliği';
      case 'Ağ İzleme':
        return 'Ağ trafiği analizi';
      case 'Simetrik Şifreleme':
        return 'Aynı anahtar ile şifreleme';
      case 'Asimetrik Şifreleme':
        return 'Açık/gizli anahtar çifti';
      case 'Hash Fonksiyonları':
        return 'Tek yönlü şifreleme';
      case 'Dijital İmzalar':
        return 'Kimlik doğrulama ve bütünlük';
      case 'Penetrasyon Testi':
        return 'Güvenlik açıklarını test etme';
      case 'Reconnaissance':
        return 'Hedef hakkında bilgi toplama';
      case 'Saldırı Teknikleri':
        return 'Saldırı yöntemleri ve araçlar';
      default:
        return 'Eğitim modülü';
    }
  }
}
