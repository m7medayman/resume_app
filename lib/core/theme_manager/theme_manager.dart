import 'package:flutter/material.dart';

import 'package:resume_app/core/theme_manager/color_manager.dart';
import 'package:resume_app/core/theme_manager/font/font_color.dart';
import 'package:resume_app/core/theme_manager/font/font_stayle_manager.dart';
import 'package:resume_app/core/theme_manager/font/font_style_manager.dart';

class MyTheme {
  FontStyleManager _fontStyleManager;
  MyTheme({
    required FontStyleManager fontStyleManager,
  }) : _fontStyleManager = fontStyleManager;
  void updateFontStyleManager(FontStyleManager fontStyleManager) {
    _fontStyleManager = fontStyleManager;
  }

  ThemeData getTheme() {
    return ThemeData(
        dialogTheme: DialogTheme(
          backgroundColor: ColorManager.backgroundColor,
          titleTextStyle: _fontStyleManager.getHeading2(),
          contentTextStyle: _fontStyleManager.getBody2(),
        ),
        textTheme: TextTheme(
          headlineLarge: _fontStyleManager.getHeading3(),
          headlineMedium: _fontStyleManager.getHeading2(),
          headlineSmall: _fontStyleManager.getHeading1(),
          bodyLarge: _fontStyleManager.getBody3(),
          bodyMedium: _fontStyleManager.getBody2(),
          bodySmall: _fontStyleManager.getBody1(),
          displayLarge: _fontStyleManager.getBody3(),
          displayMedium: _fontStyleManager.getBody2(),
          displaySmall: _fontStyleManager.getBody1(),
          titleLarge: _fontStyleManager.getBody3(),
          titleMedium: _fontStyleManager.getBody2(),
          titleSmall: _fontStyleManager.getBody1(),
        ),
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
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                foregroundColor:
                    const WidgetStatePropertyAll(ColorManager.textColor),
                textStyle: const WidgetStatePropertyAll(
                    TextStyle(color: ColorManager.textColor)),
                overlayColor: WidgetStatePropertyAll(ColorManager.onBackground),
                backgroundColor:
                    WidgetStatePropertyAll(ColorManager.primaryColor))),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(foregroundColor: Colors.white));
  }
}
