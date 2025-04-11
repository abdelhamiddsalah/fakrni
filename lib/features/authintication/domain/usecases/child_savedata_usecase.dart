import 'package:fakrni/features/authintication/domain/entities/child_entity.dart';
import 'package:fakrni/features/authintication/domain/repositories/auth_repositry.dart';

class ChildSavedataUsecase {
  final AuthRepository authRepository;

  ChildSavedataUsecase({required this.authRepository});
  Future<void> call(ChildEntity child, String parentId) => authRepository.saveChhildData(child,parentId );
}