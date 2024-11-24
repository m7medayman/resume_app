import 'package:pdf/widgets.dart' as pw;
import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/data_classes/project_experience.dart';
import 'package:resume_app/core/data_classes/work_experience.dart';
import 'package:resume_app/features/pdf_creator/data/pdf_constants.dart';

class EducationText extends pw.StatelessWidget {
  final Degree degree;
  EducationText({required this.degree});
  @override
  pw.Widget build(pw.Context context) {
    return pw.RichText(
        text: pw.TextSpan(children: [
      pw.TextSpan(style: PdfTextStyles.mediumBold, text: "${degree.school}\n"),
      pw.TextSpan(text: "${degree.title}\n", style: PdfTextStyles.medium),
      pw.TextSpan(text: "${degree.startDate.year}-${degree.endDate.year}\n\n")
    ]));
  }
}

class EducationColumn extends pw.StatelessWidget {
  final List<Degree> degrees;

  EducationColumn({required this.degrees});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Table(
        children: degrees.map((degree) {
      return pw.TableRow(children: [EducationText(degree: degree)]);
    }).toList());
  }
}

class CourceText extends pw.StatelessWidget {
  final Course course;

  CourceText({required this.course});

  @override
  pw.Widget build(pw.Context context) {
    return pw.RichText(
        text: pw.TextSpan(children: [
      pw.TextSpan(style: PdfTextStyles.mediumBold, text: "${course.title}\n"),
      pw.TextSpan(
          text:
              "${course.startDate.year}/${course.startDate.month}-${course.endDate.year}/${course.endDate.month}\n\n")
    ]));
  }
}

class CoursesColumn extends pw.StatelessWidget {
  final List<Course> courses;

  CoursesColumn({required this.courses});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Table(
        children: courses.map((corse) {
      return pw.TableRow(children: [CourceText(course: corse)]);
    }).toList());
  }
}

class ExpericeText extends pw.StatelessWidget {
  final WorkExperience experience;

  ExpericeText({required this.experience});

  @override
  pw.Widget build(pw.Context context) {
    return pw.RichText(
        text: pw.TextSpan(children: [
      pw.TextSpan(
          style: PdfTextStyles.mediumBold, text: "${experience.title}\n"),
      pw.TextSpan(
          style: PdfTextStyles.medium, text: "${experience.description}\n"),
      pw.TextSpan(
          style: PdfTextStyles.medium,
          text:
              "${experience.startDate.year}/${experience.startDate.month}-${experience.endDate.year}/${experience.endDate.month}\n\n")
    ]));
  }
}

class ExperinceColumn extends pw.StatelessWidget {
  final List<WorkExperience> workExperience;

  ExperinceColumn({required this.workExperience});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Table(
        children: workExperience.map((workExperience) {
      return pw.TableRow(children: [ExpericeText(experience: workExperience)]);
    }).toList());
  }
}

class ProjectText extends pw.StatelessWidget {
  final ProjectExperience project;

  ProjectText({required this.project});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Table(children: [
      pw.TableRow(children: [
        pw.RichText(
            text: pw.TextSpan(children: [
          pw.TextSpan(
              style: PdfTextStyles.mediumBold, text: "${project.title}\n"),
          pw.TextSpan(
              style: PdfTextStyles.medium, text: "${project.description}\n"),
        ])),
        // link of the logic
      ]),
      pw.TableRow(children: [
        project.link == ""
            ? pw.Container()
            : pw.Link(
                child: pw.Text(
                    style: PdfTextStyles.medium, "Link: ${project.link}\n"),
                destination: '${project.link}',
              ),
      ]),
      pw.TableRow(children: [pw.SizedBox(height: 20)])
    ]);
  }
}

class ProjectColumn extends pw.StatelessWidget {
  final List<ProjectExperience> projects;

  ProjectColumn({required this.projects});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Table(
        children: projects.map((project) {
      return pw.TableRow(children: [ProjectText(project: project)]);
    }).toList());
  }
}

class SkillsColumn extends pw.StatelessWidget {
  final List<String> skills;

  SkillsColumn({required this.skills});

  @override
  pw.Widget build(pw.Context context) {
    return pw.GridView(
        crossAxisCount: 2,
        childAspectRatio: 0.2,
        children: skills.map((skill) {
          return pw.Padding(
              padding: pw.EdgeInsetsDirectional.all(5),
              child: pw.Text("-$skill", style: PdfTextStyles.mediumBold));
        }).toList());
  }
}
