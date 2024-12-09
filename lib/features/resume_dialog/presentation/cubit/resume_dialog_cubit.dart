import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:resume_app/core/Di/injection.dart';
import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/data_classes/project_experience.dart';
import 'package:resume_app/core/data_classes/user_info.dart';
import 'package:resume_app/core/data_classes/work_experience.dart';
import 'package:resume_app/features/resume_dialog/domain/entities/job_info.dart';
import 'package:resume_app/features/resume_dialog/domain/use_case.dart';
import 'package:resume_app/features/resume_dialog/presentation/cubit/resume_form_state.dart';

part 'resume_dialog_state.dart';

class ResumeDialogCubit extends Cubit<ResumeDialogState> {
  JobDescriptionUseCases jobDescriptionUseCases;
  JobSummaryUseCase jobSummaryUseCase;
  JobExperienceEnhanceUseCase jobExperienceEnhanceUseCase;
  static final iniReumeState = ResumeDialogState(
      punchOfProjectExperiences: const [],
      selectedEducationInfo: getIt<MyUserInfo>().educationInfo,
      language: const {},
      jobInfoAi:
          JobInfo(softSkills: [], hardSkills: [], jobTitle: "", keyWords: []),
      resumeFormState: InitResumeFormState(),
      jobTitle: '',
      jobSummery: '',
      selectedHardSkills: const {},
      selectedSoftSkills: const {},
      punchOfWorkExperiences: const [],
      userInfo: getIt<MyUserInfo>());
  ResumeDialogCubit(
      {required this.jobDescriptionUseCases,
      required this.jobSummaryUseCase,
      required this.jobExperienceEnhanceUseCase})
      : super(iniReumeState);
  List<T> findUnselectedItems<T>(List<T> mainList, List<T> selectedList) {
    // Use a Set for efficient lookup of selected items
    final selectedSet = Set<T>.from(selectedList);

    // Filter out the selected items from the main list
    return mainList.where((item) => !selectedSet.contains(item)).toList();
  }

  List<String> _getSelectedKeyWords() {
    List<String> unSelectedHardSkillsKeyWords = findUnselectedItems(
        state.jobInfoAi.hardSkills, state.selectedHardSkills.keys.toList());
    List<String> unSelectedSoftkillsKeyWords = findUnselectedItems(
        state.jobInfoAi.softSkills, state.selectedSoftSkills.keys.toList());
    List<String> resultkeyWords = List.from(state.jobInfoAi.keyWords);
    resultkeyWords = resultkeyWords
        .where((item) => !unSelectedHardSkillsKeyWords.contains(item))
        .toList();
    resultkeyWords = resultkeyWords
        .where((item) => !unSelectedSoftkillsKeyWords.contains(item))
        .toList();
    resultkeyWords = [
      ...resultkeyWords,
      ...state.selectedHardSkills.keys,
      ...state.selectedSoftSkills.keys
    ];
    resultkeyWords = resultkeyWords.toSet().toList();

    return resultkeyWords;
  }

  void goBack() {
    emit(state.copyWith(resumeFormState: GoBackFormState()));
    emit(state.copyWith(resumeFormState: InitResumeFormState()));
  }

  void updateJobTitle(String input) {
    emit(state.copyWith(jobTitle: input));
  }

  void updateJobSummery(String input) {
    emit(state.copyWith(jobSummery: input));
  }

  Future<String> getJobExperienceEnhanced(String jobExperience) async {
    emit(state.copyWith(resumeFormState: LoadingResumeFormState()));
    var response = await jobExperienceEnhanceUseCase.execute(jobExperience);
    String returned = jobExperience;
    response.fold((error) {
      emit(state.copyWith(
          resumeFormState:
              FailureResumeFormState(errorMessage: error.message)));
      emit(state.copyWith(resumeFormState: InitResumeFormState()));
    }, (success) {
      emit(state.copyWith(resumeFormState: InitResumeFormState()));
      returned = success;
    });
    return returned;
  }

  void addProjectExperience(ProjectExperience project) {
    final updatedWorkExperience =
        List<ProjectExperience>.from(state.punchOfProjectExperiences);
    updatedWorkExperience.add(project);
    emit(state.copyWith(punchOfProjectExperiences: updatedWorkExperience));
  }

