import 'dart:io';

import 'package:Cloudy/Utilities/glass%20container/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Cloudy/Utilities/utils.dart';
import 'package:Cloudy/View/Next_Days/Components/current_day_info_card.dart';
import 'package:Cloudy/View/Next_Days/Components/verticalscroll14days.dart';
import 'package:Cloudy/ViewModel/Controllers/city_name_controller.dart';
import 'package:Cloudy/ViewModel/Controllers/days_controller.dart';
import 'package:Cloudy/ViewModel/Controllers/home_controller.dart';
import 'package:Cloudy/ViewModel/Services/SplashScreen/splash_services.dart';
import 'package:refresh/refresh.dart';

class Next14Days extends StatelessWidget {
  Next14Days({super.key});
  final controller = Get.find<HomeController>();
  final daysController = Get.put(DaysController());
  // ignore: prefer_final_fields
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final CityNameController citySelectionController =
      Get.put(CityNameController());
  Future<void> _onRefresh() async {
    try {
      String cityname = citySelectionController.savedCityName;
      await SplashServices.getApiDataOnApp(cityname);
      _refreshController.refreshCompleted();
    } on SocketException {
      _refreshController.refreshFailed();
      Utils.toastMessage("No Internet Connection");
    } catch (e) {
      _refreshController.refreshFailed();
      Utils.toastMessage("No Internet Connection");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background/Gradient.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SmartRefresher(
        header: WaterDropHeader(
          refresh: const Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: SizedBox(
              height: 20.0,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            ),
          ),
          waterDropColor: Colors.grey,
          complete: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.done,
                  color: Colors.white,
                ),
                Container(
                  width: 15.0,
                ),
                const Text(
                  "Refresh Completed",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                )
              ],
            ),
          ),
          idleIcon: const Icon(
            Icons.autorenew,
            color: Colors.white,
          ),
          failed: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.white,
                ),
                Container(
                  width: 15.0,
                ),
                const Text(
                  "Network Error",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )
              ],
            ),
          ),
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 26,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.transparent,
            title: const Text(
              "Next 14 Days",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              CustomGlassContainer(
                customBorder: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: Container(
                  height: 260,
                  width: size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: CurrentDayInfoCard(),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: VerticalScroll14Days(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
