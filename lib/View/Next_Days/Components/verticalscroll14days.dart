import 'package:Cloudy/Utilities/glass%20container/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Cloudy/Utilities/utilities.dart';
import 'package:Cloudy/ViewModel/Controllers/days_controller.dart';
import 'package:Cloudy/ViewModel/Controllers/home_controller.dart';
import 'package:vibration/vibration.dart';

class VerticalScroll14Days extends StatelessWidget {
  VerticalScroll14Days({super.key});
  final controller = Get.find<HomeController>();
  final daysController = Get.find<DaysController>();
  final currentDate = Utilities.extractDate(DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.model.value!.days!.length,
      itemBuilder: (context, index) {
        return Obx(() => GestureDetector(
              onTap: () async {
                if (await Vibration.hasVibrator() != null) {
                  Vibration.vibrate(duration: 5, amplitude: 1);
                }
                daysController.setDay(index);
              },
              child: Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 20),
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33),
                  border: Border.all(
                    width: 2,
                    color: daysController.currentDay.value == index
                        ? const Color.fromARGB(88, 255, 255, 255)
                        : Colors.transparent,
                  ),
                ),
                child: CustomGlassContainer(
                  opacity: daysController.currentDay.value == index ? 0.2 : 0.1,
                  borderRadius: 30,
                  borderWidth: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          daysController.getMonth(index) == currentDate
                              ? 'Today'
                              : daysController.getDate(index),
                          style: TextStyle(
                              color: daysController.currentDay.value == index
                                  ? Colors.white
                                  : const Color.fromARGB(255, 217, 217, 217),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_drop_up,
                              size: 15,
                              color: daysController.currentDay.value == index
                                  ? Colors.white
                                  : const Color.fromARGB(255, 217, 217, 217),
                            ),
                            Text(
                              "${daysController.getMaxTemp(index)} / ",
                              style: TextStyle(
                                  color:
                                      daysController.currentDay.value == index
                                          ? Colors.white
                                          : const Color.fromARGB(
                                              255, 217, 217, 217),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text(
                              daysController.getMinTemp(index),
                              style: TextStyle(
                                  color:
                                      daysController.currentDay.value == index
                                          ? Colors.white
                                          : const Color.fromARGB(
                                              255, 217, 217, 217),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              size: 15,
                              color: daysController.currentDay.value == index
                                  ? Colors.white
                                  : const Color.fromARGB(255, 217, 217, 217),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                            daysController.getImage(index),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
