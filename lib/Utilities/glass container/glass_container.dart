import 'dart:ui';

import 'package:flutter/material.dart';

class CustomGlassContainer extends StatelessWidget {
  final double blur;
  final double opacity;
  final double borderRadius;
  final Widget child;
  final double borderWidth;
  final BorderRadiusGeometry? customBorder;

  const CustomGlassContainer({
    super.key,
    this.blur = 10.0,
    this.opacity = 0.1,
    this.borderRadius = 20.0,
    required this.child,
    this.borderWidth = 1.5,
    this.customBorder,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: customBorder ?? BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            borderRadius: customBorder ?? BorderRadius.circular(borderRadius),
            border: Border.all(
              color: Colors.white.withOpacity(opacity),
              width: borderWidth,
            ),
          ),
          child: child, // Add your content here
        ),
      ),
    );
  }
}
