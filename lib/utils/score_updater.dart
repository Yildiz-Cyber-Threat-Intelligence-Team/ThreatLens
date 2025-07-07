import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> increaseUserScore({int amount = 5}) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return;

  final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

  await FirebaseFirestore.instance.runTransaction((transaction) async {
    final snapshot = await transaction.get(userRef);
    final currentScore = (snapshot.data()?['score'] ?? 0) as int;
    transaction.update(userRef, {'score': currentScore + amount});
  });
}
