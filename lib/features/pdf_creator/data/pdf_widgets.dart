import 'package:pdf/pdf.dart';
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
    return pw.Table(children: [
      pw.TableRow(children: [
        pw.RichText(
            text: pw.TextSpan(children: [
          pw.TextSpan(
              style: PdfTextStyles.mediumBold, text: "-${degree.school}\n"),
          pw.TextSpan(text: "${degree.title}\n", style: PdfTextStyles.medium),
        ]))
      ]),
      pw.TableRow(children: [
        pw.Align(
            child: pw.Text(
                "${degree.startDate.year} - ${degree.endDate.year}\n\n"),
            alignment: pw.Alignment.centerRight)
      ])
    ]);
  }
}

class EducationColumn extends pw.StatelessWidget {
  final List<Degree> degrees;

  EducationColumn({required this.degrees});

  @override
  pw.Widget build(pw.Context context) {
    return degrees.isEmpty
        ? pw.Container()
        : pw.Table(children: [
            pw.TableRow(children: [
              pw.Text(
                " EDUCATION ",
                style: PdfTextStyles.largeBold,
              ),
            ]),
            pw.TableRow(children: [
              pw.Divider(thickness: 1, color: PdfColors.black),
            ]),
            pw.TableRow(children: [
              pw.Table(
                  children: degrees.map((degree) {
                return pw.TableRow(children: [EducationText(degree: degree)]);
              }).toList())
            ])
          ]);
  }
}

class CourseText extends pw.StatelessWidget {
  final Course course;

  CourseText({required this.course});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Table(children: [
      pw.TableRow(children: [
        pw.RichText(
            text: pw.TextSpan(children: [
          pw.TextSpan(
              style: PdfTextStyles.mediumBold, text: "-${course.title}\n"),
        ]))
      ]),
      pw.TableRow(children: [
        pw.Align(
            alignment: pw.Alignment.centerRight,
            child: pw.Text(
                style: PdfTextStyles.small,
                "${course.startDate.year}/${course.startDate.month} - ${course.endDate.year}/${course.endDate.month}\n\n"))
      ])
    ]);
  }
}

class CoursesColumn extends pw.StatelessWidget {
  final List<Course> courses;

  CoursesColumn({required this.courses});

  @override
  pw.Widget build(pw.Context context) {
    return courses.isEmpty
        ? pw.Container()
        : pw.Table(children: [
            pw.TableRow(children: [
              pw.Text(
                "COURCES & CERTIFICATIONS",
                style: PdfTextStyles.largeBold,
              ),
            ]),
            pw.TableRow(children: [
              pw.Divider(thickness: 1, color: PdfColors.black),
            ]),
            pw.TableRow(children: [
              pw.Table(
                  children: courses.map((corse) {
                return pw.TableRow(children: [CourseText(course: corse)]);
              }).toList())
            ])
          ]);
  }
}

class ExpericeText extends pw.StatelessWidget {
  final WorkExperience experience;

  ExpericeText({required this.experience});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Table(children: [
      pw.TableRow(children: [
        pw.RichText(
            text: pw.TextSpan(children: [
          pw.TextSpan(
              style: PdfTextStyles.mediumBold, text: "-${experience.title}\n"),
          pw.TextSpan(
              style: PdfTextStyles.medium, text: "${experience.description}\n"),
        ]))
      ]),
      pw.TableRow(children: [
        pw.Align(
            alignment: pw.Alignment.centerRight,
            child: pw.Text(
                style: PdfTextStyles.medium,
                "${experience.startDate.year}/${experience.startDate.month} - ${experience.endDate.year}/${experience.endDate.month}\n\n"))
      ])
    ]);
  }
}

class ExperinceColumn extends pw.StatelessWidget {
  final List<WorkExperience> workExperience;

  ExperinceColumn({required this.workExperience});

  @override
  pw.Widget build(pw.Context context) {
    return workExperience.isEmpty
        ? pw.Container()
        : pw.Table(children: [
            pw.TableRow(children: [
              pw.Text(
                " EXPERIENCE ",
                style: PdfTextStyles.largeBold,
              ),
            ]),
            pw.TableRow(children: [
              pw.Divider(thickness: 1, color: PdfColors.black),
            ]),
            pw.TableRow(children: [
              pw.Table(
                  children: workExperience.map((workExperience) {
                return pw.TableRow(
                    children: [ExpericeText(experience: workExperience)]);
              }).toList())
            ])
          ]);
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
              style: PdfTextStyles.mediumBold, text: "-${project.title}\n"),
          pw.TextSpan(
              style: PdfTextStyles.medium, text: "${project.description}\n"),
        ])),
        // link of the logic
      ]),
      pw.TableRow(children: [
        project.link == ""
            ? pw.Container()
            : pw.Align(
                alignment: pw.Alignment.centerRight,
                child: LinkOrEmpty(website: project.link))
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
    return projects.isEmpty
        ? pw.Container()
        : pw.Table(
            defaultVerticalAlignment: pw.TableCellVerticalAlignment.full,
            children: [
                pw.TableRow(children: [
                  pw.Text(
                    "PROJECTS",
                    style: PdfTextStyles.largeBold,
                  ),
                ]),
                pw.TableRow(children: [
                  pw.Divider(thickness: 1, color: PdfColors.black),
                ]),
                pw.TableRow(children: [
                  pw.Table(
                      children: projects.map((project) {
                    return pw.TableRow(
                        children: [ProjectText(project: project)]);
                  }).toList())
                ])
              ]);
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

class LinkOrEmpty extends pw.StatelessWidget {
  final String website;
  final String? title;
  LinkOrEmpty({required this.website, this.title = "link"});

  @override
  pw.Widget build(pw.Context context) {
    // TODO: implement build
    return website.isEmpty
        ? pw.Container()
        : pw.Link(
            child: pw.Text("$title: $website", style: PdfTextStyles.mediumBold),
            destination: website);
  }
}
