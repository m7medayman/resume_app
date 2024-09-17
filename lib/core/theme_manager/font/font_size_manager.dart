import 'package:flutter/material.dart';
import 'package:profile/App/device_manager.dart';

class FontSizeManager {
  //DeskTop Font Sizes
  static const int heading1DeskTop = 60;
  static const int heading2DeskTop = 36;
  static const int heading3DeskTop = 30;
  static const int subtitleDeskTop = 20;
  static const int body1DeskTop = 18;
  static const int body2DeskTop = 16;
  static const int body3DeskTop = 16;

  // Tablet Font Sizes
  static const int heading1Tablet = 48;
  static const int heading2Tablet = 24;
  static const int heading3Tablet = 18;
  static const int subtitleTablet = 18;
  static const int body1Tablet = 16;
  static const int body2Tablet = 14;
  static const int body3Tablet = 14;

//Mobile Font Sizes
  static const int heading1Mobile = 36;
  static const int heading2Mobile = 24;
  static const int heading3Mobile = 18;
  static const int subtitleMobile = 18;
  static const int body1Mobile = 16;
  static const int body2Mobile = 16;
  static const int body3Mobile = 14;
}

enum Sizes { heading1, heading2, heading3, subtitle, body1, body2, body3 }

// this extension will return a font size depends on the type of device
extension FontSizes on Devices {
  getFontSize(Sizes s) {
    switch (this) {
      case Devices.computer:
        return getFontSizeList(s)[0];
      case Devices.tablet:
        return getFontSizeList(s)[1];
      case Devices.mobile:
        return getFontSizeList(s)[2];

      default:
    }
  }
}

//this function  will return a list of three Values of the devices 0 index computer 1 index tablet 2 index mobile
getFontSizeList(Sizes s) {
  switch (s) {
    case Sizes.heading1:
      return [
        FontSizeManager.heading1DeskTop,
        FontSizeManager.heading1Tablet,
        FontSizeManager.heading1Mobile
      ];
    case Sizes.heading2:
      return [
        FontSizeManager.heading2DeskTop,
        FontSizeManager.heading2Tablet,
        FontSizeManager.heading2Mobile
      ];
    case Sizes.heading3:
      return [
        FontSizeManager.heading3DeskTop,
        FontSizeManager.heading3Tablet,
        FontSizeManager.heading3Mobile
      ];
    case Sizes.body1:
      return [
        FontSizeManager.body1DeskTop,
        FontSizeManager.body1Tablet,
        FontSizeManager.body1Mobile
      ];
    case Sizes.body2:
      return [
        FontSizeManager.body2DeskTop,
        FontSizeManager.body2Tablet,
        FontSizeManager.body2Mobile
      ];
    case Sizes.body3:
      return [
        FontSizeManager.body3DeskTop,
        FontSizeManager.body3Tablet,
        FontSizeManager.body3Mobile
      ];
    case Sizes.subtitle:
      return [
        FontSizeManager.subtitleDeskTop,
        FontSizeManager.subtitleTablet,
        FontSizeManager.subtitleMobile
      ];
    default:
  }
}
