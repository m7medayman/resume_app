part of 'resume_dialog_cubit.dart';

class ResumeDialogState extends Equatable {
  ResumeFormState resumeFormState;
  String jobTitle;
  String jobSummery;
  MyUserInfo? userInfo;
  Map<String, bool> selectedHardSkills;
  Map<String, bool> selectedSoftSkills;
  List<WorkExperience> punchOfWorkExperiences;
  JobInfo jobInfoAi; // this is the information that got by AI

  ResumeDialogState({
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
  ResumeDialogState copyWith({
    ResumeFormState? resumeFormState,
    String? jobTitle,
    String? jobSummery,
    Map<String, bool>? selectedHardSkills,
    Map<String, bool>? selectedSoftSkills,
    MyUserInfo? userInfo,
    List<WorkExperience>? punchOfWorkExperiences,
    JobInfo? jobInfoAi,
  }) {
    return ResumeDialogState(
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
