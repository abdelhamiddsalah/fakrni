import 'package:fakrni/features/authintication/domain/entities/user_entity.dart';
import 'package:fakrni/features/authintication/domain/repositories/auth_repositry.dart';

class SaveParentdataUsecase {
  final AuthRepository repository;
  SaveParentdataUsecase({required this.repository});
  Future<void> call(UserEntity user) => repository.saveUserData(user);
}