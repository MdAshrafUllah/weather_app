import 'package:weather_app/models/air_quality.dart';
import 'package:weather_app/models/condition.dart';

class Hour {
  String? time;
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
  int? chanceOfRain;
  double? uv;
  AirQuality? airQuality;

  Hour(
      {this.time,
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
      this.chanceOfRain,
      this.uv,
      this.airQuality});

  Hour.fromJson(Map<String, dynamic> json) {
    time = json['time'];
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
    chanceOfRain = json['chance_of_rain'];
    uv = json['uv'];
    airQuality = json['air_quality'] != null
        ? AirQuality.fromJson(json['air_quality'])
        : null;
  }
}
