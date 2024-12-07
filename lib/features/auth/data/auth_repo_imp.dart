import 'package:either_dart/src/either.dart';
import 'package:resume_app/core/Di/di.dart';
import 'package:resume_app/core/auth_provider/auth_check.dart';
import 'package:resume_app/core/data_classes/user_info.dart';

import 'package:resume_app/core/resources/failure/failure_handler.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/core/shared_pref/shared_pref.dart';
import 'package:resume_app/features/auth/data/Response.dart';
import 'package:resume_app/features/auth/data/mapper.dart';
import 'package:resume_app/core/auth_provider/network_service_provider.dart';
import 'package:resume_app/features/auth/domain/repository.dart';
import 'package:resume_app/features/auth/domain/use_case.dart';

class AuthRepositoryImp extends AuthRepository {
  AuthServiceProvider serviceProvider;
  FailureHandler failureHandler;
  final AuthChecker authChecker;

  AuthRepositoryImp({
    required this.authChecker,
    required this.serviceProvider,
    required this.failureHandler,
  });
  @override
  Future<Either<Failure, MyUserInfo>> login(
      LoginParameter loginParameter) async {
    try {
      AuthResponse response =
          await serviceProvider.login(loginParameter.toLoginRequest());
      var userInfo = response.toEntity();
      registUser(userInfo);
      return Right(userInfo);
    } catch (e) {
      return Left(failureHandler.handleFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MyUserInfo>> signUP(
      SignUpParameter signUpParameter) async {
    try {
      AuthResponse response = await serviceProvider.signUp(
          signUpParameter.toSignUpRequest(),
          signUpParameter.toSignUpRequestUserDetails());
      var userInfo = response.toEntity();
      registUser(userInfo);
      return Right(userInfo);
    } catch (e) {
      Failure failure = failureHandler.handleFailure(e.toString());
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, MyUserInfo?>> autoLogin() async {
    if (authChecker.check()) {
      try {
        AuthResponse response = await serviceProvider.autoLogin();
        var userInfo = response.toEntity();
        registUser(userInfo);
        return Right(userInfo);
      } catch (e) {
        return Left(Failure(id: 5002, message: e.toString()));
      }
    } else {
      return const Right(null);
    }
  }
}
