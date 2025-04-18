// ignore_for_file: file_names

import 'package:fakrni/features/home/data/datasources/datasource_remote_Impl.dart';
import 'package:fakrni/features/home/data/models/challenge_model.dart';
import 'package:fakrni/features/home/domain/repositories/challenge_repositry.dart';

class ChallengesRepoeitryImpl extends ChallengeRepository {
  final DatasourceRemoteImpl datasourceRemoteImpl;
  
  ChallengesRepoeitryImpl({required this.datasourceRemoteImpl});

  @override
  Future<List<ChallengeModel>> getChallenges() async {
    try {
      // استرجاع قائمة التحديات من DatasourceRemoteImpl
      final challenges = await datasourceRemoteImpl.getChallenges();  // هذا يُرجع List<ChallengeModel>

      // مباشرة إرجاع التحديات
      return challenges;  // هذه هي القائمة من ChallengeModel
    } catch (e) {
      throw Exception('Failed to load challenges: $e');
    }
  }
}
