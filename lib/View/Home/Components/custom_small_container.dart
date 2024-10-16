import 'package:Cloudy/Utilities/glass%20container/glass_container.dart';
import 'package:flutter/material.dart';

class CustomSmallContainer extends StatefulWidget {
  final String text;
  final String title;
  final Color titleColor;
  final String image;
  final Color? color;
  final Color? textColor;
  const CustomSmallContainer({
    super.key,
    required this.title,
    required this.titleColor,
    required this.text,
    required this.image,
    required this.color,
    required this.textColor,
  });

  @override
  State<CustomSmallContainer> createState() => _CustomSmallContainerState();
}

class _CustomSmallContainerState extends State<CustomSmallContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            widget.title,
            style: TextStyle(
                color: widget.titleColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomGlassContainer(
            child: Container(
              height: 80,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        height: 37,
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.text,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(color: widget.textColor ?? Colors.black),
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
