import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:resume_app/core/common/widgets/toast/save_file_toast.dart';
import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/data_classes/pdf_data_class.dart';
import 'package:resume_app/core/data_classes/user_info.dart';
import 'package:resume_app/core/doc_manager/docs_manager_and_permission.dart';
import 'package:resume_app/features/pdf_creator/domain/pdf_creating_use_case.dart';
import 'package:resume_app/features/pdf_creator/presentation/cubit/pdf_form_state.dart';

part 'pdf_state.dart';

class PdfCubit extends Cubit<PdfState> {
  final PdfCreatingUseCase useCase;
  final PdfSaveUseCase pdfSaveUseCase;
  PdfCubit({required this.pdfSaveUseCase, required this.useCase})
      : super(PdfState(
            isFileSaved: false,
            state: PdfInitState(),
            data: PdfData(
                jobTitle: '',
                jobSummery: '',
                language: {},
                selectedEducationInfo: EducationInfo(),
                userInfo: MyUserInfo(
                    name: '',
                    phone: "",
                    address: "",
                    contactEmail: "",
                    contactDetails: ContactExtraDetails(),
                    educationInfo: EducationInfo()),
                selectedHardSkills: [],
                selectedSoftSkills: [],
                punchOfWorkExperiences: [],
                punchOfProjectExperience: [])));

  void getPdf() async {
    emit(state.copyWith(formState: PdfLoading()));
    var res = await useCase.execute(state.data);
    res.fold((error) {
      emit(state.copyWith(formState: PdfFailure(failure: error)));
      emit(state.copyWith(formState: PdfInitState()));
    }, (successData) {
      emit(state.copyWith(formState: ShowPdfState(data: successData)));
    });
  }

  void savePdf(String pdfname) async {
    emit(state.copyWith(formState: PdfLoading()));
    var res = await useCase.execute(state.data);
    res.fold((error) {
      emit(state.copyWith(formState: PdfFailure(failure: error)));
      emit(state.copyWith(formState: PdfInitState()));
    }, (successData) async {
      var result = await pdfSaveUseCase
          .execute(PdfSaveInput(file: successData, name: pdfname));
      result.fold((error) {
        emit(state.copyWith(formState: PdfFailure(failure: error)));
        emit(state.copyWith(formState: PdfInitState()));
      }, (path) {
        print(path);
        showSaveToast();
        emit(state.copyWith(isSaved: true));
        emit(state.copyWith(formState: PdfInitState()));
      });
    });
  }
}
