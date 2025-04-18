import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fakrni/core/cache/cache_helper.dart';
import 'package:fakrni/features/authintication/domain/entities/child_entity.dart';
import 'package:fakrni/features/authintication/domain/entities/user_entity.dart';
import 'package:fakrni/features/authintication/domain/usecases/auth_repositry_usecase.dart';
import 'package:fakrni/features/authintication/domain/usecases/child_savedata_usecase.dart';
import 'package:fakrni/features/authintication/domain/usecases/save_parentdata_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

part 'authintication_state.dart';

class AuthinticationCubit extends Cubit<AuthinticationState> {
  final AuthRepositryUsecase authRepositryUsecase;
  final SaveParentdataUsecase saveParentdataUsecase;
  final ChildSavedataUsecase childSavedataUsecase;

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();

  String? _verificationId;

  AuthinticationCubit(
    this.authRepositryUsecase,
    this.saveParentdataUsecase,
    this.childSavedataUsecase,
  ) : super(AuthinticationInitial());

  Future<void> verifyPhone({required String phoneNumber}) async {
    emit(AuthLoading());
    await authRepositryUsecase.call(
      phoneNumber: phoneNumber,
      onCodeSent: (String verificationId) {
        print('✅ Verification Code Sent');
        _verificationId = verificationId;
        emit(AuthCodeSent(verificationId));
      },
      onVerified: (PhoneAuthCredential credential) {
        emit(AuthAutoVerified(credential));
      },
      onFailed: (FirebaseAuthException error) {
        emit(AuthError(error.message ?? 'حدث خطأ غير معروف'));
      },
      onAutoRetrievalTimeout: (String verificationId) {
        print('⚠️ Auto Retrieval Timeout - ID: $verificationId');
        _verificationId = verificationId;
      },
      timeout: const Duration(seconds: 90),
    );
  }

 Future<void> signInWithSmsCode(String smsCode) async {
  try {
    String? verificationId;

    if (state is AuthCodeSent) {
      verificationId = (state as AuthCodeSent).verificationId;
    } else {
      verificationId = _verificationId;
    }

    if (verificationId == null) {
      emit(const AuthError('Verification ID غير موجود'));
      return;
    }

    emit(AuthLoading());

    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    final user = await authRepositryUsecase.authRepository.signInWithCredential(credential);

    // احفظ بيانات ولي الأمر
    await saveParentdataUsecase.call(user);

    // 👇 هنا الحفظ الحقيقي في SharedPreferences
    await CacheHelper().saveData(key: 'isParentRegistered', value: true);
    await CacheHelper().saveData(key: 'userType', value: 'parent');

    emit(AuthLoggedIn(user));
  } catch (e) {
    emit(AuthError('خطأ أثناء التحقق من كود الـ SMS: $e'));
  }
}



  Future<void> saveChildData(ChildEntity childentity, String parentId) async {
    try {
      emit(AuthLoading());
      await childSavedataUsecase.authRepository.saveChhildData(childentity, parentId);
      emit(ChildDataSaved());
    } catch (e) {
      emit(AuthError('فشل حفظ بيانات الطفل: $e'));
    }
  }
}
