import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/view/utility/app_colors.dart';
import 'package:weather_app/view/widgets/app_bar_style.dart';

class ForecastListScreen extends StatelessWidget {
  const ForecastListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: appBarStyle(
        title: "5-day forecast",
        locationIcon: true,
        location: "Chittagong, Bangladesh",
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            forecastList(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
            )
          ],
        ),
      ),
    );
  }

  Widget forecastList() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.shadeColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Today',
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
                      '4/30',
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
                    const Icon(
                      Icons.cloud,
                      color: AppColors.secondaryColor,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      '30°',
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
                      '27°',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
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
