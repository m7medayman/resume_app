import 'package:either_dart/src/either.dart';

import 'package:resume_app/core/resources/base_use_case.dart';
import 'package:resume_app/core/resources/failure.dart';
import 'package:resume_app/features/auth/domain/entity.dart';

class LoginUseCase extends BaseUseCase<LoginParameter, AuthUserEntity> {
  @override
  Future<Either<Failure, AuthUserEntity>> execute(LoginParameter input) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}

class SignUpUseCase extends BaseUseCase<SignUpParameter, AuthUserEntity> {
  @override
  Future<Either<Failure, AuthUserEntity>> execute(SignUpParameter input) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}

class LoginParameter {
  String email;
  String password;
  LoginParameter({
    required this.email,
    required this.password,
  });
}

class SignUpParameter {
  String email;
  String password;
  String userName;
  String phone;
  String address;
  Map<String, String> contactInfo;
  SignUpParameter({
    required this.email,
    required this.password,
    required this.userName,
    required this.phone,
    required this.address,
    required this.contactInfo,
  });
}
