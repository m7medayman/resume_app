// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestUserDetails _$SignUpRequestUserDetailsFromJson(
        Map<String, dynamic> json) =>
    SignUpRequestUserDetails(
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      contactEmail: json['contactEmail'] as String,
      contactDetails: ContactExtraDetails.fromJson(
          json['contactDetails'] as Map<String, dynamic>),
      educationInfo:
          EducationInfo.fromJson(json['educationInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpRequestUserDetailsToJson(
        SignUpRequestUserDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'contactEmail': instance.contactEmail,
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
