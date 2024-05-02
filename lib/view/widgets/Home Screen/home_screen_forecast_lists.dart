import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/view/utility/app_colors.dart';

class HomeScreenForecastList extends StatelessWidget {
  const HomeScreenForecastList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.shadeColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.offWhiteColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Icon(
                        Icons.more_vert,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Three day forecast",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                      color: AppColors.offWhiteColor,
                    )),
                  )
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.cloud,
                          color: AppColors.secondaryColor,
                        ),
                        Text(
                          "Today Cloudy",
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            color: AppColors.secondaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          )),
                        ),
                        Text(
                          "Cloudy 33°/23°",
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            color: AppColors.secondaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          )),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
