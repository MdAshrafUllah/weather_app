import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/utility/urls.dart';
import 'package:weather_app/models/weather.dart';

class NetworkCaller {
  static Future<WeatherModel> getLocationWeather(
      String location, int day) async {
    final response = await http.get(Uri.parse(Urls.forecast(location, day)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  static Future<WeatherModel> getLocation(String location) async {
    final response = await http.get(Uri.parse(Urls.search(location)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
