import 'package:fakrni/features/home/presentation/cubit/challenges/cubit/challenges_cubit.dart';
import 'package:fakrni/features/home/presentation/widgets/home_child_view_body.dart';
import 'package:fakrni/indepency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeChildView extends StatelessWidget {
  const HomeChildView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChallengesCubit>()..getChallenges(),
      child: const HomeChildViewBody(),
    );
  }
}
