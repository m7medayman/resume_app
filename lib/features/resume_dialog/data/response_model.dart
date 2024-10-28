import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable()
class JobDescriptionResponseModel {
  final List<String>? softSkills;
  final List<String>? hardSkills;
  final String? jobTitle;
  final List<String>? punchOfJobRequirement;
  final List<String>? punchOfKeyWords;
  JobDescriptionResponseModel({
    this.softSkills,
    this.hardSkills,
    this.jobTitle,
    this.punchOfJobRequirement,
    this.punchOfKeyWords,
  });

  // Generated fromJson and toJson methods
  factory JobDescriptionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$JobDescriptionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$JobDescriptionResponseModelToJson(this);
}

@JsonSerializable()
class RequiredSkills {
  final List<String> punchOfSoftSkills;
  final List<String> punchOfHardSkills;

  RequiredSkills({
    required this.punchOfSoftSkills,
    required this.punchOfHardSkills,
  });

  // Generated fromJson and toJson methods
  factory RequiredSkills.fromJson(Map<String, dynamic> json) =>
      _$RequiredSkillsFromJson(json);

  Map<String, dynamic> toJson() => _$RequiredSkillsToJson(this);
}

@JsonSerializable()
class JobSummaryResponse {
  String jobSummary;
  JobSummaryResponse({
    required this.jobSummary,
  });

  // Generated fromJson and toJson methods
  factory JobSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$JobSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$JobSummaryResponseToJson(this);
}
