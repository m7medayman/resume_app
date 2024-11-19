import 'package:flutter/material.dart';

@immutable
sealed class SignupFormState {
  const SignupFormState();
}

class initSignupFormState extends SignupFormState {}

class loadingSignupFormstate extends SignupFormState {}

class SuccessSignupFormState extends SignupFormState {}

class FailureSignupFormState extends SignupFormState {
  final String errorMessage;
  const FailureSignupFormState({
    required this.errorMessage,
  });
}
