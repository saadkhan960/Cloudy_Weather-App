import 'package:flutter/material.dart';

class AppColors {
  static BoxDecoration buildGradientBoxDecoration() {
    return BoxDecoration(
        gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 0, 132, 150), Colors.blue[700]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 1],
            tileMode: TileMode.clamp));
  }

  static BoxDecoration darkGradientBoxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.grey[850]!, Colors.blueGrey[700]!],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0.0, 1],
        tileMode: TileMode.clamp,
      ),
    );
  }

  // Primary Colors - Shades of Grey
  static const Color primary = Color(0xFF424242); // Dark grey
  static const Color primaryVariant = Color(0xFF616161); // Lighter grey

  // Secondary Accent - Light Grey/Blue Tinge
  static const Color accent = Color(0xFF757575); // Medium grey

  // Background Colors
  static const Color background = Color(0xFF181818); // Almost black background
  static const Color surface =
      Color(0xFF303030); // Slightly lighter grey for cards and surfaces

  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF); // White for primary text
  static const Color textSecondary =
      Color(0xFFBDBDBD); // Light grey for secondary text

  // Error Color
  static const Color error = Color(0xFFE57373); // Light red for errors
  // Unselected/Selected with Grey Theme Example
  // Selected Colors
  static const Color selectedBackgroundColor =
      Color(0xFF424242); // Dark grey for selected background
  static const Color selectedTextColor =
      Color(0xFFFFFFFF); // White for selected text

  // Unselected Colors
  static const Color unselectedBackgroundColor =
      Color(0xFF616161); // Medium grey for unselected background
  static const Color unselectedTextColor =
      Color(0xFFB0BEC5); // Light grey for unselected text

  // Optional: Background Color
  static const Color appBackgroundColor =
      Color(0xFF181818); // Dark background for the app
}
