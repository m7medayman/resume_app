import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:resume_app/core/Di/injection.dart';

import 'package:resume_app/core/resources/device_manager.dart/device_manager.dart';
import 'package:resume_app/core/resources/failure/failure_handler.dart';
import 'package:resume_app/core/resources/failure/failure_registry.dart';
import 'package:resume_app/core/screen_manager/screen_service_manager.dart';
import 'package:resume_app/core/theme_manager/font/font_stayle_manager.dart';
import 'package:resume_app/core/theme_manager/theme_manager.dart';
import 'package:resume_app/features/auth/data/fire_base_auth/failure_handler.dart';
import 'package:resume_app/features/auth/data/fire_base_auth/fire_base_auth.dart';
import 'package:resume_app/features/auth/data/repository.dart';
import 'package:resume_app/features/auth/domain/use_case.dart';

final instance = GetIt.instance;
bool isInitThemeModule = false;
void initThemeModule(double screenWidth) {
  if (!isInitThemeModule) {
    DeviceManager deviceManager = DeviceManager(screenWidth: screenWidth);
    print("device done");

    instance.registerLazySingleton<DeviceManager>(() => deviceManager);
    print("device done regist");
    instance.registerLazySingleton<FontStyleManager>(
        () => FontStyleManager(instance<DeviceManager>()));
    print("font done regist");
    instance.registerLazySingleton<MyTheme>(
        () => MyTheme(fontStyleManager: instance<FontStyleManager>()));
    print("theme done regist");
    instance.registerLazySingleton(() => ScreenSizeService(screenWidth));
  } else {
    //
  }
  isInitThemeModule = true;
}

bool isInitModule = false;
void initModule() {
  if (!isInitModule) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    instance.registerLazySingleton(() => auth);
    instance.registerLazySingleton(() => FailureHandler());
    initAllAuthFailureHandles();
    FailureRegistry.initializeAll(instance<FailureHandler>());
  }
  isInitModule = true;
}

bool isAuthReoInit = false;
void authRepoInit() {
  if (isAuthReoInit) {
    return;
  }
  isAuthReoInit = true;
  instance.registerFactory(() => AuthService(
      auth: instance<FirebaseAuth>(),
      failureHandler: instance<FailureHandler>()));
  instance.registerFactory(() => AuthRepositoryImp(
      serviceProvider: instance<AuthService>(),
      failureHandler: instance<FailureHandler>()));
}

bool isLoginModule = false;
void initLoginModule() {
  if (!isLoginModule) {
    authRepoInit();
    instance.registerFactory(
        () => LoginUseCase(authRepository: instance<AuthRepositoryImp>()));
  }
  isLoginModule = true;
}

bool isSignupMoudleInit = false;

void initSignupModule() {
  if (isSignupMoudleInit) {
    return;
  }
  isSignupMoudleInit = true;
  authRepoInit();
  getIt.registerFactory(
      () => SignUpUseCase(authRepository: getIt<AuthRepositoryImp>()));
}
