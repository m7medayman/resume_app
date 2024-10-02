import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resume_app/core/Di/injection.dart';
import 'package:resume_app/features/auth/domain/use_case.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  late SignUpUseCase signUpUseCase;
  SignupCubit() : super(SignupInitial()) {
    signUpUseCase = getIt<SignUpUseCase>();
  }
  void registerUser() {
    emit(SignUpLoading());
  }
}
