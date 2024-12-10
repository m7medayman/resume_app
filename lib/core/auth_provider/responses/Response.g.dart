// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      punchOfWorkExperinces: (json['punchOfWorkExperinces'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      punchOfProjectExperiences:
          (json['punchOfProjectExperiences'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      contactEmail: json['contactEmail'] as String,
      contactDetails: json['contactDetails'] as Map<String, dynamic>,
      educationInfo: json['educationInfo'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'contactEmail': instance.contactEmail,
      'punchOfProjectExperiences': instance.punchOfProjectExperiences,
      'punchOfWorkExperinces': instance.punchOfWorkExperinces,
      'contactDetails': instance.contactDetails,
      'educationInfo': instance.educationInfo,
    };
