import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:resume_app/core/data_classes/pdf_data_class.dart';
import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;

class PdfForm {
  Future<Uint8List> getDocument() async {
    final pdf = pw.Document();

    // Adding a page
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return [
          pw.Table(
            defaultColumnWidth: pw.IntrinsicColumnWidth(),
            children: List.generate(
              105, // Rows
              (rowIndex) {
                return pw.TableRow(
                  children: List.generate(
                    3, // Columns
                    (colIndex) {
                      int index = rowIndex * 3 + colIndex;
                      return pw.Container(
                        alignment: pw.Alignment.center,
                        margin: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Item ${index + 1}',
                          style: const pw.TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ];
      },
    ));

    // Return the generated PDF document as Uint8List
    return pdf.save();
  }
}
