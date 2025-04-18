import 'package:fakrni/config/routing/app_routing.dart';
import 'package:fakrni/core/cache/cache_helper.dart';
import 'package:fakrni/firebase_options.dart';
import 'package:fakrni/indepency_injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // مهم لتأجيل التشغيل
   CacheHelper().init(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize:  Size(360.w, 690.h),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        title: 'فكرني',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
         locale: const Locale('ar', 'EG'), // تعيين اللغة إلى العربية (مصر)
        supportedLocales:const [
       Locale('en', 'US'), // اللغة الإنجليزية
       Locale('ar', 'EG'), // اللغة العربية
        ],
        localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
        ],
         routerConfig: AppRouting.router,
      ),
    );
  }
}