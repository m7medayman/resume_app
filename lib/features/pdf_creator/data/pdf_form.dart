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
  Future<Uint8List> getDocument() async {
    final pdf = pw.Document();

    // Adding a page
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return [
          pw.Text("Mohaemd Ayman Abd elmohsen",
              style: PdfTextStyles.extraLargeBold),
          pw.Text("Flutter developer", style: PdfTextStyles.large),
          pw.Divider(thickness: 1, color: PdfColors.black),
          pw.SizedBox(height: 10),
          pw.Text("Email: m7medmahgoop@gmail.com",
              style: PdfTextStyles.mediumBold),
          pw.SizedBox(height: 5),
          pw.Text("Phone : 01090849580", style: PdfTextStyles.mediumBold),
          pw.SizedBox(height: 5),
          pw.Link(
              child: pw.Text("website: https://github.com/m7medayman",
                  style: PdfTextStyles.mediumBold),
              destination: 'https://github.com/m7medayman11'),
          pw.SizedBox(height: 5),
          pw.Text("Location: cario ,Egypt", style: PdfTextStyles.mediumBold),
          pw.SizedBox(height: 25),
          pw.Text(
            "Professional Summary",
            style: PdfTextStyles.largeBold,
          ),
          pw.Divider(thickness: 1, color: PdfColors.black),
          pw.Text(
            PdfStrings.professionalSummary,
            style: PdfTextStyles.medium,
          ),

          pw.SizedBox(height: 25),
          // end of the professional summary

          pw.Text(
            "KEY COMPETENCIES - SKILLS",
            style: PdfTextStyles.largeBold,
          ),
          pw.Divider(thickness: 1, color: PdfColors.black),
          SkillsColumn(skills: PdfStrings.testSkills),
          pw.SizedBox(height: 25),

          pw.SizedBox(height: 25),
// end of skills section

          pw.Text(
            " EDUCATION ",
            style: PdfTextStyles.largeBold,
          ),
          pw.Divider(thickness: 1, color: PdfColors.black),
          EducationColumn(degrees: PdfStrings.testDegrees),
          pw.SizedBox(height: 25),
          // end of Education
          pw.Text(
            "COURCES & CERTIFICATIONS",
            style: PdfTextStyles.largeBold,
          ),
          pw.Divider(thickness: 1, color: PdfColors.black),
          CoursesColumn(courses: PdfStrings.testCorses),
          pw.SizedBox(height: 25),
          // end of certification and references
          pw.Text(
            " EXPERIENCE ",
            style: PdfTextStyles.largeBold,
          ),
          pw.Divider(thickness: 1, color: PdfColors.black),
          ExperinceColumn(workExperience: PdfStrings.testExperince),
          pw.SizedBox(height: 25),
          // end of experience
          pw.Text(
            "PROJECTS",
            style: PdfTextStyles.largeBold,
          ),
          pw.Divider(thickness: 1, color: PdfColors.black),
          ProjectColumn(projects: PdfStrings.testProjects),
          pw.SizedBox(height: 25),
        ];
      },
    ));

    // Return the generated PDF document as Uint8List
    return pdf.save();
  }
}
