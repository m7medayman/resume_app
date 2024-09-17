import 'package:flutter/material.dart';
import 'package:resume_app/core/theme_manager/font/font_size_wight_manager.dart';

class FontConstants {
  static const String fontFamily = "Montserrat";
}

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// medium style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// bold style

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
