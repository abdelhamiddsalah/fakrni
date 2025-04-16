import 'package:fakrni/features/home/domain/entities/challenge_entity.dart';

abstract class ChallengeRepository {
  Future<List<ChallengeEntity>> getChallenges();
}
