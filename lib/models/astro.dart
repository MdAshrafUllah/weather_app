class Astro {
  String? sunrise;
  String? sunset;

  Astro({
    this.sunrise,
    this.sunset,
  });

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}
