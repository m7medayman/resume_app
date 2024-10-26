import 'package:either_dart/either.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/features/resume_dialog/domain/entities/job_info.dart';

abstract class JobDialogRepository {
  Future<Either<Failure, JobInfo>> getJobDescription(String jobDescription);
}
