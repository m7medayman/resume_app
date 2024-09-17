import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile/presentation/resources/color_manager.dart';
import 'package:profile/App/device_manager.dart';
import 'package:profile/presentation/resources/font_size_manager.dart';

class FontStyleManager {
  Devices device;
  FontStyleManager(this.device);

  _getCommonStyle(double s, FontWeight w) {
    return TextStyle(
      fontFamily: 'tilt',
      color: ColorManager.textColor,
      fontSize: s,
      fontWeight: w,
    );
  }

  getHeading1() {
    return _getCommonStyle(device.getFontSize(Sizes.heading1), FontWeight.w700);
  }

  getHeading2() {
    return _getCommonStyle(device.getFontSize(Sizes.heading2), FontWeight.w600);
  }

  getHeading3() {
    return _getCommonStyle(device.getFontSize(Sizes.heading3), FontWeight.w700);
  }

  getBody1() {
    return _getCommonStyle(device.getFontSize(Sizes.body1), FontWeight.w400);
  }

  getBody2() {
    return _getCommonStyle(device.getFontSize(Sizes.body2), FontWeight.w400);
  }

  getBody3() {
    return _getCommonStyle(device.getFontSize(Sizes.body3), FontWeight.w400);
  }

  getSubTitle() {
    return _getCommonStyle(device.getFontSize(Sizes.subtitle), FontWeight.w400);
  }
}
