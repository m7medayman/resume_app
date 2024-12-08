// request mapper is mapping the parameter to request

import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/data_classes/user_info.dart';
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
        name: name,
        phone: phone,
        address: address,
        contactEmail: contactEmail,
        contactDetails: contactExtraDetails.toJson(),
        educationInfo: educationInfo.toJson());
  }
}
