



import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPresentation extends StatelessWidget {
   PdfPresentation({key, required this.bytes});
   Uint8List bytes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Syncfusion Flutter PDF Viewer')),
      body: SfPdfViewer.memory(bytes),
    );
  }
}
