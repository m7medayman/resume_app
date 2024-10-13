import 'package:resume_app/core/data_classes/data_classes.dart';

class Auth {
  String email;
  String password;
  Auth({
    required this.email,
    required this.password,
  });
}

class AuthUserEntity {
  String name;
  String phone;
  String address;
  String contactEmail;
  ContactExtraDetails contactDetails;
  EducationInfo educationInfo;
  AuthUserEntity({
    required this.name,
    required this.phone,
    required this.address,
    required this.contactEmail,
    required this.contactDetails,
    required this.educationInfo,
  });
}

