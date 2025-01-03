import 'package:either_dart/src/either.dart';

import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/data_classes/project_experience.dart';
import 'package:resume_app/core/data_classes/user_info.dart';
import 'package:resume_app/core/data_classes/work_experience.dart';
import 'package:resume_app/core/resources/base_usecase/base_use_case.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/features/auth/domain/repository.dart';

class LoginUseCase extends BaseUseCase<LoginParameter, MyUserInfo> {
  AuthRepository authRepository;
  LoginUseCase({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, MyUserInfo>> execute(LoginParameter input) async {
    return await authRepository.login(input);
  }
}

class AutoLoginUseCase extends BaseUseCase<void, MyUserInfo?> {
  final AuthRepository authRepository;

  AutoLoginUseCase({required this.authRepository});
  @override
  Future<Either<Failure, MyUserInfo?>> execute([void input]) async {
    return await authRepository.autoLogin();
  }
}
class JobExperienceEnhanceSignupUseCase extends BaseUseCase<String, String> {
  AuthRepository repository;
  JobExperienceEnhanceSignupUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, String>> execute(String input) async {
    // TODO: implement execute
    return await repository.getJobExperienceEnhance(input);
  }
}

class SignUpUseCase extends BaseUseCase<SignUpParameter, MyUserInfo> {
  AuthRepository authRepository;
  SignUpUseCase({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, MyUserInfo>> execute(SignUpParameter input) async {
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
  List<WorkExperience> punchOfWorkingExperience;
  List<ProjectExperience> punchOfProjectExperienc;
  ContactExtraDetails contactDetails;
  EducationInfo educationInfo;
  SignUpParameter({
    required this.punchOfProjectExperienc,
    required this.punchOfWorkingExperience,
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
