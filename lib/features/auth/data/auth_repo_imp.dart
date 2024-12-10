import 'package:either_dart/src/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:resume_app/core/AI_services/gemini_repo/job_details_service_provider.dart';
import 'package:resume_app/core/AI_services/gemini_repo/response_model.dart';

import 'package:resume_app/core/Di/di.dart';
import 'package:resume_app/core/auth_provider/auth_check.dart';
import 'package:resume_app/core/data_classes/user_info.dart';

import 'package:resume_app/core/resources/failure/failure_handler.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/core/resources/failure/system_failure_const.dart';
import 'package:resume_app/core/auth_provider/responses/Response.dart';
import 'package:resume_app/core/auth_provider/mapper.dart';
import 'package:resume_app/core/auth_provider/auth_network_service_provider.dart';
import 'package:resume_app/features/auth/domain/repository.dart';
import 'package:resume_app/features/auth/domain/use_case.dart';

class AuthRepositoryImp extends AuthRepository {
  AuthServiceProvider serviceProvider;
  GeminiJobDetailsServiceProvider AiProvider;
  FailureHandler failureHandler;
  final AuthChecker authChecker;

  AuthRepositoryImp({
    required this.serviceProvider,
    required this.authChecker,
    required this.AiProvider,
    required this.failureHandler,
  });
  @override
  Future<Either<Failure, String>> getJobExperienceEnhance(
      String jobExperience) async {
    if (!await InternetConnection().hasInternetAccess) {
      return Left(SystemFailureConstants.noInternetConnection);
    }
    try {
      JobExperienceResponse responseModel =
          await AiProvider.getJobExperience(jobExperience);
      return (Right(responseModel.jobExperience));
    } on ServerException catch (_) {
      return Left(SystemFailureConstants.serverIsBusy);
    } catch (e) {
      return Left(Failure(id: 112, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MyUserInfo>> login(
      LoginParameter loginParameter) async {
    if (!await InternetConnection().hasInternetAccess) {
      return Left(SystemFailureConstants.noInternetConnection);
    }
    try {
      AuthResponse response =
          await serviceProvider.login(loginParameter.toLoginRequest());
      var userInfo = response.toEntity();
      registUser(userInfo);
      return Right(userInfo);
    } on FirebaseAuthException catch (e) {
      return Left(failureHandler.handleFailure(e.code));
    } catch (e) {
      return Left(failureHandler.handleFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MyUserInfo>> signUP(
      SignUpParameter signUpParameter) async {
    if (!await InternetConnection().hasInternetAccess) {
      return Left(SystemFailureConstants.noInternetConnection);
    }
    try {
      AuthResponse response = await serviceProvider.signUp(
          signUpParameter.toSignUpRequest(),
          signUpParameter.toUserInfoDataRequest());
      var userInfo = response.toEntity();
      registUser(userInfo);
      return Right(userInfo);
    } on FirebaseAuthException catch (e) {
      return Left(failureHandler.handleFailure(e.code));
    } catch (e) {
      Failure failure = failureHandler.handleFailure(e.toString());
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, MyUserInfo?>> autoLogin() async {
    if (!await InternetConnection().hasInternetAccess) {
      return Left(SystemFailureConstants.noInternetConnection);
    }
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
