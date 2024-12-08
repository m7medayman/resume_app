import 'package:either_dart/src/either.dart';
import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/resources/base_usecase/base_use_case.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/features/change_user_info/domain/update_user_repo.dart';

class UpdateUserUsecase extends BaseUseCase<UpdateUserParameters, Null> {
  final UpdateUserRepo updateUserRepo;

  UpdateUserUsecase({required this.updateUserRepo});

  @override
  Future<Either<Failure, Null>> execute(UpdateUserParameters input) async {
    // TODO: implement execute
    return await updateUserRepo.updateUserData(input);
  }
}

class UpdateUserParameters {
  String name;
  String phone;
  String address;
  String contactEmail;
  ContactExtraDetails contactExtraDetails;
  EducationInfo educationInfo;
  UpdateUserParameters({
    required this.name,
    required this.phone,
    required this.address,
    required this.contactEmail,
    required this.contactExtraDetails,
    required this.educationInfo,
  });
}
