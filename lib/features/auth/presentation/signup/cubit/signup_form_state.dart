import 'package:flutter/material.dart';

@immutable
sealed class SignupFormState {
  const SignupFormState();
}

class InitSignupFormState extends SignupFormState {}

class LoadingSignupFormstate extends SignupFormState {}

class SuccessSignupFormState extends SignupFormState {}

class FailureSignupFormState extends SignupFormState {
  final String errorMessage;
  const FailureSignupFormState({
    required this.errorMessage,
  });
}
