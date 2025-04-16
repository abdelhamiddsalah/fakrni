import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fakrni/features/home/domain/entities/challenge_entity.dart';
import 'package:fakrni/features/home/domain/usecases/challenge_usecase.dart';

part 'challenges_state.dart';

class ChallengesCubit extends Cubit<ChallengesState> {
  final ChallengeUsecase challengeUsecase;
  ChallengesCubit(this.challengeUsecase) : super(ChallengesInitial());
  Future<void> getChallenges() async {
    emit(ChallengesLoading());
    try {
      final challenges = await challengeUsecase.getChallenges();
      emit(ChallengesLoaded(challenges:  challenges));
    } catch (e) {
      emit(ChallengesError(message: e.toString()));
    }
  }
}
