// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestUserDetails _$SignUpRequestUserDetailsFromJson(
        Map<String, dynamic> json) =>
    SignUpRequestUserDetails(
      email: json['email'] as String,
      userName: json['userName'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      contactInfo: Map<String, String>.from(json['contactInfo'] as Map),
    );

Map<String, dynamic> _$SignUpRequestUserDetailsToJson(
        SignUpRequestUserDetails instance) =>
    <String, dynamic>{
      'email': instance.email,
      'userName': instance.userName,
      'phone': instance.phone,
      'address': instance.address,
      'contactInfo': instance.contactInfo,
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
