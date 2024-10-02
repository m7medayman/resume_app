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

class ContactExtraDetails {
  String? extraPhone;
  String? linkedIn;
  String? website;
  ContactExtraDetails({
    this.extraPhone,
    this.linkedIn,
    this.website,
  });
}

class EducationInfo {
  List<Degree>? degrees;
  List<Course>? courses;
  EducationInfo({
    this.degrees,
    this.courses,
  });
}

class Degree {
  DateTime startDate;
  DateTime endDate;
  String school;
  Degree({
    required this.startDate,
    required this.endDate,
    required this.school,
  });
}

class Course {
  DateTime startDate;
  DateTime endDate;
  Course({
    required this.startDate,
    required this.endDate,
  });
}
