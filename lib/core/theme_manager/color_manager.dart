import 'package:flutter/material.dart';

class ColorManager {
  static const Color textColorInput = Color(0xff535360);
  static const Color textColorInputBackGround = Color(0xff393946);
  static const Color textColor = Color(0xffF3F4F6);
  static Color primaryColor = const Color.fromARGB(255, 0, 127, 61);
  static Color onPrimaryColor = const Color(0xFFF9FAFB);
  static Color secondaryColor = const Color(0xFFF9FAFB);
  static Color onSecondaryColor = const Color(0xFFF9FAFB);
  static Color buttonColor = const Color(0xFF199A8E);
  static Color appBarColor = const Color(0xFF2E2E3E);
  static Color backgroundColor = const Color(0xFF2E2E3E);
  static Color onErrorColor = const Color(0xFFFFFFFF);
  static Color errorColor = const Color(0xFFFF5C5C);
  static Color lightGreyColor = const Color(0xFFE5E7EB);
  static Color darkGreyColor = const Color(0xFFA1A8B0);
  static Color surface = const Color(0xFFF9FAFB);
  static Color onSurface = const Color(0xFF101623);
  static Color onBackground = const Color(0xFF101623);
  static Color iconColor = const Color(0xFFFFFFFF);
  static Color cardColor = const Color(0xFFFFFFFF);
  static Color backLayer = const Color(0xFF3A3A47);
  static Color layer = const Color(0xFF464652);

  static ColorScheme getColorScheme(context) {
    return ColorScheme(
      brightness: MediaQuery.platformBrightnessOf(context),
      primary: primaryColor,
      onPrimary: onPrimaryColor,
      secondary: secondaryColor,
      onSecondary: onSecondaryColor,
      error: errorColor,
      onError: onErrorColor,
      surface: surface,
      onSurface: onSurface,
    );
  }
}
