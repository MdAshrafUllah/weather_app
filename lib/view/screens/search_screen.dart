import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/view/utility/app_colors.dart';
import 'package:weather_app/view/widgets/app_bar_style.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: appBarStyle(
        title: "Search Location",
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            searchFieldAndIcon(),
            const SizedBox(
              height: 15,
            ),
            searchResult()
          ],
        ),
      ),
    );
  }

  Widget searchFieldAndIcon() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: TextField(
            controller: _searchText,
            cursorColor: AppColors.secondaryColor,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                color: AppColors.offWhiteColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppColors.shadeColor,
            ),
            style: const TextStyle(
              color: AppColors.secondaryColor,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.shadeColor,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.secondaryColor,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget searchResult() {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
            color: AppColors.shadeColor,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.secondaryColor,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              title: const Text(
                "Chittagong",
                style: TextStyle(
                  color: AppColors.secondaryColor,
                ),
              ),
              trailing: Text(
                "Cloudy 33°/23°",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 18,
                )),
              ),
            ),
          );
        },
      ),
    );
  }
}
