import 'package:fakrni/core/styles/app_colors.dart';
import 'package:fakrni/features/onboarding/presentation/widgets/components_in_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 380.w,
            height: 650.h, // قللت الارتفاع شوية
            child: Stack(
              children: [
                Positioned(
                  top: 40.h, // قللت المسافة من الأعلى
                  left: 20.w,
                  right: 20.w,
                  bottom: 40.h, // قللت المسافة من الأسفل
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(20.h),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const ComponentsInOnboarding(),
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