  void deleteProjectExperience(ProjectExperience project) {
    final updatedProjectExperience =
        List<ProjectExperience>.from(state.punchOfProjectExperiences);
    updatedProjectExperience.remove(project);
    emit(state.copyWith(punchOfProjectExperiences: updatedProjectExperience));
  }

  addLanguage(String language, String level) {
    final Map<String, String> updatedLanguage = Map.from(state.language);
    updatedLanguage[language] = level;
    emit(state.copyWith(language: updatedLanguage));
  }

  deleteLanguage(String language) {
    final Map<String, String> updatedLanguage = Map.from(state.language);
    updatedLanguage.remove(language);
    emit(state.copyWith(language: updatedLanguage));
  }

  void addWorkExperience(WorkExperience workExperience) {
    final updatedWorkExperience =
        List<WorkExperience>.from(state.punchOfWorkExperiences);
    updatedWorkExperience.add(workExperience);
    emit(state.copyWith(punchOfWorkExperiences: updatedWorkExperience));
  }

  void deleteWorkExperience(WorkExperience workExperience) {
    final updatedWorkExperience =
        List<WorkExperience>.from(state.punchOfWorkExperiences);
    updatedWorkExperience.remove(workExperience);
    emit(state.copyWith(punchOfWorkExperiences: updatedWorkExperience));
  }

  void addDegree(Degree degree) {
    final updatedDegree =
        List<Degree>.from(state.selectedEducationInfo.degrees!);
    updatedDegree.add(degree);
    emit(state.copyWith(
        selectedEducationInfo:
            state.selectedEducationInfo.copyWith(degrees: updatedDegree)));
  }

  void deleteDegree(Degree degree) {
    // Create a new list and remove the degree from it
    final updatedDegrees =
        List<Degree>.from(state.selectedEducationInfo.degrees!);
    updatedDegrees.remove(degree);

    // Emit the new state with the updated list
    emit(state.copyWith(
      selectedEducationInfo:
          state.selectedEducationInfo.copyWith(degrees: updatedDegrees),
    ));
  }

  void addCourse(Course course) {
    final updatedCourse =
        List<Course>.from(state.selectedEducationInfo.courses!);
    updatedCourse.add(course);
    emit(state.copyWith(
        selectedEducationInfo:
            state.selectedEducationInfo.copyWith(courses: updatedCourse)));
  }

  void deleteCourse(Course course) {
    // Create a new list and remove the degree from it
    final updatedCourse =
        List<Course>.from(state.selectedEducationInfo.courses!);
    updatedCourse.remove(course);

    // Emit the new state with the updated list
    emit(state.copyWith(
      selectedEducationInfo:
          state.selectedEducationInfo.copyWith(courses: updatedCourse),
    ));
  }

  void getSummary(String jobSummary) async {
    emit(state.copyWith(resumeFormState: LoadingResumeFormState()));

    var resposne = await jobSummaryUseCase.execute(JobSummaryInput(
        jobSummary: jobSummary, keyWords: _getSelectedKeyWords()));
    resposne.fold((error) {
      emit(state.copyWith(
          resumeFormState:
              FailureResumeFormState(errorMessage: error.message)));
      emit(state.copyWith(resumeFormState: InitResumeFormState()));
    }, (success) {
      emit(state.copyWith(
          jobSummery: success,
          resumeFormState:
              SuccessResumeFormStateJobSummary(jobSummary: success)));
      emit(state.copyWith(resumeFormState: InitResumeFormState()));
    });
  }

  void updateSummery(String jobSummery) {
    emit(state.copyWith(jobSummery: jobSummery));
  }

  void getNextPage() {
    emit(state.copyWith(resumeFormState: GoForwardFormState()));
    emit(state.copyWith(resumeFormState: InitResumeFormState()));
  }

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
          resumeFormState:
              FailureResumeFormState(errorMessage: error.message)));
    }, (data) {
    
      emit(state.copyWith(
          resumeFormState: SuccessResumeFormState(),
          jobInfoAi: data,
          selectedHardSkills: iniReumeState.selectedHardSkills));
      emit(state.copyWith(resumeFormState: InitResumeFormState()));
      getNextPage();
    });
  }
}
