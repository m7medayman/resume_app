import 'package:either_dart/src/either.dart';
import 'package:resume_app/core/data_classes/user_info.dart';

import 'package:resume_app/core/resources/failure/failure_handler.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/features/auth/data/Response.dart';
import 'package:resume_app/features/auth/data/mapper.dart';
import 'package:resume_app/features/auth/data/network_service_provider.dart';
import 'package:resume_app/features/auth/domain/entity.dart';
import 'package:resume_app/features/auth/domain/repository.dart';
import 'package:resume_app/features/auth/domain/use_case.dart';

class AuthRepositoryImp extends AuthRepository {
  NetworkServiceProvider serviceProvider;
  FailureHandler failureHandler;
  AuthRepositoryImp({
    required this.serviceProvider,
    required this.failureHandler,
  });
  @override
  Future<Either<Failure, MyUserInfo>> login(
      LoginParameter loginParameter) async {
    try {
      AuthResponse response =
          await serviceProvider.login(loginParameter.toLoginRequest());
      return Right(response.toEntity());
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
      return Right(response.toEntity());
    } catch (e) {
      Failure failure = failureHandler.handleFailure(e.toString());
      return Left(failure);
    }
  }
}
