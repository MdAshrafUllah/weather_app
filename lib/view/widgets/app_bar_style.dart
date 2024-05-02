import 'package:flutter/material.dart';
import 'package:weather_app/view/utility/app_colors.dart';

AppBar appBarStyle(
  String title, {
  IconButton? leadingIcon,
  bool arrow = false,
}) {
  return AppBar(
    backgroundColor: AppColors.transparentColor,
    foregroundColor: AppColors.secondaryColor,
    elevation: 0,
    leading: leadingIcon,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        arrow == true
            ? const Icon(Icons.arrow_forward_ios_rounded)
            : const SizedBox()
      ],
    ),
    centerTitle: true,
    actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))],
  );
}
