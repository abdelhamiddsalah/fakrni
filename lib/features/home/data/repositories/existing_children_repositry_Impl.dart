// ignore_for_file: file_names

import 'package:fakrni/core/services/firestore_databases.dart';
import 'package:fakrni/features/home/domain/repositories/existing_children_repositry.dart';

class ExistingChildrenRepositryImpl extends ExistingChildrenRepositry{
  final FirestoreDatabases firestoreDatabases;
  ExistingChildrenRepositryImpl({required this.firestoreDatabases});
  @override
  Future<bool> hasChildren() async {
    try {
      final snapshot = await firestoreDatabases.children.get();
      return snapshot.docs.isNotEmpty;
    } catch (e) {
      throw Exception('Error checking for children: $e');
    }
  }
}