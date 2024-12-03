import 'package:either_dart/either.dart';
import 'package:resume_app/core/data_classes/pdf_view_data.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<PdfWidgetViewData>>> getListOfPdfFilesFromFolder();
}
