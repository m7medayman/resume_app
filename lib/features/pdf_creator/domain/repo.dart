import 'package:either_dart/either.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:resume_app/core/data_classes/pdf_data_class.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';

abstract class PdfRepo {
  Future<Either<Failure, pw.Document>> getPdf(PdfData pdfData);
}
