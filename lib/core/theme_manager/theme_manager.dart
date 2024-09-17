import 'package:flutter/material.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';
import 'package:resume_app/core/theme_manager/font/font_color.dart';
import 'package:resume_app/core/theme_manager/font/font_style_manager.dart';

ThemeData getTheme() {
  return ThemeData(
      useMaterial3: true,
      // colorScheme: ColorManager.getColorScheme(context),
      colorScheme: ColorScheme.fromSeed(
              seedColor: ColorManager.primaryColor,
              dynamicSchemeVariant: DynamicSchemeVariant.content
              // brightness: Brightness.dark,
              )
          .copyWith(
        primary: ColorManager.primaryColor,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: ColorManager.appBarColor,
          elevation: 0,
          centerTitle: true,
          titleTextStyle:
              getBoldStyle(color: FontColorManager.lightAppBarTextColor)),
      scaffoldBackgroundColor: ColorManager.backgroundColor,
      cardColor: ColorManager.cardColor,
      iconTheme: IconThemeData(color: ColorManager.iconColor),
      buttonTheme: ButtonThemeData(buttonColor: ColorManager.buttonColor),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(foregroundColor: Colors.white));
}
