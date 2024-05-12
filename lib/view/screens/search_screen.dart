import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/controller/search_location_controller.dart';
import 'package:weather_app/view/screens/home_screen.dart';
import 'package:weather_app/view/utility/app_colors.dart';
import 'package:weather_app/view/widgets/app_bar_style.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchLocationController searchLocationController =
      Get.put(SearchLocationController());
  final TextEditingController _searchText = TextEditingController();
  List<String> myCollection = [];
  bool alreadySave = false;
  @override
  void initState() {
    super.initState();
    savePlaceList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: appBarStyle(
        title: "Search Location",
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(
          () {
            return Column(
              children: [
                searchFieldAndIcon(),
                const SizedBox(
                  height: 15,
                ),
                searchResult(
                  searchLocationController.weather.value.location?.name ?? " ",
                  searchLocationController.weather.value.location?.country ??
                      " ",
                  searchLocationController.weather.value.current?.tempC ?? 0,
                  searchLocationController.weather.value.location?.name == null
                      ? 0
                      : 1,
                )
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchText.dispose();
    super.dispose();
  }

  Widget searchFieldAndIcon() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: TextField(
            controller: _searchText,
            cursorColor: AppColors.secondaryColor,
            textInputAction: TextInputAction.search,
            onSubmitted: (value) {
              findData(_searchText.text.trim());
            },
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
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
                onPressed: () {
                  findData(_searchText.text.trim());
                },
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

  Widget searchResult(String name, String country, double temp, int itemCount) {
    return Expanded(
      child: Obx(
        () {
          if (searchLocationController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: itemCount,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                bool alreadySaved = myCollection.contains(name);
                return Card(
                  color: AppColors.shadeColor,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.secondaryColor,
                      child: IconButton(
                        onPressed: () {
                          saveLocationOnList(name);
                        },
                        icon: Icon(
                          alreadySaved ? Icons.check : Icons.add,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    title: Text(
                      "$name, $country",
                      style: const TextStyle(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    trailing: Text(
                      "${temp.toStringAsFixed(0)}°",
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void findData(String location) {
    if (_searchText.text.isNotEmpty) {
      searchLocationController.fetchLocation(
        location,
      );
    }
    for (var i = 0; i < myCollection.length; i++) {
      if (_searchText.text == myCollection[i]) {
        alreadySave = true;
      }
    }
  }

  Future<void> savePlaceList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savePlaces = prefs.getStringList('savePlaces');
    if (savePlaces != null) {
      setState(() {
        myCollection = savePlaces;
      });
    }
  }

  void saveLocationOnList(String location) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedPlaces = prefs.getStringList('savePlaces');
    savedPlaces ??= <String>[];
    if (!savedPlaces.contains(location)) {
      savedPlaces.add(location);
      await prefs.setStringList('savePlaces', savedPlaces);
      setState(() {
        myCollection = savedPlaces!;
      });
      Get.off(() => HomeScreen(location: location));
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$location is already saved.'),
            backgroundColor: AppColors.shadeColor,
          ),
        );
      }
    }
  }
}
