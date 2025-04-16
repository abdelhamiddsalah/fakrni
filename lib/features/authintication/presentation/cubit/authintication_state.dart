part of 'authintication_cubit.dart';

abstract class AuthinticationState extends Equatable {
  const AuthinticationState();

  @override
  List<Object> get props => [];
}

class AuthinticationInitial extends AuthinticationState {}
class AuthLoading extends AuthinticationState {}

class AuthCodeSent extends AuthinticationState {
  final String verificationId;

  const AuthCodeSent(this.verificationId);

  @override
  List<Object> get props => [verificationId];
}

class AuthAutoVerified extends AuthinticationState {
  final PhoneAuthCredential credential;

  const AuthAutoVerified(this.credential);
  @override 
  List<Object> get props => [credential];
}

class AuthError extends AuthinticationState {
  final String message;

  const AuthError(this.message);
  @override
  List<Object> get props => [message];
}


class AuthLoggedIn extends AuthinticationState {
  final UserEntity user;
  const AuthLoggedIn(this.user);

  @override
  List<Object> get props => [user];
}
class ChildDataSaved extends AuthinticationState {}
