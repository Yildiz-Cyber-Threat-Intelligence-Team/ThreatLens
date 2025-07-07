import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:threat_lens/app/router.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _isEditingName = false;
  final TextEditingController _nameController = TextEditingController();

  Future<DocumentSnapshot<Map<String, dynamic>>> _getUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    return FirebaseFirestore.instance.collection('users').doc(uid).get();
  }

  Future<void> _updateDisplayName(String newName) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'displayName': newName,
    });
    await FirebaseAuth.instance.currentUser?.updateDisplayName(newName);
  }

  Future<void> _updateAvatar(String avatar) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'avatar': avatar,
    });
  }

  void _showAvatarSelectionDialog() {
    final avatars = [
      'lion.png',
      'wolf.png',
      'tiger.png',
      'dragon.png',
      'eagle.png',
    ];

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1C2541),
        title: const Text("Avatar Seç", style: TextStyle(color: Colors.white)),
        content: SizedBox(
          width: double.maxFinite,
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: avatars.map((avatar) {
              return GestureDetector(
                onTap: () async {
                  Navigator.of(context).pop();
                  await _updateAvatar(avatar);
                },
                child: ClipOval(
                  child: Image.asset('assets/images/avatars/$avatar'),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      context.go(AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B132B),
      body: SafeArea(
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: _getUserData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }

            final data = snapshot.data!.data()!;
            final name = data['displayName'] ?? 'Kullanıcı';
            final score = data['score']?.toString() ?? '0';
            final level = data['level']?.toString() ?? '1';
            final completedModules =
                data['completedModules']?.toString() ?? '0';
            final avatar = data['avatar'] ?? 'wolf.png';

            _nameController.text = name;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xFFBB86FC,
                                ).withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  'assets/images/avatars/$avatar',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(
                                        Icons.person,
                                        size: 28,
                                        color: Color(0xFFBB86FC),
                                      ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: -2,
                              bottom: -2,
                              child: GestureDetector(
                                onTap: _showAvatarSelectionDialog,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFBB86FC),
                                    shape: BoxShape.circle,
                                  ),
                                  padding: const EdgeInsets.all(4),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: _isEditingName
                                        ? TextFormField(
                                            controller: _nameController,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'Adınızı girin',
                                              hintStyle: TextStyle(
                                                color: Colors.grey[400],
                                              ),
                                              filled: true,
                                              fillColor: Colors.white
                                                  .withValues(alpha: 0.08),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: BorderSide.none,
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 8,
                                                  ),
                                            ),
                                            onFieldSubmitted: (val) async {
                                              await _updateDisplayName(val);
                                              setState(
                                                () => _isEditingName = false,
                                              );
                                            },
                                          )
                                        : Text(
                                            name,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      _isEditingName ? Icons.check : Icons.edit,
                                      color: const Color(0xFFBB86FC),
                                      size: 20,
                                    ),
                                    onPressed: () async {
                                      if (_isEditingName &&
                                          _nameController.text
                                              .trim()
                                              .isNotEmpty) {
                                        await _updateDisplayName(
                                          _nameController.text.trim(),
                                        );
                                      }
                                      setState(
                                        () => _isEditingName = !_isEditingName,
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "Profil Bilgilerin",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.email,
                                    color: Colors.white38,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    FirebaseAuth.instance.currentUser?.email ??
                                        '',
                                    style: const TextStyle(
                                      color: Colors.white38,
                                      fontSize: 13,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          icon: Icons.star,
                          label: "Seviye",
                          value: level,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _StatCard(
                          icon: Icons.verified,
                          label: "Modül",
                          value: completedModules,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _StatCard(
                          icon: Icons.emoji_events,
                          label: "Puan",
                          value: score,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  _ActionButton(
                    label: "Ana Sayfaya Dön",
                    icon: Icons.home,
                    color: const Color(0xFFBB86FC),
                    onPressed: () => context.go(AppRoutes.homepage),
                  ),
                  const SizedBox(height: 16),
                  _ActionButton(
                    label: "Çıkış Yap",
                    icon: Icons.logout,
                    color: const Color(0xFFFF6B6B),
                    onPressed: () => _signOut(context),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
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
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFFBB86FC), size: 20),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(label, style: const TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
