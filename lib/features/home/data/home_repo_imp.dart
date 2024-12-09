
import 'package:either_dart/src/either.dart';
import 'package:resume_app/core/data_classes/pdf_view_data.dart';
import 'package:resume_app/core/doc_manager/doc_path_consts.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/core/auth_provider/auth_network_service_provider.dart';
import 'package:resume_app/features/home/data/file_scan_service.dart';
import 'package:resume_app/features/home/domain/home_repo.dart';

class HomeRepoImp extends HomeRepo {
  final FileScanService fileScanService;
  final AuthServiceProvider authServiceProvider;

  HomeRepoImp(
      {required this.authServiceProvider, required this.fileScanService});
  @override
  Future<Either<Failure, List<PdfWidgetViewData>>>
      getListOfPdfFilesFromFolder() async {
    try {
      return Right(
          await fileScanService.getFilesPaths(DocPathConsts.fullPathFolder));
    } catch (e) {
      return Left(Failure(id: 4001, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await authServiceProvider.signOut();
      return const Right(null);
    } catch (e) {
      return Left(Failure(id: 4003, message: e.toString()));
    }
  }
}
