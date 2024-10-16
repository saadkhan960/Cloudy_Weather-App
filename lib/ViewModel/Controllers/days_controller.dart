import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:Cloudy/Model/data_model.dart';
import 'package:Cloudy/Resources/Images/image_assets.dart';
import 'package:Cloudy/Utilities/utilities.dart';
import 'package:Cloudy/ViewModel/Controllers/home_controller.dart';

class DaysController extends GetxController {
  RxInt currentDay = 0.obs;
  final homeController = Get.put(HomeController());
  late Rx<Days> day;

  DaysController() {
    day = homeController.model.value!.days![0].obs;
  }

  setDay(int index) {
    day.value = homeController.model.value!.days![index];
    currentDay.value = index;
  }

  String getImage(int index) => Utilities.imageMap[
              homeController.model.value!.days![index].icon.toString()] ==
          null
      ? ImageAssets.clearDay
      : Utilities
          .imageMap[homeController.model.value!.days![index].icon.toString()]!;

  String getMonth(int index) {
    String date = homeController.model.value!.days![index].datetime.toString();
    return Utilities.extractDate(date);
  }

  String getMonthDay(int index) {
    String date = homeController.model.value!.days![index].datetime.toString();
    return Utilities.extractDay(date);
  }

  String getDate(int index) {
    DateTime date = DateTime.parse(
        homeController.model.value!.days![index].datetime.toString());
    return Utilities.formatedDate(date);
  }

  String getMinTemp(int index) {
    return '${homeController.model.value!.days![index].tempmin!.toInt().toString()}\u00B0C';
  }

  String getMaxTemp(int index) {
    return '${homeController.model.value!.days![index].tempmax!.toInt().toString()}\u00B0C';
  }

  String getCurrentTempDyas(int index) {
    return '${homeController.model.value!.days![index].temp!.toInt().toString()}\u00B0C';
  }

  String getWeatherConditions(int index) {
    return homeController.model.value!.days![index].conditions.toString();
  }

  String getWeatherDescription(int index) {
    return homeController.model.value!.days![index].description.toString();
  }

  String getWeatherHumidity(int index) {
    return homeController.model.value!.days![index].humidity.toString();
  }

  String getWeatherUV(int index) {
    return homeController.model.value!.days![index].uvindex.round().toString();
  }

  String getWeatherPressure(int index) {
    return homeController.model.value!.days![index].pressure.round().toString();
  }

  String getWeatherCloudCover(int index) {
    return homeController.model.value!.days![index].cloudcover
        .round()
        .toString();
  }

  String getWeatherDew(int index) {
    return homeController.model.value!.days![index].dew.round().toString();
  }

  String getWeatherVisibility(int index) {
    return homeController.model.value!.days![index].visibility
        .round()
        .toString();
  }

  String getWeatherWindSpeed(int index) {
    return homeController.model.value!.days![index].windspeed
        .round()
        .toString();
  }

  String getWeatherSolarEnergy(int index) {
    return homeController.model.value!.days![index].solarenergy
        .round()
        .toString();
  }
}
