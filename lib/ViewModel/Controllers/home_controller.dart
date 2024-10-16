import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:Cloudy/Model/data_model.dart';
import 'package:Cloudy/Repository/home_repository.dart';
import 'package:Cloudy/Resources/Images/image_assets.dart';
import 'package:Cloudy/Utilities/utilities.dart';
import 'package:Cloudy/Utilities/utils.dart';
import 'package:Cloudy/View/Home/home_page.dart';

class HomeController extends GetxController {
  Rx<DataModel?> model = Rx<DataModel?>(null);
  Rx<Hours?> hours = Rx<Hours?>(null);
  Rx<int?> currentIndex = 0.obs;
  RxBool animator = false.obs;

  int getCurrentIndex() => currentIndex.value!;
  bool compareIndex(int index) => index == currentIndex.value!;
  String getHour(int index) => Utilities.formateTimeWithoutAmPm(
      model.value!.days![0].hours![index].datetime!.toString());
  String getHourinAmPm(int index) => Utilities.formattedTime(
      model.value!.days![0].hours![index].datetime!.toString());
  String getSolarRadiation(int index) =>
      model.value!.days![0].hours![index].solarenergy!.double().toString();
  String getImage(int index) {
    return Utilities.imageMap[
                model.value!.days![0].hours![index].icon.toString()] ==
            null
        ? ImageAssets.clearDay
        : Utilities
            .imageMap[model.value!.days![0].hours![index].icon.toString()]!;
  }

  String getAddress() =>
      '${model.value!.address.toString()}, \n${model.value!.timezone.toString()}';

  String getConditions() => hours.value!.conditions.toString();
  String getCurrentTemp() => hours.value!.temp!.round().toString();
  String getFeelLike() => hours.value!.feelslike!.round().toString();
  String getCloudCover() {
    double cloudCover = hours.value!.cloudcover!;
    if (cloudCover % 1 == 0) {
      return cloudCover.toInt().toString(); // Display as int
    } else {
      return cloudCover.toStringAsFixed(1); // Display as double
    }
  }

  String getWindSpeed() => hours.value!.windspeed!.round().toString();
  // String getHumidity() => hours.value!.humidity!.toString();
  String getHumidity() {
    double humidity = hours.value!.humidity!;
    if (humidity % 1 == 0) {
      return humidity.toInt().toString(); // Display as int
    } else {
      return humidity.toStringAsFixed(1); // Display as double
    }
  }

  getData(String city) async {
    try {
      final response = await HomeRepository.hitApi(city);
      model.value = DataModel.fromJson(response);
      for (int i = 0; i < model.value!.days![0].hours!.length; i++) {
        if (Utilities.checkTime(
            model.value!.days![0].hours![i].datetime.toString())) {
          hours.value = model.value!.days![0].hours![i];
          currentIndex.value = i;
          break;
        }
      }
      // Get.to(() => const HomeScreen());
      Get.offAll(() => const HomeScreen());
    } on SocketException {
      Utils.toastMessage("Network Error Please Check Your Internet Connection");
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
      Utils.toastMessage(e.toString());
      await Future.delayed(const Duration(seconds: 3));
      // SystemNavigator.pop();
      exit(0);
    }
  }

  getDataOnApp(String city) async {
    await HomeRepository.hitApi(city).then((value) {
      model.value = DataModel.fromJson(value);
      for (int i = 0; i < model.value!.days![0].hours!.length; i++) {
        if (Utilities.checkTime(
            model.value!.days![0].hours![i].datetime.toString())) {
          hours.value = model.value!.days![0].hours![i];
          currentIndex.value = i;
          break;
        }
      }
    });
  }

  setHour(int index) {
    Timer(const Duration(milliseconds: 100), () => animator.value = true);
    currentIndex.value = index;
    hours.value = model.value!.days![0].hours![index];
    Timer(const Duration(milliseconds: 100), () => animator.value = false);
  }
}
