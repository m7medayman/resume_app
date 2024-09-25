import 'package:flutter/widgets.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';

import 'package:resume_app/features/auth/domain/entity.dart';

@immutable
sealed class LoginState {}

class LoginInitial extends LoginState {}

final class LogInSuccess extends LoginState {
  final AuthUserEntity data;
  LogInSuccess({required this.data});
  get getData => data;
}

final class LogInLoading extends LoginState {}

final class LogInFailure extends LoginState {
  final Failure failure;
  LogInFailure({required this.failure});
  get getFailureMessage => failure.message;
}
