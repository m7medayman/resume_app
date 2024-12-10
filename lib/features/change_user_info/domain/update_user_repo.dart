import 'package:either_dart/either.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/features/change_user_info/domain/update_user_usecase.dart';

abstract class UpdateUserRepo {
  Future<Either<Failure, Null>> updateUserData(
      {required String id, required UpdateUserParameters input});

}
