import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/view/utility/app_colors.dart';

class CurrentTemperature extends StatelessWidget {
  const CurrentTemperature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '30',
              style: GoogleFonts.scada(
                  textStyle: const TextStyle(
                fontSize: 100,
                color: AppColors.secondaryColor,
              )),
            ),
            Text(
              '°',
              style: GoogleFonts.scada(
                  textStyle: const TextStyle(
                fontSize: 50,
                color: AppColors.secondaryColor,
              )),
            ),
            Text(
              'C',
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                fontSize: 50,
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w600,
              )),
            ),
          ],
        ),
        Text(
          "Cloudy 33°/23°",
          style: GoogleFonts.roboto(
              textStyle: const TextStyle(
            color: AppColors.secondaryColor,
            fontSize: 25,
          )),
        ),
      ],
    );
  }
}
