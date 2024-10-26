import 'package:either_dart/src/either.dart';

import 'package:resume_app/core/resources/base_usecase/base_use_case.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/features/resume_dialog/domain/entities/job_info.dart';
import 'package:resume_app/features/resume_dialog/domain/repository.dart';

class JobDescriptionUseCases extends BaseUseCase<String, JobInfo> {
  JobDialogRepository repository;
  JobDescriptionUseCases({
    required this.repository,
  });
  @override
  Future<Either<Failure, JobInfo>> execute(String jobDescription) async {
    return await repository.getJobDescription(jobDescription);
  }
}
