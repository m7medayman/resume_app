import 'package:either_dart/src/either.dart';

import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/resources/base_usecase/base_use_case.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/features/auth/domain/entity.dart';
import 'package:resume_app/features/auth/domain/repository.dart';

class LoginUseCase extends BaseUseCase<LoginParameter, AuthUserEntity> {
  AuthRepository authRepository;
  LoginUseCase({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, AuthUserEntity>> execute(LoginParameter input) async {
    return await authRepository.login(input);
  }
}

class SignUpUseCase extends BaseUseCase<SignUpParameter, AuthUserEntity> {
  AuthRepository authRepository;
  SignUpUseCase({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, AuthUserEntity>> execute(SignUpParameter input) async {
    return authRepository.signUP(input);
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
  String name;
  String phone;
  String address;
  String contactEmail;
  ContactExtraDetails contactDetails;
  EducationInfo educationInfo;
  SignUpParameter({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.address,
    required this.contactEmail,
    required this.contactDetails,
    required this.educationInfo,
  });
}
