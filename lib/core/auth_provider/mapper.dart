// request mapper is mapping the parameter to request

import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/data_classes/project_experience.dart';
import 'package:resume_app/core/data_classes/user_info.dart';
import 'package:resume_app/core/data_classes/work_experience.dart';
import 'package:resume_app/core/resources/helpers/null_type_extension.dart';
import 'package:resume_app/core/auth_provider/responses/Response.dart';
import 'package:resume_app/core/auth_provider/requests/request.dart';
import 'package:resume_app/features/auth/domain/use_case.dart';
import 'package:resume_app/features/change_user_info/domain/update_user_usecase.dart';

extension LoginMapper on LoginParameter {
  LoginRequest toLoginRequest() {
    return LoginRequest(email: email, password: password);
  }
}

extension UserInfoDataRequestsMapper on SignUpParameter {
  UserInfoDataRequest toUserInfoDataRequest() {
    return UserInfoDataRequest(
        punchOfWorkExperince: punchOfWorkingExperience.map((work) {
          return work.toJson();
        }).toList(),
        punchOfProjectExperince: punchOfProjectExperienc.map((project) {
          return project.toJson();
        }).toList(),
        contactEmail: contactEmail,
        name: name,
        phone: phone,
        address: address,
        contactDetails: contactDetails.toJson(),
        educationInfo: educationInfo.toJson());
  }
}

extension SignUpAuthMapper on SignUpParameter {
  SignUpRequest toSignUpRequest() {
    return SignUpRequest(email: email, password: password);
  }
}

extension AuthEntityMapper on AuthResponse {
  MyUserInfo toEntity() {
    return MyUserInfo(
        punchOfWorkExperiences: punchOfWorkExperinces.map((work) {
          return WorkExperience.fromJson(work);
        }).toList(),
        punchOfProjectExperiences: punchOfProjectExperiences.map((project) {
          return ProjectExperience.fromJson(project);
        }).toList(),
        contactEmail: contactEmail.nullSafety(),
        name: name.nullSafety(),
        phone: phone.nullSafety(),
        address: address.nullSafety(),
        extraContactDetails: ContactExtraDetails.fromJson(contactDetails),
        educationInfo: EducationInfo.fromJson(educationInfo));
  }
}

extension UpdateUserDataMapper on UpdateUserParameters {
  UserInfoDataRequest toUserInfoRequest() {
    return UserInfoDataRequest(
        punchOfWorkExperince: punchOfWorkingExperience.map((work) {
          return work.toJson();
        }).toList(),
        punchOfProjectExperince: punchOfProjectExperienc.map((project) {
          return project.toJson();
        }).toList(),
        name: name,
        phone: phone,
        address: address,
        contactEmail: contactEmail,
        contactDetails: contactExtraDetails.toJson(),
        educationInfo: educationInfo.toJson());
  }
}
