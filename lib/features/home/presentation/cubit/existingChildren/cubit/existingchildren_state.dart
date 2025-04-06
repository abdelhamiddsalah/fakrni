part of 'existingchildren_cubit.dart';

sealed class ExistingchildrenState extends Equatable {
  const ExistingchildrenState();

  @override
  List<Object> get props => [];
}

final class ExistingchildrenInitial extends ExistingchildrenState {}

final class ExistingchildrenIsExisted extends ExistingchildrenState {}
final class ExistingchildrenIsNotExisted extends ExistingchildrenState {
  final String message;
  const ExistingchildrenIsNotExisted({required this.message});
  @override
  List<Object> get props => [message];
}
