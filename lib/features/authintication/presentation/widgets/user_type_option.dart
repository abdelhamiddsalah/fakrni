import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fakrni/core/enums/enums.dart';
import 'package:fakrni/core/styles/app_colors.dart';
import 'package:fakrni/core/styles/text_styles.dart';

class UserTypeOption extends StatelessWidget {
  final UserType type;
  final UserType? selectedType;
  final void Function(UserType) onSelect;
  final String title;
  final String subtitle;
  final String imagePath;

  const UserTypeOption({
    super.key,
    required this.type,
    required this.selectedType,
    required this.onSelect,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedType == type;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.mainColor.withOpacity(0.2)
            : AppColors.textColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColors.mainColor : Colors.transparent,
          width: 2,
        ),
      ),
      child: ListTile(
        leading: Image.asset(imagePath, width: 40.w, height: 40.h),
        title: Text(
          title,
          style: TextStyles.fakrnitext.copyWith(
            color: isSelected ? AppColors.textColor : AppColors.mainColor,
            fontSize: 16.sp,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 12.sp,
            color: isSelected ? AppColors.textColor : AppColors.mainColor,
          ),
        ),
        trailing: Radio<UserType>(
          value: type,
          groupValue: selectedType,
          onChanged: (_) => onSelect(type),
          fillColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.textColor;
            }
            return AppColors.mainColor;
          }),
        ),
        onTap: () => onSelect(type),
      ),
    );
  }
}
