import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resume_app/core/data_classes/pdf_view_data.dart';
import 'package:resume_app/core/page_states/page_states.dart';
import 'package:resume_app/features/home/domain/home_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetPdfUseCase getPdfUseCase;
  HomeCubit(this.getPdfUseCase)
      : super(HomeState(pageState: InitpagesState(), pdfWidgetData: []));
  void getPdf() async {
    emit(state.copyWith(pageState: LoadingPageState()));
    var res = await getPdfUseCase.execute();
    res.fold((error) {
      emit(state.copyWith(
          pageState: FailurePageState(errorMessage: error.message)));
      emit(state.copyWith(pageState: InitpagesState()));
    }, (success) {
      emit(state.copyWith(pageState: SuccessPageState()));
      emit(state.copyWith(pdfWidgetData: success));
      emit(state.copyWith(pageState: InitpagesState()));
    });
  }
}
