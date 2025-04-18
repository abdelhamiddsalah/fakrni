import 'package:fakrni/config/routing/app_routes.dart';
import 'package:fakrni/constants/images.dart';
import 'package:fakrni/core/styles/app_colors.dart';
import 'package:fakrni/core/styles/text_styles.dart';
import 'package:fakrni/core/widgets/button_for_nav.dart';
import 'package:fakrni/core/widgets/textformfield_in_auth.dart';
import 'package:fakrni/features/authintication/presentation/cubit/authintication_cubit.dart';
import 'package:fakrni/features/authintication/presentation/widgets/arrow_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupParentViewBody extends StatelessWidget {
  const SignupParentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      body: SafeArea(
        child: Stack(
          children: [
            // ✅ Positioned Circles at bottom-left
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: 120,
                height: 120,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    const Positioned(
                      bottom: -12,
                      left: -12,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xfff0a790),
                      ),
                    ),
                    Positioned(
                      bottom: -20,
                      left: 20,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: const Color(0xff4c9bb9).withOpacity(0.5),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      left: -30,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.tealAccent.shade100.withOpacity(
                          0.5,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      left: 30,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.red.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ✅ Main content
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const ArrowBack(),
                      const SizedBox(height: 40),
                      Image.asset(
                        Assets.imagesImageInonboarding,
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'من فضلك أدخل رقم التليفون الخاص بك',
                        style: TextStyles.fakrnitext.copyWith(fontSize: 20),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: TextformfieldInAuth(
                              hintText: 'رقم التليفون',
                              keyboardType: TextInputType.phone,
                              controller: context.read<AuthinticationCubit>().phoneNumberController,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            Assets.imagesFather,
                            width: 40,
                            height: 40,
                          ),
                        ],
                      ),
                      const SizedBox(height: 80),
                      BlocConsumer<AuthinticationCubit, AuthinticationState>(
                        listener: (context, state) {
                         if (state is AuthCodeSent) {
                            print('Code sent: ${state.verificationId}');
                         }
                         if (state is AuthCodeSent) {
                            GoRouter.of(context).push(AppRoutes.parenthome);
                         }
                        },
                        builder: (context, state) {
                          return ButtonForNav(onTap: () {
                            context.read<AuthinticationCubit>().verifyPhone(phoneNumber: context.read<AuthinticationCubit>().phoneNumberController.text );
                  
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
