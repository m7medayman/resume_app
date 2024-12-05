import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:resume_app/core/data_classes/user_info.dart';
import 'package:resume_app/core/doc_manager/docs_manager_and_permission.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/core/resources/failure/system_failure_const.dart';
import 'package:resume_app/features/auth/domain/use_case.dart';
import 'package:resume_app/features/auth/presentation/lognin/cubit/login_state.dart';

part 'login_form_state.dart';

class LoginCubit extends Cubit<FormLoginState> {
  LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase)
      : super(FormLoginState(
            loginState: LoginInitial(), email: '', password: ''));

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void checkFilePermission() async {
    await DocsManagerAndPermissions.requestStoragePermission();
    var res = await DocsManagerAndPermissions.createFileInExternalStorage();
    res.fold((failure) {
      if (failure.id == SystemFailureConstants.systemPermissionDenied.id) {
        emit(state.copyWith(
            loginState: LoginPermissionFailure(failure: failure)));
      } else {
        emit(state.copyWith(loginState: LogInFailure(failure: failure)));
      }
      emit(state.copyWith(loginState: LoginInitial()));
    }, (success) {
      emit(state.copyWith(loginState: LoginInitial()));
    });
  }

  Future login() async {
    print(state.email);
    print(state.password);
    emit(state.copyWith(loginState: LogInLoading()));
    Either<Failure, MyUserInfo> res = await loginUseCase
        .execute(LoginParameter(email: state.email, password: state.password));

    res.fold((Failure f) {
      print(" failure");
      print(f.message);
      emit(state.copyWith(loginState: LogInFailure(failure: f)));
      emit(state.copyWith(loginState: LoginInitial()));
    }, (MyUserInfo entity) {
      emit(state.copyWith(loginState: LoginInitial()));
      emit(state.copyWith(loginState: LogInSuccess(data: entity)));
    });
  }
}
