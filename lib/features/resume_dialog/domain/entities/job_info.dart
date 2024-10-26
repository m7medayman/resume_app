import 'package:resume_app/features/resume_dialog/data/response_model.dart';

class JobInfo {
  List<String> softSkills;
  List<String> hardSkills;
  String jobTitle;
  List<String> keyWords;
  JobInfo({
    required this.softSkills,
    required this.hardSkills,
    required this.jobTitle,
    required this.keyWords,
  });
}
