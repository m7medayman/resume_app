import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/data_classes/project_experience.dart';
import 'package:resume_app/core/data_classes/user_info.dart';
import 'package:resume_app/core/data_classes/work_experience.dart';

class PdfData {
  String jobTitle;
  String jobSummery;
  Map<String, String> language;
  EducationInfo selectedEducationInfo;
  MyUserInfo userInfo;
  List<String> selectedHardSkills;
  List<String> selectedSoftSkills;
  List<WorkExperience> punchOfWorkExperiences;
  List<ProjectExperience> punchOfProjectExperience;
  PdfData({
    required this.jobTitle,
    required this.jobSummery,
    required this.language,
    required this.selectedEducationInfo,
    required this.userInfo,
    required this.selectedHardSkills,
    required this.selectedSoftSkills,
    required this.punchOfWorkExperiences,
    required this.punchOfProjectExperience,
  });
}
