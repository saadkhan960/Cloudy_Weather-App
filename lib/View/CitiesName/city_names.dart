import 'dart:io';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Cloudy/Utilities/utils.dart';
import 'package:Cloudy/ViewModel/Controllers/anim_search_bar_controller.dart';
import 'package:Cloudy/ViewModel/Controllers/city_name_controller.dart';
import 'package:Cloudy/ViewModel/Services/SplashScreen/splash_services.dart';

class CitiesName extends StatefulWidget {
  const CitiesName({super.key});

  @override
  State<CitiesName> createState() => _CitiesNameState();
}

class _CitiesNameState extends State<CitiesName> {
  final CityNameController citySelectionController =
      Get.put(CityNameController());
  final CitiesController citiesController = Get.put(CitiesController());
  final TextEditingController searchController = TextEditingController();

  Future<void> onRefresh() async {
    try {
      String cityname = citySelectionController.savedCityName;
      print(cityname);
      await SplashServices.getApiDataOnApp(cityname);
    } on SocketException {
      const Color.fromARGB(255, 249, 107, 96);
    } catch (e) {
      Utils.flushBar(
          context, "Network Error", const Color.fromARGB(255, 249, 107, 96));
    }
  }

  @override
  void initState() {
    super.initState();
    citySelectionController.setItem("");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background/Gradient.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
          ),
          title: const Text(
            "Select City",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: [
            AnimSearchBar(
              boxShadow: false,
              autoFocus: true,
              textFieldColor: const Color.fromARGB(62, 33, 205, 243),
              searchIconColor: Colors.white,
              textFieldIconColor: Colors.white,
              width: 300,
              textController: searchController,
              onSuffixTap: () {
                searchController.clear();
                citiesController.clearFilter();
              },
              onChange: (query) {
                citiesController.filterCities(query);
              },
              onSubmitted: (query) {
                citiesController.filterCities(query);
              },
              closeSearchOnSuffixTap: true,
              color: Colors.transparent,

              style: const TextStyle(
                  color: Colors
                      .white), // added this line to set the text color to white
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                    // itemCount: CityNamesList.majorCities.length,
                    itemCount: citiesController.filteredCities.length,
                    itemBuilder: (context, index) {
                      // List<String> data = CityNamesList.majorCities;
                      List<String> data =
                          citiesController.filteredCities; // modified this line
                      return Obx(() => Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Color.fromARGB(29, 0, 0, 0),
                                    width: 1.0),
                              ),
                            ),
                            child: ListTile(
                              onTap: () {
                                if (citySelectionController.cityName == '') {
                                  citySelectionController.setItem(data[index]);
                                } else if (citySelectionController.cityName !=
                                    data[index]) {
                                  citySelectionController.setItem(data[index]);
                                } else {
                                  citySelectionController.setItem('');
                                }
                              },
                              leading: Text(
                                "${index + 1})",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              title: Text(
                                data[index],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              trailing: citySelectionController.cityName ==
                                      data[index]
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )
                                  : citySelectionController.savedCityName !=
                                              '' &&
                                          citySelectionController
                                                  .savedCityName ==
                                              data[index]
                                      ? const Icon(
                                          Icons.check_circle,
                                          color: Colors.white,
                                        )
                                      : null,
                            ),
                          ));
                    },
                  )),
            ),
            Obx(() => citySelectionController.cityName != ""
                ? Container(
                    width: 200,
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        citySelectionController.showLoading();
                        try {
                          await citySelectionController.addItem();
                          await onRefresh();
                          // await citySelectionController.loadCityName();
                          citySelectionController.setItem("");
                        } finally {
                          citySelectionController.hideLoading();
                        }
                      },
                      child: Obx(() {
                        return !citySelectionController.isLoading.value
                            ? const Text(
                                "Apply",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  strokeAlign: CircularProgressIndicator
                                      .strokeAlignInside,
                                  color: Colors.white,
                                ),
                              );
                      }),
                    ),
                  )
                : const SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
