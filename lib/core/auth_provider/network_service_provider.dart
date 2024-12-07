import 'package:resume_app/features/auth/data/Response.dart';
import 'package:resume_app/features/auth/data/request.dart';

abstract class AuthServiceProvider {
  Future<AuthResponse> login(LoginRequest request);
  Future<AuthResponse> signUp(
      SignUpRequest request, SignUpRequestUserDetails userDetailsRequest);
  Future signOut();
  Future<AuthResponse> autoLogin();
}
