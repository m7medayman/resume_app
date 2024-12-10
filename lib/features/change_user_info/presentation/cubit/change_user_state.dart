part of 'change_user_cubit.dart';

class ChangeUserState extends Equatable {
  final PageState pageState;
  final bool extraPhoneFlag;
  final bool linkedInFlag;
  final bool websiteFlag;
  final EducationInfo educationInfo;
  final ContactExtraDetails contactExtraDetails;
  final String userName;
  final String contactEmail;
  final String phone;
  final String address;
  final List<WorkExperience> punchOfWorkExperiences;
  final List<ProjectExperience> punchOfProjectExperiences;
  const ChangeUserState(
      {required this.punchOfProjectExperiences,
      required this.punchOfWorkExperiences,
      required this.pageState,
      required this.extraPhoneFlag,
      required this.linkedInFlag,
      required this.websiteFlag,
      required this.educationInfo,
      required this.contactExtraDetails,
      required this.userName,
      required this.contactEmail,
      required this.phone,
      required this.address});

  ChangeUserState copyWith({
    PageState? pageState,
    bool? extraPhoneFlag,
    bool? linkedInFlag,
    bool? websiteFlag,
       List<WorkExperience>? punchOfWorkExperiences,
  List<ProjectExperience>? punchOfProjectExperiences,
    EducationInfo? educationInfo,
    ContactExtraDetails? contactExtraDetails,
    String? userName,
    String? contactEmail,
    String? phone,
    String? address,
  }) {
    return ChangeUserState(
      punchOfProjectExperiences: punchOfProjectExperiences??this.punchOfProjectExperiences,
      punchOfWorkExperiences: punchOfWorkExperiences??this.punchOfWorkExperiences,
      pageState: pageState ?? this.pageState,
      extraPhoneFlag: extraPhoneFlag ?? this.extraPhoneFlag,
      linkedInFlag: linkedInFlag ?? this.linkedInFlag,
      websiteFlag: websiteFlag ?? this.websiteFlag,
      educationInfo: educationInfo ?? this.educationInfo,
      contactExtraDetails: contactExtraDetails ?? this.contactExtraDetails,
      userName: userName ?? this.userName,
      contactEmail: contactEmail ?? this.contactEmail,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }

  @override
  List<Object> get props => [
        pageState,
        extraPhoneFlag,
        linkedInFlag,
        websiteFlag,
        educationInfo,
        contactExtraDetails,
        userName,
        contactEmail,
        phone,
        address,
      ];
}
