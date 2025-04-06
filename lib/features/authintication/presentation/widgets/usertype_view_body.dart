import 'package:fakrni/config/routing/app_routes.dart';
import 'package:fakrni/constants/images.dart';
import 'package:fakrni/core/styles/app_colors.dart';
import 'package:fakrni/core/styles/text_styles.dart';
import 'package:fakrni/core/widgets/button_for_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum UserType { parent, student }

class UsertypeViewBody extends StatefulWidget {
  const UsertypeViewBody({super.key});

  @override
  State<UsertypeViewBody> createState() => _UsertypeViewBodyState();
}

class _UsertypeViewBodyState extends State<UsertypeViewBody> {
  UserType? selectedType;

  void selectType(UserType type) {
    setState(() {
      selectedType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),

              Image.asset(
                Assets.imagesImageInonboarding,
                width: 100,
                height: 100,
              ),

              const SizedBox(height: 20),

              Text(
                'اختر من أنت ؟',
                style: TextStyles.fakrnitext.copyWith(fontSize: 24),
              ),

              const SizedBox(height: 30),

              /// Parent
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: selectedType == UserType.parent
                      ? AppColors.mainColor.withOpacity(0.2)
                      : AppColors.textColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selectedType == UserType.parent
                        ? AppColors.mainColor
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: ListTile(
                  leading: Image.asset(Assets.imagesFather, width: 40, height: 40),
                  title: Text(
                    'ولي أمر',
                    style: TextStyles.fakrnitext.copyWith(
                      color: selectedType == UserType.parent
                          ? AppColors.textColor
                          : AppColors.mainColor,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    'للمتابعة والإشراف على الأطفال',
                    style: TextStyle(
                      fontSize: 12,
                      color: selectedType == UserType.parent
                          ? AppColors.textColor
                          : AppColors.mainColor,
                    ),
                  ),
                  trailing: Radio<UserType>(
                    value: UserType.parent,
                    groupValue: selectedType,
                    onChanged: (_) => selectType(UserType.parent),
                    fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.selected)) {
                        return AppColors.textColor;
                      }
                      return AppColors.mainColor;
                    }),
                  ),
                  onTap: () => selectType(UserType.parent),
                ),
              ),

              const SizedBox(height: 20),

              /// Student
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: selectedType == UserType.student
                      ? AppColors.mainColor.withOpacity(0.2)
                      : AppColors.textColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selectedType == UserType.student
                        ? AppColors.mainColor
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: ListTile(
                  leading: Image.asset(Assets.imagesBoy, width: 40, height: 40),
                  title: Text(
                    'طفل',
                    style: TextStyles.fakrnitext.copyWith(
                      color: selectedType == UserType.student
                          ? AppColors.textColor
                          : AppColors.mainColor,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    'للدخول إلى الأنشطة والتحديات',
                    style: TextStyle(
                      fontSize: 12,
                      color: selectedType == UserType.student
                          ? AppColors.textColor
                          : AppColors.mainColor,
                    ),
                  ),
                  trailing: Radio<UserType>(
                    value: UserType.student,
                    groupValue: selectedType,
                    onChanged: (_) => selectType(UserType.student),
                    fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.selected)) {
                        return AppColors.textColor;
                      }
                      return AppColors.mainColor;
                    }),
                  ),
                  onTap: () => selectType(UserType.student),
                ),
              ),

              const SizedBox(height: 90),

              Opacity(
                opacity: selectedType != null ? 1 : 0.5,
                child: IgnorePointer(
                  ignoring: selectedType == null,
                  child:  ButtonForNav(
                    onTap: () {
                       GoRouter.of(context).push(
                        selectedType == UserType.parent
                            ? AppRoutes.signupparent
                            : AppRoutes.signupchild,);
                    },
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
