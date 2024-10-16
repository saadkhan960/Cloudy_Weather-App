import 'package:Cloudy/Utilities/glass%20container/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Cloudy/Resources/Images/image_assets.dart';
import 'package:Cloudy/Utilities/utilities.dart';
import 'package:Cloudy/ViewModel/Controllers/home_controller.dart';

class InfoCard extends StatelessWidget {
  InfoCard({super.key});
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: CustomGlassContainer(
        child: Container(
          height: 200,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: 5,
                left: 15,
                child: Obx(
                  () => Image.asset(
                    filterQuality: FilterQuality.high,
                    controller.getImage(controller.currentIndex.value!),
                    height: 120,
                    width: 120,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text(
                        controller.getConditions(),
                        style: const TextStyle(
                          height: 0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      Utilities.currentTime(),
                      style: TextStyle(
                        height: 0,
                        color: Colors.white.withOpacity(.8),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
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
                          '${controller.getCurrentTemp()}\u00B0C',
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
                      () => Text(
                        'Feel like ${controller.getFeelLike()}\u00B0C',
                        style: const TextStyle(
                          height: 0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                right: -15,
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Colors.white.withOpacity(.6)
                        ]).createShader(bounds);
                  },
                  child: Image.asset(
                    ImageAssets.wind,
                    height: 100,
                    width: 200,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
