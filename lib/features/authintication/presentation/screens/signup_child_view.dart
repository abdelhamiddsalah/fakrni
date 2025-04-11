import 'package:fakrni/features/authintication/presentation/cubit/authintication_cubit.dart';
import 'package:fakrni/features/authintication/presentation/widgets/signup_child_view_body.dart';
import 'package:fakrni/indepency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupChildView extends StatelessWidget {
  const SignupChildView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthinticationCubit>(),
      child: const SignupChildViewBody(),
    );
  }
}
