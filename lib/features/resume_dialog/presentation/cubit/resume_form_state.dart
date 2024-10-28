abstract class ResumeFormState {}

class InitResumeFormState extends ResumeFormState {}

class LoadingResumeFormState extends ResumeFormState {
  String? loadingContent;
  LoadingResumeFormState({this.loadingContent});
}

class FailureResumeFormState extends ResumeFormState {
  String errorMessage;
  FailureResumeFormState({required this.errorMessage});
}

class SuccessResumeFormState extends ResumeFormState {}

class SuccessResumeFormStateJobSummary extends ResumeFormState {
  String jobSummary;
  SuccessResumeFormStateJobSummary({
    required this.jobSummary,
  });
}
