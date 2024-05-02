import 'package:flutter/material.dart';
import 'package:weather_app/view/utility/app_colors.dart';
import 'package:weather_app/view/widgets/Home%20Screen/current_air_quality_bottom_part.dart';
import 'package:weather_app/view/widgets/Home%20Screen/humidity_uv_real_feel.dart';
import 'package:weather_app/view/widgets/Home%20Screen/wind_direction_pressure_chance_of_rain.dart';

class CurrentWeatherMoreInfo extends StatelessWidget {
  const CurrentWeatherMoreInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.shadeColor,
            borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HumidityUVRealFeel(),
              WindDirectionPressureChanceOfRain(),
              CurrentAirQualityBottomPart()
            ],
          ),
        ),
      ),
    );
  }
}
