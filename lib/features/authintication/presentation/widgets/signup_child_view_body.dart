import 'package:fakrni/constants/images.dart';
import 'package:fakrni/core/styles/app_colors.dart';
import 'package:fakrni/core/styles/text_styles.dart';
import 'package:fakrni/core/widgets/button_for_nav.dart';
import 'package:fakrni/core/widgets/textformfield_in_auth.dart';
import 'package:fakrni/features/authintication/presentation/widgets/arrow_back.dart';
import 'package:flutter/material.dart';

class SignupChildViewBody extends StatefulWidget {
  const SignupChildViewBody({super.key});

  @override
  State<SignupChildViewBody> createState() => _SignupChildViewBodyState();
}

class _SignupChildViewBodyState extends State<SignupChildViewBody> {
  String? selectedAge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
            ArrowBack(),
              const SizedBox(height: 40),
              Image.asset(
                Assets.imagesImageInonboarding,
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 20),
              Text(
             'مرحبًا يا بطل! أدخل اسمك وسنك',
                 style: TextStyles.fakrnitext.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 30),
              TextformfieldInAuth(hintText: 'اسمك'),
              const SizedBox(height: 20),
              TextformfieldInAuth(hintText: 'اسم الاب'),
              const SizedBox(height: 20),

              /// ✅ Dropdown سليم
             DropdownButtonFormField<String>(
  value: selectedAge,
  decoration: InputDecoration(
    filled: true,
    fillColor: AppColors.textColor, // ✅ لون الخلفية
    contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12), // ✅ مسافة بين النص والسهم
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  ),
  hint: Text(
    'اختر سنك',
    style: TextStyles.fakrnitext.copyWith(
      fontSize: 16,
      color: AppColors.mainColor,
       // ✅ لون النص في الـ hint
    ),
  ),
  dropdownColor: AppColors.mainColor, // ✅ لون القائمة المنسدلة
  style: const TextStyle(
    color: AppColors.textColor, // ✅ لون العناصر داخل القائمة
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  items: ['5', '6', '7', '8'].map((age) {
    return DropdownMenuItem<String>(
      value: age,
      child: Text(age),
    );
  }).toList(),
  onChanged: (value) {
    setState(() {
      selectedAge = value;
    });
  },
),


              const SizedBox(height: 80),
              ButtonForNav()
            ],
          ),
        ),
      ),
    );
  }
}
