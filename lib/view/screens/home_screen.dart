import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/controller/unit_controller.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/models/forecastday.dart';
import 'package:weather_app/view/screens/forecast_list_screen.dart';
import 'package:weather_app/view/screens/search_screen.dart';
import 'package:weather_app/view/utility/app_colors.dart';
import 'package:weather_app/view/utility/assets_path.dart';
import 'package:weather_app/view/widgets/app_bar_style.dart';
import 'package:weather_app/view/widgets/sunrise_sunset.dart';

class HomeScreen extends StatefulWidget {
  final String location;
  const HomeScreen({
    super.key,
    required this.location,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherController weatherController = Get.put(WeatherController());
  final UnitController unitController = Get.find();
  double aqiValue = 0.0;
  String appBarLocationPartTwo = "";
  List<String> myCollection = [];
  double temperatureFormat = 0.0;
  double maxTemperatureFormat = 0.0;
  double minTemperatureFormat = 0.0;
  double feelslikeTemperatureFormat = 0.0;
  double windFormat = 0.0;

  @override
  void initState() {
    super.initState();
    checkAndFetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (weatherController.weather.value.current == null ||
          weatherController.weather.value.current!.condition == null) {
        return const Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        aqiCalculate();
        temperatureUnitsCheck();
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: appBarStyle(
            title: widget.location,
            arrow: true,
            leadingIcon: IconButton(
              onPressed: () {
                Get.to(() => const SearchScreen());
              },
              icon: const Icon(Icons.add),
            ),
            menu: true,
            selectedLocation: widget.location,
            dayOrNight: weatherController.weather.value.current!.isDay,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              return checkAndFetchWeather();
            },
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    currentTemperature(
                      temperatureFormat,
                      unitController.temperatureUnit.value,
                      weatherController.weather.value.current!.condition!.text
                          as String,
                      maxTemperatureFormat,
                      minTemperatureFormat,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    currentAirQuality(aqiValue),
                    const SizedBox(
                      height: 20,
                    ),
                    homeScreenForecastList(
                      weatherController.weather.value.forecast!.forecastday!,
                      unitController.temperatureUnit.value,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    currentWeatherMoreInfo(
                      weatherController.weather.value.current!.humidity as int,
                      weatherController.weather.value.current!.uv as double,
                      feelslikeTemperatureFormat,
                      windFormat,
                      unitController.windUnit.value,
                      weatherController.weather.value.current!.pressureIn
                          as double,
                      weatherController.weather.value.forecast!.forecastday![0]
                          .day!.dailyChanceOfRain as int,
                      aqiValue,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    todayTomorrowSunRise(
                      weatherController.weather.value.forecast!.forecastday![0]
                          .astro!.sunrise as String,
                      weatherController.weather.value.forecast!.forecastday![0]
                          .astro!.sunset as String,
                      weatherController.weather.value.forecast!.forecastday![1]
                          .astro!.sunrise as String,
                      weatherController.weather.value.forecast!.forecastday![1]
                          .astro!.sunset as String,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    forecastButton(
                      weatherController.weather.value.forecast!.forecastday!,
                      widget.location,
                      unitController.temperatureUnit.value,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });
  }

  void checkAndFetchWeather() async {
    await savePlaceList();
    if (myCollection.isEmpty) {
      Get.off(() => const SearchScreen());
    } else {
      if (myCollection.contains(widget.location)) {
        weatherController.fetchWeather(widget.location, 5);
      } else {
        weatherController.fetchWeather(myCollection.first, 5);
        log(myCollection.toString());
      }
    }
  }

  Future<void> savePlaceList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savePlaces = prefs.getStringList('savePlaces');
    if (savePlaces != null) {
      setState(() {
        myCollection = savePlaces;
      });
    }
  }

  void temperatureUnitsCheck() {
    final temperatureUnitValue = unitController.temperatureUnit.value;
    final windUnitValue = unitController.windUnit.value;
    final currentWeather = weatherController.weather.value.current;
    final forecastWeather =
        weatherController.weather.value.forecast!.forecastday![0].day!;

    if (currentWeather != null) {
      if (temperatureUnitValue == "°C") {
        temperatureFormat = currentWeather.tempC as double;
        maxTemperatureFormat = forecastWeather.maxtempC as double;
        minTemperatureFormat = forecastWeather.mintempC as double;
        feelslikeTemperatureFormat = currentWeather.feelslikeC as double;
      } else {
        temperatureFormat = currentWeather.tempF as double;
        maxTemperatureFormat = forecastWeather.maxtempF as double;
        minTemperatureFormat = forecastWeather.mintempF as double;
        feelslikeTemperatureFormat = currentWeather.feelslikeF as double;
      }

      if (windUnitValue == "km/h") {
        windFormat = currentWeather.windKph as double;
      } else {
        windFormat = currentWeather.windMph as double;
      }
    }
  }

  void aqiCalculate() {
    double pm25 =
        weatherController.weather.value.current!.airQuality!.pm25 as double;
    double pm10 =
        weatherController.weather.value.current!.airQuality!.pm10 as double;
    double so2 =
        weatherController.weather.value.current!.airQuality!.so2 as double;
    double no2 =
        weatherController.weather.value.current!.airQuality!.no2 as double;
    double o3 =
        weatherController.weather.value.current!.airQuality!.o3 as double;
    double maxAqi = 0.0;
    if (pm25 > maxAqi) {
      maxAqi = pm25;
    }
    if (pm10 > maxAqi) {
      maxAqi = pm10;
    }
    if (so2 > maxAqi) {
      maxAqi = so2;
    }
    if (no2 > maxAqi) {
      maxAqi = no2;
    }
    if (o3 > maxAqi) {
      maxAqi = o3;
    }
    aqiValue = maxAqi;
  }
}

Widget currentTemperature(double temp, String tempUnit, String condition,
    double maxtemp, double mintemp) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            temp.toStringAsFixed(0),
            style: GoogleFonts.scada(
                textStyle: const TextStyle(
              fontSize: 100,
              color: AppColors.secondaryColor,
            )),
          ),
          Text(
            tempUnit,
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
              fontSize: 50,
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.w600,
            )),
          ),
        ],
      ),
      Center(
        child: Text(
          "$condition\n${maxtemp.toStringAsFixed(0)}°/${mintemp.toStringAsFixed(0)}°",
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
              textStyle: const TextStyle(
            color: AppColors.secondaryColor,
            fontSize: 20,
          )),
        ),
      ),
    ],
  );
}

