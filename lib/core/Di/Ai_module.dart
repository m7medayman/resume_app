import 'package:resume_app/core/AI_services/data/repo_impelement.dart';
import 'package:resume_app/core/AI_services/gemini_repo/job_details_service_provider.dart';
import 'package:resume_app/core/Di/injection.dart';

bool isAiModelInit = false;
void initAiModule() {
  if (isAiModelInit) {
    return;
  }
  isAiModelInit = true;
  getIt.registerFactory(() => GeminiJobDetailsServiceProvider());
  getIt.registerFactory(() => AiRepoImp(serviceProvider: getIt()));
}
