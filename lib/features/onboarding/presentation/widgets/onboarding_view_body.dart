import 'package:fakrni/constants/images.dart';
import 'package:fakrni/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

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
            height: 700,
            child: Stack(
              children: [
                // الـ Container الرئيسي في المنتصف فقط
                Positioned(
                  top: 60,
                  left: 20,
                  right: 20,
                  bottom: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                     // mainAxisAlignment: MainAxisAlignment.center, // توسيط عمودي
                      crossAxisAlignment: CrossAxisAlignment.center, // توسيط أفقي
                      children: [
                        Image.asset(Assets.imagesImageInonboarding),
                        const SizedBox(height: 30),
                        Container(
                          width: 200,
                          height: 50,
                          alignment: Alignment.center, // توسيط النص داخل الزر
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(120),
                          ),
                          child: const Text(
                            'فكرني',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
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
