import 'package:get/get.dart';

class UnitController extends GetxController {
  RxString temperatureUnit = "°C".obs;
  RxString windUnit = "km/h".obs;

  void setTemperatureUnit(String unit) {
    temperatureUnit.value = unit;
  }

  void setWindUnit(String unit) {
    windUnit.value = unit;
  }
}
