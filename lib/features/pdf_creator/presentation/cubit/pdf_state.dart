part of 'pdf_cubit.dart';

sealed class PdfState extends Equatable {
  const PdfState();

  @override
  List<Object> get props => [];
}

final class PdfInitial extends PdfState {}
