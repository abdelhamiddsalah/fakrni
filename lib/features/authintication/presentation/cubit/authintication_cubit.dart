import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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

  AuthinticationCubit(this.authRepositryUsecase, this.saveParentdataUsecase, this.childSavedataUsecase) : super(AuthinticationInitial());

  Future<void> verifyPhone({required String phoneNumber}) async {
    emit(AuthLoading());
    await authRepositryUsecase.call(
      phoneNumber: phoneNumber,
      onCodeSent: (String verificationId) {
        print('Verification Code Sent ✅');
        _verificationId = verificationId;
        print('Verification ID: $_verificationId'); // طباعة الـ verificationId هنا
        emit(AuthCodeSent(verificationId));
      },
      onVerified: (PhoneAuthCredential credential) {
        emit(AuthAutoVerified(credential));
      },
      onFailed: (FirebaseAuthException error) {
        emit(AuthError(error.message ?? 'Unknown Error'));
      },
      onAutoRetrievalTimeout: (String verificationId) {
        print('Auto Retrieval Timeout, verificationId: $verificationId');
        _verificationId = verificationId; // تأكد من أن _verificationId يتم تعيينه هنا
      },
      timeout: const Duration(seconds: 90),
    );
  }

 Future<void> signInWithSmsCode(String smsCode) async {
  try {
    String? verificationId;

    // خد verificationId من الحالة لو موجود
    if (state is AuthCodeSent) {
      verificationId = (state as AuthCodeSent).verificationId;
    } else {
      verificationId = _verificationId; // fallback احتياطي
    }

    print('Verification ID used for sign-in: $verificationId');

    if (verificationId == null) {
      emit(AuthError('Verification ID غير موجود'));
      return;
    }

    emit(AuthLoading());

    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    final user = await authRepositryUsecase.authRepository.signInWithCredential(credential);
    await saveParentdataUsecase.call(user);
    emit(AuthLoggedIn(user));
  } catch (e) {
    emit(AuthError('Error during SMS code verification: $e'));
  }
}

Future<void> saveChildData(ChildEntity childentity, String parentId) async {
  try {
    emit(AuthLoading());
    await childSavedataUsecase.authRepository.saveChhildData(childentity, parentId);
    emit(ChildDataSaved()); // ✅ حالة جديدة لما يتم الحفظ بنجاح
  } catch (e) {
    emit(AuthError('فشل حفظ بيانات الطفل: $e'));
  }
}


}

