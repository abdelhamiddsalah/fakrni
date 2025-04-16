import 'package:fakrni/features/home/domain/entities/challenge_entity.dart';
import 'package:fakrni/features/home/domain/repositories/challenge_repositry.dart';

class ChallengeUsecase {
  final ChallengeRepository challengeRepository;
  ChallengeUsecase({required this.challengeRepository});
  Future<List<ChallengeEntity>> getChallenges() async {
    return await challengeRepository.getChallenges();
  }
}