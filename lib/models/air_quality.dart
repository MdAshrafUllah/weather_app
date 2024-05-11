class AirQuality {
  double? no2;
  double? o3;
  double? so2;
  double? pm25;
  double? pm10;

  AirQuality({
    this.no2,
    this.o3,
    this.so2,
    this.pm25,
    this.pm10,
  });

  AirQuality.fromJson(Map<String, dynamic> json) {
    no2 = json['no2'];
    o3 = json['o3'];
    so2 = json['so2'];
    pm25 = json['pm2_5'];
    pm10 = json['pm10'];
  }
}
