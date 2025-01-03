part of 'resume_dialog_cubit.dart';

class ResumeDialogState extends Equatable {
 final ResumeFormState resumeFormState;
 final String jobTitle;
 final String jobSummery;
 final Map<String, String> language;
 final EducationInfo selectedEducationInfo;
 final MyUserInfo? userInfo;
 final Map<String, bool> selectedHardSkills;
 final Map<String, bool> selectedSoftSkills;
 final List<WorkExperience> punchOfWorkExperiences;
 final List<ProjectExperience> punchOfProjectExperiences;
 final JobInfo jobInfoAi; // this is the information that got by AI

const ResumeDialogState({
    required this.punchOfProjectExperiences,
    required this.selectedEducationInfo,
    required this.language,
    required this.resumeFormState,
    required this.jobTitle,
    required this.jobSummery,
    required this.selectedHardSkills,
    required this.selectedSoftSkills,
    required this.userInfo,
    required this.punchOfWorkExperiences,
    required this.jobInfoAi,
  });

  // Implement the copyWith method
  ResumeDialogState copyWith(
      {ResumeFormState? resumeFormState,
      String? jobTitle,
      String? jobSummery,
      Map<String, bool>? selectedHardSkills,
      Map<String, bool>? selectedSoftSkills,
      MyUserInfo? userInfo,
      List<WorkExperience>? punchOfWorkExperiences,
      List<ProjectExperience>? punchOfProjectExperiences,
      JobInfo? jobInfoAi,
      Map<String, String>? language,
      EducationInfo? selectedEducationInfo}) {
    return ResumeDialogState(
      punchOfProjectExperiences:
          punchOfProjectExperiences ?? this.punchOfProjectExperiences,
      selectedEducationInfo:
          selectedEducationInfo ?? this.selectedEducationInfo,
      language: language ?? this.language,
      resumeFormState: resumeFormState ?? this.resumeFormState,
      jobTitle: jobTitle ?? this.jobTitle,
      jobSummery: jobSummery ?? this.jobSummery,
      selectedHardSkills: selectedHardSkills ?? this.selectedHardSkills,
      selectedSoftSkills: selectedSoftSkills ?? this.selectedSoftSkills,
      userInfo: userInfo ?? this.userInfo,
      punchOfWorkExperiences:
          punchOfWorkExperiences ?? this.punchOfWorkExperiences,
      jobInfoAi: jobInfoAi ?? this.jobInfoAi,
    );
  }

  @override
  List<Object?> get props => [
        punchOfProjectExperiences,
        selectedEducationInfo,
        language,
        resumeFormState,
        jobTitle,
        jobSummery,
        selectedHardSkills,
        selectedSoftSkills,
        userInfo,
        punchOfWorkExperiences,
        jobInfoAi,
      ];
}
