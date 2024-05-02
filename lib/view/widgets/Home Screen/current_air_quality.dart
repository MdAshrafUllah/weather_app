import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/view/utility/app_colors.dart';

class CurrentAirQuality extends StatelessWidget {
  const CurrentAirQuality({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 130,
      decoration: BoxDecoration(
          color: AppColors.offWhiteColor,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.air,
            color: AppColors.secondaryColor,
          ),
          Text(
            "AQI",
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 20,
            )),
          ),
          Text(
            "- 45",
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 20,
            )),
          ),
        ],
      ),
    );
  }
}
