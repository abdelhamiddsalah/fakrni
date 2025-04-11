import 'package:fakrni/config/routing/app_routes.dart';
import 'package:fakrni/features/authintication/presentation/cubit/authintication_cubit.dart';
import 'package:fakrni/features/authintication/presentation/widgets/verifyphone_view_body.dart';
import 'package:fakrni/indepency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerifyphoneView extends StatelessWidget {
  const VerifyphoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthinticationCubit>(),
      child: BlocListener<AuthinticationCubit, AuthinticationState>(
        listener: (context, state) {
          if (state is AuthLoggedIn) {
             GoRouter.of(context).go(AppRoutes.usertype);
          }
          else if (state is AuthError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
        },
        child: VerifyphoneViewBody(),
      ),
    );
  }
}
