import 'package:weather_app/data/utility/api.dart';

class Urls {
  static const String _basedUrl = "http://api.weatherapi.com/v1";

  static String forecast(String location, int day) =>
      "$_basedUrl/forecast.json?key=${WeatherApi.apiKey}&q=$location&days=$day";
  static String search(String location) =>
      "$_basedUrl/current.json?key=${WeatherApi.apiKey}&q=$location";
}
