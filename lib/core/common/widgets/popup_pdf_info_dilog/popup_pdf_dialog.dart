import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/popup_pdf_info_dilog/pdf_file_info_dialog.dart';

class PopupPdfDialog {
  static void showPdfDialog(
      {required BuildContext context,
      required String pdfFilePath,
      required double screenHeight,
      required double screenWidth,
      required String pdfName}) {
    showDialog(
        context: context,
        builder: (context) {
          return PdfFileInfoDialog(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              pdfName: pdfName,
              pdfFilePath: pdfFilePath);
        });
  }
}
