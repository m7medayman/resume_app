import 'package:resume_app/core/AI_services/data/repo_impelement.dart';
import 'package:resume_app/core/Di/Ai_module.dart';
import 'package:resume_app/core/Di/injection.dart';
import 'package:resume_app/core/auth_provider/fire_base_auth/fire_base_auth.dart';
import 'package:resume_app/features/change_user_info/data/upate_user_repo_imp.dart';
import 'package:resume_app/features/change_user_info/domain/update_user_usecase.dart';

bool isUpdateUserModuleIsInit = false;

void updateUserModule() {
  if (isUpdateUserModuleIsInit) {
    return;
  }
  getIt.registerFactory(
      () => UpateUserRepoImp(serviceProvider: getIt<FireBaseAuthService>()));
  getIt.registerFactory(
      () => UpdateUserUsecase(updateUserRepo: getIt<UpateUserRepoImp>()));
  isUpdateUserModuleIsInit = true;
  initAiModule();
  getIt.registerFactory(() =>
      JobExperienceEnhanceChangeUserUseCase(repository: getIt<AiRepoImp>()));
}
