import 'package:flutter/material.dart';

import 'package:resume_app/core/resources/device_manager.dart/device_manager.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';
import 'package:resume_app/core/theme_manager/font/font_size_manager.dart';

class FontStyleManager {
  DeviceManager _deviceManager;
  late Devices _device;
  FontStyleManager(
    this._deviceManager,
  ) {
    _device = _deviceManager.getDevice;
  }
  void updateDeviceManger(DeviceManager deviceManager) {
    _deviceManager = deviceManager;
    _device = _deviceManager.getDevice;
  }

  _getCommonStyle(double s, FontWeight w) {
    return TextStyle(
      fontFamily: 'tilt',
      color: ColorManager.textColor,
      fontSize: s,
      fontWeight: w,
    );
  }

  getHeading1() {
    return _getCommonStyle(
        _device.getFontSize(Sizes.heading1), FontWeight.w700);
  }

  getHeading2() {
    return _getCommonStyle(
        _device.getFontSize(Sizes.heading2), FontWeight.w600);
  }

  getHeading3() {
    return _getCommonStyle(
        _device.getFontSize(Sizes.heading3), FontWeight.w700);
  }

  getBody1() {
    return _getCommonStyle(_device.getFontSize(Sizes.body1), FontWeight.w400);
  }

  getBody2() {
    return _getCommonStyle(_device.getFontSize(Sizes.body2), FontWeight.w400);
  }

  getBody3() {
    return _getCommonStyle(_device.getFontSize(Sizes.body3), FontWeight.w400);
  }

  getSubTitle() {
    return _getCommonStyle(
        _device.getFontSize(Sizes.subtitle), FontWeight.w400);
  }
}
