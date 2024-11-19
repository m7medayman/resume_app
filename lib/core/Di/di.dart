import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

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
import 'package:resume_app/features/pdf_creator/data/pdf_form.dart';
import 'package:resume_app/features/pdf_creator/data/repo_imp.dart';
import 'package:resume_app/features/pdf_creator/domain/pdf_creating_use_case.dart';
import 'package:resume_app/features/resume_dialog/data/gemini_repo/job_details_service_provider.dart';
import 'package:resume_app/features/resume_dialog/data/repo_impelement.dart';
import 'package:resume_app/features/resume_dialog/domain/use_case.dart';

final getIt = GetIt.instance;
bool isInitThemeModule = false;
void initThemeModule(double screenWidth) {
  if (!isInitThemeModule) {
    DeviceManager deviceManager = DeviceManager(screenWidth: screenWidth);
    print("device done");

    getIt.registerLazySingleton<DeviceManager>(() => deviceManager);
    print("device done regist");
    getIt.registerLazySingleton<FontStyleManager>(
        () => FontStyleManager(getIt<DeviceManager>()));
    print("font done regist");
    getIt.registerLazySingleton<MyTheme>(
        () => MyTheme(fontStyleManager: getIt<FontStyleManager>()));
    print("theme done regist");
    getIt.registerLazySingleton(() => ScreenSizeService(screenWidth));
  } else {
    //
  }
  isInitThemeModule = true;
}

bool isInitModule = false;
void initModule() {
  if (!isInitModule) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    getIt.registerLazySingleton(() => auth);
    getIt.registerLazySingleton(() => FailureHandler());
    initAllAuthFailureHandles();
    FailureRegistry.initializeAll(getIt<FailureHandler>());
  }
  isInitModule = true;
}

bool isAuthReoInit = false;
void authRepoInit() {
  if (isAuthReoInit) {
    return;
  }
  isAuthReoInit = true;
  getIt.registerFactory(() => AuthService(
      auth: getIt<FirebaseAuth>(), failureHandler: getIt<FailureHandler>()));
  getIt.registerFactory(() => AuthRepositoryImp(
      serviceProvider: getIt<AuthService>(),
      failureHandler: getIt<FailureHandler>()));
}

bool isLoginModule = false;
void initLoginModule() {
  if (!isLoginModule) {
    authRepoInit();
    getIt.registerFactory(
        () => LoginUseCase(authRepository: getIt<AuthRepositoryImp>()));
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

bool isResumeDialogModelInit = false;
void initResumeDialogModel() {
  if (isResumeDialogModelInit) {
    return;
  }
  isResumeDialogModelInit = true;
  getIt.registerFactory(() => JobDetailsServiceProvider());
  getIt.registerFactory(() => JobRepImp(serviceProvider: getIt()));
  getIt.registerFactory(
      () => JobDescriptionUseCases(repository: getIt<JobRepImp>()));
  getIt
      .registerFactory(() => JobSummaryUseCase(repository: getIt<JobRepImp>()));
  getIt.registerFactory(
      () => JobExperienceEnhanceUseCase(repository: getIt<JobRepImp>()));
}

bool isPdfViewerInit = false;
void initPdfViewerModule() {
  if (isPdfViewerInit) {
    return;
  }
  getIt.registerFactory(() => PdfForm());
  getIt.registerFactory(() => pdfRepoImp(pdfForm: getIt()));
  getIt.registerFactory(() => PdfCreatingUseCase(repo: getIt<pdfRepoImp>()));
  isPdfViewerInit = true;
}
