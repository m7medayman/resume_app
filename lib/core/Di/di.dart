import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:resume_app/core/Di/Ai_module.dart';
import 'package:resume_app/core/auth_provider/auth_check.dart';
import 'package:resume_app/core/auth_provider/fire_base_auth/fire_base_auth.dart';
import 'package:resume_app/core/data_classes/pdf_data_class.dart';
import 'package:resume_app/core/data_classes/user_info.dart';

import 'package:resume_app/core/resources/device_manager.dart/device_manager.dart';
import 'package:resume_app/core/resources/failure/failure_handler.dart';
import 'package:resume_app/core/resources/failure/failure_registry.dart';
import 'package:resume_app/core/screen_manager/screen_service_manager.dart';
import 'package:resume_app/core/theme_manager/font/font_stayle_manager.dart';
import 'package:resume_app/core/theme_manager/theme_manager.dart';
import 'package:resume_app/core/auth_provider/fire_base_auth/failure_handler.dart';
import 'package:resume_app/features/auth/data/auth_repo_imp.dart';
import 'package:resume_app/features/auth/domain/use_case.dart';
import 'package:resume_app/features/pdf_creator/data/pdf_form.dart';
import 'package:resume_app/features/pdf_creator/data/pdf_save_service.dart';
import 'package:resume_app/features/pdf_creator/data/repo_imp.dart';
import 'package:resume_app/features/pdf_creator/domain/pdf_creating_use_case.dart';
import 'package:resume_app/core/AI_services/data/repo_impelement.dart';
import 'package:resume_app/features/resume_dialog/domain/use_case.dart';

final getIt = GetIt.instance;
bool isInitThemeModule = false;
void initThemeModule(double screenWidth) {
  if (!isInitThemeModule) {
    DeviceManager deviceManager = DeviceManager(screenWidth: screenWidth);

    getIt.registerLazySingleton<DeviceManager>(() => deviceManager);

    getIt.registerLazySingleton<FontStyleManager>(
        () => FontStyleManager(getIt<DeviceManager>()));

    getIt.registerLazySingleton<MyTheme>(
        () => MyTheme(fontStyleManager: getIt<FontStyleManager>()));

    getIt.registerLazySingleton(() => ScreenSizeService(screenWidth));
  } else {
    //
  }
  isInitThemeModule = true;
}

bool isInitModule = false;
void initModule() async {
  if (!isInitModule) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    getIt.registerLazySingleton(() => auth);
    getIt.registerLazySingleton(() => FailureHandler());
    initAllAuthFailureHandles();
    FailureRegistry.initializeAll(getIt<FailureHandler>());
    getIt.registerFactory(
        () => AuthChecker(firebaseAuth: getIt<FirebaseAuth>()));
  }
  isInitModule = true;
}

bool isAuthReoInit = false;
void authRepoInit() {
  if (isAuthReoInit) {
    return;
  }
  isAuthReoInit = true;
  getIt.registerFactory(() => FireBaseAuthService(
      auth: getIt<FirebaseAuth>(), failureHandler: getIt<FailureHandler>()));
  initAiModule();
  getIt.registerFactory(() => AuthRepositoryImp(
        AiProvider: getIt(),
        authChecker: getIt<AuthChecker>(),
        serviceProvider: getIt<FireBaseAuthService>(),
        failureHandler: getIt<FailureHandler>(),
      ));
}

bool isLoginModule = false;
void initLoginModule() {
  if (!isLoginModule) {
    authRepoInit();
    getIt.registerFactory(
        () => LoginUseCase(authRepository: getIt<AuthRepositoryImp>()));
    getIt.registerFactory(
        () => AutoLoginUseCase(authRepository: getIt<AuthRepositoryImp>()));
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
  getIt.registerFactory(() => JobExperienceEnhanceSignupUseCase(
      repository: getIt<AuthRepositoryImp>()));
}

bool isResumeDialogModelInit = false;
void initResumeDialogModel() {
  if (isResumeDialogModelInit) {
    return;
  }
  isResumeDialogModelInit = true;
  initAiModule();
  getIt.registerFactory(
      () => JobDescriptionUseCases(repository: getIt<AiRepoImp>()));
  getIt
      .registerFactory(() => JobSummaryUseCase(repository: getIt<AiRepoImp>()));
  getIt.registerFactory(
      () => JobExperienceEnhanceUseCase(repository: getIt<AiRepoImp>()));
}

bool isPdfViewerInit = false;
void initPdfViewerModule(PdfData data) async {
  if (isPdfViewerInit) {
    await getIt.unregister<PdfForm>();
    getIt.registerFactory(() => PdfForm(data: data));

    return;
  }
  getIt.registerFactory(() => PdfSaveService());
  getIt.registerFactory(() => PdfForm(data: data));
  getIt.registerFactory(
      () => pdfRepoImp(pdfForm: getIt(), pdfSaveService: getIt()));
  getIt.registerFactory(() => PdfCreatingUseCase(repo: getIt<pdfRepoImp>()));
  getIt.registerFactory(() => PdfSaveUseCase(repo: getIt<pdfRepoImp>()));
  isPdfViewerInit = true;
}

bool isUserRegisted = false;
void registUser(MyUserInfo userInfo) {
  if (isUserRegisted) {
    getIt.unregister(instance: getIt<MyUserInfo>());
    getIt.registerLazySingleton(() => userInfo);
    print(getIt<MyUserInfo>().educationInfo.courses);
    return;
  }
  isUserRegisted = true;
  getIt.registerLazySingleton(() => userInfo);
}

void unRigister() {
  if (isUserRegisted) {
    getIt.unregister(instance: getIt<MyUserInfo>());
    isUserRegisted = false;
  }
}
