import 'package:fakrni/constants/images.dart';
import 'package:fakrni/core/styles/app_colors.dart';
import 'package:fakrni/core/styles/text_styles.dart';
import 'package:fakrni/features/home/presentation/cubit/challenges/cubit/challenges_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeChildViewBody extends StatelessWidget {
  const HomeChildViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'يالا ي بطل شوف مهامك',
                    style: TextStyles.fakrnitext.copyWith(fontSize: 20),
                  ),
                  Image.asset(
                    Assets.imagesBoy,
                    width: 30,
                    height: 30,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Expanded(
                child: BlocConsumer<ChallengesCubit, ChallengesState>(
                  listener: (context, state) {
                    if (state is ChallengesError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is ChallengesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is ChallengesLoaded) {
                       return ListView.builder(
                      itemCount: state.challenges.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.secondColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: AppColors.secondColor,
                                child: Text('${index + 1}'),
                              ),
                              title: Text(
                                state.challenges[index].challengename,
                                style: TextStyles.fakrnitext.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                'اضغط لعمل مهمة ${index + 1}',
                                style: TextStyles.fakrnitext.copyWith(
                                  fontSize: 14,
                                  color: AppColors.textColor.withOpacity(0.7),
                                ),
                              ),
                              trailing: CircleAvatar(
                                child: Image.network(
                                  state.challenges[index].image,
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                    } else {
                      return const Center(child: Text('No challenges found'));
                    }
                   
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
