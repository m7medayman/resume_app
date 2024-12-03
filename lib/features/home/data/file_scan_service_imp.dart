import 'dart:io';

import 'package:resume_app/core/data_classes/pdf_view_data.dart';
import 'package:resume_app/features/home/data/file_scan_service.dart';

class FileScanServiceImp extends FileScanService{
  Future<List<PdfWidgetViewData>> getFilesPaths(String folderPath) async {
    List<File> punchOfFiles = await _getPdfFiles(folderPath);
    List<PdfWidgetViewData> returnedList = [];
    returnedList = punchOfFiles.map((file) {
      return PdfWidgetViewData(
          pdfName: file.uri.pathSegments.last, pdfLocation: file.uri.path);
    }).toList();
    return returnedList;
  }

  Future<List<File>> _getPdfFiles(String folderPath) async {
    try {
      // Access the folder
      final directory = Directory(folderPath);
      if (!directory.existsSync()) {
        throw Exception('Folder does not exist.');
      }

      // List all files in the directory
      final files = directory.listSync();

      // Filter for PDF files
      final pdfFiles = files
          .where((entity) {
            return entity is File && entity.path.endsWith('.pdf');
          })
          .map((entity) => entity as File)
          .toList();

      return pdfFiles;
    } catch (e) {
      return [];
    }
  }
}
