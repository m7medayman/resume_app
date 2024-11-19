part of 'pdf_cubit.dart';

class PdfState extends Equatable {
  const PdfState({required this.state, required this.data});
  final PdfFormState state;
  final PdfData data;

  copyWith({PdfFormState? formState}) {
    return PdfState(state: formState ?? state, data: data);
  }

  @override
  List<Object> get props => [state, data];
}
