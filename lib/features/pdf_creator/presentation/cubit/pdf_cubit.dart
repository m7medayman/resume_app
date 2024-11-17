import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pdf_state.dart';

class PdfCubit extends Cubit<PdfState> {
  PdfCubit() : super(PdfInitial());
}
