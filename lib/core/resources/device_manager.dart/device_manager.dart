enum Devices { computer, tablet, mobile }

class DeviceManager {
  static int mobileSize = 600;
  static int tabletSize = 1024;
  late Devices _device;
  get getDevice => _device;
  DeviceManager({double screenWidth = 600}) {
    _device = _getDeviceType(screenWidth);
  }
  void updateDevice(double screenWidth) {
    _device = _getDeviceType(screenWidth);
  }

  Devices _getDeviceType(double screenWidth) {
    if (screenWidth <= mobileSize) {
      return Devices.mobile;
    } else if (screenWidth > mobileSize && screenWidth <= tabletSize) {
      return Devices.tablet;
    } else {
      return Devices.computer;
    }
  }
}
