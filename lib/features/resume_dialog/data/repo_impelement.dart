import 'package:either_dart/src/either.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/core/resources/failure/system_failure_const.dart';
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
    if (!await InternetConnection().hasInternetAccess) {
      return Left(SystemFailureConstants.noInternetConnection);
    }
    try {
      JobDescriptionResponseModel responseModel =
          await serviceProvider.getSkills(jobDescription);
      return Right(JobInfo(
          softSkills: responseModel.softSkills ?? [],
          hardSkills: responseModel.hardSkills ?? [],
          jobTitle: responseModel.jobTitle ?? "empty",
          keyWords: responseModel.punchOfKeyWords ?? ["empty"]));
    } on ServerException catch (_) {
      return Left(SystemFailureConstants.serverIsBusy);
    } catch (e) {

      return Left(Failure(id: 110, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getJobSummary(
      String inputJobSummary, List<String> keyWords) async {
    if (!await InternetConnection().hasInternetAccess) {
      return Left(SystemFailureConstants.noInternetConnection);
    }
    try {
      JobSummaryResponse responseModel =
          await serviceProvider.getJobSummary(inputJobSummary, keyWords);
      return (Right(responseModel.jobSummary));
    } on ServerException catch (_) {
      return Left(SystemFailureConstants.serverIsBusy);
    } catch (e) {
      return Left(Failure(id: 111, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getJobExperienceEnhance(
      String jobExperience) async {
    if (!await InternetConnection().hasInternetAccess) {
      return Left(SystemFailureConstants.noInternetConnection);
    }
    try {
      JobExperienceResponse responseModel =
          await serviceProvider.getJobExperience(jobExperience);
      return (Right(responseModel.jobExperience));
    } on ServerException catch (_) {
      return Left(SystemFailureConstants.serverIsBusy);
    } catch (e) {
      return Left(Failure(id: 112, message: e.toString()));
    }
  }
}
