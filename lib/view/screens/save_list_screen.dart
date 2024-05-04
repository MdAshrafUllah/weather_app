import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/view/utility/app_colors.dart';
import 'package:weather_app/view/widgets/app_bar_style.dart';

class SaveListScreen extends StatefulWidget {
  const SaveListScreen({super.key});

  @override
  State<SaveListScreen> createState() => _SaveListScreenState();
}

class _SaveListScreenState extends State<SaveListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: appBarStyle(
        title: "Your Collection",
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: saveWeatherList(),
      ),
    );
  }

  Widget saveWeatherList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
            color: AppColors.shadeColor,
            child: ListTile(
              title: const Text(
                "Chittagong",
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Cloudy 33°/23°",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    color: AppColors.secondaryColor,
                    // fontSize: 18,
                  ),
                ),
              ),
              trailing: CircleAvatar(
                backgroundColor: AppColors.secondaryColor,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
