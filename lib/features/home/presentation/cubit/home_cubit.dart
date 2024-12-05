import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resume_app/core/data_classes/pdf_view_data.dart';
import 'package:resume_app/core/page_states/page_states.dart';
import 'package:resume_app/features/home/domain/home_use_case.dart';
import 'package:resume_app/features/home/presentation/cubit/home_page_special_states.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetPdfUseCase getPdfUseCase;
  SignOutUseCase signOutUseCase;
  HomeCubit({required this.getPdfUseCase, required this.signOutUseCase})
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

  void signOut() async {
    emit(state.copyWith(pageState: LoadingPageState()));
    var res = await signOutUseCase.execute();
    emit(state.copyWith(pageState: InitpagesState()));
    res.fold((error) {
      emit(state.copyWith(
          pageState: FailurePageState(errorMessage: error.message)));
      emit(state.copyWith(pageState: InitpagesState()));
    }, (success) {
      emit(state.copyWith(pageState: SuccessPageState()));
      emit(state.copyWith(pageState: SignoutState()));
    });
  }
}
