import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:resume_app/core/data_classes/pdf_data_class.dart';
import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:resume_app/features/pdf_creator/data/pdf_constants.dart';
import 'package:resume_app/features/pdf_creator/data/pdf_strings.dart';
import 'package:resume_app/features/pdf_creator/data/pdf_widgets.dart';

class PdfForm {
  PdfData data;
  PdfForm({required this.data});
  Future<Uint8List> getDocument() async {
    final pdf = pw.Document();

    // Adding a page
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return [
          pw.Text(data.userInfo.name, style: PdfTextStyles.extraLargeBold),
          pw.Text(data.jobTitle, style: PdfTextStyles.large),
          pw.Divider(thickness: 1, color: PdfColors.black),
          pw.SizedBox(height: 7),
          pw.Text("Email : ${data.userInfo.contactEmail}",
              style: PdfTextStyles.mediumBold),
          pw.SizedBox(height: 2),
          pw.Text("Phone : ${data.userInfo.phone}",
              style: PdfTextStyles.mediumBold),
          pw.SizedBox(height: 2),
          LinkOrEmpty(
              website: data.userInfo.extraContactDetails.linkedIn ?? "",
              title: "LinkedIn",
              style: PdfTextStyles.mediumBold),
          pw.SizedBox(height: 2),
          LinkOrEmpty(
              website: data.userInfo.extraContactDetails.website ?? "",
              title: "website",
              style: PdfTextStyles.mediumBold),

          pw.SizedBox(height: 5),
          pw.Text("Address : ${data.userInfo.address}",
              style: PdfTextStyles.mediumBold),
          pw.SizedBox(height: 10),
          pw.Text(
            "Professional Summary",
            style: PdfTextStyles.largeBold,
          ),
          pw.Divider(thickness: 1, color: PdfColors.black),
          pw.Text(
            data.jobSummery,
            style: PdfTextStyles.medium,
          ),

          pw.SizedBox(height: 25),
          // end of the professional summary

          pw.Text(
            "KEY COMPETENCIES - SKILLS",
            style: PdfTextStyles.largeBold,
          ),
          pw.Divider(thickness: 1, color: PdfColors.black),
          SkillsColumn(skills: data.selectedHardSkills),

// end of skills section

          ...EducationColumn(degrees: data.selectedEducationInfo.degrees ?? [])
              .getList(),

          // end of Education
          ...CoursesColumn(courses: data.selectedEducationInfo.courses ?? [])
              .getList(),
          pw.SizedBox(height: 25),
          // end of certification and references
          ...ExperinceColumn(workExperience: data.punchOfWorkExperiences)
              .getList(),

          // end of experience

          ...ProjectColumn(projects: data.punchOfProjectExperience)
              .getWidgetList(),

          // soft skill section
          pw.Text(
            "PERSONAL SKILLS",
            style: PdfTextStyles.largeBold,
          ),
          pw.Divider(thickness: 1, color: PdfColors.black),
          SkillsColumn(skills: data.selectedSoftSkills),
          pw.SizedBox(height: 25),
          // language section
          pw.Text(
            "Languages",
            style: PdfTextStyles.largeBold,
          ),
          pw.Divider(thickness: 1, color: PdfColors.black),
          LanguageColumn(languages: data.language)
        ];
      },
    ));

    // Return the generated PDF document as Uint8List
    return pdf.save();
  }
}
