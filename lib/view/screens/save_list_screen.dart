// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:weather_app/controller/search_location_controller.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/view/screens/home_screen.dart';
import 'package:weather_app/view/screens/search_screen.dart';
import 'package:weather_app/view/utility/app_colors.dart';
import 'package:weather_app/view/widgets/app_bar_style.dart';

class SaveListScreen extends StatefulWidget {
  final String? selectedLocation;
  const SaveListScreen({
    super.key,
    required this.selectedLocation,
  });
  @override
  State<SaveListScreen> createState() => _SaveListScreenState();
}

class _SaveListScreenState extends State<SaveListScreen> {
  final SearchLocationController searchLocationController =
      Get.put(SearchLocationController());
  List<String> myCollection = [];
  Map<String, WeatherModel?> weatherData = {};
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    savePlaceList();
  }

  void fetchWeatherForLocation(String location) {
    searchLocationController.fetchLocation(location,
        onSuccess: (WeatherModel weather) {
      setState(() {
        weatherData[location] = weather;
      });
    }, onError: (dynamic error) {
      log("Error fetching weather for $location: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: appBarStyle(
        title: "Your Collection",
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  for (String location in myCollection)
                    GestureDetector(
                      onTap: () {
                        Get.offAll(() => HomeScreen(location: location));
                      },
                      child: Card(
                        color: AppColors.shadeColor,
                        child: ListTile(
                          title: Text(
                            location,
                            style: const TextStyle(
                              color: AppColors.secondaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle:
                              weatherData[location]?.forecast?.forecastday !=
                                      null
                                  ? Text(
                                      '${weatherData[location]!.forecast!.forecastday![0].day!.maxtempC!.toStringAsFixed(0)}°/${weatherData[location]!.forecast!.forecastday![0].day!.mintempC!.toStringAsFixed(0)}°',
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                          color: AppColors.secondaryColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      'Loading...',
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                          color: AppColors.secondaryColor,
                                        ),
                                      ),
                                    ),
                          trailing: CircleAvatar(
                            backgroundColor: AppColors.secondaryColor,
                            child: IconButton(
                              onPressed: () async {
                                await deletedLocation(location);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
    );
  }

  Future<void> savePlaceList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savePlaces = prefs.getStringList('savePlaces');
    if (savePlaces != null) {
      setState(() {
        myCollection = savePlaces;
      });
      for (String location in myCollection) {
        fetchWeatherForLocation(location);
      }
    }
  }

  Future<void> deletedLocation(String location) async {
    setState(() {
      _isLoading = true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savePlaces = prefs.getStringList('savePlaces');
    if (savePlaces != null) {
      savePlaces.remove(location);
      await prefs.setStringList('savePlaces', savePlaces);
      setState(() {
        myCollection.remove(location);
        weatherData.remove(location);
      });
      if (location == widget.selectedLocation && myCollection.isNotEmpty) {
        Get.offAll(() => HomeScreen(location: myCollection.first));
      } else if (location == widget.selectedLocation && myCollection.isEmpty) {
        Get.offAll(() => const SearchScreen());
      }
    }
    setState(() {
      _isLoading = false;
    });
  }
}
