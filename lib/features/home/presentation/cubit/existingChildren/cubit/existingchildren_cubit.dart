import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fakrni/features/home/domain/usecases/existing_children_usecase.dart';

part 'existingchildren_state.dart';

class ExistingchildrenCubit extends Cubit<ExistingchildrenState> {
  final ExistingChildrenUsecase existingChildrenUsecase;
  ExistingchildrenCubit(this.existingChildrenUsecase)
      : super(ExistingchildrenInitial());
  Future<void> checkIfChildrenExists() async {
    emit(ExistingchildrenInitial());
    try {
      final bool hasChildren = await existingChildrenUsecase.hasChildren();
      if (hasChildren) {
        emit(ExistingchildrenIsExisted());
      } else {
        emit(ExistingchildrenIsNotExisted(message: 'No children found.'));
      }
    } catch (e) {
      emit(ExistingchildrenIsNotExisted(message: e.toString()));
    }
  }
}
