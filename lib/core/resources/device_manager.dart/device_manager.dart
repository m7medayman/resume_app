enum Devices { computer, tablet, mobile }

class DeviceManager {
  static int mobileSize = 600;
  static int tabletSize = 1024;
  Devices getDevice(double screenWidth) {
    if (screenWidth <= mobileSize) {
      return Devices.mobile;
    } else if (screenWidth > mobileSize && screenWidth <= tabletSize) {
      return Devices.tablet;
    } else {
      return Devices.computer;
    }
  }
}
