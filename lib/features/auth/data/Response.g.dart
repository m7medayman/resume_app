// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
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
      'contactDetails': instance.contactDetails,
      'educationInfo': instance.educationInfo,
    };
