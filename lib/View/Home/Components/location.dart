import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Cloudy/Resources/Images/image_assets.dart';
import 'package:Cloudy/Utilities/utilities.dart';
import 'package:Cloudy/View/CitiesName/city_names.dart';
import 'package:Cloudy/ViewModel/Controllers/home_controller.dart';

class CustomLocation extends StatelessWidget {
  CustomLocation({super.key});
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {
                      Get.to(() => const CitiesName());
                    },
                    child: SizedBox(
                      width: 175,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          controller.getAddress(),
                          style: const TextStyle(
                            height: 0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  )),
              Text(
                Utilities.formatedDate(DateTime.now()),
                style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 150,
            width: 150,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  ImageAssets.map,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
