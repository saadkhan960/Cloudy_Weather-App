import 'package:get/get.dart';
import 'package:Cloudy/ViewModel/Controllers/home_controller.dart';

class SplashServices {
  static final controller = Get.put(HomeController());
  static getApiData(String city) async {
    await controller.getData(city);
  }

  static Future getApiDataOnApp(String city) async {
    await controller.getDataOnApp(city);
  }
}
