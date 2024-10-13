import 'package:json_annotation/json_annotation.dart';

import 'package:resume_app/core/data_classes/data_classes.dart';

part 'Response.g.dart';

@JsonSerializable()
class AuthResponse {
  String? name;
  String? phone;
  String? address;
  String? contactEmail;
  ContactExtraDetails? contactDetails;
  EducationInfo? educationInfo;
  AuthResponse({
    this.name,
    this.phone,
    this.address,
    this.contactEmail,
    this.contactDetails,
    this.educationInfo,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
