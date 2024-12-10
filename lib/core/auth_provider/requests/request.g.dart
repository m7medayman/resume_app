// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoDataRequest _$UserInfoDataApiFromJson(Map<String, dynamic> json) =>
    UserInfoDataRequest(
      punchOfProjectExperince:
          (json['punchOfProjectExperince'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
      punchOfWorkExperince: (json['punchOfWorkExperince'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      contactEmail: json['contactEmail'] as String,
      contactDetails: json['contactDetails'] as Map<String, dynamic>,
      educationInfo: json['educationInfo'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$UserInfoDataApiToJson(UserInfoDataRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'contactEmail': instance.contactEmail,
      'punchOfProjectExperince': instance.punchOfProjectExperince,
      'punchOfWorkExperince': instance.punchOfWorkExperince,
      'contactDetails': instance.contactDetails,
      'educationInfo': instance.educationInfo,
    };

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
