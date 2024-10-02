// request mapper is mapping the parameter to request

import 'package:resume_app/core/resources/helpers/null_type_extension.dart';
import 'package:resume_app/features/auth/data/Response.dart';
import 'package:resume_app/features/auth/data/request.dart';
import 'package:resume_app/features/auth/domain/entity.dart';
import 'package:resume_app/features/auth/domain/use_case.dart';

extension LoginMapper on LoginParameter {
  LoginRequest toLoginRequest() {
    return LoginRequest(email: email, password: password);
  }
}

extension SignUpRequestUserDetailsMapper on SignUpParameter {
  SignUpRequestUserDetails toSignUpRequestUserDetails() {
    return SignUpRequestUserDetails(
        contactEmail: email,
        userName: userName,
        phone: phone,
        address: address,
        contactInfo: contactInfo);
  }
}

extension SignUpAuthMapper on SignUpParameter {
  SignUpRequest toSignUpRequest() {
    return SignUpRequest(email: email, password: password);
  }
}

extension AuthEntityMapper on AuthResponse {
  AuthUserEntity toEntity() {
    return AuthUserEntity(
        contactEmail: email.nullSafety(),
        name: userName.nullSafety(),
        phone: phone.nullSafety(),
        address: address.nullSafety(),
        contactDetails: connectDetails.nullSafety());
  }
}
