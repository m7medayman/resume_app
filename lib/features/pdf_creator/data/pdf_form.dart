import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:resume_app/core/data_classes/pdf_data_class.dart';

class PdfForm {
  // PdfData data;
  // PdfForm(
  //   this.data,
  // );
  pw.Document getDocument() {
    final pdf = pw.Document();
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Center(
                    child: pw.Text("Hello World"),
                    // Example GridView
                  ),
                  pw.GridView(
                    crossAxisCount: 3, // Number of columns
                    childAspectRatio: 1, // Adjust the aspect ratio as needed
                    children: List.generate(
                      9, // Number of items in the grid
                      (index) => pw.Container(
                        alignment: pw.Alignment.center,
                        margin: const pw.EdgeInsets.all(4),
                        color: PdfColors.blue200,
                        child: pw.Text(
                          'Item ${index + 1}',
                          style: pw.TextStyle(
                              fontSize: 14, color: PdfColors.white),
                        ),
                      ),
                    ),
                  ),
                ])
          ]; // Center
        })); // Page
    return pdf;
  }
}
