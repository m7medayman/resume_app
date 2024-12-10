import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/data_classes/project_experience.dart';
import 'package:resume_app/core/data_classes/work_experience.dart';

class MyUserInfo {
  String name;
  String phone;
  String address;
  String contactEmail;
  ContactExtraDetails extraContactDetails;
  EducationInfo educationInfo;
  List<WorkExperience> punchOfWorkExperiences;
  List<ProjectExperience> punchOfProjectExperiences;
  MyUserInfo({
    required this.punchOfProjectExperiences,
    required this.punchOfWorkExperiences,
    required this.name,
    required this.phone,
    required this.address,
    required this.contactEmail,
    required this.extraContactDetails,
    required this.educationInfo,
  });
}
