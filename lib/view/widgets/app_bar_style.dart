import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/view/screens/save_list_screen.dart';
import 'package:weather_app/view/utility/app_colors.dart';

AppBar appBarStyle({
  String? title,
  IconButton? leadingIcon,
  bool arrow = false,
  bool menu = false,
  bool locationIcon = false,
  String? location,
  String? selectedLocation,
}) {
  return AppBar(
    backgroundColor: AppColors.transparentColor,
    foregroundColor: AppColors.secondaryColor,
    elevation: 0,
    leading: leadingIcon,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        arrow == true
            ? TextButton(
                onPressed: () {
                  Get.to(() => SaveListScreen(
                        selectedLocation: selectedLocation,
                      ));
                },
                child: Text(
                  title!,
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            : Text(
                title!,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
        arrow == true
            ? const Icon(Icons.arrow_forward_ios_rounded)
            : const SizedBox(),
        const SizedBox(
          width: 10,
        ),
        locationIcon == true
            ? const Icon(
                Icons.pin_drop,
                size: 18,
              )
            : const SizedBox(),
        locationIcon == true
            ? Text(
                "$location",
                style: const TextStyle(
                  fontSize: 14,
                ),
              )
            : const SizedBox(),
      ],
    ),
    actions: [
      menu == true
          ? IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            )
          : const SizedBox(),
    ],
  );
}
