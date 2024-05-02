import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/view/utility/app_colors.dart';

class ForecastButton extends StatelessWidget {
  const ForecastButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 60,
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.shadeColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '5-day forecast',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
