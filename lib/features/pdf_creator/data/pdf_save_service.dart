import 'dart:io';
import 'dart:typed_data';



import 'package:resume_app/core/doc_manager/doc_path_consts.dart';

class PdfSaveService {
  Future<String> saveFile(Uint8List pdfFile, String name) async {

    final file = File("${DocPathConsts.fullPathFolder}/$name.pdf");
    File result = await file.writeAsBytes(pdfFile);

    return result.path;
  }
}
