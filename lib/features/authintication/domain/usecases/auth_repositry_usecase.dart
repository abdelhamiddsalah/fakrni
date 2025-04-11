import 'package:fakrni/features/authintication/domain/repositories/auth_repositry.dart';
import 'package:fakrni/indepency_injection.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositryUsecase {
  final AuthRepository authRepository=getIt<AuthRepository>();

  AuthRepositryUsecase();
  Future<void> call({
    required String phoneNumber,
    required Function(String verificationId) onCodeSent,
    required Function(PhoneAuthCredential credential) onVerified,
    required Function(FirebaseAuthException error) onFailed,
    required Function(String verificationId) onAutoRetrievalTimeout,
    required Duration timeout,
  }) async {
    return authRepository.verifyPhone(
      phoneNumber: phoneNumber,
      onCodeSent: onCodeSent,
      onVerified: onVerified,
      onFailed: onFailed,
      onAutoRetrievalTimeout: onAutoRetrievalTimeout,
      timeout: timeout,
    );
  }
}