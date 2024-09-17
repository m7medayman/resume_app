import 'package:json_annotation/json_annotation.dart';
part 'Response.g.dart';

@JsonSerializable()
class AuthResponse {
  String? email;
  String? userName;
  String? phone;
  String? address;
  Map<String, String?>? connectDetails;
  AuthResponse(
      {this.address,
      this.connectDetails,
      this.email,
      this.phone,
      this.userName});
  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
