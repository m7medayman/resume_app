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

class EducationColumn {
  final List<Degree> degrees;

  EducationColumn({required this.degrees});

  List<pw.Widget> getList() {
    return degrees.isEmpty
        ? []
        : [
            pw.Padding(
              padding: const pw.EdgeInsets.only(top: 5),
              child: pw.Text(
                " EDUCATION ",
                style: PdfTextStyles.largeBold,
              ),
            ),
            pw.Divider(thickness: 1, color: PdfColors.black),
            pw.Table(
                children: degrees.map((degree) {
              return pw.TableRow(children: [EducationText(degree: degree)]);
            }).toList())
          ];
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

class CoursesColumn {
  final List<Course> courses;

  CoursesColumn({required this.courses});

  List<pw.Widget> getList() {
    return courses.isEmpty
        ? []
        : [
            pw.Text(
              "COURCES & CERTIFICATIONS",
              style: PdfTextStyles.largeBold,
            ),
            pw.Divider(thickness: 1, color: PdfColors.black),
            pw.Table(
                children: courses.map((corse) {
              return pw.TableRow(children: [CourseText(course: corse)]);
            }).toList())
          ];
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

class ExperinceColumn {
  final List<WorkExperience> workExperience;

  ExperinceColumn({required this.workExperience});

  List<pw.Widget> getList() {
    return workExperience.isEmpty
        ? []
        : [
            pw.Text(
              " EXPERIENCE ",
              style: PdfTextStyles.largeBold,
            ),
            pw.Divider(thickness: 1, color: PdfColors.black),
            pw.Table(
                children: workExperience.map((workExperience) {
              return pw.TableRow(
                  children: [ExpericeText(experience: workExperience)]);
            }).toList())
          ];
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

class ProjectColumn {
  final List<ProjectExperience> projects;

  ProjectColumn({required this.projects});

  List<pw.Widget> getWidgetList() {
    return projects.isEmpty
        ? []
        : [
            pw.Text(
              "PROJECTS",
              style: PdfTextStyles.largeBold,
            ),
            pw.Divider(thickness: 1, color: PdfColors.black),
            pw.Table(
                children: projects.map((project) {
              return pw.TableRow(children: [ProjectText(project: project)]);
            }).toList())
          ];
  }
}

class SkillsColumn extends pw.StatelessWidget {
  final List<String> skills;
  List<pw.TableRow> getRow(List<String> skills) {
    List<pw.TableRow> result = [];
    int index = 0;
    while (index < skills.length) {
      if (index + 1 < skills.length) {
        result.add(pw.TableRow(children: [
          pw.Expanded(
              flex: 1,
              child: pw.Padding(
                padding: pw.EdgeInsets.all(3),
                child: pw.Text("- ${skills[index]}",
                    style: PdfTextStyles.mediumBold),
              )),
          pw.Expanded(
              flex: 1,
              child: pw.Padding(
                padding:
                    const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                child: pw.Text("- ${skills[index + 1]}",
                    style: PdfTextStyles.mediumBold),
              ))
        ]));
      } else {
        result.add(pw.TableRow(children: [
          pw.Padding(
            padding: pw.EdgeInsets.all(3),
            child:
                pw.Text("- ${skills[index]}", style: PdfTextStyles.mediumBold),
          )
        ]));
      }

      index += 2;
    }
    return result;
  }

  SkillsColumn({required this.skills});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Table(children: getRow(skills));
  }
}

class LinkOrEmpty extends pw.StatelessWidget {
  final String website;
  final String? title;
  LinkOrEmpty({required this.website, this.title = "link"});

  @override
  pw.Widget build(pw.Context context) {
    // TODO: implement build
    return website.isEmpty ? pw.Container() : pw.RichText(text: pw.TextSpan(
      text: "$title: $website", style: PdfTextStyles.medium
      ,annotation: pw.AnnotationUrl(website)
    ));
  }
}

class LanguageText extends pw.StatelessWidget {
  final String language;
  final String languageLevel;

  LanguageText({required this.language, required this.languageLevel});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Table(children: [
      pw.TableRow(children: [
        pw.RichText(
            text: pw.TextSpan(children: [
          pw.TextSpan(style: PdfTextStyles.mediumBold, text: "-$language\n"),
          pw.TextSpan(style: PdfTextStyles.medium, text: "$languageLevel\n"),
        ])),
        // link of the logic
      ]),
      pw.TableRow(children: [pw.SizedBox(height: 20)])
    ]);
  }
}

class LanguageColumn extends pw.StatelessWidget {
  final Map<String, String> languages;

  LanguageColumn({required this.languages});
  List<pw.TableRow> getRow(List<String> punchOfLanguages) {
    List<pw.TableRow> result = [];
    int index = 0;
    while (index < punchOfLanguages.length) {
      String language = punchOfLanguages[index];
      if (index + 1 < punchOfLanguages.length) {
        String secoendLanguage = punchOfLanguages[index + 1];
        result.add(pw.TableRow(children: [
          pw.Expanded(
              flex: 1,
              child: pw.Padding(
                padding: const pw.EdgeInsets.all(3),
                child: LanguageText(
                    language: language,
                    languageLevel: languages[language] ?? ""),
              )),
          pw.Expanded(
              flex: 1,
              child: pw.Padding(
                padding:
                    const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                child: LanguageText(
                    language: secoendLanguage,
                    languageLevel: languages[secoendLanguage] ?? ""),
              ))
        ]));
      } else {
        result.add(pw.TableRow(children: [
          pw.Padding(
            padding: const pw.EdgeInsets.all(3),
            child: LanguageText(
                language: language, languageLevel: languages[language] ?? ""),
          )
        ]));
      }

      index += 2;
    }
    return result;
  }

  @override
  pw.Widget build(pw.Context context) {
    return pw.Table(children: getRow(languages.keys.toList()));
  }
  // List<pw.Widget> getList() {
  //   return languages.isEmpty
  //       ? []
  //       : [
  //           pw.Text(
  //             "Languages",
  //             style: PdfTextStyles.largeBold,
  //           ),
  //           pw.Divider(thickness: 1, color: PdfColors.black),
  //           pw.Table(
  //               children: languages.keys.map((language) {
  //             return pw.TableRow(children: [
  //               LanguageText(
  //                   language: language,
  //                   languageLevel: languages[language] ?? "")
  //             ]);
  //           }).toList())
  //         ];
  // }
}
