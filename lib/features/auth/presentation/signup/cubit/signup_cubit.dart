import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resume_app/core/Di/injection.dart';
import 'package:resume_app/core/data_classes/project_experience.dart';
import 'package:resume_app/core/data_classes/work_experience.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/features/auth/domain/use_case.dart';
import 'signup_form_state.dart';
import 'package:resume_app/core/data_classes/data_classes.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SighupState> {
  final SignUpUseCase signUpUseCase;
  final JobExperienceEnhanceSignupUseCase jobExperienceEnhanceSignupUseCase;
  SignupCubit(
      {required this.jobExperienceEnhanceSignupUseCase,
      required this.signUpUseCase})
      : super(SighupState(
            educationInfo: EducationInfo(courses: [], degrees: []),
            contactExtraDetails: ContactExtraDetails(),
            signupFormState: InitSignupFormState(),
            punchOfProjectExperiences: [],
            punchOfWorkExperiences: []));

  Future<String> getJobExperienceEnhanced(String jobExperience) async {
    emit(state.copyWith(signupFormState: LoadingSignupFormstate()));
    var response =
        await jobExperienceEnhanceSignupUseCase.execute(jobExperience);
    String returned = jobExperience;
    response.fold((error) {
      emit(state.copyWith(
          signupFormState:
              FailureSignupFormState(errorMessage: error.message)));
      emit(state.copyWith(signupFormState: InitSignupFormState()));
    }, (success) {
      emit(state.copyWith(signupFormState: InitSignupFormState()));
      returned = success;
    });
    return returned;
  }

  void addWorkExperience(WorkExperience workExperience) {
    final updatedWorkExperience =
        List<WorkExperience>.from(state.punchOfWorkExperiences);
    updatedWorkExperience.add(workExperience);
    emit(state.copyWith(punchOfWorkExperiences: updatedWorkExperience));
  }

  void deleteWorkExperience(WorkExperience workExperience) {
    final updatedWorkExperience =
        List<WorkExperience>.from(state.punchOfWorkExperiences);
    updatedWorkExperience.remove(workExperience);
    emit(state.copyWith(punchOfWorkExperiences: updatedWorkExperience));
  }

  void addProjectExperience(ProjectExperience project) {
    final updatedWorkExperience =
        List<ProjectExperience>.from(state.punchOfProjectExperiences);
    updatedWorkExperience.add(project);
    emit(state.copyWith(punchOfProjectExperiences: updatedWorkExperience));
  }

  void deleteProjectExperience(ProjectExperience project) {
    final updatedProjectExperience =
        List<ProjectExperience>.from(state.punchOfProjectExperiences);
    updatedProjectExperience.remove(project);
    emit(state.copyWith(punchOfProjectExperiences: updatedProjectExperience));
  }

  void changeExtraPhoneFiledVisibility() {
    emit(state.copyWith(extraPhoneFlag: !state.extraPhoneFlag));
  }

  void changeLinkedInFiledVisibility() {
    emit(state.copyWith(linkedInFlag: !state.linkedInFlag));
  }

  void deleteDegree(Degree degree) {
    // Create a new list and remove the degree from it
    final updatedDegrees = List<Degree>.from(state.educationInfo.degrees!);
    updatedDegrees.remove(degree);

    // Emit the new state with the updated list
    emit(state.copyWith(
      educationInfo: state.educationInfo.copyWith(degrees: updatedDegrees),
    ));
  }

  void changeWebsiteFiledVisibility() {
    emit(state.copyWith(websiteFlag: !state.websiteFlag));
  }

  void addDegree(Degree degree) {
    final updatedDegree = List<Degree>.from(state.educationInfo.degrees!);
    updatedDegree.add(degree);
    emit(state.copyWith(
        educationInfo: state.educationInfo.copyWith(degrees: updatedDegree)));
  }

  void addCourse(Course course) {
    final updatedCourse = List<Course>.from(state.educationInfo.courses!);
    updatedCourse.add(course);
    emit(state.copyWith(
        educationInfo: state.educationInfo.copyWith(courses: updatedCourse)));
  }

  void deleteCourse(Course course) {
    // Create a new list and remove the degree from it
    final updatedCourse = List<Course>.from(state.educationInfo.courses!);
    updatedCourse.remove(course);

    // Emit the new state with the updated list
    emit(state.copyWith(
      educationInfo: state.educationInfo.copyWith(courses: updatedCourse),
    ));
  }

  bool checkStringIsNotEmpty(String? text) {
    if (text != null || text != "" || text!.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void registerUser(
      String email,
      String password,
      String userName,
      String phone,
      String contactEmail,
      String address,
      String? extraPhone,
      String? linkedIn,
      String? Website) async {
    emit(state.copyWith(signupFormState: LoadingSignupFormstate()));
    var res = await signUpUseCase.execute(SignUpParameter(
      email: email,
      password: password,
      name: userName,
      phone: phone,
      address: address,
      contactEmail: contactEmail,
      contactDetails: ContactExtraDetails(
          extraPhone: checkStringIsNotEmpty(extraPhone) ? extraPhone : null,
          linkedIn: checkStringIsNotEmpty(linkedIn) ? linkedIn : null,
          website: checkStringIsNotEmpty(Website) ? Website : null),
      educationInfo: state.educationInfo,
      punchOfProjectExperienc: state.punchOfProjectExperiences,
      punchOfWorkingExperience: state.punchOfWorkExperiences,
    ));
    res.fold((Failure failure) {
      emit(state.copyWith(
          signupFormState:
              FailureSignupFormState(errorMessage: failure.message)));
    }, (success) {
      emit(state.copyWith(signupFormState: SuccessSignupFormState()));
    });
  }
}
