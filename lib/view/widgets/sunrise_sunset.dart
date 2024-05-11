import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/view/utility/app_colors.dart';
import 'package:weather_app/view/utility/assets_path.dart';

Widget sunriseSunset(
  String title,
  String sunriseTime,
  String sunsetTime,
) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.shadeColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 16,
                )),
              ),
              const SizedBox(
                width: 20,
              ),
              SvgPicture.asset(
                AssetsImagePath.sunriseSvg,
                fit: BoxFit.scaleDown,
                colorFilter: const ColorFilter.mode(
                  AppColors.amberColor,
                  BlendMode.srcIn,
                ),
                height: 60,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sunrise",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    sunriseTime,
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sunset",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    sunsetTime,
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}
