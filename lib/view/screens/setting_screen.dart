import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/controller/unit_controller.dart';
import 'package:weather_app/view/utility/app_colors.dart';
import 'package:weather_app/view/widgets/app_bar_style.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final UnitController unitController = Get.find();

  var temperatureItems = [
    "°C",
    "°F",
  ];

  var windItems = [
    "km/h",
    "mph",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: appBarStyle(
          title: "Setting",
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Units",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Temperature units",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  DropdownButton(
                    dropdownColor: AppColors.shadeColor,
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 18,
                      ),
                    ),
                    underline: const SizedBox(
                      height: 0,
                    ),
                    value: unitController.temperatureUnit.value,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.secondaryColor,
                    ),
                    items: temperatureItems.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          unitController.setTemperatureUnit(newValue!);
                        },
                      );
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Wind speed units",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  DropdownButton(
                    dropdownColor: AppColors.shadeColor,
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 18,
                      ),
                    ),
                    underline: const SizedBox(
                      height: 0,
                    ),
                    value: unitController.windUnit.value,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.secondaryColor,
                    ),
                    items: windItems.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          unitController.windUnit(newValue!);
                        },
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ));
  }
}
