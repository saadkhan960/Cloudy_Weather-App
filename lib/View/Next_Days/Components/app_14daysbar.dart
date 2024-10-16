import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom14daysAppBar extends StatelessWidget {
  const Custom14daysAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              tooltip: "Back",
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.navigate_before_rounded,
                size: 40,
                color: Colors.white,
              )),
          const Text(
            "Next 14 Days",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }
}
