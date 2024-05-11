import 'package:get/get.dart';
import 'package:weather_app/data/services/network_caller.dart';
import 'package:weather_app/models/weather.dart';

// class SearchLocationController extends GetxController {
//   var weather = WeatherModel().obs;
//   var isLoading = false.obs;

//   void fetchLocation(String location,
//       [Function(WeatherModel)? onSuccess, Function(dynamic)? onError]) {
//     isLoading.value = true;
//     NetworkCaller.getLocation(location).then((fetchedWeather) {
//       weather.value = fetchedWeather;
//       isLoading.value = false;
//       onSuccess!(fetchedWeather);
//     }).catchError((error) {
//       isLoading.value = false;
//       onError!(error);
//     });
//   }
// }

class SearchLocationController extends GetxController {
  var weather = WeatherModel().obs;
  var isLoading = false.obs;

  void fetchLocation(String location,
      {Function(WeatherModel)? onSuccess, Function(dynamic)? onError}) {
    isLoading.value = true;
    NetworkCaller.getLocation(location).then((fetchedWeather) {
      weather.value = fetchedWeather;
      isLoading.value = false;
      // Check if onSuccess is not null before calling it
      onSuccess?.call(fetchedWeather);
    }).catchError((error) {
      isLoading.value = false;
      // Check if onError is not null before calling it
      onError?.call(error);
    });
  }
}
