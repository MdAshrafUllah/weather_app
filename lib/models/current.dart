import 'package:weather_app/models/air_quality.dart';
import 'package:weather_app/models/condition.dart';

class Current {
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  double? pressureIn;
  int? humidity;
  double? feelslikeC;
  double? feelslikeF;
  double? uv;
  AirQuality? airQuality;

  Current(
      {this.lastUpdated,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windMph,
      this.windKph,
      this.pressureIn,
      this.humidity,
      this.feelslikeC,
      this.feelslikeF,
      this.uv,
      this.airQuality});

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    pressureIn = json['pressure_in'];
    humidity = json['humidity'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    uv = json['uv'];
    airQuality = json['air_quality'] != null
        ? AirQuality.fromJson(json['air_quality'])
        : null;
  }
}
