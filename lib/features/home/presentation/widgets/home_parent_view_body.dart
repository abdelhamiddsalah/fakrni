import 'package:fakrni/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class HomeParentViewBody extends StatelessWidget {
  const HomeParentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'أنت الآن تستطيع تتابع نتائج طفلك',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
           Center(
            child: Text('لم يوجد أطفال مسجلين بعد',
                style:TextStyles.fakrnitext.copyWith(
                  fontSize: 20,
                )),
           ),
        ],
      )),
    );
  }
}