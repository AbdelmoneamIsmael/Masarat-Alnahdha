import '../../../core/const/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/themes/colors/colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: kFontFamily,
  brightness: Brightness.light,
  scaffoldBackgroundColor: LightColors.backgroundColor,
  primaryColor: LightColors.primaryColor,
  useMaterial3: true,
  colorScheme: const ColorScheme.light().copyWith(
    primary: LightColors.primaryColor,
    primaryContainer: LightColors.containerColor,
    secondaryContainer: LightColors.secondButtonColor,
    secondary: LightColors.secondButtonColor,
    shadow: LightColors.text2Color,
    error: LightColors.redColor,
    surface:LightColors.primaryColor , // LightColors.greenColor,
    onPrimary: LightColors.offWhite,
    onSecondary: LightColors.secondBackgroundColor,
    inversePrimary: LightColors.blueColor,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontFamily: kFontFamily,
      color: LightColors.textColor,
    ),
    bodySmall: TextStyle(
      fontFamily: kFontFamily,
      color: LightColors.text2Color,
    ),
  ),
  iconTheme: const IconThemeData(color: LightColors.textColor),
  appBarTheme: AppBarTheme(
    scrolledUnderElevation: 0,
    centerTitle: false,
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: LightColors.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    elevation: 0,
    titleTextStyle: TextStyle(
      color: LightColors.textColor,
      fontFamily: kFontFamily,
      fontSize: 20.sp,
      // height: getTextHeight(20, 24.2),
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(color: LightColors.textColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: LightColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: const BorderSide(color: LightColors.primaryColor),
      ),
      textStyle: TextStyle(
        fontFamily: kFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        // height: getTextHeight(16, 19.36),
        color: LightColors.backgroundColor,
      ),
      fixedSize: Size(double.maxFinite, 52.h),
      foregroundColor: Colors.white,
    ),
  ),
  // bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //   backgroundColor: LightColors.offWhite,
  //   selectedItemColor: LightColors.orangeColor,
  //   unselectedItemColor: LightColors.text2Color,
  //   elevation: 4.0,
  // ),
);

///
///
///dark theme
///
///
///
// ThemeData darkTheme = ThemeData(
//   fontFamily: kFontFamily,
//   brightness: Brightness.dark,
//   scaffoldBackgroundColor: DarkColors.backgroundColor,
//   bottomAppBarTheme: const BottomAppBarTheme(),
//   iconTheme: const IconThemeData(color: DarkColors.textColor),
//   primaryColor: DarkColors.primaryColor,
//   useMaterial3: true,
//   colorScheme: const ColorScheme.dark().copyWith(
//     primaryContainer: DarkColors.containerColor,
//     secondary: DarkColors.blueColor,
//     shadow: DarkColors.black,
//     error: LightColors.redColor,
//     surface: LightColors.secondButtonColor,
//   ),
//   textTheme: const TextTheme(
//     bodyMedium: TextStyle(fontFamily: kFontFamily, color: DarkColors.textColor),
//     bodySmall: TextStyle(fontFamily: kFontFamily, color: DarkColors.text2Color),
//   ),
//   appBarTheme: AppBarTheme(
//     scrolledUnderElevation: 0,
//     centerTitle: false,
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarColor: DarkColors.backgroundColor,
//       statusBarIconBrightness: Brightness.light,
//       statusBarBrightness: Brightness.dark,
//     ),
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     titleTextStyle: TextStyle(
//       fontFamily: kFontFamily,
//       color: DarkColors.textColor,
//       fontSize: 20.sp,
//       // height: getTextHeight(20, 24.2),
//       fontWeight: FontWeight.w600,
//     ),
//     iconTheme: const IconThemeData(color: DarkColors.textColor),
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: DarkColors.primaryColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16.r),
//         side: const BorderSide(color: DarkColors.primaryColor),
//       ),
//       textStyle: TextStyle(
//         fontFamily: kFontFamily,
//         fontSize: 16.sp,
//         fontWeight: FontWeight.w700,
//         // height: getTextHeight(16, 19.36),
//         color: DarkColors.textColor,
//       ),
//       fixedSize: Size(double.maxFinite, 49.h),
//       foregroundColor: Colors.white,
//     ),
//   ),
// );

ThemeData darkTheme = ThemeData(
  fontFamily: kFontFamily,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: DarkColors.backgroundColor,
  primaryColor: DarkColors.forGroundColor,
  useMaterial3: true,
  colorScheme: const ColorScheme.dark().copyWith(
    primaryContainer: DarkColors.black,
    secondary: DarkColors.blueColor,
    shadow: DarkColors.textColor,
    error: DarkColors.redColor,
    surface: DarkColors.primaryColor,
    onPrimary: DarkColors.lightBlack,
    onSecondary: DarkColors.appBarColor,
    inversePrimary: DarkColors.backgroundColor,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontFamily: kFontFamily, color: DarkColors.textColor),
    bodySmall: TextStyle(fontFamily: kFontFamily, color: DarkColors.text2Color),
  ),
  iconTheme: const IconThemeData(color: DarkColors.textColor),
  appBarTheme: AppBarTheme(
    scrolledUnderElevation: 0,
    centerTitle: false,
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: DarkColors.backgroundColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
    elevation: 0,
    titleTextStyle: TextStyle(
      color: DarkColors.textColor,
      fontFamily: kFontFamily,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(color: DarkColors.textColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: DarkColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: const BorderSide(color: DarkColors.primaryColor),
      ),
      textStyle: TextStyle(
        fontFamily: kFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: DarkColors.textColor,
      ),
      fixedSize: Size(double.maxFinite, 49.h),
      foregroundColor: DarkColors.textColor,
    ),
  ),
  // bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //   backgroundColor: LightColors.offWhite,
  //   selectedItemColor: LightColors.orangeColor,
  //   unselectedItemColor: LightColors.text2Color,
  //   elevation: 4.0,
  // ),
);
