import 'package:fakrni/config/routing/app_routes.dart';
import 'package:fakrni/constants/images.dart';
import 'package:fakrni/core/styles/app_colors.dart';
import 'package:fakrni/core/styles/text_styles.dart';
import 'package:fakrni/core/widgets/button_for_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 380,
            height: 650, // قللت الارتفاع شوية
            child: Stack(
              children: [
                Positioned(
                  top: 40, // قللت المسافة من الأعلى
                  left: 20,
                  right: 20,
                  bottom: 40, // قللت المسافة من الأسفل
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 10,
      offset: Offset(0, 4),
    ),
  ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        Image.asset(Assets.imagesImageInonboarding),
                        const SizedBox(height: 25),
                        Container(
                          width: 200,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.textColor),
                            borderRadius: BorderRadius.circular(120),
                          ),
                          child: Text(
                            'فكرني',
                            style: TextStyles.fakrnitext.copyWith(
                              fontSize: 24,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          'فكرني... علشان أخلص واجبي وألعب براحتي!',
                          textAlign: TextAlign.center,
                          style: TextStyles.fakrnitext.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        ButtonForNav(onTap: () {
                          GoRouter.of(context).push(
                            AppRoutes.usertype,
                          );
                        },),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
