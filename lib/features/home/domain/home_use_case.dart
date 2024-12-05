import 'package:either_dart/src/either.dart';
import 'package:resume_app/core/data_classes/pdf_view_data.dart';
import 'package:resume_app/core/resources/base_usecase/base_use_case.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/features/home/domain/home_repo.dart';

class GetPdfUseCase extends BaseUseCase<void, List<PdfWidgetViewData>> {
  final HomeRepo repo;

  GetPdfUseCase({required this.repo});
  @override
  Future<Either<Failure, List<PdfWidgetViewData>>> execute([void input]) {
    return repo.getListOfPdfFilesFromFolder();
  }
}

class SignOutUseCase extends BaseUseCase<void, void> {
  final HomeRepo repo;

  SignOutUseCase({required this.repo});
  @override
  Future<Either<Failure, void>> execute([void input])async {
  return await repo.signOut();
  }
}
