import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:resume_app/core/resources/device_manager.dart/device_manager.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;
@injectableInit
void configureDependencies(String env) => getIt.init(environment: env);

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}

@module
abstract class AppModule {
  // This method provides a DeviceManager instance
  @singleton
  DeviceManager createDeviceManager(double screenWidth) {
    return DeviceManager(screenWidth: screenWidth);
  }

  // You can add other methods to provide different dependencies
}
