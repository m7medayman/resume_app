// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_classes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactExtraDetails _$ContactExtraDetailsFromJson(Map<String, dynamic> json) =>
    ContactExtraDetails(
      extraPhone: json['extraPhone'] as String?,
      linkedIn: json['linkedIn'] as String?,
      website: json['website'] as String?,
    );

Map<String, dynamic> _$ContactExtraDetailsToJson(
        ContactExtraDetails instance) =>
    <String, dynamic>{
      'extraPhone': instance.extraPhone,
      'linkedIn': instance.linkedIn,
      'website': instance.website,
    };

EducationInfo _$EducationInfoFromJson(Map<String, dynamic> json) =>
    EducationInfo(
      degrees: (json['degrees'] as List<dynamic>?)
          ?.map((e) => Degree.fromJson(e as Map<String, dynamic>))
          .toList(),
      courses: (json['courses'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EducationInfoToJson(EducationInfo instance) =>
    <String, dynamic>{
      'degrees': instance.degrees,
      'courses': instance.courses,
    };

Degree _$DegreeFromJson(Map<String, dynamic> json) => Degree(
      title: json['title'] as String,
      grade: $enumDecode(_$GradeDegreeEnumMap, json['grade']),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      school: json['school'] as String,
    );

Map<String, dynamic> _$DegreeToJson(Degree instance) => <String, dynamic>{
      'title': instance.title,
      'grade': _$GradeDegreeEnumMap[instance.grade]!,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'school': instance.school,
    };

const _$GradeDegreeEnumMap = {
  GradeDegree.GOOD: 'GOOD',
  GradeDegree.ACCEPTED: 'ACCEPTED',
  GradeDegree.VERYGOOD: 'VERYGOOD',
  GradeDegree.EXCELLENT: 'EXCELLENT',
};

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      title: json['title'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'title': instance.title,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
    };
