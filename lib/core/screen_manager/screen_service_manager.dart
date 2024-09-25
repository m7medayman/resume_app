import 'package:resume_app/core/Di/di.dart';
import 'package:resume_app/core/resources/device_manager.dart/device_manager.dart';
import 'package:resume_app/core/theme_manager/font/font_stayle_manager.dart';
import 'package:resume_app/core/theme_manager/theme_manager.dart';

class ScreenSizeService {
  double screenWidth;
  ScreenSizeService(this.screenWidth);
  void updateScreenSize(double newScreenWidth) {
    screenWidth = newScreenWidth;
    instance<DeviceManager>().updateDevice(screenWidth);
    instance<FontStyleManager>().updateDeviceManger(instance<DeviceManager>());
    instance<MyTheme>().updateFontStyleManager(instance<FontStyleManager>());
  }
}
