import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/view/screens/forecast_list_screen.dart';
import 'package:weather_app/view/screens/search_screen.dart';
import 'package:weather_app/view/utility/app_colors.dart';
import 'package:weather_app/view/utility/assets_path.dart';
import 'package:weather_app/view/widgets/app_bar_style.dart';
import 'package:weather_app/view/widgets/sunrise_sunset.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> forecast = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: appBarStyle(
        title: "Chittagong, Bangladesh",
        arrow: true,
        leadingIcon: IconButton(
          onPressed: () {
            Get.to(() => const SearchScreen());
          },
          icon: const Icon(Icons.add),
        ),
        menu: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              currentTemperature(),
              const SizedBox(
                height: 20,
              ),
              currentAirQuality(),
              const SizedBox(
                height: 20,
              ),
              homeScreenForecastList(),
              const SizedBox(
                height: 5,
              ),
              currentWeatherMoreInfo(),
              const SizedBox(
                height: 5,
              ),
              todayTomorrowSunRise(),
              const SizedBox(
                height: 5,
              ),
              forecastButton(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget currentTemperature() {
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

Widget currentAirQuality() {
  return Container(
    height: 40,
    width: 130,
    decoration: BoxDecoration(
        color: AppColors.offWhiteColor, borderRadius: BorderRadius.circular(5)),
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

Widget homeScreenForecastList() {
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

Widget currentWeatherMoreInfo() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(
          color: AppColors.shadeColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            humidityUVRealFeel(),
            windDirectionPressureChanceOfRain(),
            currentAirQualityBottomPart()
          ],
        ),
      ),
    ),
  );
}

Widget humidityUVRealFeel() {
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

Widget windDirectionPressureChanceOfRain() {
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

Widget currentAirQualityBottomPart() {
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
        colorFilter: ColorFilter.mode(AppColors.offWhiteColor, BlendMode.srcIn),
        fit: BoxFit.scaleDown,
        height: 50,
      ),
    ],
  );
}

Widget todayTomorrowSunRise() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        sunriseSunset(
          "Today",
          "05:20",
          "06:20",
        ),
        sunriseSunset(
          "Tomorrow",
          "05:21",
          "06:21",
        ),
      ],
    ),
  );
}

Widget forecastButton() {
  return GestureDetector(
    onTap: () {
      Get.to(() => const ForecastListScreen());
    },
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
