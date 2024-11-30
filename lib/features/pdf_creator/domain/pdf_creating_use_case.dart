import 'dart:typed_data';

import 'package:either_dart/src/either.dart';
import 'package:resume_app/core/data_classes/pdf_data_class.dart';
import 'package:resume_app/core/resources/base_usecase/base_use_case.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/features/pdf_creator/domain/repo.dart';

class PdfCreatingUseCase extends BaseUseCase<PdfData, Uint8List> {
  final PdfRepo repo;

  PdfCreatingUseCase({required this.repo});

  @override
  Future<Either<Failure, Uint8List>> execute(PdfData input) async {
    return await repo.getPdf(input);
  }
}

class PdfSaveUseCase extends BaseUseCase<PdfSaveInput, String> {
  final PdfRepo repo;

  PdfSaveUseCase({required this.repo});
  @override
  Future<Either<Failure, String>> execute(PdfSaveInput input) async {
    return await repo.savePdf(input.file, input.name);
  }
}

class PdfSaveInput {
  final Uint8List file;
  final String name;

  PdfSaveInput({required this.file, required this.name});
}
