import 'package:resume_app/core/data_classes/pdf_view_data.dart';

abstract class FileScanService {
  Future<List<PdfWidgetViewData>> getFilesPaths(String folderPath);
}
