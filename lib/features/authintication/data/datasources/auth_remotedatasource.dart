import 'package:fakrni/indepency_injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(String verificationId) onCodeSent,
    required Function(PhoneAuthCredential credential) onVerified,
    required Function(FirebaseAuthException error) onFailed,
    required Function(String verificationId) onAutoRetrievalTimeout,
    required Duration timeout,
  });

  Future<UserEntity> signInWithCredential(PhoneAuthCredential credential);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth =getIt<FirebaseAuth>();

  AuthRemoteDataSourceImpl();

  @override
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(String verificationId) onCodeSent,
    required Function(PhoneAuthCredential credential) onVerified,
    required Function(FirebaseAuthException error) onFailed,
    required Function(String verificationId) onAutoRetrievalTimeout,
    required Duration timeout,
  }) async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: timeout,
      verificationCompleted: onVerified,
      verificationFailed: onFailed,
      codeSent: (verificationId, resendToken) => onCodeSent(verificationId),
      codeAutoRetrievalTimeout: onAutoRetrievalTimeout,
    );
  }

  @override
  Future<UserEntity> signInWithCredential(PhoneAuthCredential credential) async {
    final userCredential = await firebaseAuth.signInWithCredential(credential);
    final user = userCredential.user!;
    return UserEntity(uid: user.uid, phoneNumber: user.phoneNumber);
  }
}
