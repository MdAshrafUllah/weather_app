import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/screens/splash_screen.dart';
import 'package:weather_app/view/utility/app_colors.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorSchemeSeed: AppColors.primaryColor,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
