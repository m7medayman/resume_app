import 'package:json_annotation/json_annotation.dart';
part 'data_classes.g.dart';

@JsonSerializable()
class ContactExtraDetails {
  String? extraPhone;
  String? linkedIn;
  String? website;
  ContactExtraDetails({
    this.extraPhone,
    this.linkedIn,
    this.website,
  });
  factory ContactExtraDetails.fromJson(Map<String, dynamic> json) =>
      _$ContactExtraDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$ContactExtraDetailsToJson(this);
}

@JsonSerializable()
class EducationInfo {
  List<Degree>? degrees;
  List<Course>? courses;
  EducationInfo({
    this.degrees,
    this.courses,
  });
  factory EducationInfo.fromJson(Map<String, dynamic> json) =>
      _$EducationInfoFromJson(json);
  Map<String, dynamic> toJson() => _$EducationInfoToJson(this);
  EducationInfo copyWith({
    List<Degree>? degrees,
    List<Course>? courses,
  }) {
    return EducationInfo(
      degrees: degrees ?? this.degrees,
      courses: courses ?? this.courses,
    );
  }
}

@JsonSerializable()
class Degree {
  String title;
  GradeDegree grade;
  DateTime startDate;
  DateTime endDate;
  String school;
  Degree({
    required this.title,
    required this.grade,
    required this.startDate,
    required this.endDate,
    required this.school,
  });
  factory Degree.fromJson(Map<String, dynamic> json) => _$DegreeFromJson(json);
  Map<String, dynamic> toJson() => _$DegreeToJson(this);
}

@JsonSerializable()
class Course {
  String title;
  DateTime startDate;
  DateTime endDate;
  Course({
    required this.title,
    required this.startDate,
    required this.endDate,
  });
  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

enum GradeDegree { GOOD, ACCEPTED, VERYGOOD, EXCELLENT }
