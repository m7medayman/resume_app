import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:resume_app/core/Di/injection.dart';
import 'package:resume_app/core/data_classes/job_application_data_class.dart';
import 'package:resume_app/core/data_classes/user_info.dart';
import 'package:resume_app/core/data_classes/user_info.dart';
import 'package:resume_app/core/data_classes/work_experience.dart';
import 'package:resume_app/features/auth/presentation/signup/cubit/signup_form_state.dart';
import 'package:resume_app/features/resume_dialog/domain/entities/job_info.dart';
import 'package:resume_app/features/resume_dialog/domain/repository.dart';
import 'package:resume_app/features/resume_dialog/domain/use_case.dart';
import 'package:resume_app/features/resume_dialog/presentation/cubit/resume_form_state.dart';

part 'resume_dialog_state.dart';

class ResumeDialogCubit extends Cubit<ResumeDialogState> {
  JobDescriptionUseCases jobDescriptionUseCases;
  ResumeDialogCubit(
    this.jobDescriptionUseCases,
  ) : super(ResumeDialogState(
            jobInfoAi: JobInfo(
                softSkills: [], hardSkills: [], jobTitle: "", keyWords: []),
            resumeFormState: InitResumeFormState(),
            jobTitle: '',
            jobSummery: '',
            selectedHardSkills: {},
            selectedSoftSkills: {},
            punchOfWorkExperiences: [],
            userInfo: null));
  void addAiJobHardSkill(String skill) {
    state.jobInfoAi.hardSkills.add(skill);
  }

  void addAiJobsSoftSkill(String skill) {
    state.jobInfoAi.softSkills.add(skill);
  }

  void addHardSkill(String skill) {
    if (state.selectedHardSkills.containsKey(skill)) {
      return;
    }
    var newSkills = Map<String, bool>.from(state.selectedHardSkills);
    newSkills[skill] = true;
    emit(state.copyWith(selectedHardSkills: newSkills));
  }

  void removeHardSkill(String skill) {
    if (!state.selectedHardSkills.containsKey(skill)) {
      return;
    }
    var newSkills = Map<String, bool>.from(state.selectedHardSkills);
    newSkills.remove(skill);
    emit(state.copyWith(selectedHardSkills: newSkills));
  }

  void removeSoftSkill(String skill) {
    if (!state.selectedSoftSkills.containsKey(skill)) {
      return;
    }
    var newSkills = Map<String, bool>.from(state.selectedSoftSkills);
    newSkills.remove(skill);
    emit(state.copyWith(selectedSoftSkills: newSkills));
  }

  void addSoftSkill(String skill) {
    if (state.selectedSoftSkills.containsKey(skill)) {
      return;
    }
    var newSkills = Map<String, bool>.from(state.selectedSoftSkills);
    newSkills[skill] = true;
    emit(state.copyWith(selectedSoftSkills: newSkills));
  }

  Future getJobDetails(String jobDescription) async {
    emit(state.copyWith(
        resumeFormState: LoadingResumeFormState(
      loadingContent: "processing",
    )));
    var response = await jobDescriptionUseCases.execute(jobDescription);
    response.fold((error) {
      emit(state.copyWith(
          resumeFormState: ErrorResumeFormState(errorMessage: error.message)));
    }, (data) {
      print(data);
      emit(state.copyWith(
          resumeFormState: SuccessResumeFormState(), jobInfoAi: data));
      emit(state.copyWith(resumeFormState: InitResumeFormState()));
    });
  }
}
