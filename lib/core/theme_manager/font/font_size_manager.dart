import 'package:resume_app/core/resources/device_manager.dart/device_manager.dart';

class FontSizeManager {
  //DeskTop Font Sizes
  static const double heading1DeskTop = 60;
  static const double heading2DeskTop = 36;
  static const double heading3DeskTop = 30;
  static const double subtitleDeskTop = 20;
  static const double body1DeskTop = 18;
  static const double body2DeskTop = 16;
  static const double body3DeskTop = 16;

  // Tablet Font Sizes
  static const double heading1Tablet = 48;
  static const double heading2Tablet = 30;
  static const double heading3Tablet = 18;
  static const double subtitleTablet = 18;
  static const double body1Tablet = 16;
  static const double body2Tablet = 14;
  static const double body3Tablet = 14;

//Mobile Font Sizes
  static const double heading1Mobile = 36;
  static const double heading2Mobile = 24;
  static const double heading3Mobile = 18;
  static const double subtitleMobile = 18;
  static const double body1Mobile = 16;
  static const double body2Mobile = 16;
  static const double body3Mobile = 14;
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
