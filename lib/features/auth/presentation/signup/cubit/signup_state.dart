part of 'signup_cubit.dart';

class SighupState extends Equatable {
 final bool extraPhoneFlag;
 final bool linkedInFlag;
 final bool websiteFlag;
 final EducationInfo educationInfo;
 final ContactExtraDetails contactExtraDetails;
 final SignupFormState signupFormState;
 final String email;
 final String password;
 final String userName;
 final String contactEmail;
 final String phone;
 final String address;

  const SighupState({
    this.extraPhoneFlag = false,
    this.linkedInFlag = false,
    this.websiteFlag = false,
    required this.educationInfo,
    required this.contactExtraDetails,
    required this.signupFormState,
    this.email = "",
    this.password = "",
    this.userName = "",
    this.contactEmail = "",
    this.phone = "",
    this.address = "",
  });

  // Implementing copyWith method
  SighupState copyWith({
    bool? extraPhoneFlag,
    bool? linkedInFlag,
    bool? websiteFlag,
    EducationInfo? educationInfo,
    ContactExtraDetails? contactExtraDetails,
    SignupFormState? signupFormState,
    String? email,
    String? password,
    String? userName,
    String? contactEmail,
    String? phone,
    String? address,
  }) {
    return SighupState(
      extraPhoneFlag: extraPhoneFlag ?? this.extraPhoneFlag,
      linkedInFlag: linkedInFlag ?? this.linkedInFlag,
      websiteFlag: websiteFlag ?? this.websiteFlag,
      educationInfo: educationInfo ?? this.educationInfo,
      contactExtraDetails: contactExtraDetails ?? this.contactExtraDetails,
      signupFormState: signupFormState ?? this.signupFormState,
      email: email ?? this.email,
      password: password ?? this.password,
      userName: userName ?? this.userName,
      contactEmail: contactEmail ?? this.contactEmail,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }

  @override
  List<Object?> get props => [
        extraPhoneFlag,
        linkedInFlag,
        websiteFlag,
        educationInfo,
        contactExtraDetails,
        signupFormState,
        email,
        password,
        userName,
        contactEmail,
        phone,
        address,
      ];
}
