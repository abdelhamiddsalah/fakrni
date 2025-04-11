import '../entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<void> verifyPhone({
    required String phoneNumber,
    required Function(String verificationId) onCodeSent,
    required Function(PhoneAuthCredential credential) onVerified,
    required Function(FirebaseAuthException error) onFailed,
    required Function(String verificationId) onAutoRetrievalTimeout,
    required Duration timeout,
  });

  Future<UserEntity> signInWithCredential(PhoneAuthCredential credential);
}
