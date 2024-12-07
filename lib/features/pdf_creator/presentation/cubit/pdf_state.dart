part of 'pdf_cubit.dart';

class PdfState extends Equatable {
  const PdfState(
      {required this.isFileSaved, required this.state, required this.data});
  final PdfFormState state;
  final PdfData data;
  final bool isFileSaved;

  copyWith({PdfFormState? formState, bool? isSaved}) {
    return PdfState(
        state: formState ?? state,
        data: data,
        isFileSaved: isSaved ?? isFileSaved);
  }

  @override
  List<Object> get props => [state, data];
}
