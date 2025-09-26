import 'package:flutter/material.dart';

// abstract class LightColors {
//   static Color backgroundColor = const Color(0xFFF4F7FE).withValues(alpha: .8);
//   static const Color forGroundColor = Color(0xFFffffff);
//   static const Color textColor = Color(0xFF0C1826);
//   static const Color text2Color = Color(0xFF6D879C);
//   static const Color primaryColor = Color(0xFF01B574);
//   static const Color buttonColor = Color(0xFF01B574);
//   static const Color secondButtonColor = Color(0xFFffffff);
//   static const Color containerColor = Color(0xFFffffff);
//   static const Color redColor = Color(0xFFE31A1A);
//   static const Color orangeColor = Color(0xFFFFB547);
//   static const Color greenColor = Color(0xFF01B574);
//   static const Color greyColor = Color(0xFFEAE8E9);
//   static const Color blueColor = Color(0xFFD7E9FB);
//   static const Color black = Color(0xFF000000);
//   static const Color offWhite = Color(0xFFF6F6F6);
//   static const Color appBarColor = Color(0xffF7F7F7);
// }
abstract class LightColors {
  static Color backgroundColor = const Color(
    0xFFF5F5F5,//0xFFffffff
    );
  static Color secondBackgroundColor = const Color(0xFFFfffff);
  static const Color forGroundColor = Color(
    0xFFFFFFFF,
  ); // White foreground for cards and containers
  static const Color textColor = Color(
   0xFF212121// 0xFF353055,
  ); // Dark grey for primary text
  static const Color text2Color = Color(
    0xFF666666,
  ); // Lighter grey for secondary text
  static const Color primaryColor = Color(
     0xFF007BFF ,//0xFF267349,
  ); // Green from buttons and accents
  static const Color buttonColor = Color(
    0xFF00A651,
  ); // Green for primary buttons
  static const Color secondButtonColor = Color(
    0xFF00BFA5,//0xFFB8D0FE,
  ); // White for secondary buttons
  static const Color containerColor = Color(
    0xFFFFFFFF,
  ); // White for product cards
  static const Color redColor = Color(
    0xFFAB1B08,
  ); // Pinkish-red for discount tags
  static const Color orangeColor = Color(
    0xFFE25205,
  ); // Orange for promotional highlights
  static const Color greenColor = Color(
    0xFF267349,
  ); // Green for success states or accents
  static const Color greyColor = Color(
    0xFFF2F2F2,
  ); // Light grey for borders and dividers
  static const Color purple = Color(
    0xFF8000FF,
  ); // Blue for links or secondary accents
  static const Color blueColor = Color(
    0xFF2196F3,
  ); // Blue for links or secondary accents
  static const Color black = Color(0xFF000000); // Black for icons or emphasis
  static const Color offWhite = Color(
    0xFFF2F2F2,
  ); // Off-white for subtle backgrounds
  static const Color appBarColor = Color(0xFFFFFFFF); // White for app bar
  static const Color lightBlackBackground = Color(0xFF353055);
}

// abstract class DarkColors {
//   static Color backgroundColor = const Color(0xff0C1826).withValues(alpha: .92);
//   static const Color forGroundColor = Color(0xFFffffff);
//   static const Color textColor = Color(0xFFffffff);
//   static const Color text2Color = Color(0xFF6D879C);
//   static const Color primaryColor = Color(0xFF01B574);
//   static const Color buttonColor = Color(0xFF01B574);
//   static const Color secondButtonColor = Color(0xFFffffff);
//   static const Color containerColor = Color(0xFF1A3848);
//   static const Color redColor = Color(0xFFE31A1A);
//   static const Color orangeColor = Color(0xFFFFB547);
//   static const Color greenColor = Color(0xFF01B574);
//   static const Color greyColor = Color(0xFFEAE8E9);
//   static const Color blueColor = Color(0xFF254668);
//   static const Color black = Color(0xFFffffff);
// }
abstract class DarkColors {
  static Color backgroundColor = const Color(0xFF0C1826).withValues(alpha: .8);
  static const Color forGroundColor = Color(0xFF1E293B);
  static const Color textColor = Color(0xFFF8FAFC);
  static const Color text2Color = Color(0xFF94A3B8);
  static const Color primaryColor = Color(0xFF267349); // Same as light theme
  static const Color buttonColor = Color(0xFF267349); // Same as light theme
  static const Color secondButtonColor = Color(0xFF2282AB);
  static const Color containerColor = Color(0xFF1E293B);
  static const Color redColor = Color(0xFFF87171); // Lighter red for dark mode
  static const Color orangeColor = Color(0xFFE25205); // Adjusted orange
  static const Color greenColor = Color(0xFF267349); // Same as light theme
  static const Color greyColor = Color(0xFFF2F2F2);
  static const Color blueColor = Color(0xFF1E40AF);
  static const Color black = Color(0xFF000000);
  static const Color lightBlack = Color(0xFF000000);
  static const Color appBarColor = Color(0xFF1E293B);
}
