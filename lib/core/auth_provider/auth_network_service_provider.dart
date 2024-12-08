import 'package:resume_app/core/auth_provider/requests/request.dart';
import 'package:resume_app/core/auth_provider/responses/Response.dart';

abstract class AuthServiceProvider {
  Future<AuthResponse> login(LoginRequest request);
  Future<AuthResponse> signUp(
      SignUpRequest request, UserInfoDataRequest userDetailsRequest);
  Future signOut();
  Future<AuthResponse> autoLogin();
  Future<AuthResponse> updateUserInfo(
      {required String id, required UserInfoDataRequest userDetailsRequest});
}
