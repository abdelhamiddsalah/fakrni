import 'package:fakrni/features/authintication/presentation/cubit/authintication_cubit.dart';
import 'package:fakrni/features/authintication/presentation/widgets/signup_parent_view_body.dart';
import 'package:fakrni/indepency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupParentView extends StatelessWidget {
  const SignupParentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthinticationCubit>(),
      child: const SignupParentViewBody(),
    );
  }
}
