import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Cloudy/Utilities/utilities.dart';
import 'package:Cloudy/ViewModel/Controllers/days_controller.dart';

class DaysList extends StatelessWidget {
  DaysList({super.key});
  final daysController = Get.put(DaysController());
  final currentDate = Utilities.extractDate(DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 140,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          padding: const EdgeInsets.only(right: 20),
          scrollDirection: Axis.horizontal,
          itemCount: daysController.homeController.model.value!.days!.length,
          itemBuilder: (context, index) {
            return Obx(() => GestureDetector(
                  onTap: () {
                    daysController.setDay(index);
                  },
                  child: Container(
                    width: 80,
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: daysController.currentDay.value == index
                            ? const Color.fromARGB(154, 33, 170, 243)
                            : Colors.white12,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                            daysController.getImage(index),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Text(
                          daysController.getMaxTemp(index),
                          style: TextStyle(
                            color: daysController.currentDay.value == index
                                ? Colors.white
                                : const Color.fromARGB(255, 217, 217, 217),
                            fontSize: 22,
                            height: 0,
                          ),
                        ),
                        Text(
                          daysController.getMonth(index),
                          style: TextStyle(
                            color: daysController.currentDay.value == index
                                ? Colors.white
                                : const Color.fromARGB(255, 217, 217, 217),
                            fontSize: 20,
                            height: 0,
                          ),
                        ),
                        Text(
                          daysController.getMonth(index) == currentDate
                              ? 'Today'
                              : daysController.getMonthDay(index),
                          style: TextStyle(
                            color: daysController.currentDay.value == index
                                ? Colors.white
                                : const Color.fromARGB(255, 217, 217, 217),
                            fontSize: 20,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        ));
  }
}
