import 'package:Cloudy/Resources/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Cloudy/Resources/Images/image_assets.dart';
import 'package:Cloudy/View/Home/Components/custom_small_container.dart';
import 'package:Cloudy/ViewModel/Controllers/home_controller.dart';

class ContainerList extends StatelessWidget {
  ContainerList({super.key});
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => CustomSmallContainer(
                title: "Cloud Cover",
                titleColor: Colors.white,
                text: "${controller.getCloudCover()}%",
                image: ImageAssets.cloudCover,
                color: AppColors.primaryVariant,
                textColor: Colors.white)),
            Obx(() => CustomSmallContainer(
                title: "Wind Speed",
                titleColor: Colors.white,
                text: "${controller.getWindSpeed()} kph",
                image: ImageAssets.windWhite,
                color: AppColors.primaryVariant,
                textColor: Colors.white)),
            Obx(() => CustomSmallContainer(
                title: "Humidity",
                titleColor: Colors.white,
                text: "${controller.getHumidity()}%",
                image: ImageAssets.humiditydrop,
                color: AppColors.primaryVariant,
                textColor: Colors.white))
          ],
        ),
      ),
    );
  }
}
