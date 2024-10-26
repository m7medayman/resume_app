abstract class ResumeFormState {}

class InitResumeFormState extends ResumeFormState {}

class LoadingResumeFormState extends ResumeFormState {
  String? loadingContent;
  LoadingResumeFormState({this.loadingContent});
}

class ErrorResumeFormState extends ResumeFormState {
  String errorMessage;
  ErrorResumeFormState({required this.errorMessage});
}

class SuccessResumeFormState extends ResumeFormState {}
