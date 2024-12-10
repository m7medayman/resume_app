// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectExperience _$ProjectExperienceFromJson(Map<String, dynamic> json) =>
    ProjectExperience(
      title: json['title'] as String,
      description: json['description'] as String,
      link: json['link'] as String? ?? "",
    );

Map<String, dynamic> _$ProjectExperienceToJson(ProjectExperience instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'link': instance.link,
    };
