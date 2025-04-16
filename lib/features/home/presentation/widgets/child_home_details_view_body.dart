import 'package:fakrni/constants/images.dart';
import 'package:fakrni/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ChildHomeDetailsViewBody extends StatelessWidget {
  const ChildHomeDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(child: Column(
        children: [
          CircleAvatar(
            child: Image.asset(Assets.imagesBoy),
          ),
           SizedBox(height: 20,),
           Text('اغسل اسنانك'),
           SizedBox(height: 20,),
           Text('الوصف'),
           SizedBox(height: 20,),
           Column(
            children: [
              Text('1- أقرأ التحدي و أفهمه كويس'),
              Text('2- كل تحدي ليه مده معينه'),
              Text('3- شوف الوقت المناسب للتحدي و أبدا فيه'),
              Text('4 - حاول تكسب أكبر عدد من النقاط '),
            ],
           ),

        ],
      )),
    );
  }
}