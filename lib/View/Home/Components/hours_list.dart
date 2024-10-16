import 'package:Cloudy/Utilities/glass%20container/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Cloudy/Utilities/utilities.dart';
import 'package:Cloudy/ViewModel/Controllers/home_controller.dart';
import 'package:vibration/vibration.dart';

class HoursList extends StatelessWidget {
  HoursList({super.key});
  final controller = Get.find<HomeController>();
  final currentHour =
      Utilities.formattedTimewithoutparsing(DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180,
        child: ListView.builder(
            itemCount: controller.model.value!.days![0].hours!.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  if (await Vibration.hasVibrator() != null) {
                    Vibration.vibrate(duration: 5, amplitude: 1);
                  }

                  controller.setHour(index);
                },
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 130,
                        width: 80,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Obx(
                          () => CustomGlassContainer(
                            borderWidth:
                                controller.compareIndex(index) ? 2 : 1.5,
                            opacity: controller.compareIndex(index) ? 0.2 : 0.1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                  () => Text(
                                    controller.getHourinAmPm(index) ==
                                            currentHour
                                        ? "Now"
                                        : controller.getHourinAmPm(index),
                                    style: TextStyle(
                                      color: controller.compareIndex(index)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Image.asset(
                                    controller.getImage(index),
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                                Obx(() => Text(
                                      '${controller.model.value!.days![0].hours![index].temp.round()}\u00B0C',
                                      style: TextStyle(
                                          color: controller.compareIndex(index)
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 20),
                                    )),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              );
            }));
  }
}
