import 'dart:typed_data';

import 'package:either_dart/src/either.dart';
import 'package:pdf/src/widgets/document.dart';

import 'package:resume_app/core/data_classes/pdf_data_class.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/features/pdf_creator/data/pdf_form.dart';
import 'package:resume_app/features/pdf_creator/data/pdf_save_service.dart';
import 'package:resume_app/features/pdf_creator/domain/repo.dart';

class pdfRepoImp implements PdfRepo {
  PdfForm pdfForm;
  PdfSaveService pdfSaveService;
  pdfRepoImp({
    required this.pdfSaveService,
    required this.pdfForm,
  });
  @override
  Future<Either<Failure, Uint8List>> getPdf(PdfData pdfData) async {
    try {
      return Right(await pdfForm.getDocument());
    } catch (error) {
      return Left(Failure(id: 2001, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> savePdf(Uint8List input, String name) async {
    try {
      return Right(await pdfSaveService.saveFile(input, name));
    } catch (e) {
      return Left(Failure(id: 3001, message: e.toString()));
    }
  }
}
