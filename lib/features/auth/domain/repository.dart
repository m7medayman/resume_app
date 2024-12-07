import 'dart:nativewrappers/_internal/vm/lib/mirrors_patch.dart';

import 'package:either_dart/either.dart';
import 'package:resume_app/core/data_classes/user_info.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/features/auth/domain/use_case.dart';

abstract class AuthRepository {
  Future<Either<Failure, MyUserInfo>> login(LoginParameter loginParameter);
  Future<Either<Failure, MyUserInfo>> signUP(SignUpParameter signUpParameter);
  Future<Either<Failure, MyUserInfo?>> autoLogin();
}
