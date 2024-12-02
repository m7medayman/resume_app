import 'package:resume_app/core/resources/failure/failure_model.dart';

sealed class PdfFormState {}

class PdfSuccess extends PdfFormState {
  final dynamic data;

  PdfSuccess({required this.data});
}
class PdfShowToast extends PdfFormState{
  
}
class PdfFailure extends PdfFormState {
  final Failure failure;

  PdfFailure({required this.failure});
}

class PdfInitState extends PdfFormState {}

class PdfLoading extends PdfFormState {}

class ShowPdfState extends PdfFormState {
  final dynamic data;

  ShowPdfState({required this.data});
}


class SavePdfState extends PdfFormState {
  final String path;

  SavePdfState({required this.path});
}
