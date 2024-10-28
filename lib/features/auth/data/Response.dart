import 'package:json_annotation/json_annotation.dart';
import 'package:resume_app/core/data_classes/data_classes.dart';

part 'Response.g.dart';

@JsonSerializable()
class AuthResponse {
  String name;
  String phone;
  String address;
  String contactEmail;
 Map<String,dynamic> contactDetails;
  Map<String,dynamic> educationInfo;
  AuthResponse({
    required this.name,
    required this.phone,
    required this.address,
    required this.contactEmail,
    required this.contactDetails,
    required this.educationInfo,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
