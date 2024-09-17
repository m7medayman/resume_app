// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      address: json['address'] as String?,
      connectDetails: (json['connectDetails'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'userName': instance.userName,
      'phone': instance.phone,
      'address': instance.address,
      'connectDetails': instance.connectDetails,
    };
