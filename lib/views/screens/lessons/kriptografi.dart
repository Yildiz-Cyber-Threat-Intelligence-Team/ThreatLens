// lib/views/screens/lessons/kriptografi.dart
import 'package:flutter/material.dart';

final Map<String, dynamic> kriptografiModule = {
  'id': 'kriptografi',
  'title': 'Kriptografi (Detaylı Eğitim Modülü)',
  'subtitle': 'Şifreleme, bütünlük, kimlik doğrulama, PKI ve post-kuantum güvenlik',
  'icon': Icons.lock_outline,
  'lessons': [

    // 1️⃣ Giriş: Kriptografi Nedir?
    {
      'id': 'giris',
      'title': 'Kriptografi Nedir?',
      'duration': '10 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Tanım'},
            {'type': 'desc', 'text': 'Kriptografi, bilginin gizliliğini, bütünlüğünü ve kimlik doğrulamasını korumayı amaçlayan matematiksel bir bilim dalıdır.'},
            {'type': 'desc', 'text': 'Modern dijital güvenliğin temeli olarak bankacılık, e-posta, mesajlaşma ve HTTPS gibi tüm güvenli protokollerde yer alır.'},
            {'type': 'desc', 'text': 'Kerckhoffs İlkesi’ne göre güvenlik yalnızca anahtarın gizli olmasına dayanır; algoritmaların gizliliğine değil.'},
          ],
        },
      ],
    },

    // 2️⃣ Temel Hedefler ve Tehdit Modeli
    {
      'id': 'temel-hedefler',
      'title': 'Temel Hedefler ve Tehdit Modeli',
      'duration': '8 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'bullet', 'text': 'Gizlilik: Veriyi yalnızca yetkili kişilerin okuyabilmesi.'},
            {'type': 'bullet', 'text': 'Bütünlük: Bilginin değiştirilmediğini garanti etmek.'},
            {'type': 'bullet', 'text': 'Kimlik Doğrulama: Tarafların gerçekten iddia ettikleri kişi olduğunu kanıtlamak.'},
            {'type': 'bullet', 'text': 'İnkâr Edilemezlik: Gönderenin işlemi sonradan reddedememesi.'},
          ],
          'quizQuestion': {
            'question': 'Kriptografide “bütünlük” kavramı neyi ifade eder?',
            'options': [
              'Verinin gizli tutulmasını',
              'Verinin değiştirilmediğinin doğrulanmasını',
              'İletişimde tarafların kimliğini gizlemeyi',
              'İşlemlerin anonimleştirilmesini'
            ],
            'correctIndex': 1,
            'explanation': 'Bütünlük, verinin değiştirilmediğini tespit edebilme yeteneğidir.'
          }
        },
      ],
    },

    // 3️⃣ Temel Kavramlar
    {
      'id': 'temel-kavramlar',
      'title': 'Temel Kavramlar',
      'duration': '12 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'bullet', 'text': 'Anahtar (Key): Şifreleme ve çözme işlemlerinin temel bileşeni.'},
            {'type': 'bullet', 'text': 'Nonce / IV: Aynı anahtarla tekrar kullanımın önüne geçen tekil değerler.'},
            {'type': 'bullet', 'text': 'Salt: Parolaların benzersiz şekilde saklanmasını sağlar.'},
            {'type': 'bullet', 'text': 'Etiket (Tag): Mesajın bütünlüğünü kanıtlayan AEAD çıktısı.'},
          ],
        },
      ],
    },

    // 4️⃣ Yapı Taşları
    {
      'id': 'yapi-taslari',
      'title': 'Yapı Taşları',
      'duration': '10 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'desc', 'text': 'Blok şifreler (AES), veriyi sabit boyutlu bloklar halinde işler.'},
            {'type': 'desc', 'text': 'Hash fonksiyonları (SHA-256), veriden tek yönlü özet çıkarır.'},
            {'type': 'desc', 'text': 'MAC (Message Authentication Code), mesajın doğruluğunu kanıtlar.'},
            {'type': 'desc', 'text': 'KDF (Key Derivation Function), yeni anahtarlar türetir (HKDF, Argon2).'},
            {'type': 'desc', 'text': 'Dijital imzalar (Ed25519), kimlik doğrulama ve inkâr edilemezlik sağlar.'},
          ],
        },
      ],
    },

    // 5️⃣ Simetrik Kriptografi
    {
      'id': 'simetrik',
      'title': 'Simetrik Kriptografi',
      'duration': '14 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'desc', 'text': 'Aynı anahtar hem şifreleme hem çözme için kullanılır.'},
            {'type': 'bullet', 'text': 'AES: 128-bit blok, 128/192/256-bit anahtar boyu.'},
            {'type': 'bullet', 'text': 'ECB güvensizdir; desenleri korur.'},
            {'type': 'bullet', 'text': 'CBC, GCM, ChaCha20-Poly1305 → AEAD şemaları tercih edilir.'},
            {'type': 'desc', 'text': 'Nonce değerlerinin tekrar kullanımı güvenliği tamamen yok eder.'},
          ],
        },
      ],
    },

    // 6️⃣ Asimetrik Kriptografi
    {
      'id': 'asimetrik',
      'title': 'Asimetrik Kriptografi',
      'duration': '12 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'desc', 'text': 'İki anahtar: açık (public) ve gizli (private).'},
            {'type': 'bullet', 'text': 'RSA: Tarihsel, büyük anahtar boyutu gerektirir.'},
            {'type': 'bullet', 'text': 'ECC: Modern, yüksek güvenlik ve hız sağlar (Ed25519, X25519).'},
            {'type': 'desc', 'text': 'Genellikle hibrit sistemlerde (TLS gibi) oturum anahtarı paylaşımı için kullanılır.'},
          ],
        },
      ],
    },

    // 7️⃣ Anahtar Yönetimi ve PKI
    {
      'id': 'anahtar-yonetimi',
      'title': 'Anahtar Yönetimi ve PKI',
      'duration': '12 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'bullet', 'text': 'Anahtarlar güvenli RNG (CSPRNG) ile üretilmeli.'},
            {'type': 'bullet', 'text': 'Depolama: HSM, TPM, veya OS keystore.'},
            {'type': 'bullet', 'text': 'PKI, dijital sertifikalarla açık anahtarların doğruluğunu sağlar.'},
            {'type': 'bullet', 'text': 'OCSP, CRL ve Certificate Transparency log’ları iptal kontrolü için kullanılır.'},
          ],
        },
      ],
    },

    // 8️⃣ Uygulamada Kripto
    {
      'id': 'uygulamada',
      'title': 'Uygulamada Kripto',
      'duration': '15 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'bullet', 'text': 'TLS 1.3 → ECDHE + AEAD, RSA key exchange yok.'},
            {'type': 'bullet', 'text': 'SSH → Ed25519 anahtarları.'},
            {'type': 'bullet', 'text': 'VPN → WireGuard modern çözüm.'},
            {'type': 'bullet', 'text': 'Disk şifreleme → LUKS, BitLocker.'},
            {'type': 'bullet', 'text': 'E-posta → PGP, S/MIME.'},
            {'type': 'bullet', 'text': 'JWT → JSON tabanlı imza/doğrulama.'},
          ],
        },
      ],
    },

    // 9️⃣ Parolalar ve Güvenli Saklama
    {
      'id': 'parolalar',
      'title': 'Parolalar ve Güvenli Saklama',
      'duration': '10 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'desc', 'text': 'Parolalar asla düz metin tutulmaz.'},
            {'type': 'bullet', 'text': 'Argon2id, bcrypt, scrypt güvenli KDF’lerdir.'},
            {'type': 'bullet', 'text': 'Salt + Pepper eklenmeli, parametreler donanıma göre ayarlanmalı.'},
            {'type': 'bullet', 'text': 'MFA ve passkey çözümleri parola riskini azaltır.'},
          ],
        },
      ],
    },

    // 🔟 Rastgelelik ve Sayı Üretimi
    {
      'id': 'rastgelelik',
      'title': 'Rastgelelik ve Sayı Üretimi',
      'duration': '8 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'desc', 'text': 'Anahtarlar ve nonce’lar CSPRNG ile üretilmelidir.'},
            {'type': 'bullet', 'text': 'Unix: getrandom(), /dev/urandom'},
            {'type': 'bullet', 'text': 'Windows: BCryptGenRandom()'},
            {'type': 'desc', 'text': 'Tahmin edilebilir rastgelelik, tüm güvenliği çökertir.'},
          ],
        },
      ],
    },

    // 11️⃣ Saldırı Türleri ve Yaygın Hatalar
    {
      'id': 'hatalar',
      'title': 'Saldırı Türleri ve Yaygın Hatalar',
      'duration': '10 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'bullet', 'text': 'Nonce tekrar kullanımı: AEAD güvenliğini yok eder.'},
            {'type': 'bullet', 'text': 'Zayıf algoritmalar (DES, RC4, MD5) artık kullanılmamalı.'},
            {'type': 'bullet', 'text': 'Yan kanal saldırıları: zamanlama, güç tüketimi, hata analizi.'},
            {'type': 'bullet', 'text': 'Downgrade saldırıları: eski protokollere zorlama.'},
          ],
        },
      ],
    },

    // 12️⃣ Post-Kuantum Kriptografi
    {
      'id': 'post-kuantum',
      'title': 'Post-Kuantum Kriptografi',
      'duration': '10 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'desc', 'text': 'Kuantum bilgisayarlar RSA/ECC sistemlerini kırabilir.'},
            {'type': 'desc', 'text': 'Post-quantum algoritmalar klasik sistemlerde de çalışır.'},
            {'type': 'bullet', 'text': 'NIST standartları (2024): FIPS 203 (Kyber), 204 (Dilithium), 205 (SPHINCS+).'},
            {'type': 'desc', 'text': 'Kurumlar hibrit geçiş planı yapmalıdır.'},
          ],
        },
      ],
    },

    // 13️⃣ Operasyonel Pratikler
    {
      'id': 'operasyonel',
      'title': 'Uyum ve Operasyonel Pratikler',
      'duration': '12 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'bullet', 'text': 'Kripto envanteri çıkarılmalı, anahtar ömrü/rotasyonu tanımlanmalı.'},
            {'type': 'bullet', 'text': 'HSM/TPM veya keystore ile anahtar koruması.'},
            {'type': 'bullet', 'text': 'Olay müdahale planı (anahtar iptali, yenileme) hazırlanmalı.'},
            {'type': 'bullet', 'text': 'Crypto-agile tasarım → algoritma değişimine kolay uyum.'},
          ],
        },
      ],
    },

    // 14️⃣ Quiz & Sözlük
    {
      'id': 'quiz',
      'title': 'Değerlendirme ve Sözlük',
      'duration': '12 dk',
      'steps': [
        {
          'type': 'info',
          'quizQuestion': {
            'question': 'AEAD şemaları ne sağlar?',
            'options': [
              'Yalnızca gizlilik',
              'Yalnızca bütünlük',
              'Gizlilik ve bütünlüğü aynı anda',
              'Anahtar yönetimini'
            ],
            'correctIndex': 2,
            'explanation': 'AEAD (ör. AES-GCM) hem gizlilik hem bütünlük doğrulaması sağlar.'
          }
        },
      ],
    },
  ],
};
