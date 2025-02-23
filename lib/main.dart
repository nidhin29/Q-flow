import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qflow/Presentation/Splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 917),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Q Flow',
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: ThemeData(
          fontFamily: 'MonumentExtended',
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.grey,
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.grey.shade100),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.grey.shade100),
            ),
          ),
        ),
      ),
    );
  }
}
