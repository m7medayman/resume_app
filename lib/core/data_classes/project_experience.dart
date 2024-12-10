import 'package:json_annotation/json_annotation.dart';
part 'project_experience.g.dart';
@JsonSerializable()
@JsonSerializable()
class ProjectExperience {
   String title;
   String description;
   String link;

  ProjectExperience({
    required this.title,
    required this.description,
    this.link = "",
  });

  // Factory constructor to create an instance from JSON
  factory ProjectExperience.fromJson(Map<String, dynamic> json) =>
      _$ProjectExperienceFromJson(json);

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() => _$ProjectExperienceToJson(this);
}