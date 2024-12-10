import 'package:json_annotation/json_annotation.dart';
part 'work_experience.g.dart';

@JsonSerializable()
class WorkExperience {
  String title;
  String description;
  DateTime startDate;
  DateTime endDate;

  WorkExperience({
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
  });

  // Factory constructor for creating an instance from JSON
  factory WorkExperience.fromJson(Map<String, dynamic> json) =>
      _$WorkExperienceFromJson(json);

  // Method for converting an instance to JSON
  Map<String, dynamic> toJson() => _$WorkExperienceToJson(this);
}
