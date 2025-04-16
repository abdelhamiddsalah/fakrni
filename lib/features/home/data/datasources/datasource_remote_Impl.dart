// ignore_for_file: file_names

import 'package:fakrni/core/services/firestore_databases.dart';
import 'package:fakrni/features/home/data/models/challenge_model.dart';


class DatasourceRemoteImpl {
  final FirestoreDatabases firestoreDatabases;
  DatasourceRemoteImpl({required this.firestoreDatabases});

  // جلب التحديات من Firestore وتحويلها إلى نماذج
 Future<List<ChallengeModel>> getChallenges() async {
  try {
    final snapshot = await firestoreDatabases.challenges.get();
    print("عدد المستندات: ${snapshot.docs.length}");
    print("البيانات: ${snapshot.docs.map((e) => e.data()).toList()}");

    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs
          .map((doc) => ChallengeModel.fromFirestore(doc))
          .toList();
    } else {
      throw Exception('No challenges found');
    }
  } catch (e) {
    throw Exception('Failed to load challenges: $e');
  }
}

}
