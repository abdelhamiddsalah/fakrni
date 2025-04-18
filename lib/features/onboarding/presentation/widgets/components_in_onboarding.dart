import 'package:fakrni/config/routing/app_routes.dart';
import 'package:fakrni/core/styles/app_colors.dart';
import 'package:fakrni/core/styles/text_styles.dart';
import 'package:fakrni/core/widgets/button_for_nav.dart';
import 'package:fakrni/core/widgets/star_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ComponentsInOnboarding extends StatelessWidget {
  const ComponentsInOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.h),
       const StarImage(),
        SizedBox(height: 25.h),
        Container(
          width: 200.w,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.textColor),
            borderRadius: BorderRadius.circular(120),
          ),
          child: Text(
            'فكرني',
            style: TextStyles.fakrnitext.copyWith(
              fontSize: 24.sp,
              letterSpacing: 1.2.sp,
            ),
          ),
        ),
        SizedBox(height: 25.h),
        Text(
          'فكرني... علشان أخلص واجبي وألعب براحتي!',
          textAlign: TextAlign.center,
          style: TextStyles.fakrnitext.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 75.h),
        ButtonForNav(
          onTap: () {
            GoRouter.of(context).push(AppRoutes.usertype);
          },
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
