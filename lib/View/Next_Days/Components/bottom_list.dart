import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Cloudy/ViewModel/Controllers/days_controller.dart';
import 'package:Cloudy/ViewModel/Controllers/home_controller.dart';

class CustomBottomList extends StatelessWidget {
  CustomBottomList({super.key});
  final daysController = Get.put(DaysController());
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
        bottom: 1,
        child: SizedBox(
          height: size.height / 2,
          width: size.width,
          child: ListView.builder(
              itemCount: homeController.model.value!.days!.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white38,
                  margin: EdgeInsets.only(
                      left: 20, right: 20, top: index == 0 ? 230 : 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    height: 100,
                    width: size.width,
                    decoration: const BoxDecoration(),
                  ),
                );
              }),
        ));
  }
}
