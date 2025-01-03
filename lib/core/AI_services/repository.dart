import 'package:either_dart/either.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/features/resume_dialog/domain/entities/job_info.dart';

abstract class AiRepo {
  Future<Either<Failure, JobInfo>> getJobDescription(String jobDescription);
  Future<Either<Failure, String>> getJobSummary(
      String jobSummary, List<String> keyWords);
  Future<Either<Failure, String>> getJobExperienceEnhance(String jobSummary);
}
