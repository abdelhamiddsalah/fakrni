part of 'challenges_cubit.dart';

sealed class ChallengesState extends Equatable {
  const ChallengesState();

  @override
  List<Object> get props => [];
}

final class ChallengesInitial extends ChallengesState {}

final class ChallengesLoaded extends ChallengesState {
  final List<ChallengeEntity> challenges;
  const ChallengesLoaded({required this.challenges});
  @override
  List<Object> get props => [challenges];
}

final class ChallengesError extends ChallengesState {
  final String message;
  const ChallengesError({required this.message});
  @override
  List<Object> get props => [message];
}
final class ChallengesLoading extends ChallengesState {}