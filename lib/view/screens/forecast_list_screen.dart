import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/models/forecastday.dart';
import 'package:weather_app/view/utility/app_colors.dart';
import 'package:weather_app/view/widgets/app_bar_style.dart';

class ForecastListScreen extends StatelessWidget {
  final List<Forecastday> forecast;
  final String? location;
  final String? temperatureUnitValue;
  const ForecastListScreen({
    super.key,
    required this.forecast,
    required this.location,
    required this.temperatureUnitValue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: appBarStyle(
        title: "5-day forecast",
        locationIcon: true,
        selectedLocation: location,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            forecastList(forecast),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.2,
            )
          ],
        ),
      ),
    );
  }

  Widget forecastList(List<Forecastday> forecast) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          DateTime forecastDate = DateTime.parse(forecast[index].date ?? 'N/A');
          bool isCurrentDate = DateTime.now().day == forecastDate.day &&
              DateTime.now().month == forecastDate.month &&
              DateTime.now().year == forecastDate.year;
          Color containerColor =
              isCurrentDate ? AppColors.offWhiteColor : AppColors.shadeColor;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 1.8,
                  right: 1.8,
                ),
                child: Column(
                  children: [
                    Text(
                      DateFormat('EEE').format(
                        DateTime.parse(forecast[index].date ?? 'N/A'),
                      ),
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      DateFormat('dd/MM').format(
                        DateTime.parse(forecast[index].date ?? 'N/A'),
                      ),
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Image.network(
                        "https:${forecast[index].day?.condition!.icon!}"),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      temperatureUnitValue == "°C"
                          ? '${forecast[index].day?.maxtempC!.toStringAsFixed(0)}°'
                          : '${forecast[index].day?.maxtempF!.toStringAsFixed(0)}°',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      temperatureUnitValue == "°C"
                          ? '${forecast[index].day?.mintempC!.toStringAsFixed(0)}°'
                          : '${forecast[index].day?.mintempF!.toStringAsFixed(0)}°',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
