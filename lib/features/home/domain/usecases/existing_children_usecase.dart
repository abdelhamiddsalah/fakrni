import 'package:fakrni/features/home/domain/repositories/existing_children_repositry.dart';

class ExistingChildrenUsecase {
  final ExistingChildrenRepositry existingChildrenRepositry;
  ExistingChildrenUsecase({required this.existingChildrenRepositry});
  Future<bool> hasChildren() async {
    try {
      return await existingChildrenRepositry.hasChildren();
    } catch (e) {
      throw Exception('Error checking for children');
    }
  }
}