Widget currentAirQuality(double airQuality) {
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
          airQuality.toStringAsFixed(0),
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

Widget homeScreenForecastList(
    List<Forecastday> forecast, String temperatureUnitValue) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.shadeColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 15,
          left: 5,
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
                    "Next Three days forecast",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                      color: AppColors.secondaryColor,
                    )),
                  )
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                final day = forecast[index + 1].day!;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network("https:${day.condition!.icon!}"),
                    const Spacer(),
                    Text(
                      day.condition!.text!,
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                    ),
                    const Spacer(),
                    Text(
                      temperatureUnitValue == "°C"
                          ? "${day.maxtempC!.toStringAsFixed(0)}°/${day.mintempC!.toStringAsFixed(0)}°"
                          : "${day.maxtempF!.toStringAsFixed(0)}°/${day.mintempF!.toStringAsFixed(0)}°",
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}

Widget currentWeatherMoreInfo(
    int humidity,
    double uv,
    double feelslike,
    double wind,
    String windUnit,
    double pressure,
    int chanceOfRain,
    double airQuality) {
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
            humidityUVRealFeel(humidity, uv, feelslike),
            windDirectionPressureChanceOfRain(
                wind, windUnit, pressure, chanceOfRain),
            currentAirQualityBottomPart(airQuality)
          ],
        ),
      ),
    ),
  );
}

Widget humidityUVRealFeel(
  int humidity,
  double uv,
  double feelslike,
) {
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
              humidity.toString(),
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
              uv.toStringAsFixed(0),
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
              "${feelslike.toStringAsFixed(0)}°",
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

Widget windDirectionPressureChanceOfRain(
  double wind,
  String windUnit,
  double pressure,
  int chanceOfRain,
) {
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
              "${wind.toStringAsFixed(0)} $windUnit",
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
              "${pressure.toStringAsFixed(0)} mbar",
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
              "$chanceOfRain %",
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

Widget currentAirQualityBottomPart(double airQuality) {
  return Column(
    children: [
      Text(
        "AQI ${airQuality.toStringAsFixed(0)}",
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

Widget todayTomorrowSunRise(String sunrise, String sunset,
    String tomorrowSunrise, String tomorrowSunset) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        sunriseSunset(
          "Today",
          sunrise,
          sunset,
        ),
        sunriseSunset(
          "Tomorrow",
          tomorrowSunrise,
          tomorrowSunset,
        ),
      ],
    ),
  );
}

Widget forecastButton(
    List<Forecastday> forecast, String location, String temperatureUnitValue) {
  return GestureDetector(
    onTap: () {
      Get.to(() => ForecastListScreen(
            forecast: forecast,
            location: location,
            temperatureUnitValue: temperatureUnitValue,
          ));
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
