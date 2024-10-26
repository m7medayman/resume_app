import 'package:firebase_auth/firebase_auth.dart';

import 'package:resume_app/core/data_classes/work_experience.dart';

class JobApplicationDataClass {
  String jobTitle;
  String jobSummery;
  List<String> skills;
  UserInfo userInfo;
  List<WorkExperience> punchOfWorkExperiences;

  JobApplicationDataClass({
    required this.jobTitle,
    required this.jobSummery,
    required this.skills,
    required this.userInfo,
    required this.punchOfWorkExperiences,
  });

  // Implement the copyWith method
  JobApplicationDataClass copyWith({
    String? jobTitle,
    String? jobSummery,
    List<String>? skills,
    UserInfo? userInfo,
    List<WorkExperience>? punchOfWorkExperiences,
  }) {
    return JobApplicationDataClass(
      jobTitle: jobTitle ?? this.jobTitle,
      jobSummery: jobSummery ?? this.jobSummery,
      skills: skills ?? this.skills,
      userInfo: userInfo ?? this.userInfo,
      punchOfWorkExperiences:
          punchOfWorkExperiences ?? this.punchOfWorkExperiences,
    );
  }
}
