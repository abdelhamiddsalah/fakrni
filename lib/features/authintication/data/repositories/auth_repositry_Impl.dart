import 'package:fakrni/features/authintication/data/datasources/auth_remotedatasource.dart';
import 'package:fakrni/features/authintication/data/datasources/store_datasource_parent.dart';
import 'package:fakrni/features/authintication/domain/entities/child_entity.dart';
import 'package:fakrni/features/authintication/domain/repositories/auth_repositry.dart';
import 'package:fakrni/indepency_injection.dart';

import '../../domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource =getIt<AuthRemoteDataSource>() ;
  final FirestoreRemoteDataSource storeRemoteDataSource =getIt<FirestoreRemoteDataSource>() ;

  AuthRepositoryImpl();

  @override
  Future<void> verifyPhone({
    required String phoneNumber,
    required Function(String verificationId) onCodeSent,
    required Function(PhoneAuthCredential credential) onVerified,
    required Function(FirebaseAuthException error) onFailed,
    required Function(String verificationId) onAutoRetrievalTimeout,
    required Duration timeout,
  }) async {
    return remoteDataSource.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      onCodeSent: onCodeSent,
      onVerified: onVerified,
      onFailed: onFailed,
      onAutoRetrievalTimeout: onAutoRetrievalTimeout,
      timeout: timeout,
    );
  }

  @override
  Future<UserEntity> signInWithCredential(PhoneAuthCredential credential) {
    return remoteDataSource.signInWithCredential(credential);
  }
  
  @override
  Future<void> saveUserData(UserEntity user) {
    return storeRemoteDataSource.saveParentData(user);
  }

  @override
  Future<void> saveChhildData(ChildEntity childEntity, String parentId) {
    return storeRemoteDataSource.saveChildData(childEntity, parentId);
  }
}
