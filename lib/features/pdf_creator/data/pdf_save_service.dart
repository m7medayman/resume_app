import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

class PdfSaveService {
  Future<String> saveFile(Uint8List pdfFile, String name) async {
    final output = await getTemporaryDirectory();
    print("${output.path}/$name.pdf");
    final file = File("${output.path}/$name.pdf");
    File result = await file.writeAsBytes(pdfFile);

    return result.path;
  }
}