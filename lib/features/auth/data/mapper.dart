// request mapper is mapping the parameter to request

import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/data_classes/user_info.dart';
import 'package:resume_app/core/resources/helpers/null_type_extension.dart';
import 'package:resume_app/features/auth/data/Response.dart';
import 'package:resume_app/features/auth/data/request.dart';
import 'package:resume_app/features/auth/domain/use_case.dart';

extension LoginMapper on LoginParameter {
  LoginRequest toLoginRequest() {
    return LoginRequest(email: email, password: password);
  }
}

extension SignUpRequestUserDetailsMapper on SignUpParameter {
  SignUpRequestUserDetails toSignUpRequestUserDetails() {
    return SignUpRequestUserDetails(
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
        contactDetails: ContactExtraDetails.fromJson(contactDetails),
        educationInfo: EducationInfo.fromJson(educationInfo));
  }
}
