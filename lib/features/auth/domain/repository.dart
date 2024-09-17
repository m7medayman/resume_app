import 'package:either_dart/either.dart';
import 'package:resume_app/core/resources/failure.dart';
import 'package:resume_app/features/auth/domain/entity.dart';
import 'package:resume_app/features/auth/domain/use_case.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthUserEntity>> login(LoginParameter loginParameter);
  Future<Either<Failure, AuthUserEntity>> signUP(
      SignUpParameter signUpParameter);
}
