import 'package:resume_app/core/Di/injection.dart';
import 'package:resume_app/core/auth_provider/api/fire_base_auth/fire_base_auth.dart';
import 'package:resume_app/features/home/data/file_scan_service_imp.dart';
import 'package:resume_app/features/home/data/home_repo_imp.dart';
import 'package:resume_app/features/home/domain/home_use_case.dart';

bool homeModuleIsInit = false;
void initHomeModule() {
  if (homeModuleIsInit) {
    return;
  }
  getIt.registerFactory(() => FileScanServiceImp());
  getIt.registerFactory(() => HomeRepoImp(
        fileScanService: getIt<FileScanServiceImp>(),
        authServiceProvider: getIt<FireBaseAuthService>(),
      ));

  getIt.registerFactory(() => GetPdfUseCase(repo: getIt<HomeRepoImp>()));
  getIt.registerFactory(() => SignOutUseCase(repo: getIt<HomeRepoImp>()));

  homeModuleIsInit = true;
}
