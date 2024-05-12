import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/unit_controller.dart';
import 'package:weather_app/view/screens/splash_screen.dart';
import 'package:weather_app/view/utility/app_colors.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        colorSchemeSeed: AppColors.primaryColor,
        useMaterial3: true,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.secondaryColor,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.secondaryColor,
            ),
          ),
        ),
      ),
      home: const SplashScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put<UnitController>(UnitController());
      }),
    );
  }
}
