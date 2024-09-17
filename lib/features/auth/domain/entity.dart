class Auth {
  String email;
  String password;
  Auth({
    required this.email,
    required this.password,
  });
}

class AuthUserEntity {
  String name;
  String phone;
  String address;
  String email;
  Map<String, String> contactDetails;
  AuthUserEntity({
    required this.name,
    required this.phone,
    required this.address,
    required this.email,
    required this.contactDetails,
  });
}
