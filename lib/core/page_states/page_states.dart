abstract class PageState {}

class InitpagesState extends PageState {}

class LoadingPageState extends PageState {
  String? loadingContent;
  LoadingPageState({this.loadingContent});
}

class FailurePageState extends PageState {
  String errorMessage;
  FailurePageState({required this.errorMessage});
}

class SuccessPageState extends PageState {
}