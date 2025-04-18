import 'package:fakrni/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonForNav extends StatelessWidget {
  final void Function()? onTap;
  const ButtonForNav({
    super.key, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          
            gradient: const LinearGradient(
            colors: [
              AppColors.mainColor,
              AppColors.textColor,
              AppColors.mainColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(
          Icons.arrow_back,
          color: AppColors.secondColor,
          size: 30,
        ),
      ),
    );
  }
}
