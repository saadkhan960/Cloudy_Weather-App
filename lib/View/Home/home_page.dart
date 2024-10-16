import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Cloudy/Resources/Colors/colors.dart';
import 'package:Cloudy/Utilities/utils.dart';
import 'package:Cloudy/View/Home/Components/app_bar.dart';
import 'package:Cloudy/View/Home/Components/container_list.dart';
import 'package:Cloudy/View/Home/Components/hours_list.dart';
import 'package:Cloudy/View/Home/Components/info.card.dart';
import 'package:Cloudy/View/Home/Components/location.dart';
import 'package:Cloudy/View/Next_Days/next_14_days.dart';
import 'package:Cloudy/ViewModel/Controllers/city_name_controller.dart';
import 'package:Cloudy/ViewModel/Controllers/home_controller.dart';
import 'package:Cloudy/ViewModel/Services/SplashScreen/splash_services.dart';
import 'package:refresh/refresh.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.find<HomeController>();
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
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background/Gradient.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      // color: AppColors.background,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SmartRefresher(
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
                      style: TextStyle(color: Colors.white),
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
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            controller: _refreshController,
            onRefresh: _onRefresh,
            child: SingleChildScrollView(
              child: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const CustomAppBar(),
                    const SizedBox(height: 20),
                    CustomLocation(),
                    Hero(tag: 'TAG', child: InfoCard()),
                    const SizedBox(height: 30),
                    ContainerList(),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          const Text(
                            "Today",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => Next14Days());
                            },
                            child: const Row(
                              children: [
                                Text(
                                  "Next 14 Days",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textPrimary),
                                ),
                                Icon(
                                  Icons.navigate_next_rounded,
                                  color: AppColors.textPrimary,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    HoursList()
                  ],
                ),
              )),
            ),
          )),
    );
  }
}
