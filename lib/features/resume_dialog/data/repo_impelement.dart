import 'package:either_dart/src/either.dart';

import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/features/resume_dialog/data/gemini_repo/job_details_service_provider.dart';
import 'package:resume_app/features/resume_dialog/data/response_model.dart';
import 'package:resume_app/features/resume_dialog/domain/entities/job_info.dart';
import 'package:resume_app/features/resume_dialog/domain/repository.dart';

class JobRepImp implements JobDialogRepository {
  JobDetailsServiceProvider serviceProvider;
  JobRepImp({
    required this.serviceProvider,
  });
  @override
  Future<Either<Failure, JobInfo>> getJobDescription(
      String jobDescription) async {
    try {
      JobDescriptionResponseModel responseModel =
          await serviceProvider.getSkills(jobDescription);
      return Right(JobInfo(
          softSkills: responseModel.softSkills ?? [],
          hardSkills: responseModel.hardSkills ?? [],
          jobTitle: responseModel.jobTitle ?? "empty",
          keyWords: responseModel.punchOfKeyWords ?? ["empty"]));
    } catch (e) {
      print("error at JobRepo");
      return Left(Failure(id: 110, message: e.toString()));
    }
  }

  Future<Either<Failure, String>> getJobSummary(
      String inputJobSummary, List<String> keyWords) async {
    try {
      JobSummaryResponse responseModel =
          await serviceProvider.getJobSummary(inputJobSummary, keyWords);
      return (Right(responseModel.jobSummary));
    } catch (e) {
      return Left(Failure(id: 111, message: e.toString()));
    }
  }
}
