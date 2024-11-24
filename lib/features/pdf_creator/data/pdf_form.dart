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
          pw.SizedBox(height: 10),
          pw.Text("Email: ${data.userInfo.contactEmail}",
              style: PdfTextStyles.mediumBold),
          pw.SizedBox(height: 5),
          pw.Text("Phone : ${data.userInfo.phone}",
              style: PdfTextStyles.mediumBold),
          pw.SizedBox(height: 5),
          WebsiteOrEmpty(website: data.userInfo.contactDetails.website ?? ""),
          pw.SizedBox(height: 5),
          pw.Text("Address:${data.userInfo.address}",
              style: PdfTextStyles.mediumBold),
          pw.SizedBox(height: 25),
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
          pw.SizedBox(height: 25),

// end of skills section

          pw.Text(
            " EDUCATION ",
            style: PdfTextStyles.largeBold,
          ),
          pw.Divider(thickness: 1, color: PdfColors.black),
          EducationColumn(degrees: data.selectedEducationInfo.degrees ?? []),
          pw.SizedBox(height: 25),
          // end of Education
          pw.Text(
            "COURCES & CERTIFICATIONS",
            style: PdfTextStyles.largeBold,
          ),
          pw.Divider(thickness: 1, color: PdfColors.black),
          CoursesColumn(courses: data.selectedEducationInfo.courses ?? []),
          pw.SizedBox(height: 25),
          // end of certification and references
          pw.Text(
            " EXPERIENCE ",
            style: PdfTextStyles.largeBold,
          ),
          pw.Divider(thickness: 1, color: PdfColors.black),
          ExperinceColumn(workExperience: data.punchOfWorkExperiences),
          pw.SizedBox(height: 25),
          // end of experience
          pw.Text(
            "PROJECTS",
            style: PdfTextStyles.largeBold,
          ),
          pw.Divider(thickness: 1, color: PdfColors.black),
          ProjectColumn(projects: data.punchOfProjectExperience),
          pw.SizedBox(height: 25),
        ];
      },
    ));

    // Return the generated PDF document as Uint8List
    return pdf.save();
  }
}
