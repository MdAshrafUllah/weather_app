import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/view/utility/app_colors.dart';

class HumidityUVRealFeel extends StatelessWidget {
  const HumidityUVRealFeel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text(
                "Humidity",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  color: AppColors.secondaryColor,
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "82%",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                )),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text(
                "UV",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  color: AppColors.secondaryColor,
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "2",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                )),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text(
                "Real feel",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  color: AppColors.secondaryColor,
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "28°",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
