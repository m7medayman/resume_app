import 'package:either_dart/src/either.dart';
import 'package:pdf/src/widgets/document.dart';

import 'package:resume_app/core/data_classes/pdf_data_class.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/features/pdf_creator/data/pdf_form.dart';
import 'package:resume_app/features/pdf_creator/domain/repo.dart';

class pdfRepoImp implements PdfRepo {
  PdfForm pdfForm;
  pdfRepoImp({
    required this.pdfForm,
  });
  @override
  Future<Either<Failure, Document>> getPdf(PdfData pdfData) async {
    try {
      return Right(pdfForm.getDocument());
    } catch (error) {
      return Left(Failure(id: 2001, message: error.toString()));
    }
  }
}
