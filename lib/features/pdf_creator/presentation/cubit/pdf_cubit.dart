import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/data_classes/pdf_data_class.dart';
import 'package:resume_app/core/data_classes/user_info.dart';
import 'package:resume_app/features/pdf_creator/domain/pdf_creating_use_case.dart';
import 'package:resume_app/features/pdf_creator/presentation/cubit/pdf_form_state.dart';

part 'pdf_state.dart';

class PdfCubit extends Cubit<PdfState> {
  PdfCreatingUseCase useCase;
  PdfCubit(this.useCase)
      : super(PdfState(
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
                selectedHardSkills: {},
                selectedSoftSkills: {},
                punchOfWorkExperiences: [],
                punchOfProjectExperience: [])));

  void getPdf() async {
    emit(state.copyWith(formState: PdfLoading()));
    var res = await useCase.execute(state.data);
    res.fold((error) {
      emit(state.copyWith(formState: PdfFailure(failure: error)));
      emit(state.copyWith(formState: PdfInitState()));
    }, (successData) {
      emit(state.copyWith(formState: PdfSuccess(data: successData)));

    });
  }
}
