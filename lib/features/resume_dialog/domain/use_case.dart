import 'package:either_dart/src/either.dart';

import 'package:resume_app/core/resources/base_usecase/base_use_case.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/features/resume_dialog/domain/entities/job_info.dart';
import 'package:resume_app/core/AI_services/repository.dart';

class JobDescriptionUseCases extends BaseUseCase<String, JobInfo> {
  AiRepo repository;
  JobDescriptionUseCases({
    required this.repository,
  });
  @override
  Future<Either<Failure, JobInfo>> execute(String jobDescription) async {
    return await repository.getJobDescription(jobDescription);
  }
}

class JobExperienceEnhanceUseCase extends BaseUseCase<String, String> {
  AiRepo repository;
  JobExperienceEnhanceUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, String>> execute(String input) async {
    // TODO: implement execute
    return await repository.getJobExperienceEnhance(input);
  }
}

class JobSummaryUseCase extends BaseUseCase<JobSummaryInput, String> {
  AiRepo repository;
  JobSummaryUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, String>> execute(JobSummaryInput input) async {
    // TODO: implement execute
    return await repository.getJobSummary(input.jobSummary, input.keyWords);
  }
}

class JobSummaryInput {
  String jobSummary;
  List<String> keyWords;
  JobSummaryInput({
    required this.jobSummary,
    required this.keyWords,
  });
}
