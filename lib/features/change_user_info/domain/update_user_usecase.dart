import 'package:either_dart/src/either.dart';
import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/data_classes/project_experience.dart';
import 'package:resume_app/core/data_classes/work_experience.dart';
import 'package:resume_app/core/resources/base_usecase/base_use_case.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/features/change_user_info/domain/update_user_repo.dart';

class UpdateUserUsecase extends BaseUseCase<UpdateUerInput, Null> {
  final UpdateUserRepo updateUserRepo;

  UpdateUserUsecase({required this.updateUserRepo});

  @override
  Future<Either<Failure, Null>> execute(UpdateUerInput input) async {
    // TODO: implement execute
    return await updateUserRepo.updateUserData(
        id: input.uid, input: input.updateUserParameters);
  }
}

class UpdateUerInput {
  String uid;
  UpdateUserParameters updateUserParameters;
  UpdateUerInput({required this.uid, required this.updateUserParameters});
}

class UpdateUserParameters {
  String name;
  String phone;
  String address;
  String contactEmail;
  List<WorkExperience> punchOfWorkingExperience;
  List<ProjectExperience> punchOfProjectExperienc;
  ContactExtraDetails contactExtraDetails;
  EducationInfo educationInfo;
  UpdateUserParameters({
    required this.punchOfProjectExperienc,
    required this.punchOfWorkingExperience,
    required this.name,
    required this.phone,
    required this.address,
    required this.contactEmail,
    required this.contactExtraDetails,
    required this.educationInfo,
  });
}
