// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobDescriptionResponseModel _$JobDescriptionResponseModelFromJson(
        Map<String, dynamic> json) =>
    JobDescriptionResponseModel(
      softSkills: (json['softSkills'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hardSkills: (json['heardSkills'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      jobTitle: json['jobTitle'] as String?,
      punchOfJobRequirement: (json['punchOfJobRequirement'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      punchOfKeyWords: (json['punchOfKeyWords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$JobDescriptionResponseModelToJson(
        JobDescriptionResponseModel instance) =>
    <String, dynamic>{
      'softSkills': instance.softSkills,
      'heardSkills': instance.hardSkills,
      'jobTitle': instance.jobTitle,
      'punchOfJobRequirement': instance.punchOfJobRequirement,
      'punchOfKeyWords': instance.punchOfKeyWords,
    };

RequiredSkills _$RequiredSkillsFromJson(Map<String, dynamic> json) =>
    RequiredSkills(
      punchOfSoftSkills: (json['punchOfSoftSkills'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      punchOfHardSkills: (json['punchOfHardSkills'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RequiredSkillsToJson(RequiredSkills instance) =>
    <String, dynamic>{
      'punchOfSoftSkills': instance.punchOfSoftSkills,
      'punchOfHardSkills': instance.punchOfHardSkills,
    };
