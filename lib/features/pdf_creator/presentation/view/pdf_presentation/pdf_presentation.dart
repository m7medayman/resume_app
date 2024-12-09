



import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPresentation extends StatelessWidget {
  const  PdfPresentation({key, required this.bytes});
  final Uint8List bytes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Syncfusion Flutter PDF Viewer')),
      body: SfPdfViewer.memory(bytes),
    );
  }
}
