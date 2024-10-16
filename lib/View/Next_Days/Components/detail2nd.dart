import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Cloudy/ViewModel/Controllers/days_controller.dart';
import 'package:Cloudy/ViewModel/Controllers/home_controller.dart';

class DetailsWeather2nd extends StatelessWidget {
  DetailsWeather2nd({super.key});
  final controller = Get.put(HomeController());
  final daysController = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 160,
      left: 15,
      child: Obx(
        () => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        Text(
                          daysController.getWeatherConditions(
                              daysController.currentDay.value),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
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
                        Text(
                          "${daysController.getWeatherHumidity(daysController.currentDay.value)}%",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
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
                        Text(
                          daysController
                              .getWeatherUV(daysController.currentDay.value),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
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
                        Text(
                          "${daysController.getWeatherPressure(daysController.currentDay.value)}mbar",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
