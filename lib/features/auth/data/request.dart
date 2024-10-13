import 'package:json_annotation/json_annotation.dart';

import 'package:resume_app/core/data_classes/data_classes.dart';

part 'request.g.dart';

class SignUpRequest {
  String email;
  String password;
  SignUpRequest({
    required this.email,
    required this.password,
  });
}

@JsonSerializable()
class SignUpRequestUserDetails {
  String name;
  String phone;
  String address;
  String contactEmail;
  ContactExtraDetails contactDetails;
  EducationInfo educationInfo;
  SignUpRequestUserDetails({
    required this.name,
    required this.phone,
    required this.address,
    required this.contactEmail,
    required this.contactDetails,
    required this.educationInfo,
  });

  factory SignUpRequestUserDetails.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestUserDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpRequestUserDetailsToJson(this);
}

@JsonSerializable()
class LoginRequest {
  String email;
  String password;
  LoginRequest({
    required this.email,
    required this.password,
  });
  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
