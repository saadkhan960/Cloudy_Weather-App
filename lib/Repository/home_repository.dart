import 'package:Cloudy/Data/Network/apiService.dart';
import 'package:Cloudy/Resources/AppUrl/app_url.dart';

class HomeRepository {
  static Future<dynamic> hitApi(String city) async {
    return await ApiServices()
        .getGetApiResponce(AppUrl.apiUrl(city == '' ? 'Karachi' : city));
  }
}
