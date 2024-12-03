import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfFileView extends StatelessWidget {
  const PdfFileView({super.key, required this.pdfPath});
  final String pdfPath;

  @override
  Widget build(BuildContext context) {
    final decodedPath = Uri.decodeFull(pdfPath);
    final pdfFile = File(decodedPath.trim());

    return Scaffold(
        appBar: AppBar(
          title: const Text("pdf viewer"),
        ),
        body: SfPdfViewer.file(pdfFile));
  }
}
