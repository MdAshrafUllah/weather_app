import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/view/screens/save_list_screen.dart';
import 'package:weather_app/view/screens/setting_screen.dart';
import 'package:weather_app/view/utility/app_colors.dart';

AppBar appBarStyle({
  String? title,
  IconButton? leadingIcon,
  bool arrow = false,
  bool menu = false,
  bool locationIcon = false,
  String? location,
  String? selectedLocation,
  int? dayOrNight,
}) {
  String truncatedTitle = title?.split(' ').take(2).join(' ') ?? '';
  String truncatedSelectedLocation =
      selectedLocation?.split(' ').take(2).join(' ') ?? '';

  log(dayOrNight.toString());

  return AppBar(
    backgroundColor: AppColors.transparentColor,
    foregroundColor: AppColors.secondaryColor,
    elevation: 0,
    leading: leadingIcon,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        arrow == true
            ? GestureDetector(
                onTap: () {
                  Get.to(() => SaveListScreen(
                        selectedLocation: selectedLocation,
                      ));
                },
                child: Text(
                  truncatedTitle,
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            : Text(
                truncatedTitle,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
        arrow == true
            ? const Icon(Icons.arrow_forward_ios_rounded)
            : const SizedBox(),
        const Spacer(),
        menu == true
            ? dayOrNight == 1
                ? const Text(
                    "Day",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : const Text(
                    "Night",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor,
                    ),
                  )
            : const SizedBox(),
        const SizedBox(
          width: 5,
        ),
        menu == true
            ? dayOrNight == 1
                ? const Icon(
                    Icons.wb_sunny,
                    size: 18,
                  )
                : const RotationTransition(
                    turns: AlwaysStoppedAnimation(-45 / 360),
                    child: Icon(
                      Icons.nightlight_round_sharp,
                      size: 18,
                    ),
                  )
            : const SizedBox(),
        locationIcon == true
            ? const Icon(
                Icons.pin_drop,
                size: 18,
              )
            : const SizedBox(),
        locationIcon == true
            ? Text(
                truncatedSelectedLocation,
                style: const TextStyle(
                  fontSize: 16,
                ),
              )
            : const SizedBox(),
      ],
    ),
    actions: [
      menu == true
          ? IconButton(
              onPressed: () {
                Get.to(() => const SettingScreen());
              },
              icon: const Icon(Icons.more_vert),
            )
          : const SizedBox(),
    ],
  );
}
