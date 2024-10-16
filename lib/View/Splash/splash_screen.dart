import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Cloudy/Resources/Images/image_assets.dart';
import 'package:Cloudy/ViewModel/Controllers/city_name_controller.dart';
import 'package:Cloudy/ViewModel/Services/SplashScreen/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final CityNameController citySelectionController =
      Get.put(CityNameController());
  Future<void> _onRefresh() async {
    await citySelectionController.loadCityName();
    String cityname = citySelectionController.savedCityName;
    await SplashServices.getApiData(cityname);
  }

  @override
  void initState() {
    super.initState();
    _onRefresh();
    precacheImage(const AssetImage('assets/background/Gradient.jpeg'), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1e1e1e),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.splashScreen,
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: 150,
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.teal,
                backgroundColor: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
