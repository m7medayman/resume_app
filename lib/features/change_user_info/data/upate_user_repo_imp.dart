import 'package:either_dart/src/either.dart';
import 'package:resume_app/core/Di/di.dart';
import 'package:resume_app/core/auth_provider/auth_network_service_provider.dart';
import 'package:resume_app/core/auth_provider/responses/Response.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/core/auth_provider/mapper.dart';
import 'package:resume_app/features/change_user_info/domain/update_user_repo.dart';
import 'package:resume_app/features/change_user_info/domain/update_user_usecase.dart';

class UpateUserRepoImp extends UpdateUserRepo {
 final AuthServiceProvider serviceProvider;

  UpateUserRepoImp({required this.serviceProvider});
  @override
  Future<Either<Failure, Null>> updateUserData({required String id, required UpdateUserParameters input})async {
    try {
      AuthResponse response = await serviceProvider.updateUserInfo(id: id, userDetailsRequest: input.toUserInfoRequest());
      var userInfo = response.toEntity();
      registUser(userInfo);
      return const Right(null);
    } catch (e) {
     
      return Left(Failure(id: 6001, message: e.toString()));
    }
  }
}