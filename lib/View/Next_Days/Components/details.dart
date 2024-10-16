import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Cloudy/ViewModel/Controllers/days_controller.dart';
import 'package:Cloudy/ViewModel/Controllers/home_controller.dart';

class DetailsWeather extends StatelessWidget {
  DetailsWeather({super.key});
  final controller = Get.put(HomeController());
  final daysController = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 160,
      left: 25,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --------1List--------
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      const Text(
                        'Condition:  ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 233, 233, 233),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: 105,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Obx(
                                () => Text(
                                  daysController.getWeatherConditions(
                                      daysController.currentDay.value),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      const Text(
                        'Humidity:  ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 233, 233, 233),
                        ),
                      ),
                      Obx(
                        () => Text(
                          "${daysController.getWeatherHumidity(daysController.currentDay.value)}%",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      const Text(
                        'UV Index:  ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 233, 233, 233),
                        ),
                      ),
                      Obx(
                        () => Text(
                          daysController
                              .getWeatherUV(daysController.currentDay.value),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      const Text(
                        'Pressure:  ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 233, 233, 233),
                        ),
                      ),
                      Obx(
                        () => Text(
                          "${daysController.getWeatherPressure(daysController.currentDay.value)}mbar",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 35),
          // --------Second List----------
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      const Text(
                        'Cloud Cover: ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 233, 233, 233),
                        ),
                      ),
                      Obx(
                        () => Text(
                          "${daysController.getWeatherCloudCover(daysController.currentDay.value)}%",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      const Text(
                        'Dew Point:  ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 233, 233, 233),
                        ),
                      ),
                      Obx(
                        () => Text(
                          "${daysController.getWeatherDew(daysController.currentDay.value)}\u00B0C",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      const Text(
                        'Visibility:  ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 233, 233, 233),
                        ),
                      ),
                      Obx(
                        () => Text(
                          "${daysController.getWeatherVisibility(daysController.currentDay.value)} km",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      const Text(
                        'Wind Speed:  ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 233, 233, 233),
                        ),
                      ),
                      Obx(
                        () => Text(
                          "${daysController.getWeatherWindSpeed(daysController.currentDay.value)} kph",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
