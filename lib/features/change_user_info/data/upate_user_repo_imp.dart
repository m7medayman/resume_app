import 'package:either_dart/src/either.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/features/change_user_info/domain/update_user_repo.dart';
import 'package:resume_app/features/change_user_info/domain/update_user_usecase.dart';

class UpateUserRepoImp extends UpdateUserRepo {
  @override
  Future<Either<Failure, Null>> updateUserData(UpdateUserParameters input) {
    // TODO: implement updateUserData
    throw UnimplementedError();
  }
}