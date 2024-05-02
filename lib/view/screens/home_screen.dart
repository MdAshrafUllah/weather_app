import 'package:flutter/material.dart';
import 'package:weather_app/view/utility/app_colors.dart';
import 'package:weather_app/view/widgets/app_bar_style.dart';
import 'package:weather_app/view/widgets/Home%20Screen/current_air_quality.dart';
import 'package:weather_app/view/widgets/Home%20Screen/current_temperature.dart';
import 'package:weather_app/view/widgets/Home%20Screen/current_weather_more_info.dart';
import 'package:weather_app/view/widgets/Home%20Screen/forecast_button.dart';
import 'package:weather_app/view/widgets/Home%20Screen/home_screen_forecast_lists.dart';
import 'package:weather_app/view/widgets/Home%20Screen/today_tomorrow_sun_rise.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> forecast = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: appBarStyle(
        'Chittagong, Bangladesh',
        arrow: true,
        leadingIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CurrentTemperature(),
              SizedBox(
                height: 20,
              ),
              CurrentAirQuality(),
              SizedBox(
                height: 20,
              ),
              HomeScreenForecastList(),
              SizedBox(
                height: 5,
              ),
              CurrentWeatherMoreInfo(),
              SizedBox(
                height: 5,
              ),
              TodayTomorrowSunRise(),
              SizedBox(
                height: 5,
              ),
              ForecastButton(),
            ],
          ),
        ),
      ),
    );
  }
}
