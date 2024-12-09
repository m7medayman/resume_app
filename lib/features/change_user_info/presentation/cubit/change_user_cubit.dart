import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:resume_app/core/data_classes/data_classes.dart';
import 'package:resume_app/core/data_classes/user_info.dart';
import 'package:resume_app/core/page_states/page_states.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/core/resources/helpers/null_type_extension.dart';
import 'package:resume_app/features/change_user_info/domain/update_user_usecase.dart';

part 'change_user_state.dart';

class ChangeUserCubit extends Cubit<ChangeUserState> {
  MyUserInfo userInfo;
  final UpdateUserUsecase usecase;
  FirebaseAuth auth;
  ChangeUserCubit(
      {required this.auth, required this.usecase, required this.userInfo})
      : super(ChangeUserState(
          educationInfo: userInfo.educationInfo,
          contactExtraDetails: userInfo.extraContactDetails,
          pageState: InitpagesState(),
          extraPhoneFlag:
              userInfo.extraContactDetails.extraPhone.nullSafety().isNotEmpty,
          linkedInFlag:
              userInfo.extraContactDetails.linkedIn.nullSafety().isNotEmpty,
          websiteFlag:
              userInfo.extraContactDetails.website.nullSafety().isNotEmpty,
          userName: userInfo.name,
          contactEmail: userInfo.contactEmail,
          phone: userInfo.phone,
          address: userInfo.address,
        ));
  void changeExtraPhoneFiledVisibility() {
    emit(state.copyWith(extraPhoneFlag: !state.extraPhoneFlag));
  }

  void checkExtraFiledIsEmpty() {}
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

  void updateUser(
      String userName,
      String phone,
      String contactEmail,
      String address,
      String? extraPhone,
      String? linkedIn,
      String? Website) async {
    emit(state.copyWith(pageState: LoadingPageState()));
    var res = await usecase.execute(UpdateUerInput(
      uid: auth.currentUser!.uid,
      updateUserParameters: UpdateUserParameters(
        name: userName,
        phone: phone,
        address: address,
        contactEmail: contactEmail,
        contactExtraDetails: ContactExtraDetails(
            extraPhone: checkStringIsNotEmpty(extraPhone) ? extraPhone : null,
            linkedIn: checkStringIsNotEmpty(linkedIn) ? linkedIn : null,
            website: checkStringIsNotEmpty(Website) ? Website : null),
        educationInfo: state.educationInfo,
      ),
    ));
    res.fold((Failure failure) {
      emit(state.copyWith(
          pageState: FailurePageState(errorMessage: failure.message)));
    }, (success) {
      emit(state.copyWith(pageState: SuccessPageState()));
    });
  }
}
