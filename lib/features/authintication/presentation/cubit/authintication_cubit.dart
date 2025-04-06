import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authintication_state.dart';

class AuthinticationCubit extends Cubit<AuthinticationState> {
  AuthinticationCubit() : super(AuthinticationInitial());
}
