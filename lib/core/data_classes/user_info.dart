import 'package:resume_app/core/data_classes/data_classes.dart';

class MyUserInfo {
  String name;
  String phone;
  String address;
  String contactEmail;
  ContactExtraDetails contactDetails;
  EducationInfo educationInfo;
  MyUserInfo({
    required this.name,
    required this.phone,
    required this.address,
    required this.contactEmail,
    required this.contactDetails,
    required this.educationInfo,
  });
}
