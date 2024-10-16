import 'package:get/get.dart';
import 'package:Cloudy/Resources/CitiesNamesList/city_names_list.dart';

class CitiesController extends GetxController {
  var allCities = CityNamesList.majorCities.obs;
  var filteredCities = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredCities.assignAll(allCities);
  }

  void filterCities(String query) {
    if (query.isEmpty) {
      filteredCities.assignAll(allCities);
    } else {
      filteredCities.assignAll(allCities
          .where((city) => city.toLowerCase().contains(query.toLowerCase())));
    }
  }

  void clearFilter() {
    filteredCities.assignAll(allCities);
  }
}
