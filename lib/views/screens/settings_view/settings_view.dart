import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:threat_lens/app/router.dart';
import 'package:threat_lens/services/progress_service.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  String? _pendingSnackBarMessage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_pendingSnackBarMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _pendingSnackBarMessage != null) {
          _showSnackBar(context, _pendingSnackBarMessage!);
          setState(() {
            _pendingSnackBarMessage = null;
          });
        }
      });
    }
  }

  Future<void> _loadSettings() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B132B),
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C2541),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.settings,
                            color: Color(0xFFBB86FC),
                            size: 40,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Ayarlar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "Uygulama tercihlerinizi yönetin",
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
                    const SizedBox(height: 32),
                    _SettingsItem(
                      icon: Icons.privacy_tip,
                      title: "Gizlilik Politikası",
                      subtitle: "Veri kullanım detayları",
                      onTap: () => _showPrivacyPolicy(context),
                    ),
                    const SizedBox(height: 16),
                    _SettingsItem(
                      icon: Icons.info,
                      title: "Hakkında",
                      subtitle: "Versiyon bilgisi",
                      onTap: () => _showAboutDialog(context),
                    ),
                    const SizedBox(height: 16),
                    _SettingsItem(
                      icon: Icons.refresh,
                      title: "İlerlemeyi Sıfırla",
                      subtitle: "Tüm ders ve quiz ilerlemesini sıfırla",
                      onTap: () async {
                        final currentContext = context;
                        final confirm = await _showConfirmDialog(
                          currentContext,
                          "İlerlemeyi Sıfırla",
                          "Tüm ders ilerlemeleriniz, quiz puanlarınız ve tamamlanan modülleriniz sıfırlanacak. Bu işlem geri alınamaz.",
                        );
                        if (confirm == true && mounted) {
                          final currentContext = context;
                          setState(() {
                            _isLoading = true;
                          });
                          bool success = false;
                          try {
                            await ProgressService.resetAllProgress();
                            success = true;
                          } catch (e) {
                            // Hata durumunda işlem yapılmıyor
                          }
                          if (mounted) {
                            setState(() {
                              _isLoading = false;
                              _pendingSnackBarMessage = success
                                  ? "İlerleme başarıyla sıfırlandı"
                                  : "İlerleme sıfırlanırken hata oluştu";
                            });
                            if (success) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (mounted) {
                                  currentContext.go(AppRoutes.homepage);
                                }
                              });
                            }
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 36),
                    _homeButton(context),
                  ],
                ),
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black54,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: Color(0xFFBB86FC)),
                    SizedBox(height: 16),
                    Text(
                      "İşlem yapılıyor...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
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

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFFBB86FC),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showPrivacyPolicy(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1C2541),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          "Gizlilik Politikası",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ThreatLens Gizlilik Politikası",
                style: TextStyle(
                  color: Color(0xFFBB86FC),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "• Kişisel verileriniz güvenle saklanır\n"
                "• Üçüncü taraflarla paylaşılmaz\n"
                "• Sadece eğitim amaçlı kullanılır\n"
                "• İstediğiniz zaman silebilirsiniz",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              "Tamam",
              style: TextStyle(color: Color(0xFFBB86FC)),
            ),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: "ThreatLens",
      applicationVersion: "v1.0.0",
      applicationIcon: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.security, color: Color(0xFFBB86FC), size: 24),
      ),
      children: [
        const Text(
          "Siber güvenlik öğrenim platformu.\n\n"
          "Geliştirici: ThreatLens Team\n"
          "Lisans: MIT\n"
          "© 2024 ThreatLens",
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ],
    );
  }

  Future<bool?> _showConfirmDialog(
    BuildContext context,
    String title,
    String content,
  ) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1C2541),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          content,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("İptal", style: TextStyle(color: Colors.white70)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFBB86FC),
            ),
            child: const Text("Sıfırla", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _homeButton(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFBB86FC), Color(0xFF7C3AED)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFBB86FC).withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: () => context.go(AppRoutes.homepage),
        icon: const Icon(Icons.home, color: Colors.white, size: 20),
        label: const Text(
          "Ana Menüye Dön",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SettingsItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFFBB86FC), size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.3,
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
}
