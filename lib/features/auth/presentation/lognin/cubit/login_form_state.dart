part of 'login_cubit.dart';

class FormLoginState {
  LoginState loginState;
  String email;
  String password;
  FormLoginState({
    required this.loginState,
    required this.email,
    required this.password,
  });

  FormLoginState copyWith({
    LoginState? loginState,
    String? email,
    String? password,
  }) {
    return FormLoginState(
      loginState: loginState ?? this.loginState,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
