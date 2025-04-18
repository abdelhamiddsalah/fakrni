import 'package:fakrni/constants/images.dart';
import 'package:fakrni/core/enums/enums.dart';
import 'package:fakrni/core/styles/app_colors.dart';
import 'package:fakrni/core/styles/text_styles.dart';
import 'package:fakrni/core/widgets/star_image.dart';
import 'package:fakrni/features/authintication/presentation/widgets/button_in_usertype.dart';
import 'package:fakrni/features/authintication/presentation/widgets/user_type_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              SizedBox(height: 40.h),
              const StarImage(),
              SizedBox(height: 20.h),
              Text(
                'اختر من أنت ؟',
                style: TextStyles.fakrnitext.copyWith(fontSize: 24.sp),
              ),
               SizedBox(height: 30.h),
              UserTypeOption(
                type: UserType.parent,
                selectedType: selectedType,
                onSelect: selectType,
                title: 'ولي أمر',
                subtitle: 'للمتابعة والإشراف على الأطفال',
                imagePath: Assets.imagesFather,
              ),
              SizedBox(height: 20.h),
              UserTypeOption(
                type: UserType.student,
                selectedType: selectedType,
                onSelect: selectType,
                title: 'طفل',
                subtitle: 'للدخول إلى الأنشطة والتحديات',
                imagePath: Assets.imagesBoy,
              ),
              SizedBox(height: 90.h),
              ButtonInUserType(selectedType: selectedType),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
