import 'package:flutter/widgets.dart';
import 'package:resume_app/core/data_classes/user_info.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';

@immutable
sealed class LoginState {}

class LoginInitial extends LoginState {}

final class LogInSuccess extends LoginState {
  final MyUserInfo data;
  LogInSuccess({required this.data});
  get getData => data;
}

final class LogInLoading extends LoginState {}

final class LogInFailure extends LoginState {
  final Failure failure;
  LogInFailure({required this.failure});
  get getFailureMessage => failure.message;
}
