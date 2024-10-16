import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CityNameController extends GetxController {
  final _cityName = ''.obs;
  final _savedCityName = ''.obs;
  String get cityName => _cityName.value;
  String get savedCityName => _savedCityName.value;
  var isLoading = false.obs;

  void showLoading() {
    isLoading.value = true;
  }

  void hideLoading() {
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    loadCityName();
  }

  setItem(String city) {
    _cityName.value = city;
  }

  addItem() async {
    await saveCityName(_cityName.value);
    await loadCityName();
    if (kDebugMode) {
      print("Selected city ${_cityName.value} Saved");
    }
  }

  Future<void> saveCityName(String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cityName', city);
  }

  loadCityName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _savedCityName.value = prefs.getString('cityName') ?? '';
  }
}
