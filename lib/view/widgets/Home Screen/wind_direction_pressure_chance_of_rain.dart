import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/view/utility/app_colors.dart';

class WindDirectionPressureChanceOfRain extends StatelessWidget {
  const WindDirectionPressureChanceOfRain({
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
                "Wind direction",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  color: AppColors.secondaryColor,
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "3km/h",
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
                "pressure",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  color: AppColors.secondaryColor,
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "21mbar",
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
                "Chance of rain",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  color: AppColors.secondaryColor,
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "74%",
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
