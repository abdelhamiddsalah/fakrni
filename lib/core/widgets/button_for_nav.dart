import 'package:fakrni/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

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
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          
            gradient: LinearGradient(
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
