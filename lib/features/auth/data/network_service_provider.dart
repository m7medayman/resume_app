import 'package:either_dart/either.dart';
import 'package:resume_app/core/resources/failure.dart';
import 'package:resume_app/features/auth/data/Response.dart';
import 'package:resume_app/features/auth/data/request.dart';

abstract class NetworkServiceProvider {
  Future<AuthResponse> login(LoginRequest request);
  Future<AuthResponse> signUp(
      SignUpRequest request, SignUpRequestUserDetails userDetailsRequest);
}
