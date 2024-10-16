import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Cloudy/Utilities/utilities.dart';
import 'package:Cloudy/View/Next_Days/Components/details.dart';
import 'package:Cloudy/ViewModel/Controllers/days_controller.dart';
import 'package:Cloudy/ViewModel/Controllers/home_controller.dart';

class CurrentDayInfoCard extends StatelessWidget {
  CurrentDayInfoCard({super.key});
  final controller = Get.find<HomeController>();
  final daysController = Get.find<DaysController>();
  final currentDate = Utilities.extractDate(DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Container(
        height: 200,
        width: size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // ---------------Current Temp,FeelLike & Min/MaX---------------------//
            Positioned(
              top: 30,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Colors.white.withOpacity(.5)],
                      ).createShader(bounds);
                    },
                    child: Obx(
                      () => Text(
                        daysController.getCurrentTempDyas(
                            daysController.currentDay.value),
                        style: const TextStyle(
                          fontSize: 60,
                          height: 0,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Row(
                      children: [
                        Text(
                          'Min: ${daysController.getMinTemp(daysController.currentDay.value)}',
                          style: const TextStyle(
                            height: 0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Max: ${daysController.getMaxTemp(daysController.currentDay.value)}',
                          style: const TextStyle(
                            height: 0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Obx(
                    () => Text(
                      'Feel like ${controller.getFeelLike()}\u00B0C',
                      style: const TextStyle(
                        height: 0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ---------------Icon & Time---------------------//
            Positioned(
              top: 20,
              right: 30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => SizedBox(
                      height: 90,
                      width: 90,
                      child: Image.asset(
                        filterQuality: FilterQuality.high,
                        daysController
                            .getImage(daysController.currentDay.value),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Obx(() => Text(
                        // daysController.getDate(daysController.currentDay.value),
                        daysController.getMonth(
                                    daysController.currentDay.value) ==
                                currentDate
                            ? 'Today'
                            : daysController
                                .getDate(daysController.currentDay.value),
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            // ---------------DETAILS---------------------//
            DetailsWeather(),
          ],
        ),
      ),
    );
  }
}
