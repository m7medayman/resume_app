import 'package:json_annotation/json_annotation.dart';

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
class UserInfoDataRequest {
  String name;
  String phone;
  String address;
  String contactEmail;
  List<Map<String, dynamic>> punchOfProjectExperince;
  List<Map<String, dynamic>> punchOfWorkExperince;
  Map<String, dynamic> contactDetails;
  Map<String, dynamic> educationInfo;

  UserInfoDataRequest({
    required this.punchOfProjectExperince,
    required this.punchOfWorkExperince,
    required this.name,
    required this.phone,
    required this.address,
    required this.contactEmail,
    required this.contactDetails,
    required this.educationInfo,
  });

  // factory UserInfoDataApi.fromJson(Map<String, dynamic> json) =>
  //     _$UserInfoDataApiFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoDataApiToJson(this);
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
