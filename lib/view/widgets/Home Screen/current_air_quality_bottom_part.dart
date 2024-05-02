import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/view/utility/app_colors.dart';
import 'package:weather_app/view/utility/assets_path.dart';

class CurrentAirQualityBottomPart extends StatelessWidget {
  const CurrentAirQualityBottomPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "AQI - 45",
          style: GoogleFonts.roboto(
              textStyle: const TextStyle(
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.w500,
          )),
        ),
        SvgPicture.asset(
          AssetsImagePath.airQualitySvg,
          colorFilter:
              ColorFilter.mode(AppColors.offWhiteColor, BlendMode.srcIn),
          fit: BoxFit.scaleDown,
          height: 50,
        ),
      ],
    );
  }
}
