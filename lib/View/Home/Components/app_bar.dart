import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 5),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              )),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.only(top: 5),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.white,
                  size: 26,
                ),
              )),
        ],
      ),
    );
  }
}
