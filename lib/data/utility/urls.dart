import 'package:weather_app/data/utility/api.dart';

class Urls {
  static const String _basedUrlPrimary = "http://api.weatherapi.com/v1";
  static const String _basedUrlSecondary =
      "https://api.openweathermap.org/data/2.5";

  static String forecast(String location, int day) =>
      "$_basedUrlPrimary/forecast.json?key=${WeatherApi.weatherApiKey}&q=$location&aqi=yes&days=$day";
  static String search(String location) =>
      "$_basedUrlPrimary/forecast.json?key=${WeatherApi.weatherApiKey}&q=$location";

  static String current(String lat, String lon, String units) =>
      "$_basedUrlSecondary/weather?lat=$lat&lon=$lon&appid=${WeatherApi.openWeatherMapApiKey}&units=$units";
}
