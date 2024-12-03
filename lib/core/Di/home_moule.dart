import 'package:resume_app/core/Di/injection.dart';
import 'package:resume_app/features/home/data/file_scan_service_imp.dart';
import 'package:resume_app/features/home/data/home_repo_imp.dart';
import 'package:resume_app/features/home/domain/home_use_case.dart';

bool homeModuleIsInit = false;
void initHomeModule() {
  if (homeModuleIsInit) {
    return;
  }
  getIt.registerFactory(() => FileScanServiceImp());
  getIt.registerFactory(
      () => HomeRepoImp(fileScanService: getIt<FileScanServiceImp>()));
  getIt.registerFactory(() => GetPdfUseCase(repo: getIt<HomeRepoImp>()));
  homeModuleIsInit = true;
}
