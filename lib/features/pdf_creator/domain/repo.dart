import 'dart:typed_data';

import 'package:either_dart/either.dart';
import 'package:resume_app/core/data_classes/pdf_data_class.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';

abstract class PdfRepo {
  Future<Either<Failure, Uint8List>> getPdf(PdfData pdfData);
  Future<Either<Failure, String>> savePdf(Uint8List input, String name);
}
