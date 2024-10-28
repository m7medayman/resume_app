import 'package:resume_app/core/data_classes/data_classes.dart';

void main() {
  var ed = EducationInfo(degrees: [
    Degree(
        title: "test degree",
        grade: GradeDegree.GOOD,
        startDate: DateTime(2001),
        endDate: DateTime(2001),
        school: "test school")
  ], courses: [
    Course(
        title: "test course",
        startDate: DateTime(2001),
        endDate: DateTime(2001)),
  ]);
  ed.toJson();
  print(ed.toJson());
  var fj = EducationInfo.fromJson(ed.toJson());
  print(fj);
}